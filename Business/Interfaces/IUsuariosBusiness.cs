using Modelo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Interfaces
{
    public interface IUsuariosBusiness
    {
        IList<Usuarios> GetAllUsuarios();
        Task<List<Usuarios>> GetAllUsuariosPorSucusal(int sucursal);
    }
}
