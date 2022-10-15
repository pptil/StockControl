using Autofac;
using Configuration.Settings;

namespace Configuration.Modules
{
    public class DataAccessConfigModule : Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            var assemblies = ConfigSettings.Modules["dataAccess"].Assemblies;

            foreach (var assembly in assemblies)
            {
                builder
                    .RegisterAssemblyTypes(assembly)
                    .Where(t => t.Name.EndsWith("Dao"))
                    .AsImplementedInterfaces()
                    .SingleInstance();
            }
        }
    }
}
