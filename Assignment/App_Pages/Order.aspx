<%@ Page Title="" Language="C#" MasterPageFile="~/Mizuki.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="Assignment.App_Pages.Order" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">

        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w==" crossorigin="anonymous" />

        <style>
            .navbar-collapse{flex-basis:100%;flex-grow:1;align-items:center}.navbar-toggler{padding:.25rem .75rem;font-size:1.25rem;line-height:1;background-color:transparent;border:1px solid transparent;border-radius:.25rem;transition:box-shadow .15s ease-in-out}@media (prefers-reduced-motion:reduce){.navbar-toggler{transition:none}}.navbar-toggler:hover{text-decoration:none}.navbar-toggler:focus{text-decoration:none;outline:0;box-shadow:0 0 0 .25rem}.navbar-toggler-icon{display:inline-block;width:1.5em;height:1.5em;vertical-align:middle;background-repeat:no-repeat;background-position:center;background-size:100%}.navbar-nav-scroll{max-height:var(--bs-scroll-height,75vh);overflow-y:auto}@media (min-width:576px){.navbar-expand-sm{flex-wrap:nowrap;justify-content:flex-start}.navbar-expand-sm .navbar-nav{flex-direction:row}.navbar-expand-sm .navbar-nav .dropdown-menu{position:absolute}.navbar-expand-sm .navbar-nav .nav-link{padding-right:.5rem;padding-left:.5rem}.navbar-expand-sm .navbar-nav-scroll{overflow:visible}.navbar-expand-sm .navbar-collapse{display:flex!important;flex-basis:auto}.navbar-expand-sm .navbar-toggler{display:none}}@media (min-width:768px){.navbar-expand-md{flex-wrap:nowrap;justify-content:flex-start}.navbar-expand-md .navbar-nav{flex-direction:row}.navbar-expand-md .navbar-nav .dropdown-menu{position:absolute}.navbar-expand-md .navbar-nav .nav-link{padding-right:.5rem;padding-left:.5rem}.navbar-expand-md .navbar-nav-scroll{overflow:visible}.navbar-expand-md .navbar-collapse{display:flex!important;flex-basis:auto}.navbar-expand-md .navbar-toggler{display:none}}@media (min-width:992px){.navbar-expand-lg{flex-wrap:nowrap;justify-content:flex-start}.navbar-expand-lg .navbar-nav{flex-direction:row}.navbar-expand-lg .navbar-nav .dropdown-menu{position:absolute}.navbar-expand-lg .navbar-nav .nav-link{padding-right:.5rem;padding-left:.5rem}.navbar-expand-lg .navbar-nav-scroll{overflow:visible}.navbar-expand-lg .navbar-collapse{display:flex!important;flex-basis:auto}.navbar-expand-lg .navbar-toggler{display:none}}@media (min-width:1200px){.navbar-expand-xl{flex-wrap:nowrap;justify-content:flex-start}.navbar-expand-xl .navbar-nav{flex-direction:row}.navbar-expand-xl .navbar-nav .dropdown-menu{position:absolute}.navbar-expand-xl .navbar-nav .nav-link{padding-right:.5rem;padding-left:.5rem}.navbar-expand-xl .navbar-nav-scroll{overflow:visible}.navbar-expand-xl .navbar-collapse{display:flex!important;flex-basis:auto}.navbar-expand-xl .navbar-toggler{display:none}}@media (min-width:1400px){.navbar-expand-xxl{flex-wrap:nowrap;justify-content:flex-start}.navbar-expand-xxl .navbar-nav{flex-direction:row}.navbar-expand-xxl .navbar-nav .dropdown-menu{position:absolute}.navbar-expand-xxl .navbar-nav .nav-link{padding-right:.5rem;padding-left:.5rem}.navbar-expand-xxl .navbar-nav-scroll{overflow:visible}.navbar-expand-xxl .navbar-collapse{display:flex!important;flex-basis:auto}.navbar-expand-xxl .navbar-toggler{display:none}}.navbar-expand{flex-wrap:nowrap;justify-content:flex-start}.navbar-expand .navbar-nav{flex-direction:row}.navbar-expand .navbar-nav .dropdown-menu{position:absolute}.navbar-expand .navbar-nav .nav-link{padding-right:.5rem;padding-left:.5rem}.navbar-expand .navbar-nav-scroll{overflow:visible}.navbar-expand .navbar-collapse{display:flex!important;flex-basis:auto}
        </style>


        <div class="container" id="product-section">
            <div class="row">
                <!-- Product picture -->
                <div class="col-md-6">
                    <div class="thumbnail">
                        <asp:Repeater ID="imageRepeater" runat="server">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <div class="gallery-item">
                                            <asp:ImageButton Width="100%" height="100%" CssClass="gallery-image" ID="Image1" runat="server" ImageUrl='<%# Eval("URL") %>' Enabled="False" />
                                        </div>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:Repeater>
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
                            <asp:DetailsView ID="artworkName" runat="server" Height="50px" Width="388px" AutoGenerateRows="False" Font-Size="X-Large" GridLines="None">
                                <Fields>
                                    <asp:BoundField DataField="ArtworkName" SortExpression="ArtworkName" />
                                </Fields>
                            </asp:DetailsView>
                        </div>
                    </div>
                    <div class="row" style="padding-left: 20px">
                        <div class="col-md-12">
                            <asp:DetailsView ID="artworkDescription" runat="server" Height="50px" Width="220px" AutoGenerateRows="False" Font-Size="Medium" GridLines="None">
                                <Fields>
                                    <asp:BoundField DataField="Name" HeaderText="Artist Name :" SortExpression="Name" />
                                    <asp:BoundField DataField="StockQuantity" HeaderText="Quantity :" SortExpression="StockQuantity" />
                                    <asp:BoundField DataField="Price" DataFormatString="{0:C2}" HeaderText="Price :" SortExpression="Price" />
                                </Fields>
                            </asp:DetailsView>
                        </div>
                    </div>

                    <div class="row add-to-cart" style="padding-left: 20px">
                        <div class="col-md-12 product-qty">
                            <br />
                            <br />
                            <br />
                            <asp:Button class="btn btn-default btn-lg btn-qty" Text="-" runat="server" ID="btnMinus" OnClick="btnMinus_Click" Style="width: 52px; height: 46px; border-radius: 0" PostBackUrl="~/App_Pages/Order.aspx" />
                            <asp:TextBox class="btn btn-default btn-lg btn-qty" ID="txtQuantity" runat="server" Style="width: 80px; height: 46px; border-radius: 0" Text="1" AutoPostBack="True"></asp:TextBox>
                            <asp:Button class="btn btn-default btn-lg btn-qty" Text="+" runat="server" ID="btnAdd" OnClick="btnAdd_Click" Style="width: 52px; height: 46px; border-radius: 0" PostBackUrl="~/App_Pages/Order.aspx" />
                            <br />
                            <br />
                            <asp:HiddenField ID="HiddenField1" runat="server" Visible="False" />
                            <br />
                            <br />
                            <br />
                        </div>
                    </div>
                    <!-- end row -->
                    <div class="row buttons" style="margin: 5px">
                        <div class="col-md-8">
                            <asp:Button class="btn btn-warning btn-lg btn-brand btn-full-width" ID="btnAddToCart" Style="height: 70px; width: 100%" runat="server" Text="ADD TO CART" OnClick="btnAddToCart_Click" PostBackUrl="~/App_Pages/Order.aspx" Font-Size="Large" />
                        </div>
                    </div>
                    <div class="row buttons" style="margin: 5px">
                        <div class="col-md-8">
                            <asp:Button class="btn btn-success btn-lg btn-brand btn-full-width" ID="btnAddToWishlist" Style="height: 70px; width: 100%" runat="server" Text="ADD TO WISHLIST" PostBackUrl="~/App_Pages/Order.aspx" OnClick="btnAddToWishlist_Click" Visible="False" Font-Size="Large"/>
                            <asp:Button class="btn btn-danger btn-lg btn-brand btn-full-width" ID="btnRemoveWishlist" Style="height: 70px; width: 100%" runat="server" Text="REMOVE FROM WISHLIST" PostBackUrl="~/App_Pages/Order.aspx" OnClick="btnRemoveWishlist_Click" Visible="False" Font-Size="Large"/>
                        </div>
                    </div>
                    <div class="row buttons" style="margin: 5px">
                        <div class="col-md-8">
                            <asp:Button class="btn btn-primary btn-lg btn-brand btn-full-width" ID="btnBuyNow" Style="height: 70px; width: 100%" runat="server" Text="BUY NOW" PostBackUrl="~/App_Pages/BuyNow.aspx" OnClick="btnBuyNow_Click" Font-Size="Large" />
                        </div>
                    </div>


                    <br />
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


