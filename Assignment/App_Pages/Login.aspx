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
					</span>
					<div class="wrapInput1">
                        <asp:TextBox ID="TxtLUsername" runat="server" class="input"></asp:TextBox>
                     </div>
					
					<span class="text2">
						Password
					</span>
					<div class="wrapInput2">
						<asp:TextBox ID="TxtLPass" runat="server" class="input" TextMode="Password"></asp:TextBox>
						
					</div>
					
					
						

						<div>
                             <asp:LinkButton  id="forgetPassword"  runat="server" class="forgetPasswordText" OnClick="msg"> Forgot Password?</asp:LinkButton>
						
							
						     
							
						</div>
					

				       <asp:Button ID="loginFormBtn" runat="server" Text="Login" class="formBtn" OnClick="loginFormBtn_Click" />  
						

						<div>
                            <asp:HyperLink id="signUpText" NavigateUrl="~/App_Pages/Register.aspx" Text="Create an account? Register" runat="server" class="text3"/> 

						</div>
					

				</form>
			</div>
		</div>
	


</asp:Content>