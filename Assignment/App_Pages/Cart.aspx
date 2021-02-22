<%@ Page Title="" Language="C#" MasterPageFile="~/Mizuki.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Assignment.App_Pages.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentplaceholder1" runat="server">
    <form runat="server">
        <div class="jumbotron jumbotron-fluid bg-dark pt-3 pb-4 mb-3 text-light">
            <div class="container">
                <h1 class="display-4">Cart</h1>
            </div>
        </div>
        <span>Total Price
        </span>
        <asp:Label ID="lblTotalPrice" runat="server"></asp:Label>
        <!--datasource for cart item repeater-->
        <%--<asp:SqlDataSource ID="SqlCartItemDataSource" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT [ArtworkID], [Quantity] FROM [CartDetails] WHERE ([Username] = @Username)" runat="server" >
        <SelectParameters>
            <asp:SessionParameter DefaultValue="admin" Name="Username" SessionField="username" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>--%>

        <!-- template for cart item repeater-->
        <div class="container">
            <div class="row flex-column m-auto" style="width: 800px">
                <!--card group-->
                <asp:Repeater ID="cartItemRepeater" runat="server" OnItemCommand="cartItemRepeater_ItemCommand">
                    <ItemTemplate>
                        <div class="card flex-row">
                            <img class="col-4" src="<%# Eval("URL")%>" alt="Card image cap">
                            <div class="card-body">
                                <h5 class="card-title"><%# Eval("ArtworkName")%></h5>
                                <div class="d-flex justify-content-start" style="margin: 30px 0">
                                    <!--decrease button-->
                                    <asp:Button CommandName="minus" CommandArgument='<%# Eval("ArtworkID")%>'
                                        Text="-" runat="server" ID="btnMinus" style="width:40px;height:40px"/>
                                    <p class="card-text" style="margin: 0 10px 0 10px; padding-top:5px">Quantity: <%# Eval("Quantity")%></p>
                                    <!--increase button-->
                                    <asp:Button CommandName="plus" CommandArgument='<%# Eval("ArtworkID")%>'
                                        Text="+" runat="server" ID="btnPlus" style="width:40px;height:40px"/>
                                </div>
                                <p class="card-text">Unit Price : RM<%# Eval("Price")%></p>
                                <p class="card-text">Total Price : RM<%# Eval("TotalPrice")%></p>
                                <asp:Button CommandName="delete" CommandArgument='<%# Eval("ArtworkID")%>'
                                    Text="Delete" runat="server" ID="btnDelete" />
                            </div>
                            <%--<div class="card-body col-4">
                            
                        </div>--%>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>

    </form>


</asp:Content>
