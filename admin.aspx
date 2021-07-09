<%@ Page Title="Admin Page | Lsi-Commerce" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="WebApplication_E_Commerce_Projet.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h1> welcome Admin</h1>
        <div>
            <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 479px;
        }
        .auto-style3 {
            width: 479px;
            height: 22px;
        }
        .auto-style4 {
            height: 22px;
        }
        .auto-style5 {
            width: 479px;
            height: 30px;
        }
        .auto-style6 {
            height: 30px;
            text-align: left;
        }
        .auto-style7 {
            margin-left: 2px;
        }
    </style>

    
        <div align="center">
            <h1>
                    Gestion des atricles </h1>
        </div>
        <div align="center">

            <table class="auto-style1">
                <tr>
                    <td colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="16px" Text="Article"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxArt" runat="server" Width="309px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="16px" Text="Prix"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxPrix" runat="server" Width="309px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="16px" Text="Categorie"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBoxCat" runat="server" Width="309px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="16px" Text="ImageArticle(URL)"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBoxImg" runat="server" Width="309px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5"></td>
                    <td class="auto-style6">
                        <asp:Button ID="Button1" runat="server" BackColor="#0066CC" BorderColor="White" ForeColor="White" OnClick="Button1_Click" Text="Insert" Width="120px" />
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>

        </div>
        <div align="center">

            <asp:GridView ID="grd" runat="server" CellPadding="4" OnSelectedIndexChanged="grd_SelectedIndexChanged" Width="950px" 
                AutoGenerateColumns="False" ShowFooter="True" DataKeyNames="id" OnRowCommand="grd_RowCommand" OnRowEditing="grd_RowEditing" OnRowDeleting="grd_RowDeleting" OnRowUpdating="grd_RowUpdating" OnRowCancelingEdit="grd_RowCancelingEdit" CssClass="auto-style7" ForeColor="#333333" GridLines="None"
               >
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField HeaderText="Articles">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("article") %>'  runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtArticle" Text='<%# Eval("article") %>'  runat="server"/>
                        </EditItemTemplate>
                        <FooterTemplate>
                             <asp:TextBox ID="txtArticlefooter" width="200px" runat="server"/>
                        </FooterTemplate>
                    
                     </asp:TemplateField>

                    <asp:TemplateField HeaderText="Prix ( DH )">
                           <ItemTemplate>
                            <asp:Label Text='<%# Eval("prix") %>'  align="center" runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPrix" Text='<%# Eval("prix") %>' align="center"  runat="server"/>
                        </EditItemTemplate>
                        <FooterTemplate>
                             <asp:TextBox ID="txtPrixfooter" width="200px"  runat="server"/>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Categorie">
                         <ItemTemplate>
                            <asp:Label Text='<%# Eval("categ") %>'  runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCateg" Text='<%# Eval("categ") %>'  runat="server"/>
                        </EditItemTemplate>
                        <FooterTemplate>
                             <asp:TextBox ID="txtCategfooter" width="200px" runat="server"/>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Images">
                         <ItemTemplate>
                            <asp:Label Text='<%# Eval("imgURL") %>'  runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtimg" Text='<%# Eval("imgURL") %>'  runat="server"/>
                        </EditItemTemplate>
                        <FooterTemplate>
                             <asp:TextBox ID="txtimgfooter" width="200px" runat="server"/>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                           <asp:ImageButton ImageUrl="img/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px" />
                           <asp:ImageButton ImageUrl="img/delete.png" runat="server" CommandName="delete" ToolTip="delete" Width="30px" Height="30px" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton ImageUrl="img/cancel.png" runat="server" CommandName="save" ToolTip="Cancel" Width="30px" Height="30px" />
                           <asp:ImageButton ImageUrl="img/save.png" runat="server" CommandName="cancel" ToolTip="Save" Width="30px" Height="30px" />

                        </EditItemTemplate>
                        <FooterTemplate >

                           <asp:ImageButton ImageUrl="img/addnew.png" runat="server" CommandName="add" ToolTip="add" Width="30px" Height="30px" />

                        </FooterTemplate>

                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />  <br />   <br />   <br />
            <div align="center">
                <h1>notre Clients</h1>
                <asp:GridView ID="GridViewC" runat="server"  AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridViewC_SelectedIndexChanged" Width="668px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                     <asp:TemplateField HeaderText="clients">
                          <ItemTemplate>
                            <asp:Label Text='<%# Eval("username") %>'  runat="server" />
                        </ItemTemplate>
                     </asp:TemplateField>  
                        <asp:TemplateField HeaderText="Information">
                          <ItemTemplate>
                              <asp:Label Text='adresse Email :'  runat="server" /> <br />
                            <asp:Label Text='<%# Eval("email") %>'  runat="server" /> <br />

                        </ItemTemplate>
                     </asp:TemplateField> 
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </div>



        &nbsp;</div>

        </div>
    </div>

</asp:Content>
