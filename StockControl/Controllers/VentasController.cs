using Business.Business;
using Business.Data_Transfer_Objects;
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
    public class VentasController : Controller
    {
        private readonly IVentasBusiness _ventasbusiness;
        private readonly IArticulosBusiness _articulosbusiness;
        private readonly ISelectableBusiness _selectableBusiness;

        public VentasController(IVentasBusiness VentasBusiness, ISelectableBusiness selectablebusiness, IArticulosBusiness articulosbusiness)
        {
            _ventasbusiness = VentasBusiness;
            _selectableBusiness = selectablebusiness;
            _articulosbusiness = articulosbusiness;
        }
        // GET: Ventas
        public async Task<ActionResult> Index()
        {

            var proveedores = _selectableBusiness.GetAllSelectable<Proveedores>();
            proveedores.Add(new KeyValueDto<string>()
            {
                Key = -1,
                Value = "Todos"
            });
            ViewBag.Proveedores = proveedores;
            var list = await _ventasbusiness.GetAllVentas();
            return View(list);
        }

        // GET: Articulos
        [HttpGet]
        public async Task<ActionResult> Buscar([System.Web.Http.FromBody] FiltrosDto filtros)
        {
            var proveedores = _selectableBusiness.GetAllSelectable<Proveedores>();
            var sucursales = _selectableBusiness.GetAllSelectable<Sucursales>();
            proveedores.Add(new KeyValueDto<string>()
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
            ViewBag.Proveedores = proveedores;

            var list = await _ventasbusiness.GetArticulosCondicion(filtros);
            return PartialView("_Resultados", list);

        }

        // POST: Ventas/Pedido
        public ActionResult Pedido(int id = 0)
        {
            var pedido = new Ventas()
            {
                VentasDet = new List<VentasDet>()
            };
            var proveedores = _selectableBusiness.GetAllSelectable<Proveedores>();
            proveedores.Add(new KeyValueDto<string>()
            {
                Key = -1,
                Value = "Seleccione Proveedor"
            });
            ViewBag.Proveedores = proveedores;
            if (id != 0)
            {
                pedido = _ventasbusiness.GetByID(id);
            }
            return View("Pedido", pedido);
        }

        [HttpDelete]
        public JsonResult Borrar([System.Web.Http.FromBody] int id)
        {
            var result = _ventasbusiness.Borrar(id);
            return Json(result);
        }

        [HttpGet]
        public async Task<ActionResult> GetArticulos()
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
            return PartialView("_ModalProductos", list);

        }

        [HttpGet]
        public async Task<ActionResult> AddArticulo()
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
            return PartialView("_ModalProductos", list);

        }
    }
}