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

        .img-row {
            height: 240px;
            width: 135px;
            object-fit: cover;
            object-position: center;
        }

        .overlay {
            position: relative;
            top: -140px;
            z-index: 2;
        }

        .card{
            min-width: 180px !important;
        }
        .card-img-top {
            height: 260px;
        }
        #content hr{
            margin: 50px 0 30px 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">

        <div class="bg-dark" style="height: 500px">
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
        <div id="content" class="overlay">
            <div class="container">
                <h1 class="text-light mb-4">Trending</h1>
                <div class="card-group">
                    <asp:Repeater ID="rptTrending" runat="server">
                        <ItemTemplate>
                            <div class="card">
                                <asp:ImageButton ID="ibtnTrending" runat="server" class="card-img-top img-row" src='<%# Eval("URL") %>' CommandArgument='<%# Eval("ArtworkID") %>' OnClick="SlideImg_Click" />
                                <div class="card-body">
                                    <h5 class="card-title" runat="server"><%# Eval("ArtworkName") %></h5>
                                    <p class="card-text" runat="server"><%# Eval("Username") %></p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                </div>
                <hr />
            </div>

            <div class="container">
                <h1 class="mb-4">Hot Selling</h1>
                <div class="card-group">
                    <asp:Repeater ID="rptHotSelling" runat="server">
                        <ItemTemplate>
                            <div class="card">
                                <asp:ImageButton ID="ibtnHotSelling" runat="server" class="card-img-top img-row" src='<%# Eval("URL") %>' CommandArgument='<%# Eval("ArtworkID") %>' OnClick="SlideImg_Click" />
                                <div class="card-body">
                                    <h5 class="card-title" runat="server"><%# Eval("ArtworkName") %></h5>
                                    <p class="card-text" runat="server"><%# Eval("Username") %></p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                </div>
                <hr />
            </div>

            <div class="container">
                <h1 class="mb-4">New Artwork</h1>
                <div class="card-group">
                    <asp:Repeater ID="rptNewArt" runat="server">
                        <ItemTemplate>
                            <div class="card">
                                <asp:ImageButton ID="ibtnNewArt" runat="server" class="card-img-top img-row" src='<%# Eval("URL") %>' CommandArgument='<%# Eval("ArtworkID") %>' OnClick="SlideImg_Click" />
                                <div class="card-body">
                                    <h5 class="card-title" runat="server"><%# Eval("ArtworkName") %></h5>
                                    <p class="card-text" runat="server"><%# Eval("Username") %></p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                </div>
                <hr />
            </div>
        </div>

    </form>


</asp:Content>
