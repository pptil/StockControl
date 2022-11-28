using Business.Data_Transfer_Objects;
using Business.Interfaces;
using Business.Mappers;
using DataAccess.Interfaces;
using Model.Interfaces;
using Modelo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Business
{
    public class SelectableBusiness : ISelectableBusiness
    {
        public readonly ISelectableDao _selectableDao;
        public SelectableBusiness(ISelectableDao selectableDao)
        {
            _selectableDao = selectableDao;
        }

        public List<KeyValueDto<string>> GetAllSelectable<T>() where T : class, ISelectable
        {
            var items = _selectableDao.GetAllSelectable<T>().Select(item => item.MapToKeyValueDto()).ToList();
            return items;
        }
    }
}
