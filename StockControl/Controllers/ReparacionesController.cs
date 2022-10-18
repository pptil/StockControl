using Business.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StockControl.Controllers
{
    public class ReparacionesController : Controller
    {
        private readonly IReparacionesBusiness _reparacionesbusiness;

        public ReparacionesController(IReparacionesBusiness reparacionesBusiness)
        {
            _reparacionesbusiness = reparacionesBusiness;
        }
        // GET: Reparaciones
        public ActionResult Index()
        {
            var list = _reparacionesbusiness.GetAllReparaciones();
            return View(list);
        }
    }
}
