<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="WebApplication_E_Commerce_Projet.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div id="carouselExampleDark" class="carousel carousel-light slide " data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="10000">
       <asp:Image  ImageUrl="img/e1.jpg" Width="100%"  runat="server" Height="326px"/>
      <div class="carousel-caption d-none d-md-block">
        <h5>Find products to sell on LSI-Commerce</h5>
        <p>Never worry about shipping, packaging, or holding inventory.</p>
      </div>
    </div>
    <div class="carousel-item" data-bs-interval="2000">
      <asp:Image  ImageUrl="img/e2.jpg" Width="100%" Height="326px" runat="server"/>
      <div class="carousel-caption d-none d-md-block">
     <h5>Find products to sell on LSI-Commerce</h5>
        <p>Never worry about shipping, packaging, or holding inventory.</p>
      </div>
    </div>
    <div class="carousel-item">
       <asp:Image  ImageUrl="img/e4.jpg" Width="100%" Height="326px" runat="server"/>
      <div class="carousel-caption d-none d-md-block">
        <h5>Find products to sell on LSI-Commerce</h5>
        <p>Never worry about shipping, packaging, or holding inventory.</p>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

        <div class="search-Bar">
            	<div class="row justify-content-center">
                        <div class="col-12 col-md-10 col-lg-8">
                            <form class="card card-sm">
                                <div class="card-body row no-gutters align-items-center">
                                    <div class="col-auto">
                                        <i class="fas fa-search h4 text-body"></i>
                                    </div>
                                    <!--end of col-->
                                    <div class="col">
                                        
                                        <input class="form-control form-control-lg form-control-borderless" type="search" placeholder="Search for Product">
                                    </div>
                                    <!--end of col-->
                                    <div class="col-auto">
                                        <button class="btn btn-lg btn-success" type="submit">Search</button>
                                    </div>
                                    <!--end of col-->
                                </div>
                            </form>
                        </div>
                        <!--end of col-->
                    </div>
        </div>
        <div>
            
            <div align="center">
           <h1> 
            </h1>
        </div>
        
        <div class="row"> 
            <div class="col-2">

            </div>
            <div class="col-8">

            
            <asp:GridView ID="GrvHome"  runat="server" AutoGenerateColumns="False"  DataKeyNames="id" 
                OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="808px" CellPadding="4" OnRowCommand="GrvHome_RowCommand" OnRowEditing="GrvHome_RowEditing"  OnRowDeleting="GrvHome_RowDeleting" ForeColor="#333333" GridLines="None" CssClass="auto-style1">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                      <asp:TemplateField HeaderText="Articles">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("article") %>'   runat="server"  align="center"/><br>
                            <asp:Image   ImageUrl='<%# Eval("imgURL") %>' Width="200px" Height="200px" runat="server"/>
                        </ItemTemplate>
                     </asp:TemplateField>
                      <asp:TemplateField HeaderText="Descreption">
                        <ItemTemplate> 
                            <asp:Label Text='Articel : '  runat="server" /> 
                            <asp:Label Text='<%# Eval("article") %> '  runat="server" />
                            <br>
                            <asp:Label Text='Prix : '  runat="server" /> 
                            <asp:Label Text='<%# Eval("prix") %>'  runat="server" />
                            <br>
                            <asp:Label Text='Categorié : '  runat="server" />
                            <asp:Label Text='<%# Eval("categ") %> '  runat="server" />
                           
                        </ItemTemplate>

                     </asp:TemplateField>
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                             <asp:Label Text='Ajouter au panier '  runat="server" /> <br />
                            <asp:ImageButton ImageUrl="https://image.flaticon.com/icons/png/512/57/57493.png" ImageAlign="Middle" CommandName="delete" ToolTip="delete" width="60px" Height="60px" runat="server" />
                        </ItemTemplate>
                        

                     </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle ForeColor="#333333" BackColor="#F7F6F3" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
                </div>
            <div class="auto-style2" id="buttonImg">

                
                <asp:ImageButton ImageUrl="https://www.pngplay.com/wp-content/uploads/3/Panier-Transparentes-PNG-De-Fichier.png"  Width="150px" Height="150px" runat="server" OnClick="Unnamed1_Click1" />
               <asp:Label Text="  Mon Panier" runat="server" Font-Bold="True"  Font-Size="25px" ForeColor="#CC0000"></asp:Label>
            </div>
        </div>
        </div>
        <style>
    p,h5{
        color:#ffffff;
    }
    #buttonImg{
        margin-top:150px;
       
    }

            .auto-style1 {
                margin-right: 0px;
            }

            .auto-style2 {
                flex: 0 0 auto;
                width: 16.66666667%;
                text-align: center;
            }

.form-control-borderless:hover, .form-control-borderless:active, .form-control-borderless:focus {
  
    box-shadow: none;
}
    </style>
    </div>
    
</asp:Content>
