﻿using Business.Interfaces;
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
    public class PedidosBusiness : IPedidosBusiness
    {
        private readonly IPedidosDao _pedidosDao;
        public PedidosBusiness(IPedidosDao pedidosDao)
        {
            _pedidosDao = pedidosDao;
        }

        public async Task<IList<Pedidos>> GetAllPedidos()
        {
            return await _pedidosDao.GetAllPedidos();
        }

        public async Task<List<Pedidos>> GetPedidosPorSucursal(int sucursal)
        {
            return await _pedidosDao.GetPedidosPorSucursal(sucursal);
        }

        public Pedidos GetByID(int id)
        {
            return _pedidosDao.GetPedido(id);
        }

        public bool Borrar(int id)
        {
            var ok = _pedidosDao.Delete(id);
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
