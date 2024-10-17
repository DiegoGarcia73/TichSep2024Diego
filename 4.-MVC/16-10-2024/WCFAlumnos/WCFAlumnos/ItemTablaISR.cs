using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;

namespace WCFAlumnos
{
    public class ItemTablaISR
    {
        [DataMember]
        public decimal LimInf {  get; set; }
        [DataMember]
        public decimal LimSup { get; set; }
        [DataMember]
        public decimal CuotaFija { get; set; }
        [DataMember]
        public decimal Excedente { get; set; }
        [DataMember]
        public decimal Subsidio { get; set; }
        [DataMember]
        public decimal Impuesto { get; set; }

    }
}