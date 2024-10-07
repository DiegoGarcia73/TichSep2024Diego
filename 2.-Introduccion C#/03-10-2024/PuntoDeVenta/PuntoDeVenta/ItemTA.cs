using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PuntoDeVenta
{
    internal class ItemTA : ItemBase
    {
       string telefono { get; set; }
       string compañia { get; set; }
       decimal comision { get; set; }

       public ItemTA(Articulo articulo, int cantidad, string telefono, string compañia, decimal comision) : base(articulo, cantidad)
        {
            this.telefono = telefono;
            this.compañia = compañia;
            this.comision = comision;
        }
        public override decimal Total()
        {
            return base.Total() + comision;
        }
        public override void Imprimir()
        {
            decimal subtotal = Subtotal();
            decimal total = Total();
            Console.WriteLine($"id: {id}\narticulo: {nombre}\nprecio: {precio:C2}\ncantidad: {cantidad}\n " +
                $"subtotal {subtotal:C2}\ntelefono: {telefono}\ncompañía: {compañia} \ncomision: {comision}\n" +
                $"total: {total:C2}\n");
        }
    }
}
