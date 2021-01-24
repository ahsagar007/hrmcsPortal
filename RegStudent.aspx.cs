using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class RegStudent : System.Web.UI.Page
{
    SqlCommand cmd = new SqlCommand();
    SqlConnection con = new SqlConnection();
    SqlDataAdapter da;
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        con.ConnectionString = "Data source=DESKTOP-RIQNA6S;initial catalog=HRMCS;integrated Security=true";

        //if (Session["User"] == null)
        //{
        //    Response.Redirect("~/Account/Login.aspx");
        //}
        if (!IsPostBack)
        {
            Class();

        }

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        con.Open();
        string checkuser = "select count(*) from RegStudent where DateOfBirth='" + DateOfBirth.Text + "'";
        SqlCommand cm = new SqlCommand(checkuser, con);
        int temp = Convert.ToInt32(cm.ExecuteScalar().ToString());
        if (temp == 1)
        {
            Confirmation.Text = "<script>alert('Already Registered!')</script>";

        }
        else
        {
            SqlCommand cmd = new SqlCommand("insert into RegStudent" + "(Name,NationalBirthID,FatherName,FatherPhone,MotherName,MotherPhone," +
                "Gender,DateOfBirth,PresentAddress,PermanentAddress,ExpectedClass,RegNumber,RollNumber,Shift,DateOfAdmission)" + "values(@Name,@NationalBirthID,@FatherName," +
                "@FatherPhone,@MotherName,@MotherPhone,@Gender,@DateOfBirth,@PresentAddress,@PermanentAddress,@ExpectedClass,@RegNumber,@RollNumber,@Shift,@DateOfAdmission)", con);
            cmd.Parameters.AddWithValue("@Name", StudentName.Text);
            cmd.Parameters.AddWithValue("@NationalBirthID", NationalBirthID.Text);
            cmd.Parameters.AddWithValue("@FatherName", FatherName.Text);
            cmd.Parameters.AddWithValue("@FatherPhone", FatherPhone.Text);
            cmd.Parameters.AddWithValue("@MotherName", MotherName.Text);
            cmd.Parameters.AddWithValue("@MotherPhone", MotherPhone.Text);
            cmd.Parameters.AddWithValue("@Gender", RadioGender.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@DateOfBirth", DateOfBirth.Text);
            cmd.Parameters.AddWithValue("@PresentAddress", PresentAddress.Text);
            cmd.Parameters.AddWithValue("@PermanentAddress", PermanentAddress.Text);
            cmd.Parameters.AddWithValue("@ExpectedClass", DrpExpectedClass.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@RegNumber", RegNumber.Text);
            cmd.Parameters.AddWithValue("@RollNumber", RollNumber.Text);
            cmd.Parameters.AddWithValue("@Shift", RadioShift.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@DateOfAdmission", DateTime.Now);

            cmd.ExecuteNonQuery();
            Confirmation.Text = "<script>alert('Inserted Successfully')</script>";
        }
        con.Close();

    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.Url.AbsoluteUri);
    }

    protected void Class()
    {
        con.Open();
        da = new SqlDataAdapter("select distinct * from Class", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        dt.Columns.Add("Name", typeof(string), "ClassName+' '+'Section'+'-'+Section");
        DrpExpectedClass.Items.Clear();
        DrpExpectedClass.DataSource = dt;
        DrpExpectedClass.DataTextField = "Name";
        //ddlClass.DataValueField = "ID";
        DrpExpectedClass.DataBind();
        DrpExpectedClass.Items.Insert(0, new ListItem("--Select Class--", "0"));
        con.Close();
    }

}