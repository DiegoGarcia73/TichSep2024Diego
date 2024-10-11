using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Data
{
    public class DEstatusAlumno
    {
        string _cnnstring = ConfigurationManager.ConnectionStrings["InstitutoConnection"].ConnectionString;
        string _query;
        SqlCommand comando;
        public List<EstatusAlumno> Consultar()
        {
            List<EstatusAlumno> listaEstatus = new List<EstatusAlumno>();
            _query = $"consultarEstatusAlumnos";

            using (SqlConnection conexion = new SqlConnection(_cnnstring))
            {
                comando = new SqlCommand(_query, conexion);
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@idEstatus", -1);
                conexion.Open();
                SqlDataReader reader = comando.ExecuteReader();
                while (reader.Read())
                {
                    listaEstatus.Add (new EstatusAlumno //Aquí se añadió en una lista
                    {
                        id = Convert.ToInt16(reader["id"]),
                        clave = reader["Clave"].ToString(),
                        nombre = reader["Nombre"].ToString()
                    });
                }
                conexion.Close();
                
            }
            return listaEstatus;

        }
    }
}
