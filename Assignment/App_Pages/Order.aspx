<%@ Page Title="" Language="C#" MasterPageFile="~/Mizuki.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="Assignment.App_Pages.Order" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w==" crossorigin="anonymous" />
        
        <div class="row">
            <!-- Product picture -->
            <div class="col-sm-5">
                <div class="thumbnail">
                    <img class="gallery-image" style="margin-left: 30px" src="https://i.pinimg.com/564x/78/56/1e/78561ebe81f88c3d193cb5eb6c3a68e9.jpg" alt="girl-in-dress-field">
                </div>
            </div>

            <div class="col-sm-7 desc">
                <div>
                    <h5>Add to Wishlist <i class="far fa-star" style="size" id="btnWishlist"></i></h5>
                    <asp:DetailsView ID="DetailsView1" runat="server" DataSourceID="SqlDataSource1" Height="50px" Width="388px" AutoGenerateRows="False" Font-Size="X-Large" GridLines="None" OnPageIndexChanging="DetailsView1_PageIndexChanging">
                        <Fields>
                            <asp:BoundField DataField="ArtworkName" HeaderText="Artwork Name : " SortExpression="ArtworkName" />
                            <asp:BoundField DataField="Name" HeaderText="Artist Name : " SortExpression="Name" />
                            <asp:BoundField DataField="StockQuantity" HeaderText="Stock Quantity : " SortExpression="StockQuantity" />
                            <asp:BoundField DataField="Price" HeaderText="Price :" SortExpression="Price" DataFormatString="{0:C2}" />
                        </Fields>
                    </asp:DetailsView>


                    <br />

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Artwork.ArtworkName, [User].Name, Artwork.Price, Artwork.StockQuantity FROM Artwork INNER JOIN [User] ON Artwork.Username = [User].Username WHERE (Artwork.ArtworkID = 1)"></asp:SqlDataSource>

                    <br />

                    Quantity :
                    <asp:TextBox ID="textQuantity" runat="server"></asp:TextBox>
                    <br />

                    <br />




                </div>
                <div class="row buttons">
                    <button class="btn btn-warning" id="btnAddToCart" style="height: 50px">ADD TO CART</button>
                    <button class="btn btn-primary" id="btnBuyNow" style="height: 50px">BUY NOW</button>
                </div>
            </div>

        </div>
    </form>
</asp:Content>


