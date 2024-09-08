<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchDonor.aspx.cs" Inherits="bloodDonation.SearchDonor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Blood Donation Search</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            padding:3px;
            background-color: #f4f4f9;
        }

        .search-container {
            margin: 0 auto;
            padding: 10px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            min-width: 100%;
        }

        .search-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .result-container {
            margin: 10px;
            justify-content:center;
          
        }

        .donor-card {
            background-color: #e9ecef;
            padding: 15px;
            margin-bottom: 10px;
            border-radius: 5px;
            width:100%;
            margin:10px;

        }
        .huii{
        background-color: #e9ecef;
         padding: 15px;
         margin: 10px;
         border-radius: 5px;
        }

        .donor-card h5 {
            margin-bottom: 10px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="">
            <div class="search-container">
                <h2>Search for Blood Donors</h2>
                <div class="form-group">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Search by city or pincode"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:DropDownList ID="DropDownListBloodType" runat="server" CssClass="form-control">
                        <asp:ListItem Text="A+" Value="A+" />
                        <asp:ListItem Text="A-" Value="A-" />
                        <asp:ListItem Text="B+" Value="B+" />
                        <asp:ListItem Text="B-" Value="B-" />
                        <asp:ListItem Text="AB+" Value="AB+" />
                        <asp:ListItem Text="AB-" Value="AB-" />
                        <asp:ListItem Text="O+" Value="O+" />
                        <asp:ListItem Text="O-" Value="O-" />
                    </asp:DropDownList>
                </div>
                <div class="form-group text-center">
                    <asp:Button ID="Button1" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="Search" />
                    <asp:Button ID="Button2" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="Back" />
                </div>
            </div>

            <div class="row result-container">
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <div class="col-12 col-lg-5 huii" >
                            <h5>Donor Name: <%# Eval("Name")%></h5>
                            Blood Type: <%# Eval("BloodType")%><br />
                            Gender: <%# Eval("Gender")%><br />
                            State: <%# Eval("State")%><br />
                            City: <%# Eval("City")%><br />
                            Pincode: <%# Eval("pincode")%><br />
                              <center>
                                    <asp:HyperLink ID="ProductLink" runat="server" 
                                                    NavigateUrl='<%# "RequestDonor.aspx?DonorID=" + Eval("DonorID") %>'
                                                    CssClass="btn btn-dark  ">VIEW DETAILS
                                    </asp:HyperLink>
                                </center>

                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form>
</body>
</html>
