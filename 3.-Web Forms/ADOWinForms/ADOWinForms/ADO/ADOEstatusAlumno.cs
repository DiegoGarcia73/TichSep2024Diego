﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using ADOWinForms.Entidades;

namespace ADOWinForms.ADO
{
    internal class ADOEstatusAlumno : ICRUD
    {
        /*Se hace referencia a la cadena de conexión de App.config a través de la clase configuration manager
       y su propiedad ConnectionStrings desde el espacio de nombres using System.Configuration */
        string _cnnString = ConfigurationManager.ConnectionStrings["InstitutoConnection"].ConnectionString;
        int id = 3;
        string query;
        SqlCommand comando; //Clase SqlCommand es una clase permite seleccionar conexión o comando

        public List<EstatusAlumno> Consultar() //Consultar todos //Se invoca al método Consultar() mediante
                                         //firma del método: modificador de acceso "public", tipo de dato de retorno lista<estatus> y el método (parámetros)
        {
            List<EstatusAlumno> _listaEstatus = new List<EstatusAlumno>(); //creando el objeto de la lista Estatus

            query = $"select id, clave, nombre from EstatusAlumnos where id > {0}";
            using (SqlConnection con = new SqlConnection(_cnnString))
            {
                //Query sería la consulta o el sp (stored procedure), es decir la instruccíón que se va a ejecutar
                comando = new SqlCommand(query, con); //Con es la conexión, canal de comunicación entre SQL Server y C#
                comando.CommandType = CommandType.Text;
                con.Open();
                SqlDataReader reader = comando.ExecuteReader();
                while (reader.Read())
                {
                    _listaEstatus.Add(new EstatusAlumno()
                    {
                        id = Convert.ToInt32(reader["id"]),
                        clave = reader["clave"].ToString(),
                        nombre = reader["nombre"].ToString()
                    });
                }
            }
            return _listaEstatus;
        }

        public EstatusAlumno Consultar(int id) //Consultar solo uno
        {
            // Verificar si el id existe
            string queryCheck = $"SELECT COUNT(*) FROM EstatusAlumnos WHERE id = @id"; // Usamos parámetros para prevenir inyección SQL
            using (SqlConnection con = new SqlConnection(_cnnString))
            {
                SqlCommand comando = new SqlCommand(queryCheck, con);

                //Paramaters propiedad de comando que accede al método AddVWithValue y pasa los paramétros de id a la consulta o sp
                comando.Parameters.AddWithValue("@id", id); // Se añade el parámetro id
                con.Open(); //abrir conexión

                // Verifica si el id existe
                int count = (int)comando.ExecuteScalar(); //execute scalar solo devuelve un valor

                if (count == 0)
                {
                    throw new Exception($"No se puede consultar el id {id}, debido a que no existe."); //levantar excepciones con throw
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
                        return new EstatusAlumno()
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
        public int Agregar(EstatusAlumno estatus)
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
                    throw new Exception("No se puede agregar. Ese id ya existe");
                }

                // Si no existe el estatus a agregar, se procede a la inserción
                query = $"INSERT INTO EstatusAlumnos (id, clave, nombre) VALUES ({estatus.id}, '{estatus.clave}', '{estatus.nombre}')";
                comando = new SqlCommand(query, con);
                comando.CommandType = CommandType.Text; //Propiedad CommandType
                comando.ExecuteNonQuery(); //OBJETO COMANDO MÉTODO EXECUTENONQUERY
                //METODOS ESTATICOS SE ACCEDEN POR CLASE COLOCAS . Y ACCEDES AL METODO
                //NO ESTÁTICOS SON POR OBJETO
                con.Close();
            }
            Console.WriteLine("Estatus agregado exitosamente."); //Método WriteLine
            return estatus.id;
        }

        public void Actualizar(EstatusAlumno estatus)
        {
            string queryCheck = $"select count(*) from EstatusAlumnos where id = {estatus.id}";
            using (SqlConnection con = new SqlConnection(_cnnString))
            {
                comando = new SqlCommand(queryCheck, con);
                con.Open();
                int count = (int)comando.ExecuteScalar(); //Devuelve un solo valor como resultado de un COUNT para verificar si existe o no el registro
                if (count == 0)
                {
                    throw new Exception("No se pudo actualizar. El estatus con ese id no existe");
                }

                string query = $"actualizarEstatusAlumnos";
                comando = new SqlCommand(query, con);
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
                comando = new SqlCommand(queryCheck, con);
                con.Open();
                int count = (int)comando.ExecuteScalar(); //Devuelve el número de registros que coinciden
                if (count == 0)
                {
                    throw new Exception("No se pudo eliminar el estatus con ese id, porque no existe");
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

        public List<EstatusAlumno> Cargar()
        {
            List<EstatusAlumno> _listaEstatus = new List<EstatusAlumno>();
            query = $"consultarEstatusAlumnos";

            using (SqlConnection con = new SqlConnection(_cnnString))
            {
                comando = new SqlCommand(query, con);
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

