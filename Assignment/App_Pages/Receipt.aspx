<%@ Page Title="" Language="C#" MasterPageFile="~/Mizuki.Master" AutoEventWireup="true" CodeBehind="Receipt.aspx.cs" Inherits="Assignment.App_Pages.Receipt" %>

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
        <header class="card-header"> 
            <h1>Digital Receipt</h1></header>
            
            <div class="card-body">
            <article class="card">
                <div class="card-body row">
                    <div class="col"> <strong>Recipient Name:<br /></strong> 
                        Name : <asp:Label ID="lblName" runat="server"></asp:Label>
                        <br> </div>
                    <div class="col"> <strong>Contact Number & Email</strong><br />
                        Contact Number  : <asp:Label ID="lblPhone" runat="server"></asp:Label><br />
                        Email Address   : <asp:Label ID="lblEmail" runat="server"></asp:Label>
                    </div>
                    <div class="col"> <strong>Payment Detail</strong> <br />
                        Payment Method  : <asp:Label ID="lblPaymentType" runat="server"></asp:Label><br />
                        Card Number     : <asp:Label ID="lblCardNumber" runat="server"></asp:Label><br />
                        Purchase By     : <asp:Label ID="lblName2" runat="server"></asp:Label>

                    </div>
                </div>
                </article>
            </div>
        <br /><br />
          <header class="card-header"> Order Delivery - OrderID : <asp:Label ID="lblOrderID0" runat="server"> </asp:Label></header>
          <div class="card-body">
            <article class="card">
                <div class="card-body row">
                    <div class="col"> <strong>Order time:<br />
                        </strong> <asp:Label ID="lblOrderTime" runat="server"></asp:Label>
                        <br> </div>
                    <div class="col"> <strong>Estimated Arrive time:<br />
                        </strong><asp:Label ID="lblEstimatedArriveTime" runat="server"></asp:Label>
                    </div>
                    <div class="col"> <strong>Courier Services:</strong> <br> POS LAJU</div>
                   <div class="col"> <strong>Delivery address:<br />
                        </strong><asp:Label ID="lblDeliveryAddress" runat="server"></asp:Label>
                        <br> </div>
                </div>
            </article>
            
            <br /><br />
           <asp:Repeater ID="Repeater1" runat="server">
               <HeaderTemplate>
                   <table class="table w-75 p3 ms-auto me-auto" style="width:80%; border-color:black; border-width:1px; border-style:solid">
                           <thead>
                               <tr>
                                   <th style="width: 10%;" scope="col">No.</th>
                                   <th style="width: 40%;" scope="col">Artwork Name</th>
                                   <th style="width: 10%;" scope="col">Quantity</th>
                                   <th style="width: 10%;" scope="col">Unit Price</th>
                                   <th style="width: 10%"" scope="col">Total Price</th>
                               </tr>
                           </thead>
                       
                   </HeaderTemplate>
                   <ItemTemplate>
                       
                           <tr>
                               <td style="width: 10%; text-align:center" class="align-middle"><%# Container.ItemIndex + 1 %></td>
                               <td style="width: 40%; text-align:center" class="align-middle"><%# Eval("ArtworkName")%></td>
                               <td style="width: 10%; text-align:center" class="align-middle"><%# Eval("Quantity")%></td>
                               <td style="width: 10%; text-align:center" class="align-middle"><%# Eval("Price")%></td>
                               <td style="width: 10%; text-align: right" class="align-middle"><%# Eval("TotalPrice", "{0:0.00}") %></td>
                              
                           </tr>
                       </table>
                   </ItemTemplate>
                        </asp:Repeater>

                        <table  class="table w-75 p3 ms-auto me-auto"  style="width:80%; border-color:black; border-width:1px; border-style:solid">
                            <tr>
                                <td style="width: 10%"></td>
                                <td style="width: 40%"></td>
                                <td style="width: 10%"></td> 
                                <td style="width: 10%" class="align-middle"><asp:Label ID="lblSubtotalDis" runat="server" Text="Subtotal"></asp:Label>&nbsp;</td>
                                <td style="width: 10%"><asp:Label Style="display: block; text-align: right" ID="lblSubtotal" runat="server" Text="RM???"></asp:Label></td>
                            </tr>

                            <tr>
                                <td style="width: 10%"></td>
                                <td style="width: 40%"></td>
                                <td style="width: 10%"></td> 
                                <td style="width: 10%" class="align-middle"><asp:Label  ID="lblTaxDis" runat="server" Text="Tax (6%)"></asp:Label></td>
                                <td style="width: 10%"><asp:Label Style="display: block; text-align: right" ID="lblTax" runat="server" Text="RM???"></asp:Label></td>
                           </tr>

                            <tr>
                                <td style="width: 10%"></td>
                                <td style="width: 40%"></td>
                                <td style="width: 10%"></td> 
                                <td style="width: 10%" class="align-middle"><asp:Label ID="lblTotalDis" style="float:left" runat="server" Text="Total" CssClass="auto-style13" Height="18px"></asp:Label></td>
                                <td style="width: 10%"><asp:Label Style="display: block; text-align: right" ID="lblTotal" runat="server" Text="RM???"></asp:Label></td>
                            </tr>

                        </table>
                        <br />
              <div><asp:Button style="  margin:auto; display:block;" class="btn btn-primary btn-lg btn-brand btn-full-width" ID="btnContinue" runat="server" Text="Continue With Transaction" OnClick="btnContinue_Click" Width="350px" ValidationGroup="First" /></div>
        </div>
    </article>
</div>
    </form>
</asp:Content>

