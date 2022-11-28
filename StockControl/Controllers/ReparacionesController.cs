using Business.Data_Transfer_Objects;
using Business.Interfaces;
using Business.Mappers;
using Model.Enums;
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
        private readonly IEnumBusiness _enumbusiness;
        private readonly ISelectableBusiness _selectableBusiness;

        public ReparacionesController(IReparacionesBusiness reparacionesBusiness, IEnumBusiness enumBusiness, ISelectableBusiness selectableBusiness)   
        {
            _reparacionesbusiness = reparacionesBusiness;
            _enumbusiness = enumBusiness;
            _selectableBusiness = selectableBusiness;
        }

        [HttpGet]
        public ActionResult GetReparacion([System.Web.Http.FromBody] string accion, int id = 0)
        {
            var reparacion = new Reparaciones();
            ViewBag.Estados = _enumbusiness.GetEstadosSeleccionables();
            if (id != 0)
            {
                reparacion = _reparacionesbusiness.GetReparacion(id);
            }
            bool delete = accion == "DELETE" ? true : false;

            ViewBag.Delete = delete;                
            return PartialView("_ModalReparaciones", reparacion);


        }

        // GET: Reparaciones
        [HttpGet]
        public async Task<ActionResult> Buscar([System.Web.Http.FromBody] FiltrosDto filtros)
        {
            ViewBag.Estados = _enumbusiness.GetEstadosSeleccionables();
            var list = await _reparacionesbusiness.GetReparacionesCondicion(filtros);
            return PartialView("_Resultados", list);
            
        }

        // GET: Reparaciones
        public ActionResult Index()
        {
            var estados = _enumbusiness.GetEstadosSeleccionables();
            var sucursales = _selectableBusiness.GetAllSelectable<Sucursales>();
            estados.Add(new KeyValueDto<string>()
            {
                Key = -1,
                Value = "Todos"
            });
            sucursales.Add(new KeyValueDto<string>()
            {
                Key = -1,
                Value =  "Todos"
            });
            ViewBag.Estados = estados;
            ViewBag.Sucursales = sucursales;
            var list = _reparacionesbusiness.GetAllReparaciones();
            return View(list);
        }

        [HttpPost]
        public JsonResult Guardar([System.Web.Http.FromBody] Reparaciones reparacion)
        {
            var result = _reparacionesbusiness.Guardar(reparacion);
            return Json(result);
        }

        [HttpDelete]
        public JsonResult Borrar([System.Web.Http.FromBody] int id)
        {
            var result = _reparacionesbusiness.Borrar(id);
            return Json(result);
        }
    }
}
