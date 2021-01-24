<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewStudent.aspx.cs" Inherits="ViewStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <style>
        .nav-space {
            margin-top: 10px;
        }

        table {
            table-layout: fixed;
            width: 100%;
            font-size: 10px;
        }

        th {
            text-align: center;
            background-color: #4CAF50;
            color: white;
        }

        tr {
            text-align: center;
        }

            tr:hover {
                background-color: #ddd;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

        td, th {
            border: 1px solid #ddd;
            padding: 8px;
        }

        input,
        select,
        textarea {
            max-width: 100%;
        }
    </style>
    <section id="main-content back">
        <h2 style="text-align: center">Search Student</h2>
        <hr />
        <div class="panel-body">
            <div class="row">

                <div class="col-xs-12 col-md-4">
                    <div class="form-group">
                        <asp:Label Text="Class" runat="server"></asp:Label>
                        <asp:DropDownList AutoPostBack="true" runat="server" ID="ddlClass" CssClass="form-control input-sm" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <asp:Panel ID="PanelResult" runat="server">
        <div class="panel-body">
            <div class="row">
                <section class="nav-space">
                    <section id="wrapper">

                        <asp:GridView ID="gvPhoneBook" runat="server" AutoGenerateColumns="false" ShowFooter="true" DataKeyNames="ID"
                            ShowHeaderWhenEmpty="true" HorizontalAlign="Center"
                            OnRowCommand="gvPhoneBook_RowCommand" OnRowEditing="gvPhoneBook_RowEditing" OnRowCancelingEdit="gvPhoneBook_RowCancelingEdit"
                            OnRowUpdating="gvPhoneBook_RowUpdating" OnRowDeleting="gvPhoneBook_RowDeleting">


                            <Columns>
                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("Name") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtName" Text='<%# Eval("Name") %>' runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="NameFooter" runat="server" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="BirthID">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("NationalBirthID") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtNationalBirthID" Text='<%# Eval("NationalBirthID") %>' runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="NationalBirthIDFooter" runat="server" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Father's Name">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("FatherName") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtFatherName" Text='<%# Eval("FatherName") %>' runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="FatherNameFooter" runat="server" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Father's Phone">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("FatherPhone") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtFatherPhone" Text='<%# Eval("FatherPhone") %>' runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="FatherPhoneFooter" runat="server" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Mother's Name">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("MotherName") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtMotherName" Text='<%# Eval("MotherName") %>' runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="MotherNameFooter" runat="server" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Mother's Phone">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("MotherPhone") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtMotherPhone" Text='<%# Eval("MotherPhone") %>' runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="MotherPhoneFooter" runat="server" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Gender">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("Gender") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtGender" Text='<%# Eval("Gender") %>' runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="GenderFooter" runat="server" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date Of Birth">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("DateOfBirth") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtDateOfBirth" Text='<%# Eval("DateOfBirth") %>' runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="DateOfBirthFooter" runat="server" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Present Address">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("PresentAddress") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtPresentAddress" Text='<%# Eval("PresentAddress") %>' runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="PresentAddressFooter" runat="server" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Permanent Address">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("PermanentAddress") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtPermanentAddress" Text='<%# Eval("PermanentAddress") %>' runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="PermanentAddressFooter" runat="server" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Expected Class">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("ExpectedClass") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtExpectedClass" Text='<%# Eval("ExpectedClass") %>' runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="ExpectedClassFooter" runat="server" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Shift">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("Shift") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtShift" Text='<%# Eval("Shift") %>' runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="ShiftFooter" runat="server" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date Of Admission">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("DateOfAdmission") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtDateOfAdmission" Text='<%# Eval("DateOfAdmission") %>' runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="DateOfAdmissionFooter" runat="server" />
                                    </FooterTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ImageUrl="~/Images/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px" />
                                        <asp:ImageButton ImageUrl="~/Images/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:ImageButton ImageUrl="~/Images/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px" />
                                        <asp:ImageButton ImageUrl="~/Images/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:ImageButton ImageUrl="~/Images/addnew.png" runat="server" CommandName="AddNew" ToolTip="Add New" Width="20px" Height="20px" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <br />
                        <asp:Label ID="lblSuccessMessage" Text="" runat="server" ForeColor="Green" />
                        <br />
                        <asp:Label ID="lblErrorMessage" Text="" runat="server" ForeColor="Red" />


                    </section>
                </section>
            </div>
        </div>
    </asp:Panel>


</asp:Content>

