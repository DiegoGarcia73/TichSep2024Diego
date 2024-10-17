using BusinessLogic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using Newtonsoft.Json;
using Entities;

namespace WCFAlumnos
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "WCFAlumnos" en el código, en svc y en el archivo de configuración a la vez.
    // NOTA: para iniciar el Cliente de prueba WCF para probar este servicio, seleccione WCFAlumnos.svc o WCFAlumnos.svc.cs en el Explorador de soluciones e inicie la depuración.
    public class WCFAlumnos : IWCFAlumnos
    {
        AportacionesIMSS oAportaciones = new AportacionesIMSS();
        ItemTablaISR oItemISR = new ItemTablaISR();

        public AportacionesIMSS CalcularIMSS(int id)
        {
            NAlumno ocalIMSS = new NAlumno();
            Entities.AportacionesIMSS oIMSS = ocalIMSS.CalcularIMSS(id);
            string json = JsonConvert.SerializeObject(oIMSS);
            oAportaciones = JsonConvert.DeserializeObject<AportacionesIMSS>(json);
            return oAportaciones;
        }

        public ItemTablaISR CalcularISR(int id)
        {
           NAlumno ocalISR = new NAlumno();
           Entities.ItemTablaISR oISR = ocalISR.CalcularISR(id);
           string json = JsonConvert.SerializeObject(oISR);
           oItemISR = JsonConvert.DeserializeObject<ItemTablaISR>(json);
           return oItemISR;
        }

    
    }
}
