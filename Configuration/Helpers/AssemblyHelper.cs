using System.Collections.Generic;
using System.Linq;
using System.Reflection;

namespace Configuration.Helpers
{
    public class AssemblyHelper
    {
        /// <summary>
        /// Recupera los assemblys definidos en la clave de configuración (tienen que estar separados POR COMA!)
        /// </summary>
        /// <returns></returns>
        public static List<Assembly> GetAssemblies(string assemblyNames)
        {
            if (string.IsNullOrEmpty(assemblyNames))
                return null;
            return assemblyNames.Split(',').Select(name => Assembly.Load(name.Trim())).ToList();
        }
    }
}
