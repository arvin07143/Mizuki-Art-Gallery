<%@ Page Title="" Language="C#" MasterPageFile="~/Mizuki.Master" AutoEventWireup="true" CodeBehind="ProductDelivery.aspx.cs" Inherits="Assignment.App_Pages.ProductDelivery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Delivery Detail</title>
    <style>
        .container {
         margin-top: 50px;
         margin-bottom: 50px
     }

     .card {
         position: relative;
         display: -webkit-box;
         display: -ms-flexbox;
         display: flex;
         -webkit-box-orient: vertical;
         -webkit-box-direction: normal;
         -ms-flex-direction: column;
         flex-direction: column;
         min-width: 0;
         word-wrap: break-word;
         background-color: #fff;
         background-clip: border-box;
         border: 1px solid rgba(0, 0, 0, 0.1);
         border-radius: 0.10rem
     }

     .card-header:first-child {
         border-radius: calc(0.37rem - 1px) calc(0.37rem - 1px) 0 0
     }

     .card-header {
         padding: 0.75rem 1.25rem;
         margin-bottom: 0;
         background-color: #fff;
         border-bottom: 1px solid rgba(0, 0, 0, 0.1)
     }

     

   
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <div class="container">
    <article class="card">
        <header class="card-header"> Order Delivery</header>
        <div class="card-body">
            <h6>Order ID:
                <asp:Label ID="lblOrderId" runat="server"></asp:Label>
            </h6>
            <article class="card">
                <div class="card-body row">
                    <div class="col"> <strong>Order time:<br />
                        </strong> &nbsp;<asp:Label ID="lblOrderTime" runat="server"></asp:Label>
                        <br> </div>
                    <div class="col"> <strong>Estimated Arrive time:<br />
                        </strong> &nbsp;<asp:Label ID="lblEstimatedArriveTime" runat="server"></asp:Label>
                    </div>
                    <div class="col"> <strong>Courier Services:</strong> <br> POS LAJU</div>
                   <div class="col"> <strong>Delivery address:<br />
                        </strong> &nbsp;<asp:Label ID="lblDeliveryAddress" runat="server"></asp:Label>
                        <br> </div>
                </div>
            </article>
           <asp:Repeater ID="Repeater1" runat="server">
                            <HeaderTemplate>
                                <table>
                                    <thead>
                                        <tr>
                                            <th style="width: 10%" scope="col">No.</th>
                                            <th style="width: 20%" scope="col">Art ID</th>
                                            <th style="width: 12.5%" scope="col">Product</th>
                                            <th style="width: 24%" scope="col">Name</th>
                                            <th style="width: 15%" scope="col">Unit Price</th>
                                            <th style="width: 10%" scope="col">Quantity</th>
                                            <th style="width: 15%" scope="col">Total Price</th>
                                        </tr>
                                    </thead>
                                </table>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <table >
                                    <tr>
                                        <td style="width: 10%"><%# Container.ItemIndex + 1 %></td>
                                        <td style="width: 10%"><%# Eval("ArtworkID") %></td>
                                        <td style="width: 20%">
                                            <img style="width: 80%; height: 100px" class="img-thumbnail img-fluid" src='<%#Eval("URL") %>'>
                                        </td>
                                        <td style="width: 20%" ><%# Eval("ArtworkName")%></td>
                                        <td style="width: 15%" ><%# Eval("Price")%></td>
                                        <td style="width: 10%" ><%# Eval("Quantity")%></td>
                                        <td style="width: 15%" ><%# Eval("TotalPrice")%></td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:Repeater>
                        <br />

                        <table style="border: 0px solid transparent;">
                            <tr> 
                                <td style="width: 10%"></td>
                                <td style="width: 10%"></td>
                                <td style="width: 20%"></td>
                                <td style="width: 20%"></td>
                                <td style="width: 21%"></td>
                                <td style="width: 10%">
                                    <asp:Label ID="lblSubtotalDis" runat="server" Text="Subtotal"></asp:Label></td>
                                <td style="width: 15%">
                                    <asp:Label Style="display: block; text-align: right" ID="lblSubtotal" runat="server" Text="RM???"></asp:Label></td>
                            </tr>

                            <tr>
                                <td style="width: 10%"></td>
                                <td style="width: 10%"></td>
                                <td style="width: 20%"></td>
                                <td style="width: 20%"></td>
                                <td style="width: 21%"></td>
                                <td style="width: 10%">                               
                                    <asp:Label ID="lblTaxDis" runat="server" Text="Tax"></asp:Label>&nbsp;(6%)</td>
                                <td style="width: 15%">
                                    <asp:Label Style="display: block; text-align: right" ID="lblTax" runat="server" Text="RM???"></asp:Label></td>
                            </tr>

                            <tr>
                                <td style="width: 10%"></td>
                                <td style="width: 10%"></td>
                                <td style="width: 20%"></td>
                                <td style="width: 20%"></td>
                                <td style="width: 21%"></td>
                                <td style="width: 10%">   
                                    <asp:Label ID="lblTotalDis" runat="server" Text="Total"></asp:Label>&nbsp;(6%)</td>
                                <td style="width: 15%">
                                    <asp:Label Style="display: block; text-align: right" ID="lblTotal" runat="server" Text="RM???"></asp:Label></td>
                            </tr>
                            

                        </table>



            &nbsp;<asp:Button ID="btnMainPage" runat="server" PostBackUrl="~/App_Pages/MainPage.aspx" Text="Back to main page" />
        </div>
    </article>
</div>
    </form>
</asp:Content>
