using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PuntoDeVenta
{
    internal class Item : ItemBase //hereda de la clase padre ItemBase
    {

        public Item(Articulo articulo, int cantidad) : base(articulo, cantidad)
        { 
        }
        public override void Imprimir() //polimorfismo del método imprimir
        {
            decimal subtotal = Subtotal();
            decimal total = Total();
            Console.WriteLine($"id: {id}\nnombre: {nombre}\nprecio: {precio:C2}\ncantidad: {cantidad}\n" +
                $"subtotal: {subtotal:C2}\ntotal: {total:C2}\n");

        }
    }
}
