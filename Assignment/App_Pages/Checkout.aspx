<%@ Page Title="" Language="C#" MasterPageFile="~/Mizuki.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Assignment.App_Pages.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
   
        <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w==" crossorigin="anonymous" />
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        
        <style>
            .navbar-collapse{flex-basis:100%;flex-grow:1;align-items:center}.navbar-toggler{padding:.25rem .75rem;font-size:1.25rem;line-height:1;background-color:transparent;border:1px solid transparent;border-radius:.25rem;transition:box-shadow .15s ease-in-out}@media (prefers-reduced-motion:reduce){.navbar-toggler{transition:none}}.navbar-toggler:hover{text-decoration:none}.navbar-toggler:focus{text-decoration:none;outline:0;box-shadow:0 0 0 .25rem}.navbar-toggler-icon{display:inline-block;width:1.5em;height:1.5em;vertical-align:middle;background-repeat:no-repeat;background-position:center;background-size:100%}.navbar-nav-scroll{max-height:var(--bs-scroll-height,75vh);overflow-y:auto}@media (min-width:576px){.navbar-expand-sm{flex-wrap:nowrap;justify-content:flex-start}.navbar-expand-sm .navbar-nav{flex-direction:row}.navbar-expand-sm .navbar-nav .dropdown-menu{position:absolute}.navbar-expand-sm .navbar-nav .nav-link{padding-right:.5rem;padding-left:.5rem}.navbar-expand-sm .navbar-nav-scroll{overflow:visible}.navbar-expand-sm .navbar-collapse{display:flex!important;flex-basis:auto}.navbar-expand-sm .navbar-toggler{display:none}}@media (min-width:768px){.navbar-expand-md{flex-wrap:nowrap;justify-content:flex-start}.navbar-expand-md .navbar-nav{flex-direction:row}.navbar-expand-md .navbar-nav .dropdown-menu{position:absolute}.navbar-expand-md .navbar-nav .nav-link{padding-right:.5rem;padding-left:.5rem}.navbar-expand-md .navbar-nav-scroll{overflow:visible}.navbar-expand-md .navbar-collapse{display:flex!important;flex-basis:auto}.navbar-expand-md .navbar-toggler{display:none}}@media (min-width:992px){.navbar-expand-lg{flex-wrap:nowrap;justify-content:flex-start}.navbar-expand-lg .navbar-nav{flex-direction:row}.navbar-expand-lg .navbar-nav .dropdown-menu{position:absolute}.navbar-expand-lg .navbar-nav .nav-link{padding-right:.5rem;padding-left:.5rem}.navbar-expand-lg .navbar-nav-scroll{overflow:visible}.navbar-expand-lg .navbar-collapse{display:flex!important;flex-basis:auto}.navbar-expand-lg .navbar-toggler{display:none}}@media (min-width:1200px){.navbar-expand-xl{flex-wrap:nowrap;justify-content:flex-start}.navbar-expand-xl .navbar-nav{flex-direction:row}.navbar-expand-xl .navbar-nav .dropdown-menu{position:absolute}.navbar-expand-xl .navbar-nav .nav-link{padding-right:.5rem;padding-left:.5rem}.navbar-expand-xl .navbar-nav-scroll{overflow:visible}.navbar-expand-xl .navbar-collapse{display:flex!important;flex-basis:auto}.navbar-expand-xl .navbar-toggler{display:none}}@media (min-width:1400px){.navbar-expand-xxl{flex-wrap:nowrap;justify-content:flex-start}.navbar-expand-xxl .navbar-nav{flex-direction:row}.navbar-expand-xxl .navbar-nav .dropdown-menu{position:absolute}.navbar-expand-xxl .navbar-nav .nav-link{padding-right:.5rem;padding-left:.5rem}.navbar-expand-xxl .navbar-nav-scroll{overflow:visible}.navbar-expand-xxl .navbar-collapse{display:flex!important;flex-basis:auto}.navbar-expand-xxl .navbar-toggler{display:none}}.navbar-expand{flex-wrap:nowrap;justify-content:flex-start}.navbar-expand .navbar-nav{flex-direction:row}.navbar-expand .navbar-nav .dropdown-menu{position:absolute}.navbar-expand .navbar-nav .nav-link{padding-right:.5rem;padding-left:.5rem}.navbar-expand .navbar-nav-scroll{overflow:visible}.navbar-expand .navbar-collapse{display:flex!important;flex-basis:auto}
        </style>

        <div style="width:1250px" id="product-section">
         <div class="row">
             <div class="col-md-9 ms-auto me-auto ">
                 <h1 style="margin-left:60px"><b>Check Out</b></h1>
                <div style="margin-left:-20px" class="tab-pane" id="checkout">
                <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                    <HeaderTemplate>
                        <table class="table w-75 p3 ms-auto me-auto">
                            <thead>
                                <tr>
                                    <th style="width:15%" scope="col">No.</th>
                                    <th style="width:15%" scope="col">Art ID</th>
                                    <th scope="col">Product</th>
                                    <th style="width:15%" scope="col">Unit Price</th>
                                    <th style="width:15%" scope="col">Quantity</th>
                                    <th style="width:15%" scope="col">Total Price</th>
                                </tr>
                            </thead>
                        </table>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <table class="table w-75 p3 ms-auto me-auto">
                            <tr>
                                <td style="width:15%" class="align-middle"><%# Container.ItemIndex + 1 %></td>
                                <td style="width:15%" class="align-middle"><%# Eval("ArtworkID") %></td>
                                <td>
                                    <img style="width:80px;height:80px" class="img-thumbnail img-fluid" src='<%#Eval("URL") %>'>
                                </td>
                                <td class="align-middle"><%# Eval("ArtworkName")%></td>
                                <td style="width:15%" class="align-middle"><%# Eval("Price") %></td>
                                <td style="width:15%"class="align-middle"><%# Eval("Quantity")%></td>
                                <td style="width:15%"class="align-middle"><%# Eval("TotalPrice")%></td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:Repeater>
                    <br />

                        <table style="border:0px solid transparent;" class="table w-75 p3 ms-auto me-auto">
                            <tr>
                                <td style="width:15%" class="align-middle"></td>
                                <td style="width:15%" class="align-middle"></td>
                                <td style="width:30%"></td>
                                <td></td>
                                <td style="width:15%" class="align-middle"><asp:Label ID="Label2" runat="server" Text="Subtotal"></asp:Label></td>
                                <td style="width:15%" class="align-middle"><asp:Label ID="lblSubtotal" runat="server" Text="RM???"></asp:Label></td>
                            </tr>

                            <tr>
                                <td style="width:15%" class="align-middle"></td>
                                <td style="width:15%" class="align-middle"></td>
                                <td style="width:30%"></td>
                                <td></td>
                                <td style="width:15%" class="align-middle"><asp:Label ID="lblTaxDis" runat="server" Text="Tax"></asp:Label>&nbsp;(6%)</td>
                                <td style="width:15%" class="align-middle"><asp:Label ID="lblTax" runat="server" Text="RM???"></asp:Label></td>
                            </tr>

                            <tr>
                                <td class="align-middle" colspan="2">
                                    <asp:Button style="border:none; text-align:left; background-color:transparent" ID="btnContinue" runat="server" Text="&lt; Continue Shopping" OnClick="btnContinue_Click" />
                                </td>
                                <td style="width:30%"></td>
                                <td></td>
                                <td style="width:15%" class="align-middle"><asp:Label ID="lblTotalDis" runat="server" Text="Total"></asp:Label></td>
                                <td style="width:15%" class="align-middle"><asp:Label ID="lblTotal" runat="server" Text="RM???"></asp:Label></td>
                            </tr>

                        </table>

                </div>
                </div>
                
             <div class="col-md-3 ">
                    <h1><b>Payment Info.</b></h1>
                    <br />
                    <br />
                    <p>
                        <asp:Label ID="lblPaymentMethod" runat="server" Text="Payment Method"></asp:Label>
                    </p>
                    <p>
                        <asp:RadioButtonList style="" CssClass="radio-inline" ID="RadioButtonList1" runat="server">
                            <asp:ListItem Selected="true">Credit Card <img style="width:50px; height:25px" src="https://w7.pngwing.com/pngs/117/675/png-transparent-visa-and-mastercard-ads-mastercard-credit-card-american-express-visa-debit-card-mastercard-text-payment-logo.png"/></asp:ListItem>
                            <asp:ListItem>FPX Transfer <img style="width:50px; height:30px" src="https://vectorise.net/logo/wp-content/uploads/2019/09/Logo-FPX.png"/></asp:ListItem>
                        </asp:RadioButtonList>
                    </p>
                    <p>&nbsp;</p>
                    <p>
                        <asp:Label ID="lblNameOnCard" runat="server" Text="Name On Card"></asp:Label>
                    </p>
                    <p>
                        <asp:TextBox ID="txtNameOnCard" CssClass="form-control" runat="server"></asp:TextBox>
                    </p>
                    <p>&nbsp;</p>
                    <p>
                        <asp:Label ID="lblCarNum" runat="server" Text="Car Number"></asp:Label>
                    </p>
                    <p>
                        <asp:TextBox ID="txtCarNumber" runat="server" CssClass="form-control" OnTextChanged="TextBox1_TextChanged1"></asp:TextBox>
                    </p>
                    <p>&nbsp;</p>
                    <p>
                        <asp:Label ID="lblExpirationDate" runat="server" Text="Expiration Date"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label1" runat="server" Text="CVV"></asp:Label>
                    </p>
                    <p>
                        <asp:DropDownList CssClass="dropdown" ID="DropDownList1" runat="server" Height="30px" Width="40px">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;
                        <asp:DropDownList CssClass="auto-style2" ID="DropDownList2" runat="server" Height="30px" Width="58px">
                            <asp:ListItem>2020</asp:ListItem>
                            <asp:ListItem>2021</asp:ListItem>
                            <asp:ListItem>2022</asp:ListItem>
                            <asp:ListItem>2023</asp:ListItem>
                            <asp:ListItem>2024</asp:ListItem>
                            <asp:ListItem>2025</asp:ListItem>
                            <asp:ListItem>2026</asp:ListItem>
                        </asp:DropDownList>

                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtCVV" runat="server" style="display:inline" CssClass="form-control" Height="30px" Width="51px"></asp:TextBox>
                    </p>
                    <p>
                        &nbsp;</p>
                    <p>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button  Style="height: 50px; display:inline; right:50%; width:100%"  class="btn btn-primary btn-lg btn-brand btn-full-width" ID="btnCheckout" runat="server" Text="Check Out" OnClick="btnCheckout_Click" />
                    &nbsp;</p>
             </div>


                 
             </div><!-- end row -->
       
        </div><!-- end container -->





    </form>

     <script 
     src="https://code.jquery.com/jquery-2.2.2.min.js" integrity="sha256-36cp2Co+/62rEAAYHLmRCPIych47CvdM+uTBJwSzWjI=" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"  crossorigin="anonymous"></script>
 
    <br />
 
</asp:Content>
