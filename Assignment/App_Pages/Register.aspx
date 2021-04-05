<%@ Page Title="Mizuki Register" Language="C#" MasterPageFile="~/Mizuki.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Assignment.App_Pages.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<title>Registration</title>
	<link rel="stylesheet" type="text/css" href="../css/Login_Register.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>


        <div class="whiteboxPosition">
			<div class="registerWhiteboxSize">
				<form id="signInForm" runat="server" class="form">
					<span class="text1" style="margin-bottom:-20px;">
						Register
					</span>
					<asp:Label ID="lblRegisterOk" class="text2" style="color: red;" runat="server"></asp:Label><br />
					<span class="text2">
						Name
					</span>

					<div class="wrapInput1"style="margin-bottom:5px;">
                        <asp:TextBox ID="TxtRName" runat="server" class="input" ></asp:TextBox>
                     </div>

					<span class="text2" >
						Gender
                    </span>
					<div class="text2">
					<asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal"  RepeatLayout="Flow" CssClass="radiobtn">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                    </asp:RadioButtonList>

					<div class="text2">
                        <label>Date of Birth</label>
                        <div class="text2">
                           <asp:TextBox CssClass="form-control" ID="TxtRDOB" runat="server"  TextMode="Date"></asp:TextBox>
                        </div>
                     </div>

					
                   
                    </div>

                    <span class="text2">
						Username
					</span>
					<div class="wrapInput1">
                        <asp:TextBox ID="TxtRUsername" runat="server" class="input"></asp:TextBox>
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
					
					<span class="text2">
						Email
					</span>
					<div class="wrapInput1">
						<asp:TextBox ID="TxtREmail" runat="server" class="input" TextMode="Email" ></asp:TextBox>
						
					</div>
					

					<asp:Button ID="loginFormBtn" runat="server" Text="Register" class="formBtn" OnClick="loginFormBtn_Click"  />  
						

						
						

						<div>
                            <asp:HyperLink id="signUpText" NavigateUrl="~/App_Pages/Login.aspx" Text="Already have an account? Login" runat="server" class="signUpText"/> 

						</div>
					

				</form>
			</div>
		</div>
	
</asp:Content>
