using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


public partial class Experiment3 : System.Web.UI.Page
{
    SqlCommand cmd = new SqlCommand();
    SqlConnection con = new SqlConnection();
    SqlDataAdapter da;
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        con.ConnectionString = "Data source=DESKTOP-RIQNA6S;initial catalog=HRMCS;integrated Security=true";
        if (!IsPostBack)
        {
            Class();
            Subject();
        }
    }
    protected void Class()
    {
        con.Open();
        da = new SqlDataAdapter("select distinct * from Class", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        dt.Columns.Add("Name", typeof(string), "ClassName+' '+'Section'+'-'+Section");
        ddlClass.Items.Clear();
        ddlClass.DataSource = dt;
        ddlClass.DataTextField = "Name";
        //ddlClass.DataValueField = "ID";
        ddlClass.DataBind();
        ddlClass.Items.Insert(0, new ListItem("--Select Class--", "0"));
        con.Close();
    }
    protected void Subject()
    {
        con.Open();
        da = new SqlDataAdapter("select distinct * from Subject", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        ddlSubject.Items.Clear();
        ddlSubject.DataSource = dt;
        ddlSubject.DataTextField = "SubjectName";
        //ddlSubject.DataValueField = "ID";
        ddlSubject.DataBind();
        ddlSubject.Items.Insert(0, new ListItem("--Select State--", "0"));
        con.Close();
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.Url.AbsoluteUri);
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        con.Open();
        string checkuser = "select count(*) from SubjectCombination where ClassName='" + ddlClass.Text + "' and SubjectName='" + ddlSubject.Text + "' ";
        SqlCommand cm = new SqlCommand(checkuser, con);
        int temp = Convert.ToInt32(cm.ExecuteScalar().ToString());
        if (temp == 1)
        {
            Confirmation.Text = "<script>alert('Already Registered!')</script>";

        }
        else
        {
            SqlCommand cmd = new SqlCommand("insert into SubjectCombination" + "(ClassName,SubjectName)" + "values(@ClassName,@SubjectName)", con);
            cmd.Parameters.AddWithValue("@ClassName", ddlClass.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@SubjectName", ddlSubject.SelectedItem.Text);

            cmd.ExecuteNonQuery();
            Confirmation.Text = "<script>alert('Inserted Successfully')</script>";
        }
        con.Close();

    }




};