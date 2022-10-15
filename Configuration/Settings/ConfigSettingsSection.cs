using System.Configuration;

namespace Configuration.Settings
{
    public class ConfigSettingsSection : ConfigurationSection
    {
        [ConfigurationProperty("modules")]
        public ModuleComponentCollection Modules => (ModuleComponentCollection)this["modules"];
    }
}