using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Enums
{
    public enum EstadosEnum : int
    {
        [Description("Sin Asignar")]
        SinAsignar = 0,
        [Description("En espera")]
        Espera = 1,
        [Description("En Curso")]
        Curso = 2,
        [Description("Finalizado")]
        Finalizado = 3,
        [Description("Error")]
        Error = 4
    }
}
