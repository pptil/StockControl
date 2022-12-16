using Business.Data_Transfer_Objects;
using Model.Interfaces;
using Modelo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Mappers
{
    public static class SelectableMappingExtensions
    {

        public static KeyValueDto<string> MapToKeyValueDto(this ISelectable model)
        {
            return new KeyValueDto<string>
            {
                Key = model.Id,
                Value = model.Nombre
            };
        }
    }
}
