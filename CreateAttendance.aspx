<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CreateAttendance.aspx.cs" Inherits="CreateAttendance" %>

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
        .back{
        padding:20px 30px;
        background:white;
        align-content:center;
    }

        th {
        text-align:center;
        background-color: #4CAF50;
        color: white;
        }

        tr{
            text-align:center;
        }

        tr:hover {
            background-color: #ddd;

        }

        tr:nth-child(even){
            background-color: #f2f2f2;

        }

        td, th {
        border: 1px solid #ddd;
        padding: 8px;
        }
        input,select,textarea {
    max-width: 100%;
}
        input[type=text] {
    border: 1px solid #28df99;
    border-radius: 4px;  
}
    </style>



    <section id="main-content back">
        <h2 style="text-align:center">Create Result</h2> <hr />
                        <div class="panel-body">
                            <div class="row">
                                
                                <div class="col-xs-12 col-md-4">
                                    <div class="form-group">
                                        <asp:Label Text="Class" runat="server"></asp:Label>                                        
                                        <asp:DropDownList runat="server" ID="ddlClass" CssClass="form-control input-sm"  DataValueField="ID" DataTextField ="ClassName" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged" AutoPostBack="true" >
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                </div>
                            </div>
        </section>
    <hr />

    <asp:Panel ID="PanelResult" runat="server">
        <asp:GridView ID="gvPhoneBook" runat="server" AutoGenerateColumns="false" ShowFooter="true" DataKeyNames="ID"
                ShowHeaderWhenEmpty="true" HorizontalAlign="Center">
                <Columns>
                    <asp:TemplateField HeaderText="Roll">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("RollNumber") %>' ID ="lblID" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Name") %>' ID="lblName" runat="server" />
                        </ItemTemplate>
                        
                    </asp:TemplateField>
                   
                    <asp:TemplateField HeaderText="Mark">
                        <ItemTemplate>
                            <asp:RadioButton runat="server" ID="radioPresent" Text=" Present" Selected="True" GroupName="attendance" />
                            <asp:RadioButton runat="server" ID="radioAbsent" Text=" Absent" GroupName="attendance" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
         <br />
            <asp:Label ID="lblSuccessMessage" Text="" runat="server" ForeColor="Green" />
            <br />
            <asp:Label ID="lblErrorMessage" Text="" runat="server" ForeColor="Red" />
        <div class="row spacebtwn">
            <div class="col-md-12 col-md-offset-3">
                <asp:Button Text="Save" ID="btnSave" CssClass="btn btn-info" Width="200px" runat="server" OnClick="btnSave_Click" />
                <asp:Button Text="Clear" ID="btnClear" CssClass="btn btn-danger" Width="200px" runat="server" OnClick="btnClear_Click" />
                <asp:Label ID="Confirmation" runat="server" Text=""></asp:Label>

            </div>

        </div>
    </asp:Panel>
</asp:Content>

