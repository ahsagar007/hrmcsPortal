<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewResult.aspx.cs" Inherits="ViewResult" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <style>
        body {
            overflow-x: hidden;
        }

        .random {
            margin: 10px;
            padding: 10px;
        }
    </style>

    <section id="main-content back">
        <h2 style="text-align: center">Search Result</h2>
        <hr />
        <div class="panel-body">
            <div class="row">
                <div class="col-xs-12 col-md-4">
                    <div class="form-group">
                        <asp:Label Text="Term" runat="server"></asp:Label>
                        <asp:DropDownList AutoPostBack="true" runat="server" ID="ddlTerm" CssClass="form-control input-sm CustomDrp" OnSelectedIndexChanged="ddlTerm_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-xs-12 col-md-4">
                    <div class="form-group">
                        <asp:Label Text="Class" runat="server"></asp:Label>
                        <asp:DropDownList AutoPostBack="true" runat="server" ID="ddlClass" CssClass="form-control input-sm CustomDrp" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-xs-12 col-md-4">
                    <div class="form-group">
                        <asp:Label Text="Student" runat="server"></asp:Label>
                        <asp:DropDownList AutoPostBack="true" runat="server" ID="ddlStudent" CssClass="form-control input-sm CustomDrp" OnSelectedIndexChanged="ddlStudent_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <hr />

    <asp:Panel ID="PanelResult" runat="server">
        <h1 style="text-align: center">HridoyMoni Creative School</h1>
        <p style="text-align: center">Godnail Noyapara, South Kadamtoly</p>
        <p style="text-align: center">Siddhirganj, Narayanganj</p>
        <p style="text-align: center">Mobile: 01684429971 , 01676370070</p>
        <asp:Label runat="server" Text="" /><br />

        <div class="random">
            Name:
            <asp:Label ID="lblName" runat="server" Text="" />
            <br />
            Father Name:
            <asp:Label ID="lblFatherName" runat="server" Text="" /><br />
            Mother Name:
            <asp:Label ID="lblMotherName" runat="server" Text="" /><br />
            <asp:Label runat="server" Text="" /><br />
        </div>

        <asp:Repeater ID="rpt" runat="server">
            <HeaderTemplate>
                <table id="example1" class="table table-bordered table-condensed table-hover">
                    <thead>
                        <tr class="success" style="text-align: center">
                            <th>Subject</th>
                            <th>Marks</th>
                        </tr>
                    </thead>
            </HeaderTemplate>
            <ItemTemplate>

                <tr style="text-align: center">
                    <td>
                        <asp:Label ID="SubjectName" runat="server" Text='<%# Eval("SubjectName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Marks" runat="server" AutoPostBack="true" Text='<%# Eval("Marks") %>'></asp:Label></td>
                </tr>

            </ItemTemplate>


            <FooterTemplate>
                </table>
                
            </FooterTemplate>
        </asp:Repeater>
        <p></p>
        <p></p>
        <p></p>
        <table id="total" class="table table-bordered table-condensed table-hover">
        <thead>
        <tr style="text-align: center">
            <th class="success">Total Marks</th>

            <th><asp:Label ID="txtTotal" runat="server" Text="Total Marks"></asp:Label></th>
        </tr>
        </thead>
        </table>

        <div class="row spacebtwn">
            <div class="col-md-12 col-md-offset-3">
                <asp:Button Text="Print" ID="btnPrint" CssClass="btn btn-info" Width="200px" runat="server" OnClick="btnSave_Click" />
                <asp:Button Text="Total Marks" ID="btnClear" CssClass="btn btn-danger" Width="200px" runat="server" OnClick="btnTotalMarks_Click" />
            </div>

        </div>
    </asp:Panel>
</asp:Content>

