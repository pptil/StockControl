using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DataAccess.Context;
using Modelo.Models;
using Business.Interfaces;
using Business.Business;
using Business.Data_Transfer_Objects;

namespace StockControl.Controllers
{
    public class ArticulosController : Controller
    {
        private readonly IArticulosBusiness _articulosbusiness;
        private readonly ISelectableBusiness _selectableBusiness;

        public ArticulosController(IArticulosBusiness articulosBusiness, ISelectableBusiness selectablebusiness)
        {
            _articulosbusiness = articulosBusiness;
            _selectableBusiness = selectablebusiness;
        }

        // GET: Articulos
        public async Task<ActionResult> Index()
        {

            var fabricantes = _selectableBusiness.GetAllSelectable<Fabricantes>();
            var sucursales = _selectableBusiness.GetAllSelectable<Sucursales>();
            fabricantes.Add(new KeyValueDto<string>()
            {
                Key = -1,
                Value = "Todos"
            });
            sucursales.Add(new KeyValueDto<string>()
            {
                Key = -1,
                Value = "Todos"
            });
            ViewBag.Sucursales = sucursales;
            ViewBag.Fabricantes = fabricantes;
            var list = await _articulosbusiness.GetAllArticulos();
            return View(list);
        }

        // GET: Articulos
        [HttpGet]
        public async Task<ActionResult> Buscar([System.Web.Http.FromBody] FiltrosDto filtros)
        {
            var fabricantes = _selectableBusiness.GetAllSelectable<Fabricantes>();
            var sucursales = _selectableBusiness.GetAllSelectable<Sucursales>();
            fabricantes.Add(new KeyValueDto<string>()
            {
                Key = -1,
                Value = "Todos"
            });
            sucursales.Add(new KeyValueDto<string>()
            {
                Key = -1,
                Value = "Todos"
            });
            ViewBag.Sucursales = sucursales;
            ViewBag.Fabricantes = fabricantes;

            var list = await _articulosbusiness.GetArticulosCondicion(filtros);
            return PartialView("_Resultados", list);

        }

        public async Task<ActionResult> GetArticulosSucursal(int sucursal)
        {
            var list = await _articulosbusiness.GetArticulosPorSucursal(sucursal);
            return PartialView("_BusquedaArticulos");
        }

        [HttpGet]
        public ActionResult GetArticulo([System.Web.Http.FromBody] string accion, int id = 0)
        {
            var articulo = new Articulos();
            ViewBag.Fabricantes = _selectableBusiness.GetAllSelectable<Fabricantes>();
            if (id != 0)
            {
                articulo = _articulosbusiness.GetArticulo(id);
            }
            bool delete = accion == "DELETE" ? true : false;
            ViewBag.Delete = delete;
            return PartialView("_ModalProducto", articulo);


        }

        [HttpPost]
        public JsonResult Guardar([System.Web.Http.FromBody] Articulos articulo)
        {
            var result = _articulosbusiness.Guardar(articulo);
            return Json(result);
        }

        [HttpDelete]
        public JsonResult Borrar([System.Web.Http.FromBody] int id)
        {
            var result = _articulosbusiness.Borrar(id);
            return Json(result);
        }
    }
}
