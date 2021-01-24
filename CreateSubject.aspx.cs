using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class CreateSubject : System.Web.UI.Page
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
        string checkuser = "select count(*) from Subject where SubjectCode='" + DrpSubjectCode.Text + "'";
        SqlCommand cm = new SqlCommand(checkuser, con);
        int temp = Convert.ToInt32(cm.ExecuteScalar().ToString());
        if (temp == 1)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Random", "ErrorAlert()", true);


        }
        else
        {
            SqlCommand cmd = new SqlCommand("insert into Subject" + "(SubjectName,SubjectCode,Date)" + "values(@SubjectName,@SubjectCode,@Date)", con);
            cmd.Parameters.AddWithValue("@SubjectName", DrpSubjectName.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@SubjectCode", DrpSubjectCode.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@Date", DateTime.Now);


            cmd.ExecuteNonQuery();
            ClientScript.RegisterStartupScript(this.GetType(), "Random", "SuccessAlert()", true);
        }
        con.Close();
    }
}