using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PuntoDeVenta
{
    internal class ItemDescuento : ItemBase
    {
        decimal descuento { get; set; }
        //public tipoProducto Tipo { get; set; }
        decimal impDescuento //Propiedad impDescuento solo lectura
        {
            get
            {
                return Subtotal() * (descuento / 100);
            }
        }
        public ItemDescuento(Articulo articulo, int cantidad, decimal descuento) : base (articulo, cantidad)
        {
            this.descuento = descuento;
        }
        public override decimal Total()
        {
            return Subtotal() - impDescuento;
        }
        public override void Imprimir()
        {
            decimal subtotal = Subtotal();
            decimal total = Total();
            Console.WriteLine($"id: {id}\nnombre: {nombre}\nprecio: {precio:C2}\ncantidad: {cantidad}\n" +
                $"subtotal: {subtotal:C2}\ndescuento: {descuento}%\ntotal: {total:C2}\n");
        }
    }
}
