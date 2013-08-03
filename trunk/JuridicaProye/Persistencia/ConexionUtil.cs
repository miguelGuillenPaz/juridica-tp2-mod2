using System.Configuration;

namespace DemoMVC.Persistencia
{
    public class ConexionUtil
    {
        public static string Cadena
        {
            get
            {                
                return ConfigurationManager.ConnectionStrings["GyMAdo"].ToString();
            }

        }
    }
}