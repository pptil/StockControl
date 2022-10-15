using Autofac;
using Configuration.Settings;

namespace Configuration.Modules
{
    public class RepositoryConfigModule : Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            var assemblies = ConfigSettings.Modules["repository"].Assemblies;

            foreach (var assembly in assemblies)
            {
                builder
                    .RegisterAssemblyTypes(assembly)
                    .Where(t => t.Name.EndsWith("Repository"))
                    .AsImplementedInterfaces()
                    .SingleInstance();
            }
        }
    }
}
