using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Data;
using System.Collections;
using System.ComponentModel;
using System.Net.Http;
using System.Net.Sockets;
using System.Threading.Tasks;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using Newtonsoft.Json.Linq;



namespace WCFServiceWebRoledemo
{
    /// <summary>
    /// Summary description for ConvertWS
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/&#8221;")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class ConvertWS : System.Web.Services.WebService
    {

        /*[WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }*/
        public double EUR_RATE = 0 ;
        [WebMethod]
        public double VNDTOEUR (double dong)
        {
            using (System.Net.WebClient webClient = new System.Net.WebClient())
            {
                var json = webClient.DownloadString("http://data.fixer.io/api/latest?access_key=1d55537acc77c50f76f84912d0f98e0b&symbols=VND&format=1");
                JObject obj = JObject.Parse(json);
                string rate = (string)obj["rates"]["VND"];
                EUR_RATE = double.Parse(rate);
            }
                return dong / EUR_RATE;
        }

        [WebMethod]
        public double EURTOVND(double eur)
        {
            using (System.Net.WebClient webClient = new System.Net.WebClient())
            {
                var json = webClient.DownloadString("http://data.fixer.io/api/latest?access_key=1d55537acc77c50f76f84912d0f98e0b&symbols=VND&format=1");
                JObject obj = JObject.Parse(json);
                string rate = (string)obj["rates"]["VND"];
                EUR_RATE = double.Parse(rate);
            }
            return eur * EUR_RATE;
        }
    }
}
 