<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BloodRequest.aspx.cs" Inherits="bloodDonation.BloodRequest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Requests from Patients</title>
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

    </style>
</head>
<body>
    <form id="form1" runat="server">
        
     <div class="search-container mb-4">
     <h3 class="text-center donor-card">Request's From People</h3>
         <div align="center">
             <asp:Button ID="Button1" runat="server" CssClass="btn btn-danger "  Text="Back" OnClick="Button1_Click" /></div>
         <br />
         <div class="row">
             <asp:Repeater ID="Repeater1" runat="server" >
                 <ItemTemplate>
                     <div class="col-12 col-md-6 md-lg-4">
                         <div class="donor-card">
                             <h5 class="mb-3">Patient's Email: <%# Eval("SenderEmail") %></h5>
                             <p><strong>Patient's Name:</strong> <%# Eval("SenderName") %></p>
                             <p><strong>Patient's Number:</strong> <%# Eval("SenderNumber") %></p>
                             <p><strong>Request For Date:</strong> <%# Eval("RequestDate") %> (yyyy-mm-dd)</p>
                             <p><strong>Message:</strong> <%# Eval("SenderMessage") %></p>
                             <p><strong>Call directly:</strong> <a href="tel:<%# Eval("SenderNumber") %>">Click here</a></p>
                         </div>
                     </div>
                 </ItemTemplate>
             </asp:Repeater>
         </div>
      </div>
    </form>
</body>
</html>
