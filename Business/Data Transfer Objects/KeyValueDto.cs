using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Data_Transfer_Objects
{
    public class KeyValueDto<T>
    {
        public int Key { get; set; }
        public T Value { get; set; }
    }
}
