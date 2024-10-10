using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace ADOWinForms.Entidades
{
    //Enum: conjunto de constantes asociados a un valor numérico
    //Struct por valor y class por referencia: creas objetos a partir de ellas y tienen propiedades y métodos
    //Por default valor si no usas class o struct y envías parámetros.  

    //struct conjunto de tipos de dato, tanto propiedas y métodos se definen
    internal class EstatusAlumno //Modificador de acceso Internal tipo de class 
    {
        //Propiedad. Modificador de acceso public con sus tipos de datos y sus
        public int id { get; set; } //get obtener el valor de la propiedad y set lo asigna
        public string clave { get; set; }
        public string nombre { get; set; }
    }
}
