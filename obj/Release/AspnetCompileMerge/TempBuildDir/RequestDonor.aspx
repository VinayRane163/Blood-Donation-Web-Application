<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RequestDonor.aspx.cs" UnobtrusiveValidationMode="none" Inherits="bloodDonation.RequestDonor" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Request Donor</title>
    <!-- Add Bootstrap CSS -->
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <style>
        body {
            background-color: #f8f9fa;
            color: #495057;
            font-family: Arial, sans-serif;
        }

        .donor-card {
            margin-bottom: 15px;
            padding: 20px;
            border-radius: 8px;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

      
        .form-container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .search-container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .form-label {
            font-weight: bold;
        }

        .text-center {
            text-align: center;
        }

        @media (max-width: 768px) {
            .donor-card {
                padding: 15px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <!-- Search Container -->
            <div class="search-container mb-4">
                <h2 class="text-center">Request Donor</h2>
                <div class="row">
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <div class="col-12 col-md-12">
                                <div class="donor-card">
                                    <h5 class="mb-3">Donor Name: <%# Eval("Name") %></h5>
                                    <p><strong>Blood Type:</strong> <%# Eval("BloodType") %></p>
                                    <p><strong>Gender:</strong> <%# Eval("Gender") %></p>
                                    <p><strong>State:</strong> <%# Eval("State") %></p>
                                    <p><strong>City:</strong> <%# Eval("City") %></p>
                                    <p><strong>Pincode:</strong> <%# Eval("pincode") %></p>
                                    <p><strong>Call directly:</strong> <a href="tel:<%# Eval("EmergencyContact") %>">Click here</a></p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

                <div class="mb-3">
                    <asp:Label ID="Label3" runat="server" Text="Patients Name:" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="RName" runat="server"  CssClass="form-control"></asp:TextBox>
                </div>
           
                <div class="mb-3">
                   <asp:Label ID="Label1" runat="server" Text="Date for Dontaion :     <i>can only select next day or further<i>" CssClass="form-label"></asp:Label>

                    <asp:TextBox ID="DATE" runat="server" TYPE="DATE" CssClass="form-control" required="required" />
                </div>



                <div class="mb-3">
                    <asp:Label ID="Label2" runat="server" Text="Message for Donor (if any):" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="MESSAGE" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <asp:Label ID="a" runat="server" Text="Mobile Number:" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="Number" runat="server"  required="required" CssClass="form-control"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="<center>** Wrong mobile format **</center>" ControlToValidate="Number" ForeColor="Red" ValidationExpression="^[7-9]\d{9}$"></asp:RegularExpressionValidator>
                </div>

                <asp:Button ID="Button1" runat="server" Text="Send Request" CssClass="btn form-control btn-primary" OnClick="sendreq" />
                <br />
                <br />
                <asp:Button ID="Button2" runat="server" Text="Back" CssClass="btn form-control btn-danger" OnClick="Back"  />
            </div>
        </div>

    </form>
</body>
</html>
