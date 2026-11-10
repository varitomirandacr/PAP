using System.Web.Mvc;
using PAP.Login.Filters;

namespace PAP.Login.Controllers
{
    [Authorize]
    [LogFilter]
    [LogResultFilter]
    public class HomeController : Controller
    {
        [LogFilter]
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}