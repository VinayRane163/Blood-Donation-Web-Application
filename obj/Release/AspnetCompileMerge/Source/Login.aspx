<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="bloodDonation.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
     <style>
         .centered {
             display: flex;
             align-items: center;
             justify-content: center;
             height: 100vh;
         }

         .main-cont {
             padding: 1rem;
         }
          .form-control{
             border:1px solid black;
          }
         .form-container {
             max-width: 400px;
             width: 100%;
         }

          .fontsize{
            font-size:1rem;
            font-weight:bold;
          }
     </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main-cont d-flex align-items-center justify-content-center">
              <div class="container p-3 form-container mt-3 bg-light border rounded">
                  <div align="center" >
                    <h2>Login</h2>
                  </div>
                  <br />
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" CssClass="fontsize" Text="Username  :"></asp:Label>
                    <asp:TextBox ID="Username" runat="server" CssClass="form-control" placeholder="Username(email)" type="email" AutoCompleteType="Email" required="required"></asp:TextBox>
                </div>
        
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" CssClass="fontsize" Text="Password  :"></asp:Label>
                    <asp:TextBox ID="Password" runat="server" CssClass="form-control" placeholder="Password" required="required" type="password"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary btn-block" Text="Login" OnClick="Button1_Click" />
                </div>

                <div align="center">
                    <asp:HyperLink ID="HyperLink1" href="Register.aspx" runat="server">Register</asp:HyperLink>
                </div>
            </div>
        </div>
    </form>
</body>
</html>


