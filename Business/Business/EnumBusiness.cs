using Business.Data_Transfer_Objects;
using Business.Interfaces;
using Business.Mappers;
using DataAccess.Interfaces;
using Model.Enums;
using Model.Interfaces;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Business
{
    public class EnumBusiness : IEnumBusiness
    {     
        public IList<KeyValueDto<string>> GetEstadosSeleccionables()
        {
            var items = Enum.GetValues(typeof(EstadosEnum)).Cast<EstadosEnum>().Select(value => value.MapToKeyValueDto()).ToList();
            return items;
        }
        
    }
}
