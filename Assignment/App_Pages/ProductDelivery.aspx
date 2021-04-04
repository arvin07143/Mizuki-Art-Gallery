<%@ Page Title="" Language="C#" MasterPageFile="~/Mizuki.Master" AutoEventWireup="true" CodeBehind="ProductDelivery.aspx.cs" Inherits="Assignment.App_Pages.ProductDelivery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
         margin-top: 50px;
         margin-bottom: 50px
     }

     .card {
         position: relative;
         display: -webkit-box;
         display: -ms-flexbox;
         display: flex;
         -webkit-box-orient: vertical;
         -webkit-box-direction: normal;
         -ms-flex-direction: column;
         flex-direction: column;
         min-width: 0;
         word-wrap: break-word;
         background-color: #fff;
         background-clip: border-box;
         border: 1px solid rgba(0, 0, 0, 0.1);
         border-radius: 0.10rem
     }

     .card-header:first-child {
         border-radius: calc(0.37rem - 1px) calc(0.37rem - 1px) 0 0
     }

     .card-header {
         padding: 0.75rem 1.25rem;
         margin-bottom: 0;
         background-color: #fff;
         border-bottom: 1px solid rgba(0, 0, 0, 0.1)
     }

     

   
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <div class="container">
    <article class="card">
        <header class="card-header"> Order Delivery</header>
        <div class="card-body">
            <h6>Order ID:
                <asp:Label ID="lblOrderId" runat="server"></asp:Label>
            </h6>
            <article class="card">
                <div class="card-body row">
                    <div class="col"> <strong>Order time:<br />
                        </strong> &nbsp;<asp:Label ID="lblOrderTime" runat="server"></asp:Label>
                        <br> </div>
                    <div class="col"> <strong>Estimated Arrive time:<br />
                        </strong> &nbsp;<asp:Label ID="lblEstimatedArriveTime" runat="server"></asp:Label>
                    </div>
                    <div class="col"> <strong>Courier Services:</strong> <br> POS LAJU</div>
                    <div class="col"> <strong>Tracking #:</strong> <br> BD045903594059 </div>
                </div>
            </article>
           



            &nbsp;<asp:Button ID="btnMainPage" runat="server" PostBackUrl="~/App_Pages/MainPage.aspx" Text="Back to main page" />
        </div>
    </article>
</div>
    </form>
</asp:Content>
