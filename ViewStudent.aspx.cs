using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class ViewStudent : System.Web.UI.Page

{
    
    string connectionString = @"Data Source=DESKTOP-RIQNA6S;Initial Catalog=HRMCS;Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        //con.ConnectionString = "Data source=DESKTOP-RIQNA6S;initial catalog=HRMCS;integrated Security=true";

        if (!IsPostBack)
        {
            PanelResult.Visible = true;
            Class();
            PopulateGridview();


        }
    }

    void PopulateGridview()
    {
        DataTable dtbl = new DataTable();
        using (SqlConnection sqlCon = new SqlConnection(connectionString))
        {
            sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM RegStudent", sqlCon);
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


    void Class()
    {
        PanelResult.Visible = true;
        DataTable dt = new DataTable();
        SqlConnection sqlCon = new SqlConnection(connectionString);
        sqlCon.Open();
        SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT DISTINCT ExpectedClass FROM RegStudent", sqlCon);
        sqlDa.Fill(dt);
        ddlClass.DataSource = dt;
        ddlClass.DataTextField = "ExpectedClass";
        ddlClass.DataBind();
        ddlClass.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select Class--", "0"));
        sqlCon.Close();

    }

    protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
    {
        PanelResult.Visible = true;
        DataTable dtbl = new DataTable();
        using (SqlConnection sqlCon = new SqlConnection(connectionString))
        {
            sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM RegStudent where ExpectedClass='"+ddlClass.SelectedItem+"' ",sqlCon);
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
                    string query = "INSERT INTO RegStudent (Name,NationalBirthID,FatherName,FatherPhone,MotherName,MotherPhone,Gender,DateOfBirth,PresentAddress,PermanentAddress,ExpectedClass,Shift,DateOfAdmission)" + "values(@Name,@NationalBirthID,@FatherName,@FatherPhone,@MotherName,@MotherPhone,@Gender,@DateOfBirth,@PresentAddress,@PermanentAddress,@ExpectedClass,@Shift,@DateOfAdmission)";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@Name", (gvPhoneBook.FooterRow.FindControl("NameFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@NationalBirthID", (gvPhoneBook.FooterRow.FindControl("NationalBirthIDFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@FatherName", (gvPhoneBook.FooterRow.FindControl("FatherNameFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@FatherPhone", (gvPhoneBook.FooterRow.FindControl("FatherPhoneFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@MotherName", (gvPhoneBook.FooterRow.FindControl("MotherNameFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@MotherPhone", (gvPhoneBook.FooterRow.FindControl("MotherPhoneFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Gender", (gvPhoneBook.FooterRow.FindControl("GenderFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@DateOfBirth", (gvPhoneBook.FooterRow.FindControl("DateOfBirthFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@PresentAddress", (gvPhoneBook.FooterRow.FindControl("PresentAddressFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@PermanentAddress", (gvPhoneBook.FooterRow.FindControl("PermanentAddressFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@ExpectedClass", (gvPhoneBook.FooterRow.FindControl("ExpectedClassFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Shift", (gvPhoneBook.FooterRow.FindControl("ShiftFooter") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@DateOfAdmission", (gvPhoneBook.FooterRow.FindControl("DateOfAdmissionFooter") as TextBox).Text.Trim());
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
                string query = "UPDATE RegStudent SET Name=@Name,NationalBirthID=@NationalBirthID,FatherName=@FatherName,FatherPhone=@FatherPhone,MotherName=@MotherName,MotherPhone=@MotherPhone,Gender=@Gender,DateOfBirth=@DateOfBirth,PresentAddress=@PresentAddress,PermanentAddress=@PermanentAddress,ExpectedClass=@ExpectedClass,Shift=@Shift,DateOfAdmission=@DateOfAdmission WHERE ID = @id";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@Name", (gvPhoneBook.Rows[e.RowIndex].FindControl("txtName") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@NationalBirthID", (gvPhoneBook.Rows[e.RowIndex].FindControl("txtNationalBirthID") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@FatherName", (gvPhoneBook.Rows[e.RowIndex].FindControl("txtFatherName") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@FatherPhone", (gvPhoneBook.Rows[e.RowIndex].FindControl("txtFatherPhone") as TextBox).Text.Trim()); 
                sqlCmd.Parameters.AddWithValue("@MotherName", (gvPhoneBook.Rows[e.RowIndex].FindControl("txtMotherName") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@MotherPhone", (gvPhoneBook.Rows[e.RowIndex].FindControl("txtMotherPhone") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@Gender", (gvPhoneBook.Rows[e.RowIndex].FindControl("txtGender") as TextBox).Text.Trim()); 
                sqlCmd.Parameters.AddWithValue("@DateOfBirth", (gvPhoneBook.Rows[e.RowIndex].FindControl("txtDateOfBirth") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@PresentAddress", (gvPhoneBook.Rows[e.RowIndex].FindControl("txtPresentAddress") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@PermanentAddress", (gvPhoneBook.Rows[e.RowIndex].FindControl("txtPermanentAddress") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@ExpectedClass", (gvPhoneBook.Rows[e.RowIndex].FindControl("txtExpectedClass") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@Shift", (gvPhoneBook.Rows[e.RowIndex].FindControl("txtShift") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@DateOfAdmission", (gvPhoneBook.Rows[e.RowIndex].FindControl("txtDateOfAdmission") as TextBox).Text.Trim());
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
            lblSuccessMessage.Text = "error";
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
                string query = "DELETE FROM RegStudent WHERE ID = @id";
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