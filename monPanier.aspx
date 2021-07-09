<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="monPanier.aspx.cs" Inherits="WebApplication_E_Commerce_Projet.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <div align="center">

        <h3>welcome Client :</h3>
        <h5>voici votre Panier</h5>

    </div>
        <div align="center">
              <asp:GridView ID="grd" runat="server" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="3px" CellPadding="4" OnSelectedIndexChanged="grd_SelectedIndexChanged" Width="950px" 
                AutoGenerateColumns="false"  DataKeyNames="id" CssClass="auto-style7"
                  OnRowCommand="grd_RowCommand" OnRowEditing="grd_RowEditing" OnRowDeleting="grd_RowDeleting"
               >
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
                <Columns>
                    <asp:TemplateField HeaderText="Article">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("article") %>'  runat="server" />
                        </ItemTemplate>
                     </asp:TemplateField>

                    <asp:TemplateField HeaderText="Descreption">
                           <ItemTemplate>
                            <asp:Label Text='<%# Eval("prix") %>'  align="center" runat="server" />
                               <br />
                               <asp:Label Text='<%# Eval("categ") %>'  runat="server" />
                        </ItemTemplate>
                        
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="">
                         <ItemTemplate>
                     <asp:ImageButton ImageUrl="img/delete.png" runat="server" CommandName="delete" ToolTip="delete" Width="30px" Height="30px" />

                        </ItemTemplate>
                        
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
        </div>
        <div >
</div>
</asp:Content>
