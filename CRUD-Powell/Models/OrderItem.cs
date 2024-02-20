using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CRUD_Powell.Models
{
    public class OrderItem
    {
        public int Id { get; set; }
        public int OrderID { get; set; }
        public int ProductID {  get; set; }
        //public decimal UnitPrice { get; set; } use unit price of product
        public int Quantity { get; set; }
    }
}