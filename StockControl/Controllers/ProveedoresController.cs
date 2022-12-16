using Business.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace StockControl.Controllers
{
    public class ProveedoresController : Controller
    {
        private readonly IProveedoresBusiness _proveedoresbusiness;

        public ProveedoresController(IProveedoresBusiness proveedoresBusiness)
        {
            _proveedoresbusiness = proveedoresBusiness;
        }
        // GET: Proveedores
        public ActionResult Index()
        {
            return View();
        }

    }
}
