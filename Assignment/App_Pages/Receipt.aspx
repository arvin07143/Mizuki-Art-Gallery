<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Receipt.aspx.cs" Inherits="Assignment.App_Pages.Receipt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Receipt</title>
    <style type="text/css">
        .auto-style1 {
            width: 702px;
        }
        .auto-style2 {
            width: 139px;
        }
        .auto-style3 {
            width: 100%;
        }
        .auto-style4 {
            width: 86px;
        }
        .auto-style8 {
            width: 86px;
            height: 23px;
        }
        .auto-style10 {
            width: 605px;
            height: 23px;
        }
        .auto-style11 {
            width: 117px;
            height: 23px;
        }
        .auto-style12 {
            height: 23px;
        }
        .auto-style13 {
            float: right;
        }
        .auto-style14 {
            width: 605px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="margin-left:250px; margin-right:60px;">
        <div>
            <br />
            <h1>Digital Receipt</h1>
            <table class="auto-style3" style="width:80%; border:1px solid black">
                <tr>
                    <td class="auto-style1">
                        <strong>
                        <asp:Label ID="Label1" runat="server" Text="Mizuki "></asp:Label>
                        </strong>
                    </td>
                    <td class="auto-style2">
                        <asp:Label style="float:right" ID="Label2" runat="server" Text="Date"></asp:Label>
                    </td>
                    <td>:
                        <asp:Label ID="lblDate" runat="server" Text="Date"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <strong>
                        <asp:Label ID="Label4" runat="server" Text="Bringing Joy of Creativity"></asp:Label>
                        </strong>
                    </td>
                    <td class="auto-style2" >
                        <asp:Label style="float:right" ID="Label3" runat="server" Text="OrderID"></asp:Label>
                    </td>
                    <td>: <asp:Label ID="lblOrderID" runat="server" Text="InsertID"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
            <table class="auto-style3" style="width:80%; border:1px solid black">
                <tr>
                    <td class="auto-style8"><asp:Label style="float:right" ID="Label9" runat="server" Text="Deliver To :"></asp:Label>
                    </td>
                    <td class="auto-style10">
                        <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
                    </td>
                    <td class="auto-style11" style="text-align:right">
                        <asp:Label style="float:right" ID="Label10" runat="server" Text="Payment Type :"></asp:Label>
                    </td>
                    <td class="auto-style12">
                        <asp:Label ID="lblPaymentType" runat="server" Text="PaymentType"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8"></td>
                    <td class="auto-style10">
                        <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                    </td>
                    <td class="auto-style11" style="text-align:right">
                        <asp:Label style="float:right" ID="Label11" runat="server" Text="Card Number :"></asp:Label>
                    </td>
                    <td class="auto-style12">
                        <asp:Label ID="lblCardNumber" runat="server" Text="CardNumber"><%# Eval("CardNumber")%></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style14">
                        <asp:Label ID="lblCityZip" runat="server" Text="City +  zip"><%# Eval("Price")%></asp:Label>
                    </td>
                    <td style="text-align:right">
                        <asp:Label style="float:right" ID="Label12" runat="server" Text="By :"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblName2" runat="server" Text="ID"><%# Eval("Name")%></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style14">
                        <asp:Label ID="lblPhone" runat="server" Text="Phone"><%# Eval("ContactNumber")%></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <br />

            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                            <HeaderTemplate>
                                <table class="table w-75 p3 ms-auto me-auto" style="width:80%; border-color:black; border-width:1px; border-style:solid">
                                    <thead>
                                        <tr>
                                            <th style="width: 10%; border-right:solid" scope="col">No.</th>
                                            <th style="width: 40%; border-right:solid;" scope="col">Artwork Name</th>
                                            <th style="width: 10%; border-right:solid;" scope="col">Quantity</th>
                                            <th style="width: 10%; border-right:solid;" scope="col">Unit Price</th>
                                            <th style="width: 10%" scope="col">Total Price</th>
                                        </tr>
                                    </thead>
                                </table>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <table class="table w-75 p3 ms-auto me-auto" style="width:80%; border-color:black; border-width:1px; border-style:solid; border-top:none">
                                    <tr>
                                        <td style="width: 10%; border-right:solid; text-align:center" class="align-middle"><%# Container.ItemIndex + 1 %></td>
                                        <td style="width: 40%; border-right:solid;text-align:center" class="align-middle"><%# Eval("ArtworkName")%></td>
                                        <td style="width: 10%; border-right:solid;text-align:center" class="align-middle"><%# Eval("Quantity")%></td>
                                        <td style="width: 10%; border-right:solid;text-align:center" class="align-middle"><%# Eval("Price")%></td>
                                        <td style="width: 10%; text-align: right" class="align-middle"><%# Eval("TotalPrice")%></td>
                                       
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
           

        </div>
    </form>
</body>
</html>
