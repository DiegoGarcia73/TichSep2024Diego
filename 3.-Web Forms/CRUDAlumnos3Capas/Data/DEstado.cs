using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Data
{
    public class DEstado
    {
        string _cnnstring = ConfigurationManager.ConnectionStrings["InstitutoConnection"].ConnectionString;
        string _query;
        SqlCommand comando;
        public List<Estado> Consultar()
        {
            List <Estado> listaEstado = new List<Estado>();
            _query = $"consultarEstados";
            using (SqlConnection conexion = new SqlConnection(_cnnstring))
            {
                comando = new SqlCommand(_query, conexion);
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@idEstado", 0);
                conexion.Open();
                SqlDataReader reader = comando.ExecuteReader();

                while (reader.Read()) //Se creó un objeto de tipo Estado
                {
                    Estado oEstado = new Estado();
                    oEstado.id = Convert.ToInt16(reader["id"]);
                    oEstado.nombre = reader["nombre"].ToString();
                    listaEstado.Add(oEstado);
                }
                conexion.Close();
            }
            return listaEstado;

        }
    }
}
