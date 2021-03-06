<%@ Page Title="" Language="C#" MasterPageFile="~/Mizuki.Master" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="Assignment.App_Pages.MainPage" %>
<asp:Content ID="mainPageHeader" ContentPlaceHolderID="head" runat="server">
    <style>
        .img-slide{
            height: 300px;
            width: 400px;
            object-fit: contain;
            object-position: center;
            margin: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">

    <div class="bg-dark">
        <div id="carouselExampleControls" class="carousel slide container w-50 pt-2"  data-interval="3000" data-pause="hover">
            <div class="carousel-inner m-auto">
                <asp:Repeater ID="carouselRepeater" runat="server" >
                    <ItemTemplate>
                        <div id="carouselItem" class="carousel-item" runat="server">
                            <img class="d-block img-slide"  src='<%# Eval("URL")%>'>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
            </a>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TOP 3 [URL]  FROM [Artwork] "></asp:SqlDataSource>
    </div>


    </form>


</asp:Content>
