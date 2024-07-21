using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web.UI;
using System.Web.Http;

namespace ProjectAPI
{
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var apiMethods = GetApiMethods();
                RenderApiMethods(apiMethods);
            }
        }

        private List<string> GetApiMethods()
        {
            var apiMethods = new List<string>();

            // Get all the types in the assembly
            var types = Assembly.GetExecutingAssembly().GetTypes();

            // Find the ApiController types
            var controllers = types.Where(type => typeof(ApiController).IsAssignableFrom(type)).ToList();

            foreach (var controller in controllers)
            {
                var methods = controller.GetMethods(BindingFlags.Instance | BindingFlags.DeclaredOnly | BindingFlags.Public)
                                        .Where(m => m.IsPublic && !m.IsDefined(typeof(NonActionAttribute)))
                                        .ToList();

                foreach (var method in methods)
                {
                    var route = $"{controller.Name.Replace("Controller", "")}/{method.Name}";
                    apiMethods.Add(route);
                }
            }

            return apiMethods;
        }

        private void RenderApiMethods(List<string> apiMethods)
        {
            foreach (var method in apiMethods)
            {
                var methodLink = new System.Web.UI.WebControls.Literal
                {
                    Text = $"<p>{method}</p>"
                };
                form1.Controls.Add(methodLink);
            }
        }
    }
}
