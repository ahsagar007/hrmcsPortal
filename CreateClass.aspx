<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CreateClass.aspx.cs" Inherits="_Class" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <style>
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
                                <h2>Class Adding Form</h2>
                                <hr />

                            </div>
                        </header>

                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label Text="Class Name" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="DrpClassName" ErrorMessage="Required Class Name!" CssClass="text-danger"></asp:RequiredFieldValidator>

                                        <asp:DropDownList runat="server" ID="DrpClassName" CssClass="form-control input-sm">
                                            <asp:ListItem Text="Play"></asp:ListItem>
                                            <asp:ListItem Text="Nursery"></asp:ListItem>
                                            <asp:ListItem Text="One"></asp:ListItem>
                                            <asp:ListItem Text="Two"></asp:ListItem>
                                            <asp:ListItem Text="Three"></asp:ListItem>
                                            <asp:ListItem Text="Four"></asp:ListItem>
                                            <asp:ListItem Text="Five"></asp:ListItem>
                                            <asp:ListItem Text="Six"></asp:ListItem>
                                            <asp:ListItem Text="Seven"></asp:ListItem>
                                            <asp:ListItem Text="Eight"></asp:ListItem>
                                            <asp:ListItem Text="Nine"></asp:ListItem>
                                            <asp:ListItem Text="Ten"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-4 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label Text="Class Name Numeric" runat="server"></asp:Label>
                                        <asp:Label ID="Label1" runat="server" Text="Hint!" ToolTip="For Play Use 11 &amp; For Nursery Use 12 !" CssClass="text-danger"></asp:Label>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DrpClassNameNumeric" ErrorMessage="Required Class Name Numeric!" CssClass="text-danger"></asp:RequiredFieldValidator>

                                        <asp:DropDownList runat="server" ID="DrpClassNameNumeric" CssClass="form-control input-sm">
                                            <asp:ListItem Text="11"></asp:ListItem>
                                            <asp:ListItem Text="12"></asp:ListItem>
                                            <asp:ListItem Text="1"></asp:ListItem>
                                            <asp:ListItem Text="2"></asp:ListItem>
                                            <asp:ListItem Text="3"></asp:ListItem>
                                            <asp:ListItem Text="4"></asp:ListItem>
                                            <asp:ListItem Text="5"></asp:ListItem>
                                            <asp:ListItem Text="6"></asp:ListItem>
                                            <asp:ListItem Text="7"></asp:ListItem>
                                            <asp:ListItem Text="8"></asp:ListItem>
                                            <asp:ListItem Text="9"></asp:ListItem>
                                            <asp:ListItem Text="10"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-4 col-md-offset-1">
                                    <div class="form-group">
                                        <asp:Label Text="Section" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DrpSection" ErrorMessage="Required Section!" CssClass="text-danger"></asp:RequiredFieldValidator>

                                        <asp:DropDownList runat="server" ID="DrpSection" CssClass="form-control input-sm">
                                            <asp:ListItem Text="A"></asp:ListItem>
                                            <asp:ListItem Text="B"></asp:ListItem>
                                            <asp:ListItem Text="C"></asp:ListItem>
                                            <asp:ListItem Text="D"></asp:ListItem>

                                        </asp:DropDownList>
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

