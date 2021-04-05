<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainPageRepeater.ascx.cs" Inherits="Assignment.App_Pages.MainPageRepeater" %>
<asp:Label ID="heading" CssClass="h1 mb-4" runat="server" Text=""/> <br /><br />
<div class="card-group">
    <asp:Repeater ID="rpt" runat="server">
        <ItemTemplate>
            <div class="card">
                <asp:ImageButton ID="ibtn" runat="server" class="card-img-top" src='<%# Eval("URL") %>' CommandArgument='<%# Eval("ArtworkID") %>' OnClick="SlideImg_Click" />
                <div class="card-body">
                    <h5 class="card-title" runat="server"><%# Eval("ArtworkName") %></h5>
                    <p class="card-text" runat="server"><%# Eval("Name") %></p>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
