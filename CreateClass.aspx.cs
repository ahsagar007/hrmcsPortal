using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class _Class : System.Web.UI.Page
{
    SqlCommand cmd = new SqlCommand();
    SqlConnection con = new SqlConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        con.ConnectionString = "Data source=DESKTOP-RIQNA6S;initial catalog=HRMCS;integrated Security=true";

        //if (Session["User"] == null)
        //{
        //    Response.Redirect("~/Account/Login.aspx");
        //}

    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.Url.AbsoluteUri);
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into Class" + "(ClassName,ClassNameNumeric,Section,Date)" + "values(@ClassName,@ClassNameNumeric,@Section,@Date)", con);
        cmd.Parameters.AddWithValue("@ClassName", DrpClassName.SelectedItem.Value);
        cmd.Parameters.AddWithValue("@ClassNameNumeric", DrpClassNameNumeric.SelectedItem.Value);
        cmd.Parameters.AddWithValue("@Section", DrpSection.SelectedItem.Value);
        cmd.Parameters.AddWithValue("@Date", DateTime.Now);


        cmd.ExecuteNonQuery();
        Confirmation.Text = "<script>alert('Inserted Successfully')</script>";
        con.Close();
    }
}