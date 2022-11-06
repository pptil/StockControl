using Business.Interfaces;
using Modelo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
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

        [HttpGet]
        public async Task<ActionResult> GetReparacion([System.Web.Http.FromBody] string accion, int id = 0)
        {
            var reparacion = new Reparaciones();
            if (id != 0)
            {
                reparacion = _reparacionesbusiness.GetReparacion(id);
            }
            if (accion == "DELETE")
            {
                return PartialView("_ModalConfirmacion", reparacion);
            }
            else
            {
                return PartialView("_ModalReparaciones", reparacion);
            }
            

            
        }

        // GET: Reparaciones
        public ActionResult Index()
        {
            var list = _reparacionesbusiness.GetAllReparaciones();
            return View(list);
        }

        [HttpPost]
        public async Task<JsonResult> Guardar([System.Web.Http.FromBody] Reparaciones reparacion)
        {
            var result = _reparacionesbusiness.Guardar(reparacion);
            return Json(result);
        }

        [HttpDelete]
        public async Task<JsonResult> Borrar([System.Web.Http.FromBody] int id)
        {
            var result = _reparacionesbusiness.Borrar(id);
            return Json(result);
        }
    }
}
