using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace ADO
{
    internal class ADOEstatus : ICRUDEstatus
    {
        string _cnnString = ConfigurationManager.ConnectionStrings["InstitutoConnection"].ConnectionString;
        int id = 3;
        string query;
        SqlCommand comando;

        public List<Estatus> Consultar() //Consultar todos
        {
            List<Estatus> _listaEstatus = new List<Estatus>();

            query = $"select id, clave, nombre from EstatusAlumnos where id > {0}";
            using (SqlConnection con = new SqlConnection(_cnnString))
            {
                comando = new SqlCommand(query, con);
                comando.CommandType = CommandType.Text;
                con.Open();
                SqlDataReader reader = comando.ExecuteReader();
                while (reader.Read())
                {
                    _listaEstatus.Add(new Estatus()
                    {
                        id = Convert.ToInt32(reader["id"]),
                        clave = reader["clave"].ToString(),
                        nombre = reader["nombre"].ToString()
                    });
                }
            }
            return _listaEstatus;
        }

        public Estatus Consultar(int id) //Consultar solo uno
        {
            // Verificar si el id existe
            string queryCheck = $"SELECT COUNT(*) FROM EstatusAlumnos WHERE id = @id"; // Usamos parámetros para prevenir inyección SQL
            using (SqlConnection con = new SqlConnection(_cnnString))
            {
                SqlCommand comando = new SqlCommand(queryCheck, con);
                comando.Parameters.AddWithValue("@id", id); // Se añade el parámetro id
                con.Open();

                // Verifica si el id existe
                int count = (int)comando.ExecuteScalar();

                if (count == 0)
                {
                    Console.WriteLine($"No se puede consultar el id {id}, debido a que no existe.");
                    return null; // El id no existe
                }

                // Si el id existe, consultamos el registro
                string query = $"SELECT id, clave, nombre FROM EstatusAlumnos WHERE id = @id";
                comando = new SqlCommand(query, con);
                comando.Parameters.AddWithValue("@id", id); // Se añade el parámetro id
                comando.CommandType = CommandType.Text;

                using (SqlDataReader reader = comando.ExecuteReader())
                {
                    if (reader.Read()) // Verifica si hay filas que leer
                    {
                        return new Estatus()
                        {
                            id = Convert.ToInt32(reader["id"]),
                            clave = reader["clave"].ToString(),
                            nombre = reader["nombre"].ToString()
                        };
                    }
                    else
                    {
                        Console.WriteLine($"No se encontró el id {id}.");
                        return null; // Por si acaso no se encuentra el registro aunque el count dijera lo contrario
                    }
                }
            }
        }


        public int Agregar(Estatus estatus)
        {
            // Verificar si ya existe un registro con el mismo id
            string queryCheck = $"SELECT COUNT(*) FROM EstatusAlumnos WHERE id = {estatus.id}";

            using (SqlConnection con = new SqlConnection(_cnnString))
            {
                comando = new SqlCommand(queryCheck, con);
                con.Open();
                int count = (int)comando.ExecuteScalar(); // Devuelve el número de registros que coinciden

                if (count > 0)
                {
                    Console.WriteLine("No se puede agregar. Ese id ya existe");
                    return -1; // Indicamos que ya existe
                }

                Console.WriteLine("Ingrese la nueva clave");
                estatus.clave = Console.ReadLine();
                Console.WriteLine("Ingrese el nuevo nombre del estatus");
                estatus.nombre = Console.ReadLine();

                // Si no existe el estatus a agregar, se procede a la inserción
                query = $"INSERT INTO EstatusAlumnos (id, clave, nombre) VALUES ({estatus.id}, '{estatus.clave}', '{estatus.nombre}')";
                comando = new SqlCommand(query, con);
                comando.CommandType = CommandType.Text;
                comando.ExecuteNonQuery();
                con.Close();
            }
            Console.WriteLine("Estatus agregado exitosamente.");
            return estatus.id;
        }

        public void Actualizar(Estatus estatus)
        {
            string queryCheck = $"select count(*) from EstatusAlumnos where id = {estatus.id}";
            using (SqlConnection con = new SqlConnection(_cnnString))
            {
                comando = new SqlCommand(queryCheck, con);
                con.Open(); 
                int count = (int)comando.ExecuteScalar(); //Devuelve un solo valor como resultado de un COUNT para verificar si existe o no el registro
                if (count == 0)
                {
                    Console.WriteLine("No se pudo actualizar. El estatus con ese id no existe");
                    con.Close();
                    return;
                }

                Console.WriteLine("Ingrese la nueva clave");
                estatus.clave = Console.ReadLine();
                Console.WriteLine("Ingrese el nuevo nombre del estatus");
                estatus.nombre = Console.ReadLine();

                
                string query = $"actualizarEstatusAlumnos"; 
                comando = new SqlCommand (query, con);
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("id", estatus.id);
                comando.Parameters.AddWithValue("clave", estatus.clave);
                comando.Parameters.AddWithValue("nombre", estatus.nombre);
            
                comando.ExecuteNonQuery();
                con.Close();
            }
            Console.WriteLine("Estatus actualizado con éxito");
        }
       
        public void Eliminar(int id)
        {
            //Se verifica si existe el registro con ese id 

            string queryCheck = $"select count(*) from EstatusAlumnos where id = {id}";
            using (SqlConnection con = new SqlConnection(_cnnString))
            {
                comando = new SqlCommand (queryCheck, con);
                con.Open();
                int count = (int)comando.ExecuteScalar(); //Devuelve el número de registros que coinciden
                if (count == 0)
                {
                    Console.WriteLine("No se pudo eliminar el estatus con ese id, porque no existe");
                    con.Close();
                    return;
                }
                //Si existe, aquí lo vamos a eliminar
                query = $"delete from EstatusAlumnos where id={id}";
                comando = new SqlCommand(query, con);
                comando.CommandType = CommandType.Text;      
                comando.ExecuteNonQuery();
                con.Close();
            }
            Console.WriteLine("Estatus eliminado existosamente");
        }
   
        public List<Estatus> Cargar()
        {
            List<Estatus> _listaEstatus = new List<Estatus>();
            query = $"consultarEstatusAlumnos";

            using (SqlConnection con = new SqlConnection(_cnnString))
            {
                comando = new SqlCommand(query , con);
                comando.CommandType = CommandType.Text;
                comando.Parameters.AddWithValue("id", -1);
                con.Open();
                id = comando.ExecuteNonQuery();
                con.Close();

            }
            return _listaEstatus;
        }
    }
}
