<%@ Page Title="" Language="C#" MasterPageFile="~/Mizuki.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Assignment.App_Pages.CustomerProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../css/profile.css" />
    <title>Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="main main-raised">
            <div class="profile-content" style="margin-top: 100px">
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Artwork.ArtworkID, Artwork.ArtworkName, Artwork.URL FROM Artwork INNER JOIN Favourite ON Artwork.ArtworkID = Favourite.ArtworkID AND Favourite.Username = @currentUser">
                    <SelectParameters>
                        <asp:SessionParameter Name="currentUser" SessionField="username" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Order].OrderID FROM [User] INNER JOIN [Order] ON [User].Username = [Order].Username WHERE [User].Username = @currentUserName">
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
                                    <img src="../images/beauty_20210117164458.jpg" alt="Circle Image" class="img-raised rounded-circle img-fluid">
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
                        <p>
                            <asp:Label ID="lblProfDesc" runat="server" Text="Professional Artist with Ambition"></asp:Label>
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
                            <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource4">
                                <ItemTemplate>
                                    <table class="table table-borderless w-75 p3 ms-auto me-auto table-striped">
                                        <tbody>
                                            <tr>
                                                <th scope="row">Name</th>
                                                <td>
                                                    <asp:Label ID="lblProfName" runat="server" Text='<%# Eval("Name") %>'></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Date of Birth</th>
                                                <td>
                                                    <asp:Label ID="lblProfDOB" runat="server" Text='<%# Eval("DOB","{0:d MMMM yyyy}") %>'></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Gender</th>
                                                <td>
                                                    <asp:Label ID="lblProfGender" runat="server" Text='<%# Eval("Gender") %>'></asp:Label></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </ItemTemplate>
                            </asp:Repeater>
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
                                                <th scope="col">Contents</th>
                                                <th style="width: 15%" scope="col">Price</th>
                                            </tr>
                                        </thead>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:HiddenField ID="txtOuterID" runat="server" Value='<%# Eval("OrderID") %>' Visible="false" />
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Artwork.ArtworkName FROM Artwork INNER JOIN OrderDetails ON Artwork.ArtworkID = OrderDetails.ArtworkID INNER JOIN [Order] ON OrderDetails.OrderID = [Order].OrderID AND [Order].OrderID = CAST(@orderID AS INT)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="txtOuterID" Name="orderID" PropertyName="Value" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <table class="table borderless ms-auto me-auto w-75 p-3">
                                        <tr>
                                            <td style="width: 10%" class="align-middle"><%# Container.ItemIndex + 1 %></td>
                                            <td style="width: 10%" class="align-middle"><%# Eval("OrderID") %></td>
                                            <td style="width: 15%" class="align-middle"></td>
                                            <td style="margin-left: -10px">
                                                <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource3">
                                                    <ItemTemplate>
                                                        <table class="table">
                                                            <tr>
                                                                <td><%# Eval("ArtworkName") %></td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </td>
                                            <td style="width: 15%" class="align-middle"></td>
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
