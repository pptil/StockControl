using System.Collections.Generic;
using System.Configuration;
using System.Reflection;
using Configuration.Helpers;

namespace Configuration.Settings
{
    public class ModuleComponent : ConfigurationElement
    {
        [ConfigurationProperty("component", DefaultValue = "", IsKey = true, IsRequired = true)]
        public string Component
        {
            get { return (string)this["component"]; }
            set { this["component"] = value; }
        }

        [ConfigurationProperty("assemblies", DefaultValue = "", IsRequired = true)]
        public string AssemblyNames
        {
            get { return (string)this["assemblies"]; }
            set { this["assemblies"] = value; }
        }

        public List<Assembly> Assemblies
        {
            get
            {
                if (!string.IsNullOrEmpty(AssemblyNames))
                    return AssemblyHelper.GetAssemblies(AssemblyNames);

                return new List<Assembly>();
            }
        }
    }
}