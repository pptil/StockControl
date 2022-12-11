using Business.Data_Transfer_Objects;
using Business.Interfaces;
using DataAccess.Dao;
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

        public async Task<IList<Articulos>> GetAllArticulos()
        {
            return await _articulosDao.GetAllArticulos();
        }

        public async Task<List<Articulos>> GetArticulosPorSucursal(int sucursal)
        {
            return await _articulosDao.GetArticulosPorSucursal(sucursal);
        }

        public Articulos GetArticulo(int id)
        {
            return _articulosDao.GetBy(id);
        }

        public async Task<IList<Articulos>> GetArticulosCondicion(FiltrosDto filtro)
        {
            var list = await _articulosDao.GetFiltrados(filtro.Nuevo, filtro.Sucursal, filtro.Fabricante, filtro.Producto);
            return list;
        }

        public bool Guardar(Articulos articulo)
        {
            int result = 0;
            if (articulo.Id == 0)
            {
                result = _articulosDao.Insert(articulo);
            }
            else
            {
                result = _articulosDao.Update(articulo, articulo.Id);
            }

            if (result == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool Borrar(int id)
        {
            var ok = _articulosDao.Delete(id);
            if (ok == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
