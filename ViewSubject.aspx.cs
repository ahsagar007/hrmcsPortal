using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class ViewSubject : System.Web.UI.Page
{
    string connectionString = @"Data Source=DESKTOP-E8VU3NU;Initial Catalog=HRMCS;Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateGridview();
        }
    }
    void PopulateGridview()
    {
        DataTable dtbl = new DataTable();
        using (SqlConnection sqlCon = new SqlConnection(connectionString))
        {
            sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Subject", sqlCon);
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
    protected void gvPhoneBook_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("AddNew"))
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "INSERT INTO Subject (SubjectName,SubjectCode,Date) VALUES (@SubjectName,@SubjectCode,@Date)";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@SubjectName", (gvPhoneBook.FooterRow.FindControl("txtFirstNameFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@SubjectCode", (gvPhoneBook.FooterRow.FindControl("txtLastNameFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Date", (gvPhoneBook.FooterRow.FindControl("txtEmailFooter") as TextBox).Text.Trim());
                    sqlCmd.ExecuteNonQuery();
                    PopulateGridview();
                    lblSuccessMessage.Text = "New Record Added";
                    lblErrorMessage.Text = "";
                }
            }
        }
        catch (Exception ex)
        {
            lblSuccessMessage.Text = "";
            lblErrorMessage.Text = ex.Message;
        }
    }

    protected void gvPhoneBook_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvPhoneBook.EditIndex = e.NewEditIndex;
        PopulateGridview();
    }

    protected void gvPhoneBook_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvPhoneBook.EditIndex = -1;
        PopulateGridview();
    }

    protected void gvPhoneBook_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                string query = "UPDATE Subject SET SubjectName=@SubjectName,SubjectCode=@SubjectCode,Date=@Date WHERE ID = @id";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@SubjectName", (gvPhoneBook.Rows[e.RowIndex].FindControl("txtFirstName") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@SubjectCode", (gvPhoneBook.Rows[e.RowIndex].FindControl("txtLastName") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@Date", (gvPhoneBook.Rows[e.RowIndex].FindControl("txtEmail") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvPhoneBook.DataKeys[e.RowIndex].Value.ToString()));
                sqlCmd.ExecuteNonQuery();
                gvPhoneBook.EditIndex = -1;
                PopulateGridview();
                lblSuccessMessage.Text = "Selected Record Updated";
                lblErrorMessage.Text = "";
            }
        }
        catch (Exception ex)
        {
            lblSuccessMessage.Text = "";
            lblErrorMessage.Text = ex.Message;
        }
    }

    protected void gvPhoneBook_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                string query = "DELETE FROM Subject WHERE ID = @id";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvPhoneBook.DataKeys[e.RowIndex].Value.ToString()));
                sqlCmd.ExecuteNonQuery();
                PopulateGridview();
                lblSuccessMessage.Text = "Selected Record Deleted";
                lblErrorMessage.Text = "";
            }
        }
        catch (Exception ex)
        {
            lblSuccessMessage.Text = "";
            lblErrorMessage.Text = ex.Message;
        }
    }
}