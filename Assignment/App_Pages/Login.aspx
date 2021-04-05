<%@ Page Title="Mizuki Login" Language="C#" MasterPageFile="~/Mizuki.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Assignment.Login" %>

<asp:Content ID="LoginHeader" ContentPlaceHolderID="head" runat="server">
    <title>Login</title>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="contentplaceholder1" runat="server">
<link rel="stylesheet" type="text/css" href="../css/Login_Register.css" />
		
        <div class="whiteboxPosition">
			<div class="loginWhiteboxSize">
				<form id="loginform" runat="server" class="form">
					<span class="text1 ">
						Login
					</span>
					<asp:Label ID="lblLoginFail" class="text2" style="color: red;" runat="server"></asp:Label>
					<span class="text2">
						Username
						<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtLUsername" Display="Dynamic" ErrorMessage="Username is required." Font-Size="8px" ForeColor="Red">*Username is required.</asp:RequiredFieldValidator>
					</span>
					<div class="wrapInput1">
                        <asp:TextBox ID="TxtLUsername" runat="server" class="input"></asp:TextBox>
                     </div>
					
					<span class="text2">
						Password
						<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtLPass" Display="Dynamic" ErrorMessage="Password is required." Font-Size="8px" ForeColor="Red">*Password is required.</asp:RequiredFieldValidator>
	                </span>
                	<div class="wrapInput2">
						<asp:TextBox ID="TxtLPass" runat="server" class="input" TextMode="Password"></asp:TextBox>
						
					</div>
					
					
						

						<div>
							<asp:HyperLink id="forgetPassword" NavigateUrl="~/App_Pages/ForgetPassword.aspx" Text="Forgot Password?" runat="server" class="forgetPasswordText"/>
							
						</div>
					

				       <asp:Button ID="loginFormBtn" runat="server" Text="Login" class="formBtn" OnClick="loginFormBtn_Click" />  
						

						<div>
                            <asp:HyperLink id="signUpText" NavigateUrl="~/App_Pages/Register.aspx" Text="Create an account? Register" runat="server" class="text3"/> 

						</div>
					

				</form>
			</div>
		</div>
	


</asp:Content>