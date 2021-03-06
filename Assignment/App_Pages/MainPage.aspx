<%@ Page Title="" Language="C#" MasterPageFile="~/Mizuki.Master" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="Assignment.App_Pages.MainPage" %>

<asp:Content ID="mainPageHeader" ContentPlaceHolderID="head" runat="server">
    <style>
        .img-slide {
            height: 300px;
            width: 400px;
            object-fit: contain;
            object-position: center;
            margin: auto;
        }
        .img-row{
            height: 240px;
            width: 135px;
            object-fit: cover;
            object-position: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">

        <div class="bg-dark">
            <div id="carouselExampleControls" class="carousel slide container w-50 pt-2" data-interval="3000" data-pause="hover">
                <div class="carousel-inner m-auto">
                    <asp:Repeater ID="carouselRepeater" runat="server">
                        <ItemTemplate>
                            <div id="carouselItem" class="carousel-item" runat="server">

                                <asp:ImageButton class="d-block img-slide" src='<%# Eval("URL")%>' runat="server" CommandArgument='<%# Eval("ArtworkID") %>' OnClick="SlideImg_Click" />

                                <div class="carousel-caption d-none d-md-block">
                                    <h5 runat="server" style="text-shadow: 2px 2px 4px #000000;"><%# Eval("ArtworkName")%></h5>
                                </div>
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
        </div>

        <div class="container mt-3 mb-3">
            <hr />
            <h1>New Artwork</h1>
            <div class="card-group">
                <asp:Repeater ID="newArtworkRepeater" runat="server">
                    <ItemTemplate>
                        <div class="card">
                            <asp:ImageButton ID="artImageBtn" runat="server" class="card-img-top img-row" src='<%# Eval("URL") %>' CommandArgument='<%# Eval("ArtworkID") %>' OnClick="SlideImg_Click"/>
                            <div class="card-body">
                                <h5 class="card-title" runat="server"><%# Eval("ArtworkName") %></h5>
                                <p class="card-text" runat="server"><%# Eval("Username") %></p>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

            </div>
        </div>

        <div class="container mt-3 mb-3">
            <hr />
            <div class="w-100">
                <h1>Trending</h1>
                <img src="https://via.placeholder.com/300x150" />
                <p>Lorem Ipsum</p>
            </div>
        </div>
        <div class="container mt-3 mb-3">
            <hr />
            <div class="w-100">
                <h1>New From Loke7Yao</h1>
                <img src="https://via.placeholder.com/300x150" />
                <p>Lorem Ipsum</p>
            </div>
        </div>
    </form>


</asp:Content>
