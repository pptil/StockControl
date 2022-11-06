﻿using DataAccess.Context;
using DataAccess.Interfaces;
using Modelo.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Dao
{
    public class PedidosDao : BaseDao<Pedidos>, IPedidosDao
    {
        public async Task<List<Pedidos>> GetPedidosPorSucursal(int sucursal)
        {
            
            try
            {
                using (var _context = new StockContext())
                {
                    var list = await _context.Pedidos
                                .Include("PedidosDet")
                                .Where(i => i.sucursal_cod == sucursal)
                                .ToListAsync();
                    return list;
                }                            
            }
            catch (Exception)
            {

                throw;
            }
                      
        }
        
        
        public Pedidos GetPedido(int id)
        {

            try
            {
                using (var _context = new StockContext())
                {
                    var pedido =  _context.Pedidos
                                .Include("PedidosDet")
                                .Where(i => i.pedido_cod == id)
                                .FirstOrDefault();
                    return pedido;
                }
            }
            catch (Exception)
            {

                throw;
            }

        }

    }
}
