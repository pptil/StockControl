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
    public class PedidosController : Controller
    {
        private readonly IPedidosBusiness _pedidosbusiness;
        private readonly IArticulosBusiness _articulosbusiness;
        private readonly ISelectableBusiness _selectableBusiness;
        private readonly IReportesBusiness _reportesBusiness;

        public PedidosController(IPedidosBusiness pedidosBusiness, ISelectableBusiness selectablebusiness, IArticulosBusiness articulosbusiness, IReportesBusiness reportesBusiness)
        {
            _pedidosbusiness = pedidosBusiness;
            _selectableBusiness = selectablebusiness;
            _articulosbusiness = articulosbusiness;
            _reportesBusiness = reportesBusiness;
        }
        // GET: Pedidos
        public async Task<ActionResult> Index()
        {

            var proveedores = _selectableBusiness.GetAllSelectable<Proveedores>();
            proveedores.Add(new KeyValueDto<string>()
            {
                Key = -1,
                Value = "Todos"
            });
            ViewBag.Proveedores = proveedores;
            var list = await _pedidosbusiness.GetAllPedidos();
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

            var list = await _pedidosbusiness.GetArticulosCondicion(filtros);
            return PartialView("_Resultados", list);

        }

        // POST: Pedidos/Pedido
        public ActionResult Pedido(int id = 0)
        {
            var pedido = new Pedidos()
            {
                PedidosDet = new List<PedidosDet>()
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
                pedido = _pedidosbusiness.GetByID(id);
            }
            return View("Pedido", pedido);
        }

        [HttpDelete]
        public JsonResult Borrar([System.Web.Http.FromBody] int id)
        {
            var result = _pedidosbusiness.Borrar(id);
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


            var productos = await _articulosbusiness.GetAllArticulos();
            var list = productos.Where(x => x.Stock > 0).ToList();
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

            var productos = await _articulosbusiness.GetAllArticulos();
            var list = productos.Where(x => x.Stock > 0).ToList();
            return PartialView("_ModalProductos", list);

        }
        [HttpPost]
        public async Task<string> Generar(int pedidoId)
        {
            var docMemoryStream = await _reportesBusiness.GenerarInformePDF(pedidoId, Model.Enums.TipoPDFEnum.Pedido);

            return Convert.ToBase64String(docMemoryStream.ToArray());
        }
    }
}
