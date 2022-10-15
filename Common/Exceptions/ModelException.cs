using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common.Exceptions
{
    public class ModelException : Exception
    {
        public ModelException(string message) : base(message)
        {
        }

        public ModelException(string message, Exception inner) : base(message, inner)
        {
        }
    }
}
