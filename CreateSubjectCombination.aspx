<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CreateSubjectCombination.aspx.cs" Inherits="Experiment3" %>

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
    </style>



    <section id="main-content back">
        <section id="wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heaging">
                            <div class="col-md-4 col-md-offset-4">
                                <h2 style="text-align: center">Subject Combination</h2>
                                <hr />
                            </div>
                        </header>
                    </section>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-4 col-md-offset-1">
                                <div class="form-group">
                                    <asp:Label Text="Class" runat="server"></asp:Label>
                                    <asp:DropDownList runat="server" ID="ddlClass" CssClass="form-control input-sm">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4 col-md-offset-1">
                                <div class="form-group">
                                    <asp:Label Text="Subject" runat="server"></asp:Label>
                                    <asp:DropDownList runat="server" ID="ddlSubject" CssClass="form-control input-sm">
                                    </asp:DropDownList>
                                </div>
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
            </div>
        </section>
    </section>

    <hr />
</asp:Content>


