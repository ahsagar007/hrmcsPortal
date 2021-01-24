using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class ClassView : System.Web.UI.Page
{
    SqlCommand cmd = new SqlCommand();
    SqlConnection con = new SqlConnection();
    SqlDataAdapter da;
    DataSet ds = new DataSet();
    Connection com = new Connection();
    protected void Page_Load(object sender, EventArgs e)
    {
        con.ConnectionString = "Data source=DESKTOP-RIQNA6S;initial catalog=HRMCS;integrated Security=true";

        if (!IsPostBack)
        {
            Class();
            PanelResult.Visible = false;
        }
        TableSubject = SubjectTable();

    }

    protected void Class()
    {
        PanelResult.Visible = false;

        DataTable dt = com.ExecuteQuery("Select ID, ClassName + ' Section-' + Section ClassName from Class");
        
        ddlClass.DataSource = dt;
        ddlClass.DataBind();
        ddlClass.Items.Insert(0, new ListItem("--Select Class--", "0"));
        
    }

    

    protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
    {
        PanelResult.Visible = false;
        con.Open();
        da = new SqlDataAdapter("select ID, Name  from RegStudent where ExpectedClass='"+ddlClass.SelectedItem+"'", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        ddlStudent.Items.Clear();
        ddlStudent.DataTextField = "Name";
        ddlStudent.DataSource = dt;
        //ddlClass.DataValueField = "ID";
        ddlStudent.DataBind();
        ddlStudent.Items.Insert(0, new ListItem("--Select Student--", "0"));
        con.Close();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        foreach (RepeaterItem r in rpt.Items)
        {
            Label SubjectName = (Label)r.FindControl("SubjectName");
            
            HiddenField SubjectID = (HiddenField)r.FindControl("hdnSubjectID");
            TextBox Marks = (TextBox)r.FindControl("Marks");

            string query = @"insert into RegResult(Term,Class,StudentID,StudentName,SubjectID,SubjectName,Marks,Date) values('" + ddlTerm.SelectedItem.Text + "', '"+ ddlClass.SelectedItem.Text + "'," + ddlStudent.SelectedValue + ",'" + ddlStudent.SelectedItem.Text + "',"+ SubjectID.Value + ",'"+ SubjectName.Text + "','"+ Marks.Text + "',GETDATE())";
            com.ExecuteNonQuery(query);

        }



    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        decimal totalMarks = 0;
        foreach (RepeaterItem r in rpt.Items)
        {
            TextBox total = (TextBox)r.FindControl("Marks");

            totalMarks += Convert.ToDecimal(total.Text == "" ? "0" : total.Text);

        }

        txtTotal.Text = totalMarks.ToString();
        
        
    }

    protected void ddlStudent_SelectedIndexChanged(object sender, EventArgs e)
    {

        PanelResult.Visible = true;
        con.Open();
        da = new SqlDataAdapter("select *  from SubjectCombination where ClassName='" + ddlClass.SelectedItem + "'", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        

        TableSubject = SubjectTable();

        if (dt != null)
        {
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    TableSubject.Rows.Add(dt.Rows[i]["ID"].ToString(), dt.Rows[i]["SubjectName"].ToString());
                }
                rpt.DataSource = TableSubject;
                rpt.DataBind();
            }

        }
        
        

    }

    DataTable TableSubject
    {
        set { ViewState["TableSubject"] = value; }
        get
        {
            try
            {
                return (DataTable)ViewState["TableSubject"];
            }
            catch
            {
                return null;
            }
        }
    }
    private DataTable SubjectTable()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("SubjectID");
        dt.Columns.Add("SubjectName");
        

        return dt;
    }

    
}