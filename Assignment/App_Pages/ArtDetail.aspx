<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Mizuki.Master" CodeBehind="ArtDetail.aspx.cs" Inherits="Assignment.App_Pages.ArtDetail" %>

<asp:Content ID="artDetailHeader" ContentPlaceHolderID="head" runat="server">
    <title>Art Detail</title>
    <style>
        #form1 {
            min-height: 600px;
        }

        .img-art {
            height: 450px;
            object-fit: contain;
            object-position: center;
        }

        .detail-box {
            width: 100%;
            height: 500px;
            margin: 50px 0;
            padding: 20px 10px;
        }
        input[type=text]{
            padding-left: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="container">
            <div class="detail-box">
                <div class="d-flex justify-content-around">
                    <!--art image column-->
                    <div class="">
                        <img src="#" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.5), 0 6px 20px 0 rgba(0, 0, 0, 0.7);" class="img-art" id="artImage" runat="server" />
                    </div>
                    <!--art detail column-->
                    <div style="width: 400px; margin: 20px" class="d-flex flex-column justify-content-between">
                        <!--art name-->
                        <div>
                            <div>
                                <asp:Label ID="artName" runat="server" CssClass="h1"></asp:Label>
                            </div>
                            <div class="mt-4">
                                <p style="display: inline; color: grey; margin-right: 10px">by: </p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="artistName" runat="server" CssClass="h5"></asp:Label>
                            </div>
                            <div>
                                <p style="display: inline; color: grey; margin-right: 10px">In Stock: </p>
                                <asp:Label ID="stockQuantity" runat="server"></asp:Label>
                            </div>
                            <div>
                                <p style="display: inline; color: grey; margin-right: 10px">RM </p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="price" runat="server"></asp:Label>
                            </div>
                        </div>
                        <!--buttons-->
                        <div>
                            <div class="d-flex mb-2">
                                <div style="margin-right: 5px">
                                    <asp:Button ID="btnMinus" Text="-" runat="server" CssClass="btn btn-light btn-outline-dark" Width="40" Height="40" OnClick="btnMinus_Click" /></div>
                                <div style="margin-right: 5px">
                                    <asp:TextBox ID="txtQuantity" runat="server" Enabled="False" Width="60" Text="1" Height="40" CssClass="form-control"></asp:TextBox></div>
                                <div style="margin-right: 5px">
                                    <asp:Button ID="btnPlus" Text="+" runat="server" CssClass="btn btn-light btn-outline-dark" Height="40px" Width="40px" OnClick="btnPlus_Click" /></div>
                            </div>
                            <!--add wishlist-->
                            <div class="mb-2"><asp:Button ID="btnWishlist" Text="Add to Wishlist" CssClass="btn btn-primary" runat="server" Height="60" Width="200" OnClick="btnWishlist_Click" /></div>
                            <!--remove wishlist-->
                            <div class="mb-2"><asp:Button ID="btnWishlistRemove" Text="Remove From Wishlist" style="display: none" CssClass="btn btn-danger" runat="server" Height="60" Width="200" OnClick="btnWishlistRemove_Click" /></div>
                            <!--order-->
                            <div><asp:Button ID="btnAddToCart" Text="Add To Cart" CssClass="btn btn-success" runat="server" Width="200" Height="60" OnClick="btnAddToCart_Click" /></div>
                        </div>

                    </div>


                </div>
            </div>

        </div>
    </form>

</asp:Content>

