using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Http;
using System.Configuration;
using System.Net.Http.Headers;
using Entidades;
using Newtonsoft.Json;
using System.Diagnostics.Eventing.Reader;
using System.Runtime.Remoting.Messaging;

namespace Negocio
{
    public class NEstatusAlumnos
    {

        string urlWebAPI = ConfigurationManager.AppSettings["urlWebAPI"];

        public List<EstatusAlumnos> Consultar()
        {
            var estatus = new List<EstatusAlumnos>();
            try
            {
              
                using (var cliente = new HttpClient())
                {
                    Task<HttpResponseMessage> responseTask = cliente.GetAsync(urlWebAPI);

                    responseTask.Wait();

                    HttpResponseMessage resultado = responseTask.Result;

                    if (resultado.IsSuccessStatusCode)
                    {
                        Task<string> readTask = resultado.Content.ReadAsStringAsync();

                        readTask.Wait();
                        string json = readTask.Result;

                        estatus = JsonConvert.DeserializeObject<List<EstatusAlumnos>>(json);
                    }
                    else throw new Exception($"WebAPI. Respondió con un error.{resultado.StatusCode}");
                   
                }
            } catch (Exception ex)
            {
                throw new Exception($"WebAPI. Respondió con un error. {ex.Message}");
            }
            return estatus;
        }
        public EstatusAlumnos Consultar(int id)
        {
            EstatusAlumnos estatus = null;
            try
            {
                using (var cliente = new HttpClient())
                {
                    var responseTask = cliente.GetAsync(urlWebAPI + $"/{id}");
                    responseTask.Wait();

                    var resultado = responseTask.Result;

                    if (resultado.IsSuccessStatusCode)
                    {
                        var readTask = resultado.Content.ReadAsStringAsync();
                        readTask.Wait();
                        string json = readTask.Result;
                        estatus = JsonConvert.DeserializeObject<EstatusAlumnos>(json);
                    }
                    else throw new Exception($"WebAPI. Respondió con un error {resultado.StatusCode}");
                }
            }
            catch (Exception ex)
            {
                throw new Exception($"WebAPI. Responíó con un error.{ex.Message}");
            }
            return estatus;
        } 
        public EstatusAlumnos Agregar (EstatusAlumnos estatus)
        {
            try
            {
                using (var cliente = new HttpClient())
                {
                    HttpContent httpContent = new StringContent(JsonConvert.SerializeObject(estatus), Encoding.UTF8);

                    httpContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");
                    var postTask = cliente.PostAsync(urlWebAPI, httpContent);
                    postTask.Wait();
                    var resultado = postTask.Result;

                    if (resultado.IsSuccessStatusCode)
                    {
                        var readTask = resultado.Content.ReadAsStringAsync();
                        readTask.Wait();

                        string json = readTask.Result;
                        estatus = JsonConvert.DeserializeObject<EstatusAlumnos>(json);
                    } else throw new Exception($"WebAPI. Respondió con un error {resultado.StatusCode}");
                }
            }catch (Exception ex)
            {
                throw new Exception($"WebAPI. Respondió con un error{ex.Message}");
            }
            return estatus;
        }
        public void Actualizar (EstatusAlumnos estatus)
        {
            try
            {
                using (var cliente = new HttpClient())
                {
                    HttpContent httpContent = new StringContent(JsonConvert.SerializeObject(estatus), Encoding.UTF8);
                    httpContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");
                    var postTask = cliente.PutAsync(urlWebAPI + $"/{estatus.id}", httpContent);
                    postTask.Wait();
                    var resultado = postTask.Result;
                   
                    if (!resultado.IsSuccessStatusCode)
                    {
                        throw new Exception($"WebAPI. Respondió con un error{resultado.StatusCode}");
                    }
                }
            } catch (Exception ex)
            {
                throw new Exception($"WebAPI. Respondió con un error {ex.Message}");
            }
        }
        public void Eliminar (int id)
        {
            try
            {
                using (var cliente = new HttpClient())
                {
                    var responseTask = cliente.DeleteAsync(urlWebAPI + $"/{id}");
                    responseTask.Wait();
                    var resultado = responseTask.Result;
                    if (!resultado.IsSuccessStatusCode)
                    {
                        throw new Exception($"WebAPI. Respondió con un error {resultado.StatusCode}");
                    }
                }
            }catch (Exception ex)
            {
                throw new Exception($"WebAPI. Respondió con un error{ex.Message}");
            }
        }
    }
}
