﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Interfaces
{
    public interface IUpdate<T> where T : class
    {
        int Update<TId>(T entity, TId id);

        Task<int> UpdateAsync<TId>(T entity, TId id);
    }
}
