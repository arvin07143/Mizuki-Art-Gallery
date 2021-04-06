<%@ Page Title="" Language="C#" MasterPageFile="~/Mizuki.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Assignment.App_Pages.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Checkout</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <link rel="stylesheet" href="../css/checkout.css" type="text/css" class="css"/>
        <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w==" crossorigin="anonymous" />

        <style>
            .navbar-collapse {
                flex-basis: 100%;
                flex-grow: 1;
                align-items: center
            }

            .navbar-toggler {
                padding: .25rem .75rem;
                font-size: 1.25rem;
                line-height: 1;
                background-color: transparent;
                border: 1px solid transparent;
                border-radius: .25rem;
                transition: box-shadow .15s ease-in-out
            }

            @media (prefers-reduced-motion:reduce) {
                .navbar-toggler {
                    transition: none
                }
            }

            .navbar-toggler:hover {
                text-decoration: none
            }

            .navbar-toggler:focus {
                text-decoration: none;
                outline: 0;
                box-shadow: 0 0 0 .25rem
            }

            .navbar-toggler-icon {
                display: inline-block;
                width: 1.5em;
                height: 1.5em;
                vertical-align: middle;
                background-repeat: no-repeat;
                background-position: center;
                background-size: 100%
            }

            .navbar-nav-scroll {
                max-height: var(--bs-scroll-height,75vh);
                overflow-y: auto
            }

            @media (min-width:576px) {
                .navbar-expand-sm {
                    flex-wrap: nowrap;
                    justify-content: flex-start
                }

                    .navbar-expand-sm .navbar-nav {
                        flex-direction: row
                    }

                        .navbar-expand-sm .navbar-nav .dropdown-menu {
                            position: absolute
                        }

                        .navbar-expand-sm .navbar-nav .nav-link {
                            padding-right: .5rem;
                            padding-left: .5rem
                        }

                    .navbar-expand-sm .navbar-nav-scroll {
                        overflow: visible
                    }

                    .navbar-expand-sm .navbar-collapse {
                        display: flex !important;
                        flex-basis: auto
                    }

                    .navbar-expand-sm .navbar-toggler {
                        display: none
                    }
            }

            @media (min-width:768px) {
                .navbar-expand-md {
                    flex-wrap: nowrap;
                    justify-content: flex-start
                }

                    .navbar-expand-md .navbar-nav {
                        flex-direction: row
                    }

                        .navbar-expand-md .navbar-nav .dropdown-menu {
                            position: absolute
                        }

                        .navbar-expand-md .navbar-nav .nav-link {
                            padding-right: .5rem;
                            padding-left: .5rem
                        }

                    .navbar-expand-md .navbar-nav-scroll {
                        overflow: visible
                    }

                    .navbar-expand-md .navbar-collapse {
                        display: flex !important;
                        flex-basis: auto
                    }

                    .navbar-expand-md .navbar-toggler {
                        display: none
                    }
            }

            @media (min-width:992px) {
                .navbar-expand-lg {
                    flex-wrap: nowrap;
                    justify-content: flex-start
                }

                    .navbar-expand-lg .navbar-nav {
                        flex-direction: row
                    }

                        .navbar-expand-lg .navbar-nav .dropdown-menu {
                            position: absolute
                        }

                        .navbar-expand-lg .navbar-nav .nav-link {
                            padding-right: .5rem;
                            padding-left: .5rem
                        }

                    .navbar-expand-lg .navbar-nav-scroll {
                        overflow: visible
                    }

                    .navbar-expand-lg .navbar-collapse {
                        display: flex !important;
                        flex-basis: auto
                    }

                    .navbar-expand-lg .navbar-toggler {
                        display: none
                    }
            }

            @media (min-width:1200px) {
                .navbar-expand-xl {
                    flex-wrap: nowrap;
                    justify-content: flex-start
                }

                    .navbar-expand-xl .navbar-nav {
                        flex-direction: row
                    }

                        .navbar-expand-xl .navbar-nav .dropdown-menu {
                            position: absolute
                        }

                        .navbar-expand-xl .navbar-nav .nav-link {
                            padding-right: .5rem;
                            padding-left: .5rem
                        }

                    .navbar-expand-xl .navbar-nav-scroll {
                        overflow: visible
                    }

                    .navbar-expand-xl .navbar-collapse {
                        display: flex !important;
                        flex-basis: auto
                    }

                    .navbar-expand-xl .navbar-toggler {
                        display: none
                    }
            }

            @media (min-width:1400px) {
                .navbar-expand-xxl {
                    flex-wrap: nowrap;
                    justify-content: flex-start
                }

                    .navbar-expand-xxl .navbar-nav {
                        flex-direction: row
                    }

                        .navbar-expand-xxl .navbar-nav .dropdown-menu {
                            position: absolute
                        }

                        .navbar-expand-xxl .navbar-nav .nav-link {
                            padding-right: .5rem;
                            padding-left: .5rem
                        }

                    .navbar-expand-xxl .navbar-nav-scroll {
                        overflow: visible
                    }

                    .navbar-expand-xxl .navbar-collapse {
                        display: flex !important;
                        flex-basis: auto
                    }

                    .navbar-expand-xxl .navbar-toggler {
                        display: none
                    }
            }

            .navbar-expand {
                flex-wrap: nowrap;
                justify-content: flex-start
            }

                .navbar-expand .navbar-nav {
                    flex-direction: row
                }

                    .navbar-expand .navbar-nav .dropdown-menu {
                        position: absolute
                    }

                    .navbar-expand .navbar-nav .nav-link {
                        padding-right: .5rem;
                        padding-left: .5rem
                    }

                .navbar-expand .navbar-nav-scroll {
                    overflow: visible
                }

                .navbar-expand .navbar-collapse {
                    display: flex !important;
                    flex-basis: auto
                }
            
            .rbl input[type="radio"]
            {
               margin-left: 10px;
               margin-right: 1px;
            }
           
            </style>

        <div style="width: 100%" id="product-section">
            <div class="row">
                <div class="col-md-7 ms-auto me-auto ">
                    <h1 style="margin-left: 60px"><b>Check Out</b></h1>

                    <br />

         <p  style="margin-left: 60px">
           <table style="margin-left: 80px; width:100%">
            <thead>
                <tr>
                    <th class="auto-style8" style="width:50%" scope="col"><strong>Delivery Address</strong></th>
                    <th class="auto-style8" style="width:50%" scope="col"><strong>Payment Info&nbsp; <asp:Label ID="lblDatetime" runat="server"></asp:Label>
                    </strong></th>
                 </tr>
            </thead>
            <tr>
                <td>
                <div class="form-group row" style="width:350px">
                     <asp:Label ID="lblRecipientName" class="col-4 col-form-label" runat="server">Recipient Name</asp:Label> 
                     <div class="col-8">
                       <div class="input-group">
                         <asp:TextBox id="txtName" name="txtName" placeholder="Alice" type="text" class="form-control" runat="server"></asp:TextBox>
                         <div class="input-group-append">
                           <div class="input-group-text">
                             <i class="fa fa-address-book-o"></i>
                           </div>
                         </div>
                       </div>
                     </div>
                </div>
                    <p>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="Recipent Name is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtName" ErrorMessage="Must be in characters" ValidationExpression="^[a-zA-Z]{1,50}$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                    </p>
               
                </td>
                <td>
                    <div class="form-group row" >
                        <asp:Label ID="lblPaymentMethod" class="col-4 col-form-label" runat="server">Payment Method</asp:Label>                     
                        <div class="form-group row">
                          <div class="col-8">
                            <asp:RadioButtonList ValidateRequestMode="Enabled" class="rbl" ID="rblPayment" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" RepeatColumns="2">
                                <asp:ListItem Value="Visa"><img style="width:50px; height:40px;" src="https://blackbullmarkets.com/wp-content/uploads/2020/09/Visa-logo.png"/></asp:ListItem>
                                <asp:ListItem Value="Master"><img style="width:50px; height:45px; " src="https://brand.mastercard.com/content/dam/mccom/brandcenter/thumbnails/mastercard_vrt_pos_92px_2x.png"/></asp:ListItem>
                            </asp:RadioButtonList>
                        </div> 
                        </div>
                    </div>
                    <p>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="rblPayment" Display="Dynamic" ErrorMessage="Payment Mothod is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </p>
                    </td>
            </tr>
            <tr>
                <td>
                    <div class="form-group row" style="width:350px">
                      <asp:Label ID="lblEmail" class="col-4 col-form-label" runat="server">Email Address</asp:Label> 
                      <div class="col-8">
                        <div class="input-group">
                          <asp:TextBox  runat="server" id="txtEmail" name="text" placeholder="abc123@gmail.com" type="text" class="form-control" TextMode="Email" ></asp:TextBox>
                          <div class="input-group-append">
                            <div class="input-group-text">
                              <i class="fa fa-envelope-o"></i>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <p>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </p>
                </td>
                <td>
                    <div class="form-group row">
                      <asp:Label id="lblCardholderName" class="col-3 col-form-label" runat="server">Cardholder</asp:Label> 
                      <div class="col-8">
                        <div class="input-group">
                          <asp:TextBox id="txtCardholderName" name="Cardholder Name" type="text" class="form-control" runat="server"></asp:TextBox> 
                          <div class="input-group-append">
                            <div class="input-group-text">
                              <i class="fa fa-address-card-o"></i>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div> 
                    <p>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCardholderName" Display="Dynamic" ErrorMessage="Name On Card is required" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtCardholderName" ErrorMessage="Must be in characters" ValidationExpression="^[a-zA-Z]{1,50}$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                    </p>
                    </td>
            </tr>
            <tr>
                <td>
                    <div class="form-group row" style="width:350px">
                      <asp:Label runat="server" id="lblContactNumber" class="col-4 col-form-label">Contact Number</asp:Label> 
                      <div class="col-8">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <div class="input-group-text">+60</div>
                          </div> 
                          <asp:TextBox id="txtContactNumber" name="txtContactNumber" placeholder="123456789" type="text" class="form-control" runat="server"></asp:TextBox>
                          <div class="input-group-append">
                            <div class="input-group-text">
                              <i class="fa fa-mobile-phone"></i>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <p>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtContactNumber" Display="Dynamic" ErrorMessage="Contact Number is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </p>
                    <p>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtContactNumber" Display="Dynamic" ErrorMessage="Invalid Format (eg. +60 123456789)" ValidationExpression="^[0-9]{9,10}$" ForeColor="Red"></asp:RegularExpressionValidator>
                    </p>
                </td>
                <td>
                    <div class="form-group row">
                      <asp:Label id="lblCardNumber" class="col-3 col-form-label" runat="server">Card Number</asp:Label> 
                      <div class="col-8">
                        <div class="input-group">
                          <asp:TextBox id="txtCardNumber" name="txtCardNumber" type="text" class="form-control" runat="server"></asp:TextBox>
                          <div class="input-group-append">
                            <div class="input-group-text">
                              <i class="fa fa-credit-card-alt"></i>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div> 
                    <p>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCardNumber" Display="Dynamic" ErrorMessage="Card Number is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </p>
                    <p><asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="txtCardNumber" Display="Dynamic" OnServerValidate="CustomValidator1_ServerValidate" ForeColor="Red"></asp:CustomValidator>
                    </p>
                    </td>
            </tr>
            <tr>
                <td>
                    <div class="form-group row" style="width:350px">
                      <asp:Label for="lblDeliveryAddress" class="col-4 col-form-label" runat="server">Delivery Address</asp:Label> 
                      <div class="col-8">
                        <div class="input-group">
                          <asp:TextBox id="txtDeliveryAddress" name="txtDeliveryAddress" placeholder="88, Jalan Malinja 1, Setapak" type="text" class="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                          <div class="input-group-append">
                            <div class="input-group-text">
                              <i class="fa fa-home"></i>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <p>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtDeliveryAddress" Display="Dynamic" ErrorMessage="Deliver Address is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </p>
                    </td>
                <td>
                        <div class="form-group row">
                          <asp:Label id="lblExpirationDate" class="col-3 col-form-label" runat="server">Expiration Date</asp:Label> 
                          <div class="col-3">
                            <asp:DropDownList class="form-select" ID="ddlMonth" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                <asp:ListItem Text="" Selected="True"></asp:ListItem>
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
                          </div>
                            <div class="col-3">
                            <asp:DropDownList class="form-select" ID="ddlYear" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                <asp:ListItem Text="" Selected="True"></asp:ListItem>
                                <asp:ListItem>2020</asp:ListItem>
                                <asp:ListItem>2021</asp:ListItem>
                                <asp:ListItem>2022</asp:ListItem>
                                <asp:ListItem>2023</asp:ListItem>
                                <asp:ListItem>2024</asp:ListItem>
                                <asp:ListItem>2025</asp:ListItem>
                                <asp:ListItem>2026</asp:ListItem>
                            </asp:DropDownList>
                          </div>

                         </div> 
                    <p>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlMonth" Display="Dynamic" ErrorMessage="Expiration Date of Month is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlYear" Display="Dynamic" ErrorMessage="Expiration Date of Year is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </p>
                    
                    </td>
            </tr>
            <tr>
                <td>
                    <div class="form-group row" style="width:350px">
                       <asp:Label id="lblState" class="col-4 col-form-label" runat="server">State</asp:Label> 
                       <div class="col-8">
                         <asp:DropDownList id="ddlState" name="ddlState" class="form-select" runat="server">
                            <asp:ListItem Text="" Selected="True"></asp:ListItem>
                            <asp:ListItem>Johor</asp:ListItem>
                            <asp:ListItem>Kedah</asp:ListItem>
                            <asp:ListItem>Kelantan</asp:ListItem>
                            <asp:ListItem>Malacca</asp:ListItem>
                            <asp:ListItem>Negeri Sembilan</asp:ListItem>
                            <asp:ListItem>Pahang</asp:ListItem>
                            <asp:ListItem>Penang</asp:ListItem>
                            <asp:ListItem>Perak</asp:ListItem>
                            <asp:ListItem>Perlis</asp:ListItem>
                            <asp:ListItem>Sabah</asp:ListItem>
                            <asp:ListItem>Sarawak</asp:ListItem>
                            <asp:ListItem>Selangor</asp:ListItem>
                            <asp:ListItem>Terengganu</asp:ListItem>
                            <asp:ListItem>Kuala Lumpur</asp:ListItem>
                            <asp:ListItem>Labuan</asp:ListItem>
                            <asp:ListItem>Putrajaya</asp:ListItem>
                         </asp:DropDownList>
                       </div>
                     </div>
                    
                        <p><asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="ddlState" Display="Dynamic" ErrorMessage="State is required" ForeColor="Red"></asp:RequiredFieldValidator>
                        </p>
                    </td>
                <td>
                    <div class="form-group row" >
                      <asp:Label id="lblCVV" class="col-3 col-form-label" runat="server">CVV</asp:Label> 
                      <div class="col-4">
                        <div class="input-group">
                          <asp:TextBox id="txtCVV" name="txtCVV" type="text" class="form-control" runat="server"></asp:TextBox> 
                          <div class="input-group-append">
                            <div class="input-group-text">
                              <i class="fa "></i>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div> 
                    <p>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCVV" Display="Dynamic" ErrorMessage="CVV is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtCVV" Display="Dynamic" ErrorMessage="CVV should be 3 digits" ValidationExpression="^[0-9]{3}$" ForeColor="Red"></asp:RegularExpressionValidator>
                    </p>
                </td>
            </tr>
            <tr>
                <td>
                     <div class="form-group row" style="width:350px">
                      <asp:Label id="lblCity" class="col-4 col-form-label" runat="server">City</asp:Label> 
                      <div class="col-8">
                        <div class="input-group">
                          <asp:TextBox id="txtCity" name="txtCity" placeholder="Kuala Lumpur" type="text" class="form-control" runat="server"></asp:TextBox> 
                          <div class="input-group-append">
                            <div class="input-group-text">
                              <i class="fa "></i>
                            </div>
                          </div>
                        </div>
                      </div>
                  </div>                  
                    <p>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtCity" Display="Dynamic" ErrorMessage="City is required" ForeColor="Red"></asp:RequiredFieldValidator>
                        </p>
                </td>
            </tr>
            <tr>
                 <td>
                    <div class="form-group row" style="width:350px">
                      <asp:Label id="lblZipCode" class="col-4 col-form-label" runat="server">Zip Code</asp:Label> 
                      <div class="col-4">
                        <div class="input-group">
                          <asp:TextBox id="txtZipCode" name="txtZipCode" placeholder="52100" type="text" class="form-control" runat="server"></asp:TextBox> 
                          <div class="input-group-append">
                            <div class="input-group-text">
                              <i class="fa "></i>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div> 
                     
               
                    <p><asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtZipCode" Display="Dynamic" ErrorMessage="Zip Code is required" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtZipCode" ErrorMessage="Zip Code should be 5 digits" ValidationExpression="^[0-9]{5}$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                    </p> 
                 </td>
            </tr>
        </table></p>
                    </div>

           
                <div class="col-md-5">
                    <p style="margin-left: 60px">&nbsp;</p>
                    <p style="margin-left: 60px">&nbsp;</p>
                    <p style="margin-left: 60px">&nbsp;</p>

                    <div style="margin-left: 70px" class="tab-pane" id="checkout">
                        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                            <HeaderTemplate>
                                <table class="table w-75 p3 ms-auto me-auto" style="width:100%">
                                    <thead>
                                        <tr>
                                            <th style="width: 40%" scope="col">Artwork Name</th>
                                            <th style="width: 10%" scope="col">Quantity</th>
                                            <th style="width: 25%" scope="col">Unit Price</th>
                                            <th style="width: 25%; text-align:right" scope="col">Price</th>
                                        </tr>
                                    </thead>
                                </table>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <table class="table w-75 p3 ms-auto me-auto">
                                    <tr>
                                        <td style="width: 40%" class="align-middle"><%# Eval("ArtworkName")%></td>
                                        <td style="width: 10%" class="align-middle"><%# Eval("Quantity")%></td>
                                        <td style="width: 25%; text-align:center" class="align-middle"><%# Eval("Price")%></td>
                                        <td style="width: 25%; text-align: right" class="align-middle"><%# Eval("TotalPrice", "{0:0.00}") %></td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:Repeater>
                        <br />

                        <table style="border: 0px solid transparent;" class="table w-75 p3 ms-auto me-auto">
                            <tr>
                                <td style="width: 60%"><asp:Label ID="lblSubtotalDis" runat="server" Text="Subtotal"></asp:Label></td>
                                     
                                <td style="width: 10%" class="align-middle"></td>
                               
                                <td style="width: 30%">
                                    <asp:Label Style="display: block; text-align: right" ID="lblSubtotal" runat="server" Text="RM???"></asp:Label></td>
                            </tr>

                            <tr>
                                <td style="width: 60%"><asp:Label ID="lblTaxDis" runat="server" Text="Tax"></asp:Label>&nbsp;(6%)</td>
                                     
                                <td style="width: 10%" class="align-middle"></td>
                               
                                <td style="width: 30%">
                                    <asp:Label Style="display: block; text-align: right" ID="lblTax" runat="server" Text="RM???"></asp:Label></td>
                            </tr>

                            <tr>
                                <td style="width: 60%"><asp:Label ID="lblTotalDis" runat="server" Text="Total"></asp:Label></td>
                                
                                <td style="width: 10%" class="align-middle"></td>
                                    
                                <td class="align-middle" style="width: 30%">
                                    <asp:Label Style="display: block; text-align: right" ID="lblTotal" runat="server" Text="RM???"></asp:Label></td>
                            </tr>

                        </table>

                            <asp:Button style="margin-left:60px" class="btn btn-danger btn-lg btn-brand btn-full-width" ID="btnContinue" runat="server" Text="Continue Shopping" OnClick="btnContinue_Click" Width="350px" CausesValidation="False" ValidationGroup="First" />
                            <br /><br />
                            <asp:Button style="margin-left:60px" class="btn btn-primary btn-lg btn-brand btn-full-width" ID="btnCheckout" runat="server" Text="Complete Payment" OnClick="btnCheckout_Click" Width="350px"  />


                    </div>
                </div>
                    
                        &nbsp;
                



            </div>
            <!-- end row -->

        </div>
        <!-- end container -->





    </form>

    <script
        src="https://code.jquery.com/jquery-2.2.2.min.js" integrity="sha256-36cp2Co+/62rEAAYHLmRCPIych47CvdM+uTBJwSzWjI=" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

    <br />

</asp:Content>
