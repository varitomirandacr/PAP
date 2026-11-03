using System.Web.Mvc;
using PAP.Login.Filters;

namespace PAP.Login
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
            // Require authentication for all controllers/actions unless marked [AllowAnonymous].
            filters.Add(new AuthorizeAttribute());
            // Stop Back from showing cached login or app pages after login/logout.
            filters.Add(new NoCacheAttribute());
        }
    }
}
