<%@ Page Title="" Language="C#" MasterPageFile="~/Mizuki.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Assignment.App_Pages.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentplaceholder1" runat="server">
    <div class="jumbotron jumbotron-fluid bg-dark pt-3 pb-4 mb-3 text-light">
        <div class="container">
            <h1 class="display-4">Cart</h1>
        </div>
    </div>
    <!--datasource for cart item repeater-->
    <%--<asp:SqlDataSource ID="SqlCartItemDataSource" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT [ArtworkID], [Quantity] FROM [CartDetails] WHERE ([Username] = @Username)" runat="server" >
        <SelectParameters>
            <asp:SessionParameter DefaultValue="admin" Name="Username" SessionField="username" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>--%>
    <form id="cartForm" runat="server">
        <!-- template for cart item repeater-->
        <div class="container">
            <div class="row flex-column m-auto" style="width: 800px">
                <!--card group-->
                <asp:Repeater ID="cartItemRepeater" runat="server">
                    <ItemTemplate>
                        <div class="card flex-row">
                            <img class="col-2" src="<%# Eval("URL")%>" alt="Card image cap">
                            <div class="card-body col-8">
                                <h5 class="card-title"><%# Eval("ArtworkName")%></h5>
                                <p class="card-text">Quantity: <%# Eval("Quantity")%></p>
                                <p class="text-right">Unit Price:<%# Eval("Price")%></p>
                                <p class="text-right">Total Price:<%# Eval("TotalPrice")%></p>
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
