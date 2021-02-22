<%@ Page Title="" Language="C#" MasterPageFile="~/Mizuki.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="Assignment.App_Pages.Order" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">

        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w==" crossorigin="anonymous" />

        <div class="container" id="product-section">
            <div class="row">
                <!-- Product picture -->
                <div class="col-md-6">
                    <div class="thumbnail">
                        <img class="gallery-image" src="https://i.pinimg.com/564x/78/56/1e/78561ebe81f88c3d193cb5eb6c3a68e9.jpg" alt="girl-in-dress-field">
                    </div>
                </div>


                <div class="col-md-6">
                    <!--         <div class="row">
                        <div class="col-md-12">
                            <h4>Add to Wishlist <i class="far fa-star" style="size" id="btnWishlist"></i></h4>
                        </div>
                    </div>   -->

                    <div class="row">
                        <div class="col-md-12">
                            <asp:DetailsView ID="DetailsView1" runat="server" DataSourceID="SqlDataSource1" Height="50px" Width="388px" AutoGenerateRows="False" Font-Size="X-Large" GridLines="None" OnPageIndexChanging="DetailsView1_PageIndexChanging">
                                <Fields>
                                    <asp:BoundField DataField="ArtworkName" SortExpression="ArtworkName" />
                                </Fields>
                            </asp:DetailsView>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <asp:DetailsView ID="DetailsView4" runat="server" Height="50px" Width="220px" AutoGenerateRows="False" DataSourceID="SqlDataSource1" Font-Size="Medium" GridLines="None">
                                <Fields>
                                    <asp:BoundField DataField="Name" HeaderText="Artist Name :" SortExpression="Name" />
                                    <asp:BoundField DataField="StockQuantity" HeaderText="Quantity :" SortExpression="StockQuantity" />
                                    <asp:BoundField DataField="Price" DataFormatString="{0:C2}" HeaderText="Price :" SortExpression="Price" />
                                </Fields>
                            </asp:DetailsView>
                        </div>
                    </div>

                    <div class="row add-to-cart">
                        <div class="col-md-5 product-qty">
                            <br />
                            <br />
                            <br />
                            <span id="btnMinus" class="btn btn-default btn-lg btn-qty" style="width: 52px; height: 46px; border-radius: 0">
                                <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
                            </span>
                            <asp:TextBox class="btn btn-default btn-lg btn-qty" ID="txtQuantity" runat="server" style="width: 100px; height: 46px; border-radius: 0"></asp:TextBox> 
                            <span id="btnAdd" class="btn btn-default btn-lg btn-qty" style="width: 52px; height: 46px; border-radius: 0">
                                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                            </span>
                            <br />
                            <br />
                            <br />
                            <asp:Button ID="testButton" runat="server" Text="Button" />
                            <br />
                            <br />
                            
                        </div>
                    </div>
                    <!-- end row -->
                    <div class="row buttons">
                        <div class="col-md-6">
                            <asp:Button class="btn btn-warning btn-lg btn-brand btn-full-width" id="btnAddToCart" style="height: 50px" runat="server" Text="ADD TO CART" />
                        </div>
                        <div class="col-md-6">
                            <asp:Button class="btn btn-primary btn-lg btn-brand btn-full-width" id="btnBuyNow" style="height: 50px" runat="server" Text="BUY NOW" PostBackUrl="~/App_Pages/BuyNow.aspx" />
                        </div>
                    </div>


                    <br />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Artwork.ArtworkName, [User].Name, Artwork.Price, Artwork.StockQuantity FROM Artwork INNER JOIN [User] ON Artwork.Username = [User].Username WHERE (Artwork.ArtworkID = 1)"></asp:SqlDataSource>
                    <br />
                    <br />
                    <br />
                </div>
            </div>
        </div>


         <script
             src="https://code.jquery.com/jquery-2.2.2.min.js"
             integrity="sha256-36cp2Co+/62rEAAYHLmRCPIych47CvdM+uTBJwSzWjI="
             crossorigin="anonymous"></script>
        <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
            integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
            crossorigin="anonymous">
        </script>

    </form>
</asp:Content>


