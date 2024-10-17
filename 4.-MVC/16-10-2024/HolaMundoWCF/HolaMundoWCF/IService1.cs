using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization; //permite usar los decoradores data contract y data member. Define contrato de datos
using System.ServiceModel; //definir contrato de servicios
using System.ServiceModel.Web;
using System.Text;

namespace HolaMundoWCF
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de interfaz "IService1" en el código y en el archivo de configuración a la vez.
    [ServiceContract] //clase decorador

    //Contrato de datos
    public interface IService1
    {

        [OperationContract]  //Tiene que ser parte del contrato de servicio para poder exponer los métodos
        string GetData(int value); //firma del método

        [OperationContract]
        CompositeType GetDataUsingDataContract(CompositeType composite);

        // TODO: agregue aquí sus operaciones de servicio
    }


    // Utilice un contrato de datos, como se ilustra en el ejemplo siguiente, para agregar tipos compuestos a las operaciones de servicio.
    [DataContract] //Si las propiedades no son parte del contrato de datos no se pueden usar
    public class CompositeType
    {
        bool boolValue = true;
        string stringValue = "Hello ";

        [DataMember]
        public bool BoolValue
        {
            get { return boolValue; } //obtener valor
            set { boolValue = value; } //set asigna valor
        }

        [DataMember]
        public string StringValue
        {
            get { return stringValue; }
            set { stringValue = value; }
        }
    }
}
