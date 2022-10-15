using System.Configuration;

namespace Configuration.Settings
{
    [ConfigurationCollection(typeof(ModuleComponent))]
    public class ModuleComponentCollection : ConfigurationElementCollection
    {
        public new ModuleComponent this[string index]
        {
            get { return (ModuleComponent)BaseGet(index); }
            set
            {
                if (BaseGet(index) != null)
                    BaseRemove(index);

                BaseAdd(value);
            }
        }

        protected override ConfigurationElement CreateNewElement()
        {
            return new ModuleComponent();
        }

        protected override object GetElementKey(ConfigurationElement element)
        {
            return ((ModuleComponent)element).Component;
        }
    }
}