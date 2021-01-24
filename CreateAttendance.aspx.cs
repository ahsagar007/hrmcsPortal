using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class CreateAttendance : System.Web.UI.Page
{
    SqlCommand cmd = new SqlCommand();
    SqlConnection con = new SqlConnection();
    SqlDataAdapter da;
    DataSet ds = new DataSet();
    Connection com = new Connection();
    string connectionString = @"Data Source=DESKTOP-RIQNA6S;Initial Catalog=HRMCS;Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        con.ConnectionString = "Data source=DESKTOP-RIQNA6S;initial catalog=HRMCS;integrated Security=true";

        if (!IsPostBack)
        {
            PanelResult.Visible = false;
            Class();

            
        }
    }




    void PopulateGridview()
    {
        DataTable dtbl = new DataTable();
        using (SqlConnection sqlCon = new SqlConnection(connectionString))
        {
            sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("select * from RegStudent where ExpectedClass='" + ddlClass.SelectedItem + "'", sqlCon);
            sqlDa.Fill(dtbl);
        }
        if (dtbl.Rows.Count > 0)
        {
            gvPhoneBook.DataSource = dtbl;
            gvPhoneBook.DataBind();
        }
        else
        {
            dtbl.Rows.Add(dtbl.NewRow());
            gvPhoneBook.DataSource = dtbl;
            gvPhoneBook.DataBind();
            gvPhoneBook.Rows[0].Cells.Clear();
            gvPhoneBook.Rows[0].Cells.Add(new TableCell());
            gvPhoneBook.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
            gvPhoneBook.Rows[0].Cells[0].Text = "No Data Found ..!";
            gvPhoneBook.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
        }

    }
    



    protected void Class()
    {
        DataTable dt = com.ExecuteQuery("Select ID, ClassName + ' Section-' + Section ClassName from Class");
        ddlClass.DataSource = dt;
        ddlClass.DataBind();
        ddlClass.Items.Insert(0, new ListItem("--Select Class--", "0"));

        
    }

    

    protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        PopulateGridview();
        PanelResult.Visible = true;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        foreach(GridViewRow row in gvPhoneBook.Rows)
        {
            Label id = (row.Cells[0].FindControl("lblID") as Label);
            Label name = (row.Cells[1].FindControl("lblName") as Label);
            RadioButton radioPresent = (row.Cells[2].FindControl("radioPresent") as RadioButton);
            RadioButton radioAbsent = (row.Cells[2].FindControl("radioAbsent") as RadioButton);
            string status;
            if (radioPresent.Checked)
            {
                status = "Present";
            }
            else
            {
                status = "Absent";
            }
            saveAttendance(id.Text, name.Text, status);
        }
       
    }

    private void saveAttendance(string Roll,String Name, String status)
    {

        string query = @"insert into Attendance(Roll,Name,Status,Date) values('" + Roll + "','" + Name + "','" + status + "',GETDATE() )";
        com.ExecuteNonQuery(query);

    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        
    }


    
}