﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CRUD_Powell.Models
{
    public class Product
    {
        public int Id { get; set; }
        public string ProductName { get; set; } 
        public decimal UnitPrice { get; set; }
        public string Package {  get; set; }

    }
}