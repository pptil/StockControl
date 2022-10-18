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
    public class VentasBusiness : IVentasBusiness
    {
        private readonly IVentasDao _ventasDao;
        public VentasBusiness(IVentasDao ventasDao)
        {
            _ventasDao = ventasDao;
        }

        public IList<Ventas> GetAllVentas()
        {
            return _ventasDao.GetAll();
        }
        
        public async Task<List<Ventas>> GetVentasPorSucursal(int sucursal)
        {
            return await _ventasDao.GetVentasPorSucursal(sucursal);
        }
    }
}
