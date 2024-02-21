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
using System.Drawing;
using System.Web.Services.Description;

namespace CRUD_Powell
{
    public partial class ProductOrder : System.Web.UI.Page
    {
        //List<Product> productList = new List<Product>();
        Customer customer;
        List<OrderItem> orderItems;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["GourmetShopConnectionString"].ConnectionString))
                {
                    SqlCommand sqlCmd = new SqlCommand("dbo.ProductList_Powell", conn);
                    conn.Open();

                    sqlCmd.Connection = conn;
                    sqlCmd.CommandType = System.Data.CommandType.StoredProcedure;

                    SqlDataReader reader = sqlCmd.ExecuteReader();
                    ProductRepeater.DataSource = reader;
                    ProductRepeater.DataBind();

                    conn.Close();
                    conn.Dispose();
                }
            }
        }

        //private void BindData()
        //{ 
        //    using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["GourmetShopConnectionString"].ConnectionString))
        //    {
        //        SqlCommand sqlCmd = new SqlCommand("dbo.ProductList_Powell", conn);
        //        conn.Open();

        //        sqlCmd.Connection = conn;
        //        sqlCmd.CommandType = System.Data.CommandType.StoredProcedure;

        //        SqlDataReader reader = sqlCmd.ExecuteReader();
        //        ProductRepeater.DataSource = reader;
                
        //        //foreach (var item in reader)
        //        //{
        //        //    Product p = new Product();
        //        //    p.Id = reader.GetInt32(0);
        //        //    p.ProductName = reader.GetString(1);
        //        //    p.UnitPrice = reader.GetDecimal(2);
        //        //    p.Package = reader.GetString(3);

        //        //    productList.Add(p);
        //        //}

        //        //ProductRepeater.DataSource = productList;
        //        ProductRepeater.DataBind();

        //        conn.Close();
        //        conn.Dispose();
        //    }
        //}


        protected void ProductRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            //RepeaterItem row = e.Item as RepeaterItem;
            //if (row.ItemType == ListItemType.Item)
            //{
            //    Label key = row.FindControl("key") as Label;
            //    TextBox tbQuantity = row.FindControl("quantity") as TextBox;
            //    //LinkButton lnkQty = row.FindControl("Quantity") as LinkButton;
            //}
        }

        protected void ProductRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            //int key = int.Parse(e.CommandArgument.ToString());

        }


        protected void Submit(object sender, EventArgs e)
        { 
            List<OrderItem> orderItems = new List<OrderItem>();
            customer = new Customer();
            
            // Need to find control data for customer
            var FirstName = FindControl("FirstName") as Label;
            //customer.FirstName = form1.FindControl("FirstName").ToString();
            //customer.LastName = form1.FindControl("LastName").ToString();
            //customer.City = form1.FindControl("City").ToString();
            //customer.Phone = form1.FindControl("Phone").ToString();

            foreach(RepeaterItem item in ProductRepeater.Items)
            {
                OrderItem orderItem = new OrderItem();
                
                var foo = item.FindControl("key") as Label;
                orderItem.Id = int.Parse(foo.Text);

                var bar = item.FindControl("Quantity") as TextBox;
                orderItem.Quantity = int.Parse(bar.Text);

                orderItems.Add(orderItem);
            }


            // Call Stored Procedure to Insert
            // Redirect to Confirmation Page
        }
    }
}