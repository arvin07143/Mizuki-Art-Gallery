<%@ Page Title="Mizuki Register" Language="C#" MasterPageFile="~/Mizuki.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Assignment.App_Pages.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<link rel="stylesheet" type="text/css" href="../css/login_register.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

        <div class="whiteboxPosition">
			<div class="registerWhiteboxSize">
				<form id="signInForm" runat="server" class="form">
					<span class="text1 ">
						Register
					</span>

					<span class="text2">
						Username
					</span>
					<div class="wrapInput1">
                        <asp:TextBox ID="TxtRUsername" runat="server" class="input"></asp:TextBox>
                     </div>

                    <span class="text2">
						Email
					</span>
					<div class="wrapInput1">
                        <asp:TextBox ID="TxtREmail" runat="server" class="input"></asp:TextBox>
                     </div>

                    <span class="text2">
						Password
					</span>
					<div class="wrapInput1">
                        <asp:TextBox ID="TxtRPass" runat="server" class="input"></asp:TextBox>
                     </div>
					
					<span class="text2">
						Confirm Password
					</span>
					<div class="wrapInput1">
						<asp:TextBox ID="TxtRConfirmPass" runat="server" class="input" ></asp:TextBox>
						
					</div>
						
					

				       <asp:Button ID="registerBtn" runat="server" Text="Register" class="formBtn" />  
						

						
						

						<div>
                            <asp:HyperLink id="signUpText" NavigateUrl="~/App_Pages/Login.aspx" Text="Already have an account? Login" runat="server" class="text4"/> 

						</div>
					

				</form>
			</div>
		</div>
	
	



</asp:Content>
