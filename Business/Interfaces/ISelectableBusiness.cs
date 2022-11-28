using Business.Data_Transfer_Objects;
using Model.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Interfaces
{
    public interface ISelectableBusiness
    {
        List<KeyValueDto<string>> GetAllSelectable<T>() where T : class, ISelectable;
    }
}
