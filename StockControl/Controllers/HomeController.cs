using Business.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace StockControl.Controllers
{
    public class HomeController : Controller
    {
        private readonly IHomeBusiness _homeBusiness;

        public HomeController(IHomeBusiness homeBusiness)
        {
            _homeBusiness= homeBusiness;;
        }
        // GET: Home
        public async Task<ActionResult> Home()
        {
            var homeDto = await _homeBusiness.GetHome();

            return View(homeDto);
        }      
    }
}
