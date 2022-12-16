using Business.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StockControl.Controllers
{
    public class ReportesController : Controller
    {
        private readonly IReportesBusiness _reportesBusiness;

        public ReportesController(IReportesBusiness reportesBusiness)
        {
            _reportesBusiness = reportesBusiness;
        }
        // GET: Reportes
        public ActionResult Index()
        {
            return View();
        }

        
    }
}
