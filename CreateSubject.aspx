<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CreateSubject.aspx.cs" Inherits="CreateSubject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
        <style>
            body{
    overflow-x:hidden;
                
            }
        .spacebtwn{
            margin-top:20px;
            padding:10px;

        }
        .btnSpace{
            margin:20px;
            padding:20px;
        }
        .legend{
            border:1px solid #CCCCCC;
            border-radius:4px;
            padding-left:5px;
            width:280px;
        }
        .listItem{
            margin:50px;
            margin-top:50px;

        }
        
    </style>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script src="Scripts/SweetAlert.js" type="text/javascript"></script>


    <section id="main-content">
        <section id="wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heaging">
                            <div class="col-md-4 col-md-offset-4">
                                <h2>Subject Adding Form</h2><hr />
                                
                            </div>
                        </header>

                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label Text="Subject Name" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="DrpSubjectName" ErrorMessage="Required Subject Name!" CssClass="text-danger"></asp:RequiredFieldValidator>
                                        
                                        <asp:DropDownList runat="server" ID="DrpSubjectName" CssClass="form-control input-md">
                                            <asp:ListItem Text="Bangla 1st"></asp:ListItem>
                                            <asp:ListItem Text="Bangla 2nd"></asp:ListItem>
                                            <asp:ListItem Text="English 1st"></asp:ListItem>
                                            <asp:ListItem Text="English 2nd"></asp:ListItem>
                                            <asp:ListItem Text="Mathematics"></asp:ListItem>
                                            <asp:ListItem Text="Religion"></asp:ListItem>
                                            <asp:ListItem Text="Science"></asp:ListItem>
                                            <asp:ListItem Text="Social Science"></asp:ListItem>
                                            <asp:ListItem Text="Drawing"></asp:ListItem>
                                            <asp:ListItem Text="ICT"></asp:ListItem>
                                            <asp:ListItem Text="Agricultural education / Domestic science"></asp:ListItem>
                                            <asp:ListItem Text="Physical Education"></asp:ListItem>
                                            <asp:ListItem Text="Arts and crafts"></asp:ListItem>
                                            <asp:ListItem Text="Karmo o Jibon Mukhi Shikkha"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-4 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label Text="Subject Code" runat="server"></asp:Label>
                                        
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DrpSubjectCode" ErrorMessage="Required Subject Code!" CssClass="text-danger"></asp:RequiredFieldValidator>
                                        
                                        <asp:DropDownList runat="server" ID="DrpSubjectCode" CssClass="form-control input-md">
                                            <asp:ListItem Text="BAN01"></asp:ListItem>
                                            <asp:ListItem Text="BAN02"></asp:ListItem>
                                            <asp:ListItem Text="ENG01"></asp:ListItem>
                                            <asp:ListItem Text="ENG02"></asp:ListItem>
                                            <asp:ListItem Text="MAT01"></asp:ListItem>
                                            <asp:ListItem Text="REL01"></asp:ListItem>
                                            <asp:ListItem Text="SCI01"></asp:ListItem>
                                            <asp:ListItem Text="SOCI01"></asp:ListItem>
                                            <asp:ListItem Text="DRW01"></asp:ListItem>
                                            <asp:ListItem Text="ICT01"></asp:ListItem>
                                            <asp:ListItem Text="AGDO01"></asp:ListItem>
                                            <asp:ListItem Text="PHYE01"></asp:ListItem>
                                            <asp:ListItem Text="ART01"></asp:ListItem>
                                            <asp:ListItem Text="KAR01"></asp:ListItem>
                                        </asp:DropDownList> 
                                    </div>
                                </div>
                                

                            </div>

                            <div class="row spacebtwn">
                                <div class="col-md-12 col-md-offset-3">
                                    <asp:Button Text="Save" ID="btnSave" CssClass="btn btn-info" Width="200px" runat="server" OnClick="btnSave_Click" />
                                    <asp:Button Text="Clear" ID="btnClear" CssClass="btn btn-danger" Width="200px" runat="server" OnClick="btnClear_Click" />
                                </div>
                            </div>
                        </div>

                    </section>
                </div>
            </div>
        </section>
    </section>
</asp:Content>

