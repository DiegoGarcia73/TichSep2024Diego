using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;


namespace HolaMundoWCF
{
    public class AportacionesIMSS
    {
        [DataMember]
        public decimal MaternidadEnfermedad {  get; set; }
        [DataMember]
        public decimal InvalidezVida {  get; set; }

    }
}