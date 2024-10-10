using ADOWebForms.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADOWebForms.ADO
{
    internal interface ICRUD
    {
        //Retorna una lista de estatusAlumnos y define un método llamado Consultar() que no recibe argumentos. Enviar es parámetro
        List<EstatusAlumno> Consultar(); //firma del método. Interfaz es un contrato en donde se define todos los métodos a usar
        EstatusAlumno Consultar(int id); //Retorna un objeto de tipo EstatusAlumno y recibe como parámetro un valor entero llamado id
        int Agregar(EstatusAlumno estatus); //Retorna un tipo de dato entero y el método se llama Agregar y recibe como argumento un objeto Estatus Alumno y estatus es la variable/tipo de dato
        void Actualizar(EstatusAlumno estatus); //Void no tiene valor de retorno. Agregar se llama el método y recibe como argumento un objeto de tipo EstatusAlumno
        void Eliminar(int id);
    }
}
