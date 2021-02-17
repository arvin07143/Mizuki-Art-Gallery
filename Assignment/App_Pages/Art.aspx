<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Art.aspx.cs" Inherits="Assignment.App_Pages.Art" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<style>
		:root {
			/* Base font size */
			font-size: 10px;
		}
		
		*,
		*::before,
		*::after {
			box-sizing: border-box;
		}
		
		body {
			min-height: 100vh;
			background-color: #fafafa;
			background-image: url('https://previews.123rf.com/images/teresaterra/teresaterra1802/teresaterra180200040/96114472-romantic-bunch-of-pink-roses-with-blank-greeting-card-lying-on-the-bed.jpg');
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
    <div class="container">

	<h1 class="heading" style="color:black"><b><span>Mizuki Gallery</span></b></h1>

	<div class="gallery">

		<div class="gallery-item">
			<img class="gallery-image" src="https://i.pinimg.com/564x/78/56/1e/78561ebe81f88c3d193cb5eb6c3a68e9.jpg" alt="person writing">
		</div>

		<div class="gallery-item">
			<img class="gallery-image" src="https://i.pinimg.com/564x/1a/46/11/1a4611b27348f6eecaab0620710d1a83.jpg" alt="sunset">
		</div>

		<div class="gallery-item">
			<img class="gallery-image" src="https://i.pinimg.com/564x/1e/7f/65/1e7f65f57330ff7b7ed35f2ab5fd598f.jpg" alt="street">
		</div>

		<div class="gallery-item">
			<img class="gallery-image" src="https://i.pinimg.com/564x/7c/06/10/7c0610191f89e573a30426b7305deb41.jpg" alt="car">
		</div>

		<div class="gallery-item">
			<img class="gallery-image" src="https://i.pinimg.com/236x/51/d3/98/51d3981f42047bf45016d0f590bcfb8e.jpg" alt="women at the street">
		</div>

		<div class="gallery-item">
			<img class="gallery-image" src="https://i.pinimg.com/564x/b4/10/8f/b4108f58455673fd070dcd6ddb6b5674.jpg" alt="man playing guitar">
		</div>

	</div>

</div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
