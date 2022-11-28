using Model.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Data_Transfer_Objects
{
    public class FiltrosDto
    {    
        public int Sucursal { get; set; }
        public string Producto { get; set; }
        public int Fabricante { get; set; }
        public EstadosEnum Estado { get; set; }
        public int? Nuevo { get; set; }
    }
}
