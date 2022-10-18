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

namespace StockControl.Controllers
{
    public class ArticulosController : Controller
    {
        private readonly IArticulosBusiness _articulosbusiness;

        public ArticulosController(IArticulosBusiness articulosBusiness)
        {
            _articulosbusiness = articulosBusiness;
        }

        // GET: Articulos
        public async Task<ActionResult> Index()
        {
            //var list = _articulosbusiness.GetAllArticulos();
            var list2 = await _articulosbusiness.GetArticulosPorSucursal(1);
            List<Articulos> articulos = new List<Articulos>(list2);
            return View(articulos);
        } 
        
        public async Task<ActionResult> GetArticulosSucursal(int sucursal)
        {
            var list = await _articulosbusiness.GetArticulosPorSucursal(sucursal);
            return PartialView("_BusquedaArticulos");
        }
    }
}
