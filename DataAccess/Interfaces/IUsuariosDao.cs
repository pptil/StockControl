using Modelo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Interfaces
{
    public interface IUsuariosDao : 
        IGetAll<Usuarios>
    {
        Task<List<Usuarios>> GetUsuariosPorSucursal(int sucursal);
    }
}
