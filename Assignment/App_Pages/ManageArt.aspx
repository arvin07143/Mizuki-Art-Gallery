<%@ Page Language="C#" MasterPageFile="~/Mizuki.Master" AutoEventWireup="true" CodeBehind="ManageArt.aspx.cs" Inherits="Assignment.ManageArt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../css/manage_art.css" />
    <title>Art Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.js" integrity="sha512-WNLxfP/8cVYL9sj8Jnp6et0BkubLP31jhTG9vhL/F5uEZmg5wEzKoXp1kJslzPQWwPT1eyMiSxlKCgzHLOTOTQ==" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons">
    <script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js" integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9" crossorigin="anonymous"></script>
    <link href="../css/lightbox.css" rel="stylesheet" />
    <script src="../js/lightbox.js"></script>
    <script>
        function UploadFileCheck(source, arguments) {
            var sFile = arguments.Value;
            arguments.IsValid =
                ((sFile.endsWith('.jpg')) ||
                    (sFile.endsWith('.jpeg')) ||
                    (sFile.endsWith('.gif')) ||
                    (sFile.endsWith('.png')));
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
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
                                <asp:RequiredFieldValidator ValidationGroup="Add Form" ForeColor="Red" ID="rfvNewArtName" ControlToValidate="formArtName" runat="server" Display="Dynamic" ErrorMessage="Art Name Cannot Be Blank"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="formArtCategory" class="col-sm-3 col-form-label">Art Category</label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="formArtCategory" CssClass="form-select" runat="server"></asp:DropDownList>

                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="formArtPrice" class="col-sm-3 col-form-label">Art Price</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="formArtPrice" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="Add Form" ForeColor="Red" ID="rfvFormPrice" Display="Dynamic" ControlToValidate="formArtPrice" runat="server" ErrorMessage="Price Cannot Be Blank"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ValidationGroup="Add Form" ForeColor="Red" ID="priceFormValidator" Display="Dynamic" ControlToValidate="formArtPrice" Type="Double" ValueToCompare="0.01" Operator="GreaterThan" runat="server" ErrorMessage="Price Must Be Larger Than 1"></asp:CompareValidator>

                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="formArtStock" class="col-sm-3 col-form-label">Art Quantity</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="formArtStock" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="Add Form" ForeColor="Red" ID="rfvFormStock" Display="Dynamic" ControlToValidate="formArtStock" runat="server" ErrorMessage="Stock Value Cannot Be Blank"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ValidationGroup="Add Form" ForeColor="Red" ID="stockFormValidator" Display="Dynamic" ControlToValidate="formArtStock" Type="Integer" ValueToCompare="1" Operator="GreaterThanEqual" runat="server" ErrorMessage="Stock Must Be Greater or Equal 1"></asp:CompareValidator>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="imgFile" class="form-label">Upload your image here</label>
                            <asp:FileUpload ID="imgFile" runat="server" CssClass="form-control" />
                            <asp:CustomValidator ValidationGroup="Add Form" ForeColor="Red" ID="CustomValidator1" ControlToValidate="imgFile" runat="server" SetFocusOnError="true" Display="Dynamic" ErrorMessage="Invalid: File Type (allowed types: jpg, jpeg, gif, png)" ClientValidationFunction="UploadFileCheck"></asp:CustomValidator>
                            <div id="uploadHelp" class="form-text">
                                Supported file extensions : .JPG
                            </div>
                        </div>
                        <div class="row mb-3">
                            <asp:Button CssClass="btn btn-success" runat="server" OnClick="addItemFormSubmitClicked" ValidationGroup="Add Form" Text="Save" />
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div class="main main-raised" style="margin-top: 100px">
            <div class="container" style="">

                <div class="row py-3">
                    <div class="col-4">
                        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">Manage Artwork</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">Sales History</button>
                            </li>
                        </ul>
                    </div>
                    <div class="col-8 float-end">
                        <asp:LinkButton class="btn btn-primary float-end align-middle" ID="btnAddNewArt" runat="server" data-toggle="modal" data-target="#modalForm" OnClientClick="return false;">Add New Artwork <i class="material-icons align-middle" >add</i></asp:LinkButton>
                        <asp:LinkButton class="btn btn-success float-end me-3 align-middle" ID="btnViewGallery" runat="server" OnClientClick="lightbox.start($('#gallery-img'));return false;">View As Gallery <i class="material-icons align-middle">collections</i></asp:LinkButton>
                    </div>
                </div>
                <div class="row">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Artwork.Price, Artwork.ArtworkID, Artwork.ArtworkName, Artwork.StockQuantity, Artwork.URL, ArtCategory.CategoryName FROM Artwork INNER JOIN ArtCategory ON Artwork.CategoryID = ArtCategory.CategoryID WHERE (Artwork.Username = @currentUsername) AND Artwork.StockQuantity > -1">
                        <SelectParameters>
                            <asp:SessionParameter Name="currentUsername" SessionField="username" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <div class="tab-content" id="pills-tabContent">
                        <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemDataBound">
                                <HeaderTemplate>
                                    <table class="table">
                                        <thead>
                                            <td style="width: 10%">Artwork ID</td>
                                            <td style="width: 20%">Thumbnail</td>
                                            <td style="width: 15%">Name</td>
                                            <td style="width: 15%">Category</td>
                                            <td style="width: 15%">Price</td>
                                            <td style="width: 15%">Stock</td>
                                            <td style="width: 10%"></td>
                                        </thead>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <table class="table table-borderless table-hover table-responsive">
                                        <tr>
                                            <td style="width: 10%; text-align: center" class="align-middle">
                                                <asp:Label ID="lblArtworkID" runat="server" Text='<%# Eval("ArtworkID") %>'> </asp:Label>
                                            </td>
                                            <td style="width: 20%">
                                                <a href='<%#Eval("URL") %>' id="gallery-img" data-lightbox="img-gallery" data-title="<%# Eval("ArtworkName") %>">
                                                    <img class="img-thumbnail img-fluid" style="max-width: 80%" src='<%#Eval("URL") %>'>
                                                </a>
                                            </td>
                                            <td style="width: 15%" class="align-middle">
                                                <asp:TextBox ID="artName" runat="server" Text='<%# Eval("ArtworkName") %>' Enabled="false" BorderStyle="None" BackColor="Transparent" CssClass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ValidationGroup="Edit Image" ForeColor="Red" Display="Dynamic" ID="rfvArtName" runat="server" ErrorMessage="Art Name Cannot Be Blank" ControlToValidate="artName"></asp:RequiredFieldValidator>
                                            </td>
                                            <td style="width: 15%" class="align-middle">
                                                <asp:Label ID="lblCategory" runat="server" Text='<%# Eval("CategoryName") %>'></asp:Label>
                                                <asp:DropDownList ID="ddlCat" CssClass="form-select" runat="server" Visible="false"></asp:DropDownList>
                                            </td>
                                            <td style="width: 15%" class="align-middle">
                                                <div class="input-group">
                                                    <div class="input-group-text" style="background-color: transparent; border: none">RM</div>
                                                    <asp:TextBox ID="artPrice" Display="Dynamic" runat="server" Text='<%# String.Format("RM {0:0.00}", Eval("Price")) %>' Enabled="false" BorderStyle="None" BackColor="Transparent" CssClass="form-control"></asp:TextBox>
                                                </div>
                                                <asp:RequiredFieldValidator ValidationGroup="Edit Image" ID="rfvPrice" ForeColor="Red" Display="Dynamic" ControlToValidate="artPrice" runat="server" ErrorMessage="Price Cannot Be Blank"></asp:RequiredFieldValidator>
                                                <asp:CompareValidator ValidationGroup="Edit Image" ID="priceValidator" ForeColor="Red" Display="Dynamic" ControlToValidate="artPrice" Type="Double" ValueToCompare="0.01" Operator="GreaterThan" runat="server" ErrorMessage="Price Must Be Larger Than 1"></asp:CompareValidator>
                                            </td>
                                            <td style="width: 15%" class="align-middle">
                                                <asp:TextBox ID="txtStock" runat="server" Text='<%# Eval("StockQuantity") %>' Enabled="false" BorderStyle="None" BackColor="Transparent" CssClass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ValidationGroup="Edit Image" ID="rfvStock" ForeColor="Red" Display="Dynamic" ControlToValidate="txtStock" runat="server" ErrorMessage="Stock Value Cannot Be Blank"></asp:RequiredFieldValidator>
                                                <asp:CompareValidator ValidationGroup="Edit Image" ID="stockValidator" ForeColor="Red" Display="Dynamic" ControlToValidate="txtStock" Type="Integer" ValueToCompare="1" Operator="GreaterThanEqual" runat="server" ErrorMessage="Stock Must Be Greater or Equal 1"></asp:CompareValidator>
                                            </td>
                                            <td class="align-middle align-content-center" style="width: 10%">
                                                <div class="btn-group-vertical" role="group">
                                                    <asp:LinkButton ID="btnEditImage" CssClass="btn btn-outline-info" runat="server" OnClick="btnEditImage_Click" CausesValidation="false">Edit</asp:LinkButton>
                                                    <asp:LinkButton ID="btnSaveImage" CssClass="btn btn-outline-success" runat="server" OnClick="btnSaveImage_Click" Visible="False" ValidationGroup="Edit Image">Save</asp:LinkButton>
                                                    <asp:LinkButton ID="btnCancelEdit" CssClass="btn btn-outline-danger" runat="server" OnClick="btnCancel_Click" Visible="False" CausesValidation="false">Cancel</asp:LinkButton>
                                                    <asp:LinkButton ID="btnDeleteImage" CssClass="btn btn-danger" runat="server" OnClick="btnDeleteImage_Click" Visible="False" CausesValidation="false">Delete Art</asp:LinkButton>
                                                </div>
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

                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Artwork.ArtworkID, Artwork.URL, Artwork.ArtworkName, FORMAT([Order].Date, 'dd/MM/yyyy') AS Date, [User].Name, OrderDetails.Quantity, (Artwork.Price * OrderDetails.Quantity) AS Total FROM Artwork INNER JOIN OrderDetails ON (Artwork.ArtworkID = OrderDetails.ArtworkID) INNER JOIN [Order] ON (OrderDetails.OrderID = [Order].OrderID) INNER JOIN [User] ON ([Order].Username = [User].Username) WHERE (Artwork.Username = @currentUsername) ORDER BY [Order].Date DESC">
                        <SelectParameters>
                            <asp:SessionParameter Name="currentUsername" SessionField="username" />
                        </SelectParameters>
                        </asp:SqlDataSource>
                        <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                           <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2" OnItemDataBound="Repeater2_ItemDataBound">
                                <HeaderTemplate>
                                    <table class="table">
                                        <thead>
                                            <td style="width: 10%">Artwork ID</td>
                                            <td style="width: 20%">Thumbnail</td>
                                            <td style="width: 15%">Name</td>
                                            <td style="width: 15%">Sales Date</td>
                                            <td style="width: 15%">Purchased By</td>
                                            <td style="width: 10%">Quantity</td>
                                            <td style="width: 15%">Total</td>
                                        </thead>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <table class="table table-borderless table-hover table-responsive">
                                        <tr>
                                            <td style="width: 10%; text-align: center" class="align-middle">
                                                <asp:Label ID="lblSalesArtworkID" runat="server" Text='<%# Eval("ArtworkID") %>'> </asp:Label>
                                            </td>
                                            <td style="width: 20%">
                                                <a href='<%#Eval("URL") %>' id="sales-img" data-lightbox="img-gallery" data-title="<%# Eval("ArtworkName") %>">
                                                    <img class="img-thumbnail img-fluid" style="max-width: 80%" src='<%#Eval("URL") %>'>
                                                </a>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </td>
                                            <td style="width: 15%" class="align-middle">
                                                <asp:TextBox ID="lblSalesArtName" runat="server" Text='<%# Eval("ArtworkName") %>' Enabled="false" BorderStyle="None" BackColor="Transparent" CssClass="form-control"></asp:TextBox>
                                            </td>
                                            <td style="width: 15%" class="align-middle">
                                                <asp:Label ID="lblSalesDate" runat="server" Text='<%# Eval("Date") %>'></asp:Label>
                                            </td>
                                            <td style="width: 15%" class="align-middle">
                                                <asp:Label ID="lblPurchasedBy" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                            </td>
                                            <td style="width: 10%" class="align-middle">
                                                <asp:TextBox ID="lblSalesQuantity" runat="server" Text='<%# Eval("Quantity") %>' Enabled="false" BorderStyle="None" BackColor="Transparent" CssClass="form-control"></asp:TextBox>
                                            </td>
                                            <td style="width: 15%" class="align-middle">
                                                <asp:TextBox ID="lblSalesTotal" runat="server" Text='<%# String.Format("RM {0:0.00}",Eval("Total")) %>' Enabled="false" BorderStyle="None" BackColor="Transparent" CssClass="form-control"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <%-- Label used for showing Error Message --%>
                                    <asp:Label ID="lblErrorMsg2" runat="server" Text="Sorry, you have no sold artworks." Visible="false">
                                    </asp:Label>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
        </div>
        </div>
        </div>
    </form>
</asp:Content>
