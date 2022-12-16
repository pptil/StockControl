using Business.Data_Transfer_Objects;
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
        Task<IList<Reparaciones>> GetReparacionesCondicion(FiltrosDto filtros);
        Reparaciones GetReparacion(int id);
        bool Guardar(Reparaciones reparaciones);
        bool Borrar(int id);
    }
}
