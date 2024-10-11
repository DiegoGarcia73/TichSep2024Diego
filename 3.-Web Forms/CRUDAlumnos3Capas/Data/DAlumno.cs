using Entities;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.IO;


namespace Data
{
    public class DAlumno
    {
       
        string _cnnString = ConfigurationManager.ConnectionStrings["InstitutoConnection"].ConnectionString;
        string _query;
        SqlCommand comando;

        public List<Alumno> Consultar()
        {
            List<Alumno> listaAlumno = new List<Alumno>();

            _query = $"consultarEAlumnos";
            using (SqlConnection con = new SqlConnection(_cnnString))
            {
                comando = new SqlCommand(_query, con);
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@idAlumno", -1);
                con.Open();
                SqlDataReader reader = comando.ExecuteReader();
                while (reader.Read())
                {
                    listaAlumno.Add(new Alumno()
                    {
                        id = Convert.ToInt32(reader["id"]),
                        nombre = reader["nombre"].ToString(),
                        primerApellido = reader["primerApellido"].ToString(),
                        segundoApellido = reader["segundoApellido"].ToString(),
                        correo = reader["correo"].ToString(),
                        telefono = reader["telefono"].ToString(),
                        fechaNacimiento = Convert.ToDateTime(reader["fechaNacimiento"]),
                        curp = reader["curp"].ToString(),
                        sueldo = reader["sueldo"] == DBNull.Value ? 0 : Convert.ToDecimal(reader["sueldo"]),
                        idEstadoOrigen = Convert.ToInt32(reader["idEstadoOrigen"]),
                        idEstatus = Convert.ToInt32(reader["idEstatus"])

                    });
                }
                
            }
            return listaAlumno;
           
        }
            
        public Alumno Consultar(int id)
        {

            // Verificar si el id existe
            _query = $"consultarEAlumnos"; // Usamos parámetros para prevenir inyección SQL
            using (SqlConnection con = new SqlConnection(_cnnString))
            {
           
                // Si el id existe, consultamos el registro
                _query = $"consultarEAlumnos";
                comando = new SqlCommand(_query, con);
                comando.Parameters.AddWithValue("@idAlumno", id); // Se añade el parámetro id
                comando.CommandType = CommandType.StoredProcedure;
                con.Open();

                using (SqlDataReader reader = comando.ExecuteReader())
                {
                    if (reader.Read()) // Verifica si hay filas que leer
                    {
                        return new Alumno()
                        {
                            id = Convert.ToInt32(reader["id"]),
                            nombre = reader["nombre"].ToString(),
                            primerApellido = reader["primerApellido"].ToString(),
                            segundoApellido = reader["segundoApellido"].ToString(),
                            correo = reader["correo"].ToString(),
                            telefono = reader["telefono"].ToString(),
                            fechaNacimiento = Convert.ToDateTime(reader["fechaNacimiento"]),
                            curp = reader["curp"].ToString(),
                            sueldo = reader["sueldo"]==DBNull.Value ? 0 : Convert.ToDecimal(reader["sueldo"]),
                            idEstadoOrigen = Convert.ToInt32(reader["idEstadoOrigen"]),
                            idEstatus = Convert.ToInt32(reader["idEstatus"])
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



        public void Agregar(Alumno alumno)
        {
            _query = $"sp_agregarAlumnos";

            using (SqlConnection conexion = new SqlConnection(_cnnString))
            {
                comando = new SqlCommand(_query, conexion);
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@nombre", alumno.nombre);
                comando.Parameters.AddWithValue("@primerApellido", alumno.primerApellido);
                comando.Parameters.AddWithValue("@segundoApellido", alumno.segundoApellido);
                comando.Parameters.AddWithValue("@correo", alumno.correo);
                comando.Parameters.AddWithValue("@telefono", alumno.telefono);
                comando.Parameters.AddWithValue("@fechaNacimiento", alumno.fechaNacimiento);
                comando.Parameters.AddWithValue("@curp", alumno.curp);
                comando.Parameters.AddWithValue("@sueldo", alumno.sueldo);
                comando.Parameters.AddWithValue("@idEstadoOrigen", alumno.idEstadoOrigen);
                comando.Parameters.AddWithValue("@idEstatus", alumno.idEstatus);
                conexion.Open();
                comando.ExecuteNonQuery();
                conexion.Close();

            }


        }
        public void Actualizar(Alumno alumno)
        {
            _query = $"actualizarAlumnos";

            using (SqlConnection conexion = new SqlConnection(_cnnString))
            {
                comando = new SqlCommand(_query, conexion);
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@idAlumno", alumno.id);
                comando.Parameters.AddWithValue("@nombre", alumno.nombre);
                comando.Parameters.AddWithValue("@primerApellido", alumno.primerApellido);
                comando.Parameters.AddWithValue("@segundoApellido", alumno.segundoApellido);
                comando.Parameters.AddWithValue("@correo", alumno.correo);
                comando.Parameters.AddWithValue("@telefono", alumno.telefono);
                comando.Parameters.AddWithValue("@fechaNacimiento", alumno.fechaNacimiento);
                comando.Parameters.AddWithValue("@curp", alumno.curp);
                comando.Parameters.AddWithValue("@sueldo", alumno.sueldo);
                comando.Parameters.AddWithValue("@idEstadoOrigen", alumno.idEstadoOrigen);
                comando.Parameters.AddWithValue("@idEstatus", alumno.idEstatus);
                conexion.Open();
                comando.ExecuteNonQuery();
                conexion.Close();
            }
        }
        public void Eliminar(int id)
        {
            _query = $"sp_eliminarTabAlumnos";

            using (SqlConnection conexion = new SqlConnection(_cnnString))
            {
                comando = new SqlCommand(_query, conexion);
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@id", id);
                conexion.Open();
                comando.ExecuteNonQuery();
                conexion.Close();
            }
        }

        List<ItemTablaISR> _listaItemISR = new List<ItemTablaISR>();

        public List<ItemTablaISR> ConsultarTablaISR()
        {
            _query = $"select * from TablaISR";
            using (SqlConnection conexion = new SqlConnection(_cnnString))
            {
                comando = new SqlCommand(_query , conexion);
                comando.CommandType = CommandType.Text;
                conexion.Open();
                SqlDataReader reader = comando.ExecuteReader();

                while (reader.Read())
                {
                    _listaItemISR.Add(new ItemTablaISR()
                    {
                        LimiteInferior = Convert.ToDecimal(reader["LimInf"]),
                        LimiteSuperior = Convert.ToDecimal(reader["LimSup"]),
                        CuotaFija = Convert.ToDecimal(reader["CuotaFija"]),
                        Excedente = Convert.ToDecimal(reader["ExedLimInf"]),
                        Subsidio = Convert.ToDecimal(reader["Subsidio"])

                    });
                }
            }
            return _listaItemISR;
        }
    }
}
