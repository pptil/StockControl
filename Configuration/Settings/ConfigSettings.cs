using System.Configuration;

namespace Configuration.Settings
{
    public class ConfigSettings
    {
        public static ConfigSettingsSection Config = ConfigurationManager.GetSection("stockSettings") as ConfigSettingsSection;

        public static ModuleComponentCollection Modules => Config.Modules;
    }
}
