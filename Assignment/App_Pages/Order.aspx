<%@ Page Title="" Language="C#" MasterPageFile="~/Mizuki.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="Assignment.App_Pages.Order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
  <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    </head>

<body>  
 
 <section>
   <div class="container-fluid">
     <div class="row">
       <!-- Product picture -->
       <div class="col-sm-5">
         <div class="thumbnail">
           <img class="gallery-image" src="https://i.pinimg.com/564x/78/56/1e/78561ebe81f88c3d193cb5eb6c3a68e9.jpg" alt="girl-in-dress-field">
           <div class="caption">
             <div class="row buttons">
               
                 <button class="btn  col-sm-4 col-sm-offset-2 btn-lg" style="background-color:#ff9f00; color:#fff;font-size:1em;"><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;ADD TO CART</button>
               
                                
               <button class="btn col-sm-4 col-sm-offset-1 btn-lg" style="background-color:#fb641b; color:#fff;font-size:1em;"><i class="fa fa-bolt" style="font-size:1.2em;"></i> BUY NOW</button>
               </div>
             
           </div>
         </div>
         
         </div>
     
       <div class="col-sm-7 desc">
        
         <div>           
           <h1>Girl In Dress Field</h1>
           
           <div class="row">
              <div class="col-sm-2">
                <span class="label label-success">4.6 <span class="glyphicon glyphicon-star"></span></span>
              </div>
           
              <div class="col-sm-5">
                <strong>2,421 Ratings & Reviews</strong>
              </div>
           
          </div>
           
         <div>
          <h3>RM 92,400</h3> 
         </div>
           
         <div>
                  
          <h5><span class="glyphicon glyphicon-calendar"></span> EMIs from <strong>RM 3,070/month </strong></h5>  
           
           <h5><span class="glyphicon glyphicon-tag"></span><strong> Bank Offer</strong> 5% Instant Discount on Visa Cards for First 3 Online Payments.</h5>
           
           <h5><span class="glyphicon glyphicon-tag"></span><strong> Bank Offer</strong> Extra 5% off* with Axis Bank Buzz Credit Card.</h5>
         
         </div>    
          
       
         <br>
           
           <div class="row">            
             <div class="col-sm-6">
               <strong>Resolution</strong>
               <br>
               <br>
               <button class="btn btn-default" style="color:#337ab7;border:1px dashed #337ab7;">1080p</button>
               <button class="btn btn-default">4K</button>
             </div>
             
         </div>
         
           <br><br>
           

  </section> 
</body>
</asp:Content>
