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
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["GourmetShopConnectionString"].ConnectionString))
            {
                SqlCommand sqlCmd = new SqlCommand("dbo.ProductList_Powell", conn);
                conn.Open();

                sqlCmd.Connection = conn;
                sqlCmd.CommandType = System.Data.CommandType.StoredProcedure;

                SqlDataReader reader = sqlCmd.ExecuteReader();

                conn.Close();
                conn.Dispose();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string OrderNumber = string.Empty;
            int CustomerID = 0;

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

                sqlCmd.Parameters.AddWithValue("@ProductID",ctrlProduct.SelectedValue);
                sqlCmd.Parameters.AddWithValue("@OrderQty", int.Parse(ctrlQuantity.Text));

                sqlCmd.Parameters.Add("@CustomerID", SqlDbType.Int).Direction = ParameterDirection.Output;
                sqlCmd.Parameters.Add("@OrderNumber", SqlDbType.NVarChar,10).Direction= ParameterDirection.Output;

                sqlCmd.ExecuteScalar();

                OrderNumber = sqlCmd.Parameters["@OrderNumber"].Value.ToString();
                CustomerID = int.Parse(sqlCmd.Parameters["@CustomerID"].Value.ToString());

                conn.Close();
                conn.Dispose();
            }
            Response.Redirect("Confirmation.aspx?FirstName=" + ctrlFirstName.Text
                + "&&OrderNumber=" + OrderNumber
                + "&&CustomerID=" + CustomerID
                + "&&ProductName=" + ctrlProduct.SelectedItem);

        }
    }
}