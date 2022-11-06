using Business.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StockControl.Controllers
{
    public class HomeController : Controller
    {
        private readonly IArticulosBusiness _articulosbusiness;

        public HomeController(IArticulosBusiness articulosBusiness)
        {
            _articulosbusiness = articulosBusiness;
        }
        // GET: Home
        public ActionResult Home()
        {
            var articulos = _articulosbusiness.GetAllArticulos();

            return View();
        }      
    }
}
