<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        body {
            overflow-x: hidden;
        }

        .back {
            padding: 20px 0px 0px 20px;
            background: white;
            align-content: center;
        }


        .container .card {
            position: relative;
            border-radius: 10px;
        }

        .card .icon {
            position: absolute;
            top: 0;
            left: 0;
            width: 150px;
            height: 150px;
            background: #f00;
            transition: 0.7s;
            z-index: 1;
        }

        .row .col-md-3 .card:nth-child(1) .icon {
            background: #e07768;
        }

        .row .col-md-3 .card:nth-child(2) .icon {
            background: #6eadd4;
        }

        .row .col-md-3 .card:nth-child(3) .icon {
            background: #4aada9;
        }

        .row .col-md-3 .card:nth-child(4) .icon {
            background: #2a265f;
        }


        .card .icon .fa {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 80px;
            transition: 0.7s;
            color: #fff;
        }

        i {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 30px;
            transition: 0.7s;
            color: #fff;
        }

        .card .face {
            width: 150px;
            height: 150px;
            transition: 0.5s;
        }

            .card .face.face1 {
                position: relative;
                background: #333;
                display: flex;
                justify-content: center;
                align-items: center;
                z-index: 1;
                transform: translateY(50px);
            }

        .card:hover .face.face1 {
            background: #ff0057;
            transform: translateY(0px);
        }

        .card .face.face1 .content {
            opacity: 1;
            transition: 0.5s;
        }

        .card:hover .face.face1 .content {
            opacity: 1;
        }

        .card .face.face1 .content i {
            max-width: 100px;
        }

        .card .face.face2 {
            position: relative;
            background: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            box-sizing: border-box;
            box-shadow: 0 20px 50px rgba(0,0,0,0.8);
            transform: translateY(-100px);
        }

        .card:hover .face.face2 {
            transform: translateY(0);
        }

        .card .face.face2 .content p {
            margin: 0;
            padding: 0;
            text-align: center;
            color: #414141;
        }

        .card .face.face2 .content h3 {
            margin: 0 0 10px 0;
            padding: 0;
            color: #fff;
            font-size: 24px;
            text-align: center;
            color: #414141;
        }

        a {
            text-decoration: none;
            color: #414141;
        }
    </style>

    <div class="back ">

        <div class="row">
            <div class="col-md-3">
                <div class="card">
                    <div class="face face1">
                        <div class="content">
                            <div class="icon">
                                <asp:Label runat="server" ID="AdminCount" class="fa " aria-hidden="true"></asp:Label>
                                <p style="color: white; text-align: center">Admin</p>

                            </div>
                        </div>
                    </div>
                    <div class="face face2">
                        <div class="content">
                            <h3>
                                <a href="https://www.linkedin.com/in/adamdipinto/" target="_blank"></a>
                            </h3>
                            <p>This is where I network and build my professional protfolio.</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="card">
                    <div class="face face1">
                        <div class="content">
                            <div class="icon">
                                <asp:Label runat="server" ID="StudentCount" class="fa " aria-hidden="true"></asp:Label>
                                <p style="color: white; text-align: center">Student</p>

                            </div>
                        </div>
                    </div>
                    <div class="face face2">
                        <div class="content">
                            <h3>
                                <a href="https://www.linkedin.com/in/adamdipinto/" target="_blank"></a>
                            </h3>
                            <p>This is where I network and build my professional protfolio.</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="card">
                    <div class="face face1">
                        <div class="content">
                            <div class="icon">
                                <asp:Label runat="server" ID="ClassCount" class="fa " aria-hidden="true"></asp:Label>
                                <p style="color: white; text-align: center">Class</p>

                            </div>
                        </div>
                    </div>
                    <div class="face face2">
                        <div class="content">
                            <h3>
                                <a href="https://github.com/atom888" target="_blank"></a>
                            </h3>
                            <p>This is where I share code and work on projects.</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="face face1">
                        <div class="content">
                            <div class="icon">
                                <asp:Label runat="server" ID="SubjectCount" class="fa " aria-hidden="true"></asp:Label>
                                <p style="color: white; text-align: center">Subject</p>
                            </div>
                        </div>
                    </div>
                    <div class="face face2">
                        <div class="content">
                            <h3>
                                <a href="https://github.com/atom888" target="_blank"></a>
                            </h3>
                            <p>This is where I share code and work on projects.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    



</asp:Content>
