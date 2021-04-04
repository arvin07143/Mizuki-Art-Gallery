<%@ Page Title="" Language="C#" MasterPageFile="~/Mizuki.Master" AutoEventWireup="true" CodeBehind="Art.aspx.cs" Inherits="Assignment.App_Pages.Art" %>

<asp:Content ID="artHead" runat="server" ContentPlaceHolderID="head">
    <style>
        
        *,
        *::before,
        *::after {
            box-sizing: border-box;
        }

        #form1 {
            min-height: 600px;
        }

        .container {
            max-width: 1250px;
            margin: 0 auto;
            padding: 0 80px 80px;
        }

        .heading {
            font-family: "Montserrat", Arial, sans-serif;
            font-size: 2rem;
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
            margin: 0 10 0 10;
        }

        .gallery-item {
            /* Minimum width of 24rem and grow to fit available space */
            flex: 1 0 10rem;
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

        .card-img-top {
            height: 280px;
            width: 100%;
            display: block;
            object-fit: contain;
            object-position: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="contentplaceholder1" runat="server">
    <form id="form1" runat="server">


        <h1 class="heading" style="color: black"><b><span>Mizuki Gallery</span></b></h1>
        <%--card decks--%>
        <div class="container">
            <div class="card text-center">
                <div class="card-header">
                    <ul class="nav nav-tabs card-header-tabs">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="true" href="#watercolorPaintingContent" data-toggle="tab">Watercolor Painting</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#oilPaintingContent" data-toggle="tab">Oil Painting</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="#sketchesContent"  data-toggle="tab">Sketches</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="#acrylicPaintingContent" data-toggle="tab">Acrylic Painting</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="#otherContent" data-toggle="tab">Other</a>
                        </li>
                    </ul>
                </div>
                <div class="card-body">
                    <div class="tab-content">
                        <div class="tab-pane fade show active" role="tabpanel" id="watercolorPaintingContent">
                            <div class="gallery">
                                <asp:SqlDataSource ID="SqlDataSourceDigitalArt" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Artwork] WHERE [CategoryID] = '2' AND StockQuantity > 0"></asp:SqlDataSource>
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSourceDigitalArt">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <div class="gallery-item">
                                                    <asp:ImageButton CssClass="gallery-image" ID="Image1" runat="server" ImageUrl='<%# Eval("URL") %>' CommandArgument='<%# Eval("ArtworkID") %>' OnClick="Image_Click" />
                                                </div>
                                            </tr>
                                            <asp:HiddenField ID="ArtworkID" runat="server" Value='<%# Eval("ArtworkID") %>' />
                                        </table>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                        <div class="tab-pane fade" role="tabpanel" id="oilPaintingContent">
                            <div class="gallery">
                                <asp:SqlDataSource ID="SqlDataSource_oil" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Artwork] WHERE [CategoryID] = '4' AND StockQuantity > 0"></asp:SqlDataSource>
                                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource_oil">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <div class="gallery-item">
                                                    <asp:ImageButton CssClass="gallery-image" ID="Image1" runat="server" ImageUrl='<%# Eval("URL") %>' CommandArgument='<%# Eval("ArtworkID") %>' OnClick="Image_Click" />
                                                </div>
                                            </tr>
                                            <asp:HiddenField ID="ArtworkID" runat="server" Value='<%# Eval("ArtworkID") %>' />
                                        </table>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                        <div class="tab-pane fade" role="tabpanel" id="sketchesContent">
                            <div class="gallery">
                                <asp:SqlDataSource ID="SqlDataSource_sketches" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Artwork] WHERE [CategoryID] = '5' AND StockQuantity > 0"></asp:SqlDataSource>
                                <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource_sketches">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <div class="gallery-item">
                                                    <asp:ImageButton CssClass="gallery-image" ID="Image1" runat="server" ImageUrl='<%# Eval("URL") %>' CommandArgument='<%# Eval("ArtworkID") %>' OnClick="Image_Click" />
                                                </div>
                                            </tr>
                                            <asp:HiddenField ID="ArtworkID" runat="server" Value='<%# Eval("ArtworkID") %>' />
                                        </table>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                        <div class="tab-pane fade" role="tabpanel" id="acrylicPaintingContent">
                            <div class="gallery">
                                <asp:SqlDataSource ID="SqlDataSource_acrylic" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Artwork] WHERE [CategoryID] = '3' AND StockQuantity > 0"></asp:SqlDataSource>
                                <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource_acrylic">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <div class="gallery-item">
                                                    <asp:ImageButton CssClass="gallery-image" ID="Image1" runat="server" ImageUrl='<%# Eval("URL") %>' CommandArgument='<%# Eval("ArtworkID") %>' OnClick="Image_Click" />
                                                </div>
                                            </tr>
                                            <asp:HiddenField ID="ArtworkID" runat="server" Value='<%# Eval("ArtworkID") %>' />
                                        </table>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                        <div class="tab-pane fade" role="tabpanel" id="otherContent">
                            <div class="gallery">
                                <asp:SqlDataSource ID="SqlDataSource_other" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Artwork] WHERE [CategoryID] = '1' AND StockQuantity > 0"></asp:SqlDataSource>
                                <asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlDataSource_other">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <div class="gallery-item">
                                                    <asp:ImageButton CssClass="gallery-image" ID="Image1" runat="server" ImageUrl='<%# Eval("URL") %>' CommandArgument='<%# Eval("ArtworkID") %>' OnClick="Image_Click" />
                                                </div>
                                            </tr>
                                            <asp:HiddenField ID="ArtworkID" runat="server" Value='<%# Eval("ArtworkID") %>' />
                                        </table>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--end of card decks--%>
        <%-- <div class="container">
            <div class="gallery">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Artwork]"></asp:SqlDataSource>
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <div class="gallery-item">
                                    <asp:ImageButton CssClass="gallery-image" ID="Image1" runat="server" ImageUrl='<%# Eval("URL") %>' CommandArgument='<%# Eval("ArtworkID") %>' OnClick="Image_Click" />
                                </div>
                            </tr>
                            <asp:HiddenField ID="ArtworkID" runat="server" Value='<%# Eval("ArtworkID") %>' />
                        </table>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>--%>
        
    </form>
</asp:Content>

