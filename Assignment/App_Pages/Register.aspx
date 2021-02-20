<%@ Page Title="" Language="C#" MasterPageFile="~/Mizuki.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Assignment.App_Pages.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>

<html>
<head>
  
    <style>
        * {
            margin: 0px;
            padding: 0px;
            box-sizing: border-box;
        }

        body, html {
            height: 100%;
            font-family: Raleway-Regular, sans-serif;
            background-image: url("https://i.pinimg.com/originals/9f/09/79/9f0979d83ab4537c9df1dc99336fbcbb.jpg");
            z-index: 0;
            background-size: cover;
            background-repeat: no-repeat;
        }

        /*---------------------------------------------*/
        a {
            font-family: Raleway-Regular;
            font-size: 14px;
            line-height: 1.7;
            color: #666666;
            margin: 0px;
   
        }

            a:focus {
                outline: none !important;
            }

            a:hover {
                text-decoration: none;
                color: #85929E;
            }

        /*---------------------------------------------*/





        /*---------------------------------------------*/
        input {
            outline: none;
            border: none;
        }



        /*---------------------------------------------*/
        button {
            outline: none !important;
            border: none;
            background: transparent;
        }

            button:hover {
                cursor: pointer;
            }





        .forgetPasswordText {
            font-family: Raleway-Regular;
            font-size: 13px;
            color: #555555;
            line-height: 1.4;
        }


        /*//////////////////////////////////////////////////////////////////
        [ login ]*/


        .whiteboxPosition {
            width: 100%;
            min-height: 100vh;
            display: -webkit-box;
            display: -webkit-flex;
            display: -moz-box;
            display: -ms-flexbox;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            padding: 15px;
        }


        .whiteboxSize {
            width: 380px;
            height: 600px;
            background: #fff;
            padding-left: 50px;
            padding-right: 50px;
            padding-top: 20px;
            padding-bottom: 20px;
        }


        /*==================================================================
        [ Form ]*/

        .login100-form {
            width: 100%;
        }

        .loginText {
            font-family: Raleway-Medium;
            font-size: 30px;
            color: #555555;
            line-height: 1.2;
            text-transform: uppercase;
            text-align: left;
            width: 100%;
            display: block;
            padding-bottom: 20px;
            padding-top: 20px;
        }

        .text {
            font-family: Raleway-SemiBold;
            font-size: 13px;
            color: #555555;
            line-height: 1.4;
            text-transform: uppercase;
            padding-bottom: 5px;
        }

        .signUpText {
            font-family: Raleway-Regular;
            font-size: 13px;
            color: #555555;
            line-height: 1.4;
            padding-left: 55px;
        }

        /*------------------------------------------------------------------
        [ Input ]*/
        .wrap-usernameInput {
            width: 100%;
            position: relative;
            background-color: #fff;
            border: 1px solid #e6e6e6;
            border-radius: 2px;
            margin-bottom: 20px;
        }

        .wrap-passwordInput {
            width: 100%;
            position: relative;
            background-color: #fff;
            border: 1px solid #e6e6e6;
            border-radius: 2px;
            margin-bottom: 12px;
        }

        /*---------------------------------------------*/
        .input {
            font-family: Raleway-Medium;
            color: #555555;
            line-height: 1.2;
            font-size: 18px;
            display: block;
            width: 100%;
            background: transparent;
            height: 35px;
            padding: 0 25px 0 25px;
        }


        .loginFormBtn {
            font-family: Raleway-Bold;
            font-size: 16px;
            color: #fff;
            line-height: 1.2;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 0 20px;
            min-width: 280px;
            height: 30px;
            background-color: #333333;
            border-radius: 27px;
            margin-top: 5px;
            margin-bottom: 45px;
            transition: all 0.4s;
        }

            .loginFormBtn:hover {
                background-color: #283747;
            }


            .radiobtn input[type="radio"] {
                margin:8px 20px 15px 40px;
                font-family: Raleway-SemiBold;
                font-size: 13px;
                color: #555555;
                line-height: 1.4;
                text-transform: uppercase;

            }

         
         
    </style>
</head>
<body>
        <div class="whiteboxPosition">
			<div class="whiteboxSize">
				<form id="signInForm" runat="server" class="loginForm">
					<span class="loginText ">
						Register
					</span>

					<span class="text">
						Username
					</span>
					<div class="wrap-usernameInput">
                        <asp:TextBox ID="TextBox1" runat="server" class="input"></asp:TextBox>
                     </div>

                    <span class="text">
						Email
					</span>
					<div class="wrap-usernameInput">
                        <asp:TextBox ID="email" runat="server" class="input"></asp:TextBox>
                     </div>

                    <span class="text">
						Password
					</span>
					<div class="wrap-usernameInput">
                        <asp:TextBox ID="pass" runat="server" class="input"></asp:TextBox>
                     </div>
					
					<span class="text">
						Confirm Password
					</span>
					<div class="wrap-usernameInput">
						<asp:TextBox ID="confirmPass" runat="server" class="input" ></asp:TextBox>
						
					</div>
					
					<span class="text">
						Join as
                    </span>
					<div class="text">
					<asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal"  RepeatLayout="Flow" CssClass="radiobtn">
                            <asp:ListItem>Artist</asp:ListItem>
                      
                            <asp:ListItem>Buyer</asp:ListItem>
                    </asp:RadioButtonList>
                   
                    </div>
						
					

				       <asp:Button ID="loginFormBtn" runat="server" Text="Register" class="loginFormBtn" />  
						

						
						

						<div>
                            <asp:HyperLink id="signUpText" NavigateUrl="~/App_Pages/Login.aspx" Text="Already have an account? Login" runat="server" class="signUpText"/> 

						</div>
					

				</form>
			</div>
		</div>
	
	


</body>
</html>
</asp:Content>
