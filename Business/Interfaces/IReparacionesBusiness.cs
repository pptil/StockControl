using Modelo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Interfaces
{
    public interface IReparacionesBusiness
    {
        IList<Reparaciones> GetAllReparaciones();
        Reparaciones GetReparacion(int id);
        Task<bool> Guardar(Reparaciones reparaciones);
        Task<bool> Borrar(int id);
    }
}
