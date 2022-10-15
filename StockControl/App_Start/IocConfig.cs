using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Http.Dependencies;
using System.Web.Mvc;
using Autofac;
using Autofac.Core;
using Autofac.Integration.Mvc;
using Autofac.Integration.WebApi;
using Configuration.Modules;

namespace StockControl.App_Start
{
    public class IocConfig
    {
        public static IContainer Container { get; set; }

        public static void Config()
        {
            var builder = new ContainerBuilder();

            builder.RegisterControllers(typeof(WebApiApplication).Assembly).InstancePerDependency();
            builder.RegisterModule(new BusinessConfigModule());
            builder.RegisterModule(new DataAccessConfigModule());
            //builder.RegisterModule(new RepositoryConfigModule());
            Container = builder.Build();

            DependencyResolver.SetResolver(new AutofacDependencyResolver(Container));
        }
    }
}