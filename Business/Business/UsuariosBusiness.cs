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
    public class UsuariosBusiness : IUsuariosBusiness
    {
        private readonly IUsuariosDao _usuariosDao;
        public UsuariosBusiness(IUsuariosDao usuariosDao)
        {
            _usuariosDao = usuariosDao;
        }

        public IList<Usuarios> GetAllUsuarios()
        {
            return _usuariosDao.GetAll();
        }
        
        public async Task<List<Usuarios>> GetAllUsuariosPorSucusal(int sucursal)
        {
            return await _usuariosDao.GetUsuariosPorSucursal(sucursal);
        }
    }
}
