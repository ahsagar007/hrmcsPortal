<%@ Page Title="Result" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CreateResult.aspx.cs" Inherits="ClassView" %>

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

        .back {
            padding: 20px 30px;
            background: white;
            align-content: center;
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

        input, select, textarea {
            max-width: 100%;
        }

            input[type=text] {
                border: 1px solid #28df99;
                border-radius: 4px;
            }

            .CustomDrp {
            color: #fff;
            padding: inherit;
            border-radius:12px;
            background-color: #312450;
            border:1px #fafafa; 
            text-align:center;

        }
          
        select {  
            border:2px solid darkblue;
            border-radius:5px;
            -webkit-appearance: none
        }
    </style>



    <section id="main-content back">
        <h2 style="text-align: center">Create Result</h2>
        <hr />
        <div class="panel-body">
            <div class="row">
                <div class="col-xs-12 col-md-3">
                    <div class="form-group">
                        <asp:Label Text="Term" runat="server"></asp:Label>
                        <asp:DropDownList runat="server" ID="ddlTerm" CssClass="form-control input-sm CustomDrp" DataValueField="ID" DataTextField="Name">

                            <asp:ListItem Text="" Value="1">1st Terminal</asp:ListItem>
                            <asp:ListItem Text="2nd Termimal" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Final" Value="3"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-xs-12 col-md-3">
                    <div class="form-group">
                        <asp:Label Text="Term" runat="server"></asp:Label>
                        <asp:DropDownList runat="server" ID="ddlYear" CssClass="form-control input-sm CustomDrp" DataValueField="ID" DataTextField="Name">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-xs-12 col-md-3">
                    <div class="form-group">
                        <asp:Label Text="Class" runat="server"></asp:Label>
                        <asp:DropDownList runat="server" ID="ddlClass" CssClass="form-control input-sm CustomDrp" DataValueField="ID" DataTextField="ClassName" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged" AutoPostBack="true">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-xs-12 col-md-3">
                    <div class="form-group">
                        <asp:Label Text="Student Name" runat="server"></asp:Label>
                        <asp:DropDownList runat="server" ID="ddlStudent" CssClass="form-control input-sm CustomDrp" DataValueField="ID" DataTextField="Name" OnSelectedIndexChanged="ddlStudent_SelectedIndexChanged" AutoPostBack="true">
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <hr />

    <asp:Panel ID="PanelResult" runat="server">
        <div class="panel-body">
            <div class="row">

                <div class="col-sm-12">
                    <div class="box">
                        <div class="box-body">
                            <asp:Repeater ID="rpt" runat="server">

                                <HeaderTemplate>

                                    <table id="example1" class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>Subject</th>
                                                <th>Marks</th>

                                            </tr>
                                        </thead>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <asp:Label ID="SubjectName" runat="server" Text='<%# Eval("SubjectName") %>' />
                                            <asp:HiddenField ID="hdnSubjectID" runat="server" Value='<%# Eval("SubjectID") %>' />

                                        </td>
                                        <td>
                                            <asp:TextBox ID="Marks" runat="server" placeholder="Enter Marks" Value='0' AutoPostBack="false" CssClass="form-control"></asp:TextBox></td>

                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>
                            </asp:Repeater>



                        </div>
                    </div>
                </div>

            </div>

        </div>
        <div class="row spacebtwn">
            <div class="col-md-12 col-md-offset-3">
                <asp:Button Text="Save" ID="btnSave" CssClass="btn btn-info" Width="200px" runat="server" OnClick="btnSave_Click" />
                <asp:Label ID="txtTotal" runat="server" Text=""></asp:Label>

            </div>

        </div>
    </asp:Panel>

</asp:Content>
