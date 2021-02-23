<%@ Page Language="C#" MasterPageFile="~/Mizuki.Master" AutoEventWireup="true" CodeBehind="ManageArt.aspx.cs" Inherits="Assignment.ManageArt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../css/manage_art.css" />
    <title>Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.js" integrity="sha512-WNLxfP/8cVYL9sj8Jnp6et0BkubLP31jhTG9vhL/F5uEZmg5wEzKoXp1kJslzPQWwPT1eyMiSxlKCgzHLOTOTQ==" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons">
    <script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js" integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9" crossorigin="anonymous"></script>
    <link href="../css/lightbox.css" rel="stylesheet" />
    <script src="../js/lightbox.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <asp:Label ID="lblTest" runat="server" Text=""></asp:Label>
        <div class="modal fade bd-example-modal-lg" id="modalForm">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Add New Art</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="row mb-3">
                            <label for="formArtName" class="col-sm-3 col-form-label">Art Name</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="formArtName" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="formArtPrice" class="col-sm-3 col-form-label">Art Price</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="formArtPrice" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="formArtStock" class="col-sm-3 col-form-label">Art Quantity</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="formArtStock" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="imgFile" class="form-label">Upload your image here</label>
                            <asp:FileUpload ID="imgFile" runat="server" CssClass="form-control" />
                            <div id="uploadHelp" class="form-text">
                                Supported file extensions : .JPG
                            </div>
                        </div>
                        <div class="row mb-3">
                            <asp:Button CssClass="btn btn-success" runat="server" OnClick="addItemFormSubmitClicked" Text="Save" />
                        </div>
                    </div>
                </div>
            </div>

        </div>



        <div class="main main-raised" style="margin-top: 100px">
            <div class="container" style="">

                <div class="row py-3">
                    <div class="col-4"></div>
                    <div class="col-8 float-end">
                        <asp:LinkButton class="btn btn-primary float-end align-middle" ID="btnAddNewArt" runat="server" data-toggle="modal" data-target="#modalForm" OnClientClick="return false;">Add New Artwork <i class="material-icons align-middle" >add</i></asp:LinkButton>
                        <asp:LinkButton class="btn btn-success float-end me-3 align-middle" ID="btnViewGallery" runat="server" OnClientClick="lightbox.start($('#gallery-img'));return false;">View As Gallery <i class="material-icons align-middle">collections</i></asp:LinkButton>
                    </div>
                </div>
                <div class="row">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Price, ArtworkID, ArtworkName, StockQuantity, URL FROM Artwork WHERE (Username = @currentUsername)">
                        <SelectParameters>
                            <asp:SessionParameter Name="currentUsername" SessionField="username" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemDataBound">
                        <HeaderTemplate>
                            <table class="table">
                                <thead>
                                    <td style="width: 10%">No.</td>
                                    <td style="width: 10%">Artwork ID</td>
                                    <td style="width: 30%">Artwork Image</td>
                                    <td style="width: 20%">Artwork Name</td>
                                    <td style="width: 10%">Artwork Price</td>
                                    <td style="width: 20%">Artwork Stock</td>
                                </thead>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table class="table table-borderless table-hover">
                                <tr>
                                    <td style="width: 10%" class="align-middle"><%# Container.ItemIndex + 1 %></td>
                                    <td style="width: 10%" class="align-middle">
                                        <asp:Label ID="lblArtworkID" runat="server" Text='<%# Eval("ArtworkID") %>'> </asp:Label>

                                    </td>
                                    <td style="width: 30%">
                                        <a href='<%#Eval("URL") %>' id="gallery-img" data-lightbox="img-gallery" data-title="<%# Eval("ArtworkName") %>">
                                            <img class="img-thumbnail img-fluid" style="max-width: 80%" src='<%#Eval("URL") %>'>
                                        </a>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                    <td style="width: 20%" class="align-middle"><%# Eval("ArtworkName") %></td>
                                    <td style="width: 10%" class="align-middle"><%# Eval("Price","{0:C2}") %></td>
                                    <td style="width: 20%" class="align-middle">
                                        <row>
                                                <asp:LinkButton class="btn btn-default btn-qty" ID="btnRemove" runat="server" onClick="btnRemoveStockClick"><i class="material-icons">remove</i></asp:LinkButton>
                                                <asp:TextBox class="btn btn-outline-dark btn-qty" ID="txtStock" runat="server" text=<%# Eval("StockQuantity") %>></asp:TextBox>
                                                <asp:LinkButton class="btn btn-default btn-qty" ID="btnAdd" runat="server" onClick="btnAddStockClick"><i class="material-icons">add</i></asp:LinkButton>
                                            </row>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <FooterTemplate>
                            <%-- Label used for showing Error Message --%>
                            <asp:Label ID="lblErrorMsg" runat="server" Text="Sorry, you have no artworks." Visible="false">
                            </asp:Label>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
