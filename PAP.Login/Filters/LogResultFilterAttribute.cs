using System;
using System.Diagnostics;
using System.Web.Mvc;

namespace PAP.Login.Filters
{
    /// <summary>
    /// Result filter that logs when an action result starts and finishes rendering
    /// (ViewResult, RedirectResult, JsonResult, ContentResult, etc.).
    /// </summary>
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, AllowMultiple = false, Inherited = true)]
    public class LogResultFilterAttribute : ActionFilterAttribute
    {
        private const string StopwatchKey = "__LogResultFilterStopwatch";

        public override void OnResultExecuting(ResultExecutingContext filterContext)
        {
            filterContext.HttpContext.Items[StopwatchKey] = Stopwatch.StartNew();

            var descriptor = filterContext.RouteData;
            var controller = descriptor.Values["controller"];
            var action = descriptor.Values["action"];
            var resultType = filterContext.Result != null
                ? filterContext.Result.GetType().Name
                : "null";

            RequestLog.Write(string.Format(
                "RESULT START {0}.{1} | ResultType={2} | Cancelled={3}",
                controller,
                action,
                resultType,
                filterContext.Cancel));

            base.OnResultExecuting(filterContext);
        }

        public override void OnResultExecuted(ResultExecutedContext filterContext)
        {
            var elapsedMs = 0L;
            var stopwatch = filterContext.HttpContext.Items[StopwatchKey] as Stopwatch;
            if (stopwatch != null)
            {
                stopwatch.Stop();
                elapsedMs = stopwatch.ElapsedMilliseconds;
            }

            var descriptor = filterContext.RouteData;
            var controller = descriptor.Values["controller"];
            var action = descriptor.Values["action"];
            var resultType = filterContext.Result != null
                ? filterContext.Result.GetType().Name
                : "null";
            var status = filterContext.Exception == null ? "OK" : "ERROR";
            var detail = filterContext.Exception == null
                ? string.Empty
                : " | Exception=" + filterContext.Exception.Message;

            // Extra detail for common result types
            var extra = string.Empty;
            var viewResult = filterContext.Result as ViewResultBase;
            if (viewResult != null)
            {
                extra = " | View=" + (string.IsNullOrEmpty(viewResult.ViewName) ? "(default)" : viewResult.ViewName);
            }
            else
            {
                var redirect = filterContext.Result as RedirectResult;
                if (redirect != null)
                {
                    extra = " | Url=" + redirect.Url;
                }
                else
                {
                    var redirectToRoute = filterContext.Result as RedirectToRouteResult;
                    if (redirectToRoute != null)
                    {
                        extra = " | Route=" + redirectToRoute.RouteName
                            + " Values=" + string.Join(",", redirectToRoute.RouteValues.Values);
                    }
                }
            }

            RequestLog.Write(string.Format(
                "RESULT END   {0}.{1} | ResultType={2} | Status={3} | {4} ms{5}{6}",
                controller,
                action,
                resultType,
                status,
                elapsedMs,
                extra,
                detail));

            base.OnResultExecuted(filterContext);
        }
    }
}
