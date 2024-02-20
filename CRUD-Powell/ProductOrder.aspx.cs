using CRUD_Powell.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data.Sql;

using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace CRUD_Powell
{
    public partial class ProductOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Product> productList = new List<Product>();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["GourmetShopConnectionString"].ConnectionString))
            {
                SqlCommand sqlCmd = new SqlCommand("dbo.ProductList_Powell", conn);
                conn.Open();

                sqlCmd.Connection = conn;
                sqlCmd.CommandType = System.Data.CommandType.StoredProcedure;

                SqlDataReader reader = sqlCmd.ExecuteReader();

                foreach(var item in reader)
                {
                    Product p = new Product();
                    p.ProductName = reader.GetString(1);
                    p.UnitPrice = reader.GetDecimal(2);
                    p.Package = reader.GetString(3);


                }

                //sqlCmd.ExecuteNonQuery();

                conn.Close();
            }

        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}