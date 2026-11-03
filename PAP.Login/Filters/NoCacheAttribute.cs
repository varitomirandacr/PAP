using System;
using System.Web;
using System.Web.Mvc;

namespace PAP.Login.Filters
{
    /// <summary>
    /// Prevents the browser from caching pages so Back/Forward cannot restore
    /// authenticated or login screens from history (bfcache / disk cache).
    /// </summary>
    public class NoCacheAttribute : ActionFilterAttribute
    {
        public override void OnResultExecuting(ResultExecutingContext filterContext)
        {
            var response = filterContext.HttpContext.Response;
            response.Cache.SetCacheability(HttpCacheability.NoCache);
            response.Cache.SetNoStore();
            response.Cache.SetExpires(DateTime.UtcNow.AddYears(-1));
            response.Cache.SetValidUntilExpires(false);
            response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);
            response.Headers["Pragma"] = "no-cache";
            response.Headers["Expires"] = "-1";

            base.OnResultExecuting(filterContext);
        }
    }
}
