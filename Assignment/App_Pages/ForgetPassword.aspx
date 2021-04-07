<%@ Page Title="Forget password" Language="C#" MasterPageFile="~/Mizuki.Master" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="Assignment.App_Pages.ForgetPassword" %>
<asp:Content ID="Contentt1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" type="text/css" href="../css/Login_Register.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="whiteboxPosition">
			<div class="registerWhiteboxSize" style="height: 600px;">
				<form id="forgetPassForm" runat="server" class="form">
					<span class="text1" style="margin-bottom:-20px;">
						Forget Password
					</span>
					<asp:ValidationSummary  class="text2" ID="vsForgetPassword" runat="server"  ForeColor="#FF3300" />
					<span class="text2">
						Username
					<asp:RequiredFieldValidator ID="rsvFPUsername" runat="server" ControlToValidate="TxtRUsername" Display="Dynamic" ErrorMessage="Username is required." ForeColor="Red" >*</asp:RequiredFieldValidator>
					</span>
					<div class="wrapInput1">
                        <asp:TextBox ID="TxtRUsername" runat="server" class="input"></asp:TextBox>
                     </div>

                    <span class="text2">
						New Password
						<asp:RequiredFieldValidator ID="rsvFPNewPass" runat="server" ControlToValidate="TxtRPass" ErrorMessage="Password is required." ForeColor="Red" >*</asp:RequiredFieldValidator>
					</span>
					<div class="wrapInput1">
                        <asp:TextBox ID="TxtRPass" runat="server" class="input"></asp:TextBox>
                     </div>
					
					<span class="text2">
						Confirm Password
						<asp:RequiredFieldValidator ID="rsfFPConfirmPass" runat="server" ControlToValidate="TxtRConfirmPass" Display="Dynamic" ErrorMessage="Comfirm password is required." ForeColor="Red" >*</asp:RequiredFieldValidator>
						<asp:CustomValidator ID="cvFPConfirmPass" runat="server" ErrorMessage="Confirm password does not match." ForeColor="Red" ControlToValidate="TxtRConfirmPass" OnServerValidate="conPassValidate_ServerValidate">*</asp:CustomValidator>
					</span>
                    <div class="wrapInput1">
						<asp:TextBox ID="TxtRConfirmPass" runat="server" class="input" ></asp:TextBox>
						
					</div>
					
					<span class="text2">
						validation code
					</span>
					<div class="wrapInput1">
						<asp:TextBox ID="TxtRValidationCode" runat="server" class="input"  ></asp:TextBox>
						
					</div>
					

					<span class="text2">
					

					<asp:Label ID="getCodeMsg" runat="server" Text="" class="text2" ForeColor="Red"></asp:Label>
					

					</span>
					

					<asp:Button ID="getVerificationCode" runat="server" class="formBtn"  Text="Get Code" OnClick="getVerificationCode_Click" />
					

					<asp:Button ID="forgetPasssFormBtn" runat="server" Text="Change Password" class="formBtn" OnClick="forgetPasssFormBtn_Click"  />  
						

						
						

						<div>
                            <asp:HyperLink id="signUpText" NavigateUrl="~/App_Pages/Login.aspx" Text="Already have an account? Login" runat="server" class="signUpText"/> 

						</div>
					

				</form>
			</div>
		</div>
	
</asp:Content>
