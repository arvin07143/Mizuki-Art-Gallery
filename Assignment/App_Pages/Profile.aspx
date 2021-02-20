<%@ Page Title="" Language="C#" MasterPageFile="~/Mizuki.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Assignment.App_Pages.CustomerProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../css/profile.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons">
    <link rel="stylesgeet" href="https://rawgit.com/creativetimofficial/material-kit/master/assets/css/material-kit.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="main main-raised">
            <div class="profile-content">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 ms-auto me-auto">
                            <div class="profile">
                                <div class="avatar">
                                    <img src="../img/beauty_20210117164458.jpg" alt="Circle Image" class="img-raised rounded-circle img-fluid">
                                </div>
                                <div class="name">
                                    <h3 class="title">
                                        <asp:Label ID="lblName" runat="server" Text="testname"></asp:Label></h3>
                                    <h6>
                                        <asp:Label ID="lblProf" runat="server" Text="Artist / User"></asp:Label>

                                    </h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="description text-center">
                        <p>
                            <asp:Label ID="lblProfDesc" runat="server" Text="Test description"></asp:Label>
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
                            <table class="table table-borderless w-75 p3 ms-auto me-auto table-striped">
                                <tbody>
                                    <tr>
                                        <th scope="row">Name</th>
                                        <td>
                                            <asp:Label ID="lblProfName" runat="server" Text="test name"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Date of Birth</th>
                                        <td>
                                            <asp:Label ID="lblProfDOB" runat="server" Text="test date"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Gender</th>
                                        <td>
                                            <asp:Label ID="lblProfGender" runat="server" Text="test gender"></asp:Label></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="tab-pane" id="history">
                            <p>test2</p>
                        </div>

                        <div class="tab-pane" id="wishlist">
                            <p>test</p>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ArtworkID], [ArtworkName] FROM [Artwork]"></asp:SqlDataSource>
                            <asp:Repeater ID="Repeater1" runat="server">
                                <HeaderTemplate>
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col">No.</th>
                                                <th scope="col">Art</th>
                                                <th scope="col"></th>
                                                <th scope="col"></th>
                                            </tr>
                                        </thead>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td><i class="material-icons">shopping_cart</i></td>
                                        <td><i class="material-icons">clear</i></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="../js/profile.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js" integrity="sha384-fA23ZRQ3G/J53mElWqVJEGJzU0sTs+SvzG8fXVWP+kJQ1lwFAOkcUOysnlKJC33U" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js" integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9" crossorigin="anonymous"></script>
    </form>
</asp:Content>
