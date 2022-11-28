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

        public PedidosController(IPedidosBusiness pedidosBusiness)
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
            if (id!= 0)
            {
                pedido = _pedidosbusiness.GetByID(id);
            }
            return View(pedido);
        }



    }
}
