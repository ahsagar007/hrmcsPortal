using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using iTextSharp.tool.xml;

public partial class ViewResult : System.Web.UI.Page
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
            Term();
            PanelResult.Visible = false;
        }
        TableSubject = SubjectTable();
    }

    protected void Term()
    {
        PanelResult.Visible = false;
        DataTable dt = com.ExecuteQuery("SELECT DISTINCT Term FROM RegResult");
        ddlTerm.DataSource = dt;
        ddlTerm.DataTextField = "Term";
        ddlTerm.DataBind();
        ddlTerm.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select Term--", "0"));

    }

    protected void ddlTerm_SelectedIndexChanged(object sender, EventArgs e)
    {
        PanelResult.Visible = false;
        DataTable dt = com.ExecuteQuery("select DISTINCT Class  from RegResult where Term='" + ddlTerm.SelectedItem.Text + "'");
        ddlClass.DataSource = dt;
        ddlClass.DataTextField = "Class";
        //ddlClass.DataValueField = "ID";
        ddlClass.DataBind();
        ddlClass.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select Class--", "0"));

    }



    protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
    {
        PanelResult.Visible = false;
        DataTable dt = com.ExecuteQuery("select Name  from RegStudent where ExpectedClass='" + ddlClass.SelectedItem + "'");
        ddlStudent.DataSource = dt;
        ddlStudent.DataTextField = "Name";
        //ddlStudent.DataValueField = "ID";
        ddlStudent.DataBind();
        ddlStudent.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select Student--", "0"));

    }



    protected void ddlStudent_SelectedIndexChanged(object sender, EventArgs e)
    {

        PanelResult.Visible = true;
        da = new SqlDataAdapter("select *  from RegResult where StudentName='" + ddlStudent.SelectedItem + "'", con);
        DataTable dt = new DataTable();
        da.Fill(dt);

        SqlDataAdapter daInfo = new SqlDataAdapter("Select name, fathername, mothername from RegStudent where name = '" + ddlStudent.SelectedItem + "'", con);
        DataTable dtInfo = new DataTable();
        daInfo.Fill(dtInfo);

        if (dtInfo != null)
        {
            lblName.Text = dtInfo.Rows[0]["name"].ToString();
            lblFatherName.Text = dtInfo.Rows[0]["FatherName"].ToString();
            lblMotherName.Text = dtInfo.Rows[0]["MotherName"].ToString();
        }


        TableSubject = SubjectTable();

        if (dt != null)
        {
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    TableSubject.Rows.Add(dt.Rows[i]["SubjectName"].ToString(), dt.Rows[i]["Marks"].ToString());
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
        dt.Columns.Add("SubjectName");
        dt.Columns.Add("Marks");
        return dt;
    }

    protected void btnTotalMarks_Click(object sender, EventArgs e)
    {
        decimal totalMarks = 0;
        foreach (RepeaterItem r in rpt.Items)
        {
            Label total = (Label)r.FindControl("Marks");

            totalMarks += Convert.ToDecimal(total.Text == "" ? "0" : total.Text);

        }

        txtTotal.Text = totalMarks.ToString();


    }

    [Obsolete]
    protected void btnSave_Click(object sender, EventArgs e)
    {
        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename="+ ddlStudent.SelectedItem + ".pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);

        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        PanelResult.RenderControl(hw);
        StringReader sr = new StringReader(sw.ToString());
        Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
        HTMLWorker htmlParser = new HTMLWorker(pdfDoc);
        PdfWriter.GetInstance(pdfDoc, Response.OutputStream);

        pdfDoc.Open();
        htmlParser.Parse(sr);
        pdfDoc.Close();
        Response.Write(pdfDoc);
        Response.End();
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        return;
    }
}
