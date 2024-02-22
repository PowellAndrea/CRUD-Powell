﻿using CRUD_Powell.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data.Sql;

using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using Microsoft.SqlServer.Server;
using System.Data;
using System.Web.DynamicData;

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

                foreach (var item in reader)
                {
                    Product p = new Product();
                    p.Id = reader.GetInt32(0);
                    p.ProductName = reader.GetString(1);
                    p.UnitPrice = reader.GetDecimal(2);
                    p.Package = reader.GetString(3);

                    productList.Add(p);
                }

                ProductRepeater.DataSource = productList;
                ProductRepeater.DataBind();

                    conn.Close();
                    conn.Dispose();
                }
        }

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

    }

    protected void ctrlProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            var FirstName = FindControl("ctrlFirstName") as TextBox;
            var LastName = FindControl("ctrlLastName") as TextBox;
            var City = FindControl("ctrlCity") as TextBox;
            var Country = FindControl("ctrlCountry") as TextBox;
            var Phone = FindControl("ctrlPhone") as TextBox;

            //var ProductID = FindControl("ctrlProductID") as Label;
            //var OrderQty = FindControl("ctrlQuantity") as TextBox;
            var ctrlPrice = FindControl("ctrlPrice") as Label;


            //customer.FirstName = form1.FindControl("FirstName").ToString();
            //customer.LastName = form1.FindControl("LastName").ToString();
            //customer.City = form1.FindControl("City").ToString();
            //customer.Phone = form1.FindControl("Phone").ToString();

            //foreach (RepeaterItem item in ProductRepeater.Items)
            //{
            //    var tbQty = item.FindControl("Quantity") as TextBox;
            //    //var txQty = tbQty.Text;
            //    if (tbQty.Text !=null && int.Parse(tbQty.Text) > 0)
            //    {
            //        var Key = item.FindControl("key") as Label;
            //        ProductID = int.Parse(Key.Text);
            //        OrderQty = int.Parse(tbQty.Text);
            //        // Stopping after first non 0 quantity found
            //        break;
            //    }
            //}

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["GourmetShopConnectionString"].ConnectionString))
            {
                SqlCommand sqlCmd = new SqlCommand("dbo.InsertCustomerAndOrder_Powell", conn);
                conn.Open();

                sqlCmd.Connection = conn;
                sqlCmd.CommandType = System.Data.CommandType.StoredProcedure;

                sqlCmd.Parameters.AddWithValue("@FirstName", FirstName.Text);
                sqlCmd.Parameters.AddWithValue("@LastName", LastName.Text);
                sqlCmd.Parameters.AddWithValue("@City", City.Text);
                sqlCmd.Parameters.AddWithValue("@Country", Country.Text);
                sqlCmd.Parameters.AddWithValue("@Phone",City.Text);

                // Fix This
                sqlCmd.Parameters.AddWithValue("@ProductID", 5);
                sqlCmd.Parameters.AddWithValue("@OrderQty",6);

                int UnitPrice = 0;
                UnitPrice = int.Parse(ctrlPrice.Text);
                sqlCmd.Parameters.AddWithValue("@UnitPrice", UnitPrice);
                //sqlCmd.Parameters.AddWithValue("@UnitPrice", int.Parse(ctrlPrice.Text));
                //sqlCmd.Parameters.AddWithValue("@ProductID", ProductID.Text);
                //sqlCmd.Parameters.AddWithValue("@OrderQty", OrderQty);

                sqlCmd.Parameters.AddWithValue("@CustomerID", SqlDbType.Int).Direction = ParameterDirection.Output;
                sqlCmd.ExecuteNonQuery();

                //int customerID = (int)sqlCmd.Parameters["@CustomerID"].Value;

                conn.Close();
                conn.Dispose();
            }
            Response.Redirect("Confirmation.aspx");
        }
    }
}