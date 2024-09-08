<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="bloodDonation.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Blood Donation</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7f9;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: orangered;
            padding: 1rem 0;
            color: white;
        }

        header p {
            font-size: 2.5rem;
            text-align: center;
            margin: 0;
            font-weight: bold;
        }

        .container {
            padding: 2rem;
        }

        .btn-custom {
            width: 100%;
            font-size: 1.2rem;
            padding: 1rem;
            border-radius: .5rem;
            transition: background-color 0.3s, transform 0.2s;
        }

     
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

      

        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
        }

       

        .btn-warning {
            background-color: #ffc107;
            border-color: #ffc107;
        }


        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }

       

        @media (max-width: 666px) {
            header p {
                font-size: 2rem;
            }

            .btn-custom {
                font-size: 1.5rem;
                padding: 1.25rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <p>Blood Donation</p>
        </header>
        <div class="container">
            <div class="row">
                <div class="col-12 mb-3">
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary btn-custom" Text="Search for Donor" OnClick="searchdonor" />
                </div>
                <div class="col-12 mb-3">
                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-success btn-custom" Text="Register as Donor" OnClick="regdonor" />
                </div>
                <div class="col-12 mb-3">
                    <asp:Button ID="Button3" runat="server" CssClass="btn btn-warning btn-custom" Text="See Requests for Donation" OnClick="seerequest" />
                </div>
                <div class="col-12 mb-3">
                    <asp:Button ID="Button4" runat="server" CssClass="btn btn-danger btn-custom" Text="Log Out" OnClick="logout" />
                </div>
            </div>
        </div>
    </form>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
