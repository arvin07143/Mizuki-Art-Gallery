<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Mizuki.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Assignment.App_Pages.CustomerProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../css/profile.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons">

    <script>
        function UploadFileCheck(source, arguments) { //client validation
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
    <form id="form1" runat="server" style="min-height: 800px">
            <div class="modal fade bd-example-modal-lg" id="modalForm">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Upload New Profile Picture</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="row mb-3">
                            <label for="imgFile" class="form-label">Upload your image here</label>
                            <asp:FileUpload ID="imgFile" runat="server" CssClass="form-control" />
                            <asp:CustomValidator ValidationGroup="Add Form" ForeColor="Red" ID="CustomValidator1" ControlToValidate="imgFile" runat="server" SetFocusOnError="true" Display="Dynamic" ErrorMessage="Invalid: File Type (allowed types: jpg, jpeg, gif, png)" ClientValidationFunction="UploadFileCheck"></asp:CustomValidator>
                            <div id="uploadHelp" class="form-text">
                                Supported file extensions : .JPG,.PNG,.JPEG,.GIF
                            </div>
                        </div>
                        <div class="row mb-3">
                            <asp:Button CssClass="btn btn-success" runat="server" OnClick="saveNewProfileImage" ValidationGroup="Add Form" Text="Save" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="main main-raised">
            <div class="profile-content" style="margin-top: 100px">
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Artwork.ArtworkID, Artwork.ArtworkName, Artwork.URL FROM Artwork INNER JOIN Favourite ON Artwork.ArtworkID = Favourite.ArtworkID AND Favourite.Username = @currentUser AND Artwork.StockQuantity >-1">
                    <SelectParameters>
                        <asp:SessionParameter Name="currentUser" SessionField="username" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Order].OrderID, [Order].Total, FORMAT([Order].Date, 'dd/MM/yyyy') AS Date FROM [User] INNER JOIN [Order] ON [User].Username = [Order].Username WHERE [User].Username = @currentUserName ORDER BY [Order].Date DESC">
                    <SelectParameters>
                        <asp:SessionParameter Name="currentUserName" SessionField="username" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Name, DOB, Gender FROM [User] WHERE [User].Username = @currUsername">
                    <SelectParameters>
                        <asp:SessionParameter Name="currUsername" SessionField="username" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 ms-auto me-auto">
                            <div class="profile">
                                <div class="avatar">
                                    <asp:ImageButton ID="profilePic" runat="server" CssClass="img-raised profileimg" ImageUrl="" data-toggle="modal" data-target="#modalForm" OnClientClick="return false;"/>
                                </div>
                                <div class="name">
                                    <h3 class="title">
                                        <asp:Label ID="lblName" runat="server" Text=""></asp:Label>

                                    </h3>
                                    <h6>
                                        <asp:Label ID="lblProf" runat="server" Text=""></asp:Label>
                                    </h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="description text-center">
                        <p class="col-6 justify-content-center mx-auto me-auto">
                            <asp:TextBox ID="txtDsc" runat="server" BorderStyle="None" BackColor="Transparent" Text="Professional Artist with Ambition" CssClass="form-control text-center text-wrap text-break" Enabled="false"></asp:TextBox>
                        </p>
                    </div>
                    <div class="row">
                        <div class="col-md-6 ms-auto me-auto">
                            <div class="profile-tabs">
                                <ul class="nav nav-pills nav-pills-icons justify-content-center" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" href="#info" role="tab" data-toggle="tab">
                                            <i class="material-icons">account_circle</i>
                                            Info
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#history" role="tab" data-toggle="tab">
                                            <i class="material-icons">shopping_cart</i>
                                            Purchase History
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#wishlist" role="tab" data-toggle="tab">
                                            <i class="material-icons">favorite</i>
                                            Wish List
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="tab-content tab-space">
                        <div class="tab-pane active" id="info">
                            <div class="d-flex flex-row-reverse w-75 ms-auto me-auto">
                                <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" CssClass="btn btn-outline-info" />
                            </div>
                            <table class="table table-borderless w-75 p3 ms-auto me-auto table-striped">
                                <tbody>
                                    <tr>
                                        <th style="width: 40%">Name</th>
                                        <td>
                                            <asp:TextBox ID="txtName" BorderStyle="None" BackColor="Transparent" runat="server" Text='' Enabled="false"></asp:TextBox>
                                            <asp:RequiredFieldValidator ForeColor="Red" ID="rfvName" ControlToValidate="txtName" runat="server" ErrorMessage="Name must not be blank"></asp:RequiredFieldValidator>
                                    </tr>
                                    <tr>
                                        <th style="width: 40%">Date of Birth</th>
                                        <td>
                                            <asp:Label ID="lblDOB" runat="server" Visible="true"></asp:Label>
                                            <asp:TextBox ID="txtDOB" BorderStyle="None" BackColor="Transparent" runat="server" Text="" Enabled="false" TextMode="Date" CssClass="form-control" Visible="false"></asp:TextBox>
                                            <asp:RangeValidator ID="DateRangeValidator" runat="server" ControlToValidate="txtDOB" ForeColor="red" ErrorMessage="Date of birth cannot be larger than current date" Type="Date" Display="Dynamic"></asp:RangeValidator>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtDOB" ForeColor="red" runat="server" ErrorMessage="This field is required" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </td>
                                    </tr>
                                    <tr>
                                        <th style="width: 40%">Gender</th>
                                        <td>
                                            <asp:TextBox ID="txtGender" BorderStyle="None" BackColor="Transparent" runat="server" Text='' Enabled="false"></asp:TextBox>
                                            <asp:DropDownList ID="DropDownList1" runat="server" Visible="false" CssClass="form-select">
                                                <asp:ListItem Value="M">Male</asp:ListItem>
                                                <asp:ListItem Value="F">Female</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="width: 40%">Email</th>
                                        <td>
                                            <asp:TextBox ID="txtEmail" BorderStyle="None" BackColor="Transparent" runat="server" Text='' Enabled="false"></asp:TextBox>
                                            <asp:RequiredFieldValidator ForeColor="Red" ID="rfvEmail" ControlToValidate="txtEmail" runat="server" ErrorMessage="Email must not be blank" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="emailRegex" runat="server" ControlToValidate="txtEmail"
                                                ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                                                ErrorMessage="Invalid email address" Display="Dynamic" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="row">
                                <div class="col-sm-12 text-center">
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CssClass="btn btn-outline-danger pr-2" Visible="false" CausesValidation="false" />
                                    <asp:Button ID="btnSave" runat="server" Text="Save Changes" OnClick="btnSave_Click" CssClass="btn btn-outline-success pl-2" Visible="false" />
                                </div>
                            </div>
                        </div>

                        <div class="tab-pane" id="history">
                            <asp:Repeater ID="Repeater2" DataSourceID="SqlDataSource1" runat="server">
                                <HeaderTemplate>
                                    <table class="table bordered ms-auto me-auto w-75 p-3">
                                        <thead>
                                            <tr>
                                                <th style="width: 10%" scope="col">No.</th>
                                                <th style="width: 10%" scope="col">Order ID</th>
                                                <th style="width: 15%" scope="col">Date</th>
                                                <th style="width: 35%" scope="col">Contents</th>
                                                <th style="width: 15%" scope="col">Subtotal</th>
                                                <th style="width: 15%" scope="col">Price</th>
                                            </tr>
                                        </thead>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:HiddenField ID="txtOuterID" runat="server" Value='<%# Eval("OrderID") %>' Visible="false" />
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Artwork.ArtworkName, OrderDetails.Quantity, (OrderDetails.Quantity * Artwork.Price) AS Subtotal FROM Artwork INNER JOIN OrderDetails ON Artwork.ArtworkID = OrderDetails.ArtworkID INNER JOIN [Order] ON OrderDetails.OrderID = [Order].OrderID AND [Order].OrderID = CAST(@orderID AS INT)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="txtOuterID" Name="orderID" PropertyName="Value" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <table class="table borderless ms-auto me-auto w-75 p-3">
                                        <tr>
                                            <td style="width: 10%" class="align-middle"><%# Container.ItemIndex + 1 %></td>
                                            <td style="width: 10%" class="align-middle"><%# Eval("OrderID") %></td>
                                            <td style="width: 15%" class="align-middle"><%# Eval("Date") %></td>
                                            <td style="width: 35%; margin-left: -10px">
                                                <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource3">
                                                    <ItemTemplate>
                                                        <table class="table">
                                                            <tr>
                                                                <td><%# Eval("Quantity") %>x&nbsp;&nbsp;<%# Eval("ArtworkName") %></td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </td>
                                            <td style="width: 15%; margin-left: -10px">
                                                <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource3">
                                                    <ItemTemplate>
                                                        <table class="table">
                                                            <tr>
                                                                <td><%# String.Format("RM {0:0.00}",Eval("Subtotal")) %></td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </td>
                                            <td style="width: 15%" class="align-middle"><%# String.Format("RM {0:0.00}",Eval("Total")) %></td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>

                        <div class="tab-pane" id="wishlist">

                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
                                <HeaderTemplate>
                                    <table class="table w-75 p3 ms-auto me-auto">
                                        <thead>
                                            <tr>
                                                <th style="width: 10%" scope="col">No.</th>
                                                <th style="width: 10%" scope="col">Art ID</th>
                                                <th scope="col"></th>
                                                <th scope="col"></th>
                                                <th scope="col"></th>
                                            </tr>
                                        </thead>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <table class="table w-75 p3 ms-auto me-auto">
                                        <tr>
                                            <td style="width: 10%" class="align-middle"><%# Container.ItemIndex + 1 %></td>
                                            <td style="width: 10%" class="align-middle">
                                                <asp:Label ID="lblArtworkID" runat="server" Text='<%# Eval("ArtworkID") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <img class="img-thumbnail img-fluid" src='<%#Eval("URL") %>'>
                                            </td>
                                            <td class="align-middle"><%# Eval("ArtworkName")%></td>
                                            <td class="align-middle">
                                                <asp:LinkButton ID="btnBuy" runat="server" OnClick="btnAddToCart"><i class="material-icons">shopping_cart</i></asp:LinkButton></td>
                                            <td class="align-middle">
                                                <asp:LinkButton ID="btnDeleteFav" runat="server" OnClick="btnDeleteFav"><i class="material-icons">clear</i></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js" integrity="sha384-fA23ZRQ3G/J53mElWqVJEGJzU0sTs+SvzG8fXVWP+kJQ1lwFAOkcUOysnlKJC33U" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js" integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9" crossorigin="anonymous"></script>
    </form>
</asp:Content>
