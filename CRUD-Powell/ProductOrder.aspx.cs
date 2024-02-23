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
using Microsoft.SqlServer.Server;
using System.Data;
using System.Web.DynamicData;
using static System.Net.Mime.MediaTypeNames;
using System.Drawing;
using System.Security.Policy;
using System.Runtime.Remoting.Messaging;

namespace CRUD_Powell
{
    public partial class ProductOrder : System.Web.UI.Page
    {
        string FirstName = "Andrea";
        string LastName = "Powell";
        string City = "City";
        string Country = "Country";
        string Phone = string.Empty;

        string strProductDetail = string.Empty;
        int ProductID = 0;
        string ProductName = string.Empty;
        decimal UnitPrice = 0;
        int Quantity = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["GourmetShopConnectionString"].ConnectionString))
            {
                SqlCommand sqlCmd = new SqlCommand("dbo.ProductList_Powell", conn);
                conn.Open();

                sqlCmd.Connection = conn;
                sqlCmd.CommandType = System.Data.CommandType.StoredProcedure;

                SqlDataReader reader = sqlCmd.ExecuteReader();

                //foreach (var item in reader)
                //{
                //    int ProductID = reader.GetInt32(0);
                //    string ProductName = reader.GetName(1);
                //    decimal UnitPrice = reader.GetDecimal(2);
                //    string Package = reader.GetString(3);
                //    string strProductDetail = reader.GetString(1) + " - " + UnitPrice.ToString() + " (" + reader.GetString(3) +")";
                //}

                conn.Close();
                conn.Dispose();
            }
        }

        //protected void ctrlProduct_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    var FirstName = FindControl("ctrlFirstName") as TextBox;
        //    var LastName = FindControl("ctrlLastName") as TextBox;
        //    var City = FindControl("ctrlCity") as TextBox;
        //    var Country = FindControl("ctrlCountry") as TextBox;
        //    var Phone = FindControl("ctrlPhone") as TextBox;

        //    //foreach (RepeaterItem item in ProductRepeater.Items)
        //    //{
        //    //    var tbQty = item.FindControl("Quantity") as TextBox;
        //    //    //var txQty = tbQty.Text;
        //    //    if (tbQty.Text !=null && int.Parse(tbQty.Text) > 0)
        //    //    {
        //    //        var Key = item.FindControl("key") as Label;
        //    //        ProductID = int.Parse(Key.Text);
        //    //        OrderQty = int.Parse(tbQty.Text);

        //    //form1.FindControl("FirstName").ToString()


        //}

        //protected void ctrlProduct_DataBinding(object sender, EventArgs e)
        //{
        //    //FindControl("ctrlProduct");
        //    ProductID = int.Parse(lblProductID.ToString());
        //    UnitPrice = decimal.Parse(lblUnitPrice.ToString());
        //    ProductName = lblProductName.ToString();
        //    strProductDetail = lblProductName.ToString();
        //}


    protected void btnSubmit_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["GourmetShopConnectionString"].ConnectionString))
            {
                SqlCommand sqlCmd = new SqlCommand("dbo.InsertCustomerAndOrder_Powell", conn);
                conn.Open();

                sqlCmd.Connection = conn;
                sqlCmd.CommandType = System.Data.CommandType.StoredProcedure;

                sqlCmd.Parameters.AddWithValue("@FirstName", ctrlFirstName.Text);
                sqlCmd.Parameters.AddWithValue("@LastName", ctrlLastName.Text);
                sqlCmd.Parameters.AddWithValue("@City", ctrlCity.Text);
                sqlCmd.Parameters.AddWithValue("@Country", ctrlCountry.Text);
                sqlCmd.Parameters.AddWithValue("@Phone", ctrlCity.Text);

                // Fix This
                sqlCmd.Parameters.AddWithValue("@ProductID", int.Parse(ctrlProduct.Text));
                sqlCmd.Parameters.AddWithValue("@OrderQty", int.Parse(ctrlQuantity.Text));
                //var foo = lblUnitPrice.Text;
                //var bar = int.Parse(lblUnitPrice.Text);
                //var bar = decimal.Parse(foo);
                //sqlCmd.Parameters.AddWithValue("@UnitPrice", int.Parse(lblUnitPrice.Text));

                sqlCmd.Parameters.Add("@CustomerID", SqlDbType.Int).Direction = ParameterDirection.Output;
                var CustomerID = sqlCmd.ExecuteNonQuery();

                conn.Close();
                conn.Dispose();
            }
            Response.Redirect("Confirmation.aspx");
        }
    }
}