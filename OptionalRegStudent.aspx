<%@ Page Title="Student Registration" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="OptionalRegStudent.aspx.cs" Inherits="RegStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <style>
        body {
            overflow-x: hidden;
        }

        .spacebtwn {
            margin-top: 20px;
            padding: 10px;
        }

        .btnSpace {
            margin: 20px;
            padding: 20px;
        }

        .legend {
            border: 1px solid #CCCCCC;
            border-radius: 4px;
            padding-left: 5px;
            width: 280px;
        }

        .listItem {
            margin: 50px;
            margin-top: 50px;
        }
    </style>


    <section id="main-content">
        <section id="wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heaging">
                            <div class="col-md-4 col-md-offset-4">
                                <h2 style="text-align: center">Registration Form</h2>
                                <hr />
                            </div>
                        </header>

                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label Text="Year" runat="server"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="DateOfBirth" ErrorMessage="Required Date of Birth!" CssClass="text-danger"></asp:RequiredFieldValidator>
                                        <asp:TextBox runat="server" ID="AdmissionDate" TextMode="Date" Enabled="true" CssClass="form-control input-sm"></asp:TextBox>

                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label Text="Student Name" runat="server"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="StudentName" ErrorMessage="Required Student Name" CssClass="text-danger"></asp:RequiredFieldValidator>
                                        <asp:TextBox runat="server" ID="StudentName" Enabled="true" CssClass="form-control input-sm" placeholder="Student Name"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-md-4 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label Text="Birth Certificate" runat="server"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NationalBirthID" ErrorMessage="Required National/Birth ID" CssClass="text-danger"></asp:RequiredFieldValidator>
                                        <asp:TextBox runat="server" ID="NationalBirthID" Enabled="true" CssClass="form-control input-sm" placeholder="National ID / Birth Certificate"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-md-4 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label Text="Father's Name" runat="server"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="FatherName" ErrorMessage="Required Father's Name" CssClass="text-danger"></asp:RequiredFieldValidator>

                                        <asp:TextBox runat="server" ID="FatherName" Enabled="true" CssClass="form-control input-sm" placeholder="Father's Name"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-md-4 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label Text="Phone" runat="server"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="FatherPhone" ErrorMessage="Required Father's Phone" CssClass="text-danger"></asp:RequiredFieldValidator>

                                        <asp:TextBox runat="server" ID="FatherPhone" TextMode="Number" Enabled="true" CssClass="form-control input-sm" placeholder="Fathers's Phone"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-md-4 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label Text="Mother's Name" runat="server"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="MotherName" ErrorMessage="Required Mother's Name!" CssClass="text-danger"></asp:RequiredFieldValidator>

                                        <asp:TextBox runat="server" ID="MotherName" Enabled="true" CssClass="form-control input-sm" placeholder="Father's Name"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label Text="Phone" runat="server"></asp:Label>
                                        <asp:TextBox runat="server" ID="MotherPhone" TextMode="Number" Enabled="true" CssClass="form-control input-sm" placeholder="Mother's Phone"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-md-4 col-md-offset-1 ">
                                    <div class="form-group legend">
                                        <asp:Label Text="Gender" runat="server"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="RadioGender" ErrorMessage="Required Gender!" CssClass="text-danger"></asp:RequiredFieldValidator>

                                        <asp:RadioButtonList ID="RadioGender" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem Text="Male" />
                                            <asp:ListItem class="listItem" Text="Female" />
                                        </asp:RadioButtonList>

                                    </div>
                                </div>
                                <div class="col-md-4 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label Text="Date of Birth" runat="server"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="DateOfBirth" ErrorMessage="Required Date of Birth!" CssClass="text-danger"></asp:RequiredFieldValidator>
                                        <asp:TextBox runat="server" ID="DateOfBirth" TextMode="Date" Enabled="true" CssClass="form-control input-sm"></asp:TextBox>

                                    </div>
                                </div>

                                <div class="col-md-4 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label Text="Present Address" runat="server"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="PresentAddress" ErrorMessage="Required Present Address!" CssClass="text-danger"></asp:RequiredFieldValidator>
                                        <asp:TextBox runat="server" ID="PresentAddress" Enabled="true" CssClass="form-control input-sm" placeholder="Present Address"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-md-4 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label Text="Permanent Address" runat="server"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="PermanentAddress" ErrorMessage="Required P. Address!" CssClass="text-danger"></asp:RequiredFieldValidator>

                                        <asp:TextBox runat="server" ID="PermanentAddress" Enabled="true" CssClass="form-control input-sm" placeholder="Permanent Address"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-md-4 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label Text="Expected Class" runat="server"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="DrpExpectedClass" ErrorMessage="Required Expected Class!" CssClass="text-danger"></asp:RequiredFieldValidator>
                                        <asp:DropDownList runat="server" ID="DrpExpectedClass" CssClass="form-control input-sm">
                                        </asp:DropDownList>

                                    </div>
                                </div>

                                <div class="col-md-4 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label Text="Registration Number" runat="server"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="PermanentAddress" ErrorMessage="Required Reg Number!" CssClass="text-danger"></asp:RequiredFieldValidator>

                                        <asp:TextBox runat="server" ID="RegNumber" Enabled="true" CssClass="form-control input-sm" placeholder="Enter Reg Number"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-md-4 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label Text="Roll Number" runat="server"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="PermanentAddress" ErrorMessage="Required Roll Number!" CssClass="text-danger"></asp:RequiredFieldValidator>

                                        <asp:TextBox runat="server" ID="RollNumber" Enabled="true" CssClass="form-control input-sm" placeholder="Enter Roll Number"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-md-4 col-md-offset-1">
                                    <div class="form-group legend">
                                        <asp:Label CssClass="line" Text="Shift" runat="server"></asp:Label>
                                        <asp:RadioButtonList runat="server" ID="RadioShift" RepeatDirection="Horizontal">
                                            <asp:ListItem Text="Morning" Selected="True" />
                                            <asp:ListItem class="listItem" Text="Day" />
                                        </asp:RadioButtonList>

                                    </div>

                                </div>

                            </div>

                            <div class="row spacebtwn">
                                <div class="col-md-12 col-md-offset-3">
                                    <asp:Button Text="Save" ID="btnSave" CssClass="btn btn-info" Width="200px" runat="server" OnClick="btnSave_Click" />
                                    <asp:Button Text="Clear" ID="btnClear" CssClass="btn btn-danger" Width="200px" runat="server" OnClick="btnClear_Click" />
                                    <asp:Label ID="Confirmation" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </div>

                    </section>
                </div>
            </div>
        </section>
    </section>
</asp:Content>

