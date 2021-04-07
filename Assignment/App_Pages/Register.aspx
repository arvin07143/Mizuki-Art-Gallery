<%@ Page Title="Mizuki Register" Language="C#" MasterPageFile="~/Mizuki.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Assignment.App_Pages.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

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
						Name<asp:RequiredFieldValidator ID="rsfRName" runat="server" ControlToValidate="TxtRName" Display="Dynamic" ErrorMessage="Name is required." ForeColor="Red" font-size = "8px">*Name is required.</asp:RequiredFieldValidator>
					</span>
					<div class="wrapInput1"style="margin-bottom:5px;">
                        <asp:TextBox ID="TxtRName" runat="server" class="input" ></asp:TextBox>
                     </div>

					<span class="text2" >
						Gender<asp:RequiredFieldValidator ID="rsfRGender" runat="server" Display="Dynamic" ErrorMessage="Gender is required." Font-Size="8px" ForeColor="Red" ControlToValidate="RadioButtonList1">*Gender is required.</asp:RequiredFieldValidator>
&nbsp;</span><div class="text2">
					<asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal"  RepeatLayout="Flow" CssClass="radiobtn">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                    </asp:RadioButtonList>

					<div class="text2">
                        <label>Date of Birth<asp:RequiredFieldValidator ID="rsfRDOB" runat="server" ControlToValidate="TxtRDOB" Display="Dynamic" ErrorMessage="*Date  of birth is required." Font-Size="8px" ForeColor="Red">*Date  of birth is required.</asp:RequiredFieldValidator>
                        </label>&nbsp;<div class="text2">
                           <asp:TextBox CssClass="form-control" ID="TxtRDOB" runat="server"  TextMode="Date"></asp:TextBox>
                        </div>
                     </div>

					
                   
                    </div>

                    <span class="text2">
						Username
					<asp:RequiredFieldValidator ID="rsfRUsername" runat="server" ControlToValidate="TxtRUsername" Display="Dynamic" ErrorMessage="Username is required." ForeColor="Red" font-size = "8px">*Username is required.</asp:RequiredFieldValidator>
					</span>
					<div class="wrapInput1">
                        <asp:TextBox ID="TxtRUsername" runat="server" class="input"></asp:TextBox>
                     </div>

                    <span class="text2">
						Password
						<asp:RequiredFieldValidator ID="rsfRPassword" runat="server" ControlToValidate="TxtRPass" ErrorMessage="Password is required." ForeColor="Red" font-size = "8px">*Password is required.</asp:RequiredFieldValidator>
					</span>
					<div class="wrapInput1">
                        <asp:TextBox ID="TxtRPass" runat="server" class="input"></asp:TextBox>
                     </div>
					
					<span class="text2">
						Confirm Password<asp:RequiredFieldValidator ID="rsvRConfirmPass" runat="server" ControlToValidate="TxtRConfirmPass" Display="Dynamic" ErrorMessage="Confirm password is required." ForeColor="Red" font-size = "8px">*Confirm password is required.</asp:RequiredFieldValidator>
&nbsp;</span><div class="wrapInput1">
						<asp:TextBox ID="TxtRConfirmPass" runat="server" class="input" ></asp:TextBox>
						
					</div>
					
					<span class="text2">
						Email
					<asp:RequiredFieldValidator ID="rsfREmail" runat="server" ControlToValidate="TxtREmail" Display="Dynamic" ErrorMessage="Email is required." ForeColor="Red" font-size = "8px">*Email is required.</asp:RequiredFieldValidator>
					</span>
					<div class="wrapInput1">
						<asp:TextBox ID="TxtREmail" runat="server" class="input" TextMode="Email" ></asp:TextBox>
						
					</div>
					

					<asp:Button ID="registerFormBtn" runat="server" Text="Register" class="formBtn" OnClick="registerFormBtn_Click"  />  
						

						
						

						<div>
                            <asp:HyperLink id="signUpText" NavigateUrl="~/App_Pages/Login.aspx" Text="Already have an account? Login" runat="server" class="signUpText"/> 

						</div>
					

				</form>
			</div>
		</div>
	
</asp:Content>
