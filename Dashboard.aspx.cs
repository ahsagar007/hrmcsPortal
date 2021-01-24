using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Contact : Page
{
    SqlCommandBuilder builder;
    SqlConnection con = new SqlConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Session["User"] == null)
        {
            Response.Redirect("~/Account/Login.aspx");
        }
        AdminCounts();
        StudentCounts();
        ClassCounts();
        SubjectCounts();
        


    }
    void AdminCounts()
    {
        
        SqlDataAdapter sda;
        DataSet ds = new DataSet();
        con.ConnectionString = "Data source=DESKTOP-RIQNA6S;initial catalog=HRMCS;integrated Security=true";
        con.Open();
        string sql = "select * from Register";
        sda = new SqlDataAdapter(sql, con);
        sda.Fill(ds);
        builder = new SqlCommandBuilder(sda);
        AdminCount.Text = ds.Tables[0].Rows.Count.ToString();
        //AdminCount1.Text = ds.Tables[0].Rows.Count.ToString();
        con.Close();

    }

    void StudentCounts()
    {
        
        SqlDataAdapter sda;
        DataSet ds = new DataSet();
        con.ConnectionString = "Data source=DESKTOP-RIQNA6S;initial catalog=HRMCS;integrated Security=true";
        con.Open();
        string sql1 = "select * from RegStudent";
        sda = new SqlDataAdapter(sql1, con);
        sda.Fill(ds);
        builder = new SqlCommandBuilder(sda);
        StudentCount.Text = ds.Tables[0].Rows.Count.ToString();
        //StudentCount1.Text = ds.Tables[0].Rows.Count.ToString();
        con.Close();

    }

    void ClassCounts()
    {
        
        SqlDataAdapter sda;
        DataSet ds = new DataSet();
        con.ConnectionString = "Data source=DESKTOP-RIQNA6S;initial catalog=HRMCS;integrated Security=true";
        con.Open();
        string sql = "select * from Class";
        sda = new SqlDataAdapter(sql, con);
        sda.Fill(ds);
        builder = new SqlCommandBuilder(sda);
        //ClassCount.Text = ds.Tables[0].Rows.Count.ToString();
        //ClassCount1.Text = ds.Tables[0].Rows.Count.ToString();
        con.Close();

    }

    void SubjectCounts()
    {
        
        SqlDataAdapter sda;
        DataSet ds = new DataSet();
        con.ConnectionString = "Data source=DESKTOP-RIQNA6S;initial catalog=HRMCS;integrated Security=true";
        con.Open();
        string sql = "select * from Subject";
        sda = new SqlDataAdapter(sql, con);
        sda.Fill(ds);
        builder = new SqlCommandBuilder(sda);
        //SubjectCount.Text = ds.Tables[0].Rows.Count.ToString();
        //SubjectCount1.Text = ds.Tables[0].Rows.Count.ToString();
        con.Close();

    }

    protected void Logoutbtn_Click(object sender, EventArgs e)
    {
        Session.Remove("User");
        Response.Redirect("~/Account/Login.aspx");
    }
}