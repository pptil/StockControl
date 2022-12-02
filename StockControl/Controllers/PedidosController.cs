using Business.Business;
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
        private readonly ISelectableBusiness _selectableBusiness;

        public PedidosController(IPedidosBusiness pedidosBusiness, ISelectableBusiness selectablebusiness)
        {
            _pedidosbusiness = pedidosBusiness;
        }
        // GET: Pedidos
        public async Task<ActionResult> Index()
        {
            var list = await _pedidosbusiness.GetAllPedidos();
            return View(list);
        }

        // POST: Pedidos/Pedido
        public ActionResult Pedido(int id = 0)
        {
            var pedido = new Pedidos();
            ViewBag.Proveedores = _selectableBusiness.GetAllSelectable<Proveedores>();
            if (id!= 0)
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


    }
}
