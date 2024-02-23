using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUD_Powell
{
    public partial class Confirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblFirstName.Text = Request.QueryString["FirstName"];
                lblOrderNumber.Text = Request.QueryString["OrderNumber"];
                lblCustomerID.Text = Request.QueryString["CustomerID"];
                lblProductName.Text = Request.QueryString["ProductName"];

                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["GourmetShopConnectionString"].ConnectionString))
                {
                    SqlCommand sqlCmd = new SqlCommand("dbo.NewCustomerSummary_Powell", conn);
                    conn.Open();

                    sqlCmd.Connection = conn;
                    sqlCmd.CommandType = System.Data.CommandType.StoredProcedure;

                    SqlDataReader reader = sqlCmd.ExecuteReader();
                    
                    conn.Close();
                    conn.Dispose();
                }
            }

        }

        protected void OrderRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}