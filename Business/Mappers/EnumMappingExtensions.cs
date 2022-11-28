using Business.Data_Transfer_Objects;
using Model.Enums;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Mappers
{
    public static class EnumMappingExtensions
    {
        public static KeyValueDto<string> MapToKeyValueDto(this Enum enumValue)
        {
            try
            {
                return new KeyValueDto<string>
                {
                    Key = Convert.ToInt32(enumValue),
                    Value = enumValue.GetAttribute<DescriptionAttribute>().Description
                };
            }
            catch (Exception ex)
            {

                throw new Exception("Error al mapear de enum a KeyValueDto", ex);
            }
        }
    }
}
