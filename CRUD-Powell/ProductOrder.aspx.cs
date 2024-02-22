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
        decimal ProductPrice = 0;
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

                foreach (var item in reader)
                {
                    ProductID = reader.GetInt32(0);
            // Format as Money
                    ProductPrice = reader.GetDecimal(2);
                    strProductDetail = reader.GetString(1) + " - " + ProductPrice.ToString() + " (" + reader.GetString(3) +")";
                }

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

        protected void ctrlProduct_DataBinding(object sender, EventArgs e)
        {
            //FindControl("ctrlProduct");
            //ProductID = int.Parse(Key.Text);
            //        OrderQty = int.Parse(tbQty.Text);
            //            < asp:Label ID = "lblProductName" runat = "server" Text = '<%#Eval("ProductName") %>' />
            //< asp:Label ID = "lblUnitPrice" runat = "server" Text = '<%#Eval("UnitPrice") %>' />
            ////<asp:Label ID="lblProductID" runat="server" Visible="false" Text='<%#Eval("Id") %>' />
            //< asp:TextBox ID = "ctrlQuantity" runat = "server" size = "2" TextMode = "Number" />
            //< asp:Label ID = "lblPackage" runat = "server" Text = '<%#Eval("Package")%>' />

            //    var tbQty = item.FindControl("Quantity") as TextBox;
            //    //var txQty = tbQty.Text;
            //    if (tbQty.Text !=null && int.Parse(tbQty.Text) > 0)
            //    {
            //        var Key = item.FindControl("key") as Label;
            //        ProductID = int.Parse(Key.Text);
            //        OrderQty = int.Parse(tbQty.Text);

            //ProductID = int.Par  (#Eval("UnitPrice"))


        }


        protected void ctrlProduct_DataBound(object sender, EventArgs e)
        {
            //FindControl("ctrlProduct");
            //ProductID = int.Parse(Key.Text);
            //        OrderQty = int.Parse(tbQty.Text);



            //    var tbQty = item.FindControl("Quantity") as TextBox;
            //    //var txQty = tbQty.Text;
            //    if (tbQty.Text !=null && int.Parse(tbQty.Text) > 0)
            //    {
            //        var Key = item.FindControl("key") as Label;
            //        ProductID = int.Parse(Key.Text);
            //        OrderQty = int.Parse(tbQty.Text);
            //string FirstName = string.Empty;
            //string LastName = string.Empty;
            //string City = string.Empty;
            //string Country = string.Empty;
            //string Phone = string.Empty;

        }

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
                sqlCmd.Parameters.AddWithValue("@ProductID", ProductID);
                sqlCmd.Parameters.AddWithValue("@OrderQty", Quantity);
                sqlCmd.Parameters.AddWithValue("@UnitPrice", ProductPrice);
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

            //var ProductID = FindControl("ctrlProductID") as Label;
            //var OrderQty = FindControl("ctrlQuantity") as TextBox;
        }
    }
}