<%@ Page Language="C#" AutoEventWireup="true" UnobtrusiveValidationMode="none" CodeBehind="RegisterDonor.aspx.cs" Inherits="bloodDonation.RegisterDonor" %>



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
             max-width: 600px;
                          
             width: 100%;
         }
         .fontsize{
             font-size:1rem;
             font-weight:bold;
         }

     </style>
</head>
    <!--name,dob,gender,mobile number,email,adress(state,city,pincode),bloodtype,weight,medical history,willingtodonate(emergency call),emergency number, concent terms and condition ,  -->
<body>
    <form id="form1" runat="server">
        <div class="main-cont d-flex align-items-center justify-content-center">
              <div class="container p-3 form-container mt-3 bg-light border rounded border-black">
                  <div align="center" >
                    <h4>Register as Donar</h4>
                  </div>
                  <br />

                <div class="form-group ">
                    <asp:Label ID="Label1" runat="server" CssClass="fontsize" Text="Name  :"></asp:Label>
                    <asp:TextBox ID="Username" runat="server" CssClass="form-control" placeholder="Name" required="required"></asp:TextBox>
                    <br />
                </div>

                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" CssClass="fontsize" Text="Date Of Birth  :"></asp:Label>
                    <asp:TextBox ID="dateofbirth" runat="server" CssClass="form-control" type="date" required="required"></asp:TextBox>
                    <br />
                </div>

                <div class="form-group">
                    <asp:Label ID="Label9" runat="server" CssClass="fontsize" Text="Gender  :"></asp:Label>
                     <asp:DropDownList ID="GenderList" CssClass="form-control" runat="server"  >
                          <asp:ListItem Text="Male" Value="Male" />
                          <asp:ListItem Text="Female" Value="Female" />
                     </asp:DropDownList>
                   <br />
                </div>

          <div class="form-group">
                    <asp:Label for="DropDownListBloodType" runat="server" CssClass="fontsize" Text="Blood type  :"></asp:Label>
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
                   <br />
                </div>
                           <div class="form-group">
                    <asp:Label for="DropDownListMedicalHistory" runat="server" CssClass="fontsize" Text="Medical History  :"></asp:Label>
                   <asp:DropDownList ID="DropDownListMedicalHistory" runat="server" CssClass="form-control">
                        <asp:ListItem Text="None" Value="None" />
                        <asp:ListItem Text="Diabetes" Value="Diabetes" />
                        <asp:ListItem Text="Hypertension" Value="Hypertension" />
                        <asp:ListItem Text="Heart Disease" Value="HeartDisease" />
                        <asp:ListItem Text="Asthma" Value="Asthma" />
                        <asp:ListItem Text="Allergy" Value="Allergy" />
                        <asp:ListItem Text="Cancer" Value="Cancer" />
                        <asp:ListItem Text="Stroke" Value="Stroke" />
                        <asp:ListItem Text="Kidney Disease" Value="KidneyDisease" />
                        <asp:ListItem Text="Others" Value="Others" />
                    </asp:DropDownList>

                   <br />
                </div>             
                  
                <div class="form-group">
                    <asp:Label ID="Label7" runat="server" CssClass="fontsize" Text="State  :"></asp:Label>
                      <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server"  >
                        <asp:ListItem Text="Andhra Pradesh" Value="AndhraPradesh" />
                        <asp:ListItem Text="Arunachal Pradesh" Value="ArunachalPradesh" />
                        <asp:ListItem Text="Assam" Value="Assam" />
                        <asp:ListItem Text="Bihar" Value="Bihar" />
                        <asp:ListItem Text="Chhattisgarh" Value="Chhattisgarh" />
                        <asp:ListItem Text="Goa" Value="Goa" />
                        <asp:ListItem Text="Gujarat" Value="Gujarat" />
                        <asp:ListItem Text="Haryana" Value="Haryana" />
                        <asp:ListItem Text="Himachal Pradesh" Value="HimachalPradesh" />
                        <asp:ListItem Text="Jharkhand" Value="Jharkhand" />
                        <asp:ListItem Text="Karnataka" Value="Karnataka" />
                        <asp:ListItem Text="Kerala" Value="Kerala" />
                        <asp:ListItem Text="Madhya Pradesh" Value="MadhyaPradesh" />
                        <asp:ListItem Text="Maharashtra" Value="Maharashtra" />
                        <asp:ListItem Text="Manipur" Value="Manipur" />
                        <asp:ListItem Text="Meghalaya" Value="Meghalaya" />
                        <asp:ListItem Text="Mizoram" Value="Mizoram" />
                        <asp:ListItem Text="Nagaland" Value="Nagaland" />
                        <asp:ListItem Text="Odisha" Value="Odisha" />
                        <asp:ListItem Text="Punjab" Value="Punjab" />
                        <asp:ListItem Text="Rajasthan" Value="Rajasthan" />
                        <asp:ListItem Text="Sikkim" Value="Sikkim" />
                        <asp:ListItem Text="Tamil Nadu" Value="TamilNadu" />
                        <asp:ListItem Text="Telangana" Value="Telangana" />
                        <asp:ListItem Text="Tripura" Value="Tripura" />
                        <asp:ListItem Text="Uttar Pradesh" Value="UttarPradesh" />
                        <asp:ListItem Text="Uttarakhand" Value="Uttarakhand" />
                        <asp:ListItem Text="West Bengal" Value="WestBengal" />
                    </asp:DropDownList>
                  <br />
              </div>

                 <div class="form-group">
                     <asp:Label ID="Label6" runat="server" CssClass="fontsize" Text="City  :"></asp:Label>
                    <asp:TextBox ID="City" runat="server" CssClass="form-control" placeholder="City"  required="required" AutoCompleteType="HomeCity" ></asp:TextBox>
                     <br />
                </div>
 
                <div class="form-group">
                     <asp:Label for="Pincode" runat="server" CssClass="fontsize" Text="Pincode  :"></asp:Label>
                    <asp:TextBox ID="Pincode" runat="server" CssClass="form-control" placeholder="Pincode"  required="required"  ></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="<center>** Wrong pincode format **</center>" ControlToValidate="pincode" ForeColor="Red" ValidationExpression="^[1-9][0-9]{5}"></asp:RegularExpressionValidator>

                </div>

                <div class="form-group">
                     <asp:Label for="Address" runat="server" CssClass="fontsize" Text="Address  :"></asp:Label>
                    <asp:TextBox ID="Address" runat="server" CssClass="form-control" placeholder="Address"  required="required" AutoCompleteType="HomeStreetAddress" ></asp:TextBox>
                     <br />
                </div>

                    <div class="form-group">
                         <asp:Label ID="Label3" runat="server" CssClass="fontsize" Text="Mobile Number  :"></asp:Label>
                        <asp:TextBox ID="MobileNumber" runat="server" CssClass="form-control" placeholder="Mobile Number"  required="required"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="<center>** Wrong mobile format **</center>" ControlToValidate="MobileNumber" ForeColor="Red" ValidationExpression="^[7-9]\d{9}$"></asp:RegularExpressionValidator>
                    </div>
                    
                 <div class="form-group">
                         <asp:Label for="EmergencyContact" runat="server" CssClass="fontsize" Text="Emergency Mobile Number  :   * if none enter same *"></asp:Label>
                        <asp:TextBox ID="EmergencyContact" runat="server" CssClass="form-control" placeholder="Emergency Mobile Number"  required="required"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="EmergencyContactvalidator" runat="server" ErrorMessage="<center>** Wrong mobile format **</center>" ControlToValidate="EmergencyContact" ForeColor="Red" ValidationExpression="^[7-9]\d{9}$"></asp:RegularExpressionValidator>
                    </div>
                    
                 <div class="form-group">
                     <asp:CheckBox ID="CheckBox1" runat="server" />
                     Accept <a href="TermsConditions.html">Terms & Conditions</a>
                    </div>
                                 
                <div class="form-group">
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary btn-block" Text="Register" OnClick="RegisterasDonar_Click" />
                </div>

                  <div align="center">
                    <asp:HyperLink ID="HyperLink1" href="Default.aspx" runat="server">Go Back</asp:HyperLink>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
