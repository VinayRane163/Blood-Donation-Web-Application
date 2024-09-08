<%@ Page Language="C#" AutoEventWireup="true" UnobtrusiveValidationMode="none" CodeBehind="Register.aspx.cs" Inherits="bloodDonation.Register" %>


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
          body{
              overflow-y:hidden;
          }
         .main-cont {
             padding: 1rem;
         }
         .form-control{
             border:1px solid black;
         }
         .form-container {
             max-width: 600px;
                          
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
              <div class="container p-3 form-container mt-3 bg-light border rounded border-black">
                  <div align="center" >
                    <h2>Register</h2>
                  </div>
                  <br />
                <div class="form-group ">
                    <asp:Label ID="Label1" runat="server" CssClass="fontsize" Text="Name  :"></asp:Label>
                    <asp:TextBox ID="Username" runat="server" CssClass="form-control" placeholder="Name" required="required"></asp:TextBox>
                    <br />
                </div>
        
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" CssClass="fontsize" Text="Email ID  :"></asp:Label>
                    <asp:TextBox ID="Email" runat="server" CssClass="form-control" placeholder="Email" type="email" required="required"></asp:TextBox>
                    <br />
                </div>

                 <div class="form-group">
                     <asp:Label ID="Label3" runat="server" CssClass="fontsize" Text="Mobile Number  :"></asp:Label>
                    <asp:TextBox ID="MobileNumber" runat="server" CssClass="form-control" placeholder="Mobile Number"  required="required"></asp:TextBox>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="<center>** Wrong mobile format **</center>" ControlToValidate="MobileNumber" ForeColor="Red" ValidationExpression="^[7-9]\d{9}$"></asp:RegularExpressionValidator>
                </div>

                 <div class="form-group">
                     <asp:Label ID="Label4" runat="server" CssClass="fontsize" Text="Password  :"></asp:Label>
                    <asp:TextBox ID="Password" runat="server" CssClass="form-control" placeholder="Password"  required="required" type="password"></asp:TextBox>
                     <br />
                </div>

                 <div class="form-group">
                     <asp:Label ID="Label5" runat="server" CssClass="fontsize" Text="Re-Enter Password  :"></asp:Label>
                    <asp:TextBox ID="RePass" runat="server" CssClass="form-control" placeholder="re-enter password" required="required" type="password"></asp:TextBox>
                     <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="<center>** Please enter same password **</center>" ForeColor="red" ControlToCompare="Password" ControlToValidate="RePass"></asp:CompareValidator>
                </div>

                 
                <div class="form-group">
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary btn-block" Text="Register" OnClick="Register_Click" />
                </div>

                  <div align="center">
                    <asp:HyperLink ID="HyperLink1" href="Login.aspx" runat="server">Login</asp:HyperLink>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
