﻿using Modelo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Interfaces
{
    public interface IVentasBusiness
    {
        IList<Ventas> GetAllVentas();
        Task<List<Ventas>> GetVentasPorSucursal(int sucursal);
    }
}