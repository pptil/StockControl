using Business.Interfaces;
using DataAccess.Interfaces;
using Modelo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Business
{
    public class ArticulosBusiness : IArticulosBusiness
    {
        private readonly IArticulosDao _articulosDao;
        public ArticulosBusiness(IArticulosDao articulosDao)
        {
            _articulosDao = articulosDao;
        }

        public IList<Articulos> GetAllArticulos()
        {
            return _articulosDao.GetAll();
        }

        public async Task<List<Articulos>> GetArticulosPorSucursal(int sucursal)
        {
            return await _articulosDao.GetArticulosPorSucursal(sucursal);
        }

        public Articulos GetArticulo(int id)
        {
            return _articulosDao.GetBy(id);
        }
    }
}
