using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;

namespace WCFAlumnos
{
    public class AportacionesIMSS
    {
        [DataMember]
        public decimal EnfermerdadMaternidad {  get; set; }
        [DataMember]
        public decimal InvalidezVida {  get; set; }
        [DataMember]
        public decimal Retiro {  get; set; }
        [DataMember]
        public decimal Cesantia { get; set; }
        [DataMember]
        public decimal Infonavit {  get; set; }

    }
}