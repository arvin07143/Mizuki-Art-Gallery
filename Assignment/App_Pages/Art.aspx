<%@ Page Title="" Language="C#" MasterPageFile="~/Mizuki.Master" AutoEventWireup="true" CodeBehind="Art.aspx.cs" Inherits="Assignment.App_Pages.Art" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentplaceholder1" runat="server">
    <form id="form1" runat="server">
	<style>
		*,
		*::before,
		*::after {
			box-sizing: border-box;
		}
		
		body {
			min-height: 100vh;
			background-color: #fafafa;
			/*background-image: url('https://previews.123rf.com/images/teresaterra/teresaterra1802/teresaterra180200040/96114472-romantic-bunch-of-pink-roses-with-blank-greeting-card-lying-on-the-bed.jpg');*/
			background-repeat: no-repeat;
			background-attachment: fixed;
			background-size: 100% 100%;
		}
		
		.container {
			max-width: 1250px;
			margin: 0 auto;
			padding: 0 2rem 2rem;
		}
		
		.heading {
			font-family: "Montserrat", Arial, sans-serif;
			font-size: 4rem;
			font-weight: 500;
			line-height: 1.5;
			text-align: center;
			padding: 3.5rem 0;
			color: #1a1a1a;
		}
		
		.heading span {
			display: block;
		}
		
		.gallery {
			display: flex;
			flex-wrap: wrap;
			/* Compensate for excess margin on outer gallery flex items */
			margin: 0 0;
		}
		
		.gallery-item {
			/* Minimum width of 24rem and grow to fit available space */
			flex: 1 0 24rem;
			/* Margin value should be half of grid-gap value as margins on flex items don't collapse */
			margin: 5px;
			box-shadow: 0.3rem 0.4rem 0.4rem rgba(0, 0, 0, 0.4);
			overflow: hidden;
		}
		
		.gallery-image {
			display: block;
			width: 100%;
			height: 100%;
			object-fit: cover;
			transition: transform 400ms ease-out;
		}
		
		.gallery-image:hover {
			transform: scale(1.15);
		}
		
	</style>

    <h1 class="heading" style="color:black"><b><span>Mizuki Gallery</span></b></h1>
        <div class="container">
        <div class="gallery">
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Artwork]"></asp:SqlDataSource>
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate> 
                    <div class="gallery-item">
                        <asp:ImageButton CssClass="gallery-image" ID="Image1"  runat="server" ImageUrl='<%# Eval("URL") %>' PostBackUrl="~/App_Pages/Order.aspx"/>
                    </div>                 
            </ItemTemplate>
        </asp:Repeater>
                </div>
        </div>

    </form>
</asp:Content>

