using System;
using System.Diagnostics;
using System.Web.Mvc;

namespace PAP.Login.Filters
{
    /// <summary>
    /// Action filter that logs request start/end for controller endpoints.
    /// Writes to Debug/Trace and to App_Data/logs/requests.log.
    /// </summary>
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, AllowMultiple = false, Inherited = true)]
    public class LogFilterAttribute : ActionFilterAttribute
    {
        private const string StopwatchKey = "__LogFilterStopwatch";

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            filterContext.HttpContext.Items[StopwatchKey] = Stopwatch.StartNew();

            var request = filterContext.HttpContext.Request;
            var user = filterContext.HttpContext.User?.Identity;
            var userName = user != null && user.IsAuthenticated ? user.Name : "anonymous";
            var descriptor = filterContext.ActionDescriptor;

            RequestLog.Write(string.Format(
                "ACTION START {0} {1} → {2}.{3} | User={4} | IP={5}",
                request.HttpMethod,
                request.RawUrl,
                descriptor.ControllerDescriptor.ControllerName,
                descriptor.ActionName,
                userName,
                request.UserHostAddress));

            base.OnActionExecuting(filterContext);
        }

        public override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            var elapsedMs = 0L;
            var stopwatch = filterContext.HttpContext.Items[StopwatchKey] as Stopwatch;
            if (stopwatch != null)
            {
                stopwatch.Stop();
                elapsedMs = stopwatch.ElapsedMilliseconds;
            }

            var descriptor = filterContext.ActionDescriptor;
            var status = filterContext.Exception == null ? "OK" : "ERROR";
            var detail = filterContext.Exception == null
                ? string.Empty
                : " | Exception=" + filterContext.Exception.Message;

            RequestLog.Write(string.Format(
                "ACTION END   {0}.{1} | Status={2} | {3} ms{4}",
                descriptor.ControllerDescriptor.ControllerName,
                descriptor.ActionName,
                status,
                elapsedMs,
                detail));

            base.OnActionExecuted(filterContext);
        }
    }
}
