<%@ Page Title="" Language="C#" MasterPageFile="~/Mizuki.Master" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="Assignment.App_Pages.MainPage" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="~/App_Pages/MainPageRepeater.ascx" %>

<asp:Content ID="mainPageHeader" ContentPlaceHolderID="head" runat="server">
    <title>Home</title>
    <style>
        .img-slide {
            height: 300px;
            width: 400px;
            object-fit: contain;
            object-position: center;
            margin: auto;
        }

        .overlay {
            position: relative;
            top: -140px;
            z-index: 2;
        }

        .card {
            min-width: 180px !important;
        }

        .card-img-top {
            height: 280px;
            object-fit: cover;
            object-position: center;
        }

        #content hr {
            margin: 50px 0 30px 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <%--carousel--%>
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
        <%--end of carousel--%>

        <div id="content" class="overlay">
            <div class="container">
                    <uc1:Header ID="Header1" Name="CodeDigest" runat="server" displayType ="Trending"/>
                <hr />
            </div>

            <div class="container">

                    <uc1:Header ID="Header2" Name="CodeDigest" runat="server" displayType ="Hot Selling"/>
 
                <hr />
            </div>

            <div class="container">

                    <uc1:Header ID="Header3" Name="CodeDigest" runat="server" displayType ="New Artwork"/>

                <hr />
            </div>
        </div>

    </form>


</asp:Content>
