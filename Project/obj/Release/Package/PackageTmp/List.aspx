<%@ Page Title="Person List" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="Project.List" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <script>
        window.onload = function() {
            document.getElementById("BtnMasterPerson").className = "btn btn-primary";
        }
    </script>

    <div class="content-container">
        <div id="accordion" class="panel-group">
            <%-- FIRST PANEL --%>
            <div class="panel panel-default">
                <%-- Header --%>
                <div class="panel-heading">
                    <div class="panel-title">
                        <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                            <asp:Label Text="GridView" runat="server" meta:resourcekey="LabelResource1" />
                        </a>
                    </h4>
                    </div>
                </div>
                <%-- Content --%>
                <div id="collapseOne" class="panel-collapse collapse in">
                    <div class="panel-body">

                        <asp:GridView ID="GwPersons" CssClass="table table-hover" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnRowCancelingEdit="GwPersons_RowCancelingEdit" OnRowEditing="GwPersons_RowEditing" OnRowUpdating="GwPersons_RowUpdating" OnRowDataBound="GwPersons_RowDataBound" meta:resourcekey="GwPersonsResource1">
                            <Columns>
                                <asp:TemplateField HeaderText="Id" Visible="False" meta:resourcekey="TemplateFieldResource1">
                                    <EditItemTemplate>
                                        <asp:Label ID="LblId" runat="server" Text='<%# Bind("Id") %>' meta:resourcekey="LblIdResource1"></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="LblId" runat="server" Text='<%# Bind("Id") %>' meta:resourcekey="LblIdResource2"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name:" meta:resourcekey="TemplateFieldResource2">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TxName" CssClass="form-control input-sm" runat="server" Text='<%# Bind("Name") %>' meta:resourcekey="TxNameResource1"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="LblName" runat="server" Text='<%# Bind("Name") %>' meta:resourcekey="LblNameResource1"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Surname:" meta:resourcekey="TemplateFieldResource3">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TxtSurname" CssClass="form-control input-sm" runat="server" Text='<%# Bind("Surname") %>' meta:resourcekey="TxtSurnameResource1"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="LblSurname" runat="server" Text='<%# Bind("Surname") %>' meta:resourcekey="LblSurnameResource1"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Email:" meta:resourcekey="TemplateFieldResource4">
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Phone:" meta:resourcekey="TemplateFieldResource5">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TxtPhone" CssClass="form-control input-sm" runat="server" Text='<%# Bind("Telephone") %>' meta:resourcekey="TxtPhoneResource1"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="LblPhone" runat="server" Text='<%# Bind("Telephone") %>' meta:resourcekey="LblPhoneResource1"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Status:" ShowHeader="False" meta:resourcekey="TemplateFieldResource6">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DdlEmail" CssClass="form-control input-sm" runat="server"
                                            SelectedValue='<%# Eval("Admin").ToString() %>' meta:resourcekey="DdlEmailResource1">
                                            <asp:ListItem Value="True" meta:resourcekey="ListItemResource1" Selected="True">Admin</asp:ListItem>
                                            <asp:ListItem Value="False" meta:resourcekey="ListItemResource2">User</asp:ListItem>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:DropDownList ID="DdlEmail" CssClass="form-control input-sm" disabled="disabled" runat="server"
                                            SelectedValue='<%# Eval("Admin").ToString() %>' meta:resourcekey="DdlEmailResource2">
                                            <asp:ListItem Value="True" meta:resourcekey="ListItemResource3" Selected="True">Admin</asp:ListItem>
                                            <asp:ListItem Value="False" meta:resourcekey="ListItemResource4">User</asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField
                                    ShowEditButton="True" meta:resourcekey="CommandFieldResource1"
                                />
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F7F7F7" />
                            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                            <SortedDescendingHeaderStyle BackColor="#242121" />
                            
                        </asp:GridView>
                    </div>
                </div>
            </div>

            <%-- SECOND PANEL --%>
            <div class="panel panel-default">
                <%-- Header --%>
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                            <asp:Label Text="Repeater" runat="server" meta:resourcekey="LabelResource2" />
                        </a>
                    </h4>
                </div>
                <%-- Content --%>
                <div id="collapseTwo" class="panel-collapse collapse">
                    <div class="panel-body">
                        
                        <asp:Repeater ID="RepeaterPerson" OnItemDataBound="RepeaterPerson_ItemDataBound" runat="server">
                            <HeaderTemplate>
                                <table class="table table-hover">
                                    <tr style="background:#333; color:white;">
                                        <th>
                                            <asp:Label Text="Name:" runat="server" meta:resourcekey="LabelResource3" />
                                        </th>
                                        <th>
                                            <asp:Label Text="Surname:" runat="server" meta:resourcekey="LabelResource4" />
                                        </th>
                                        <th>
                                            <asp:Label Text="Email:" runat="server" meta:resourcekey="LabelResource5" />
                                        </th>
                                        <th>
                                            <asp:Label Text="Telephone:" runat="server" meta:resourcekey="LabelResource6" />
                                        </th>
                                        <th>
                                            <asp:Label Text="Status:" runat="server" meta:resourcekey="LabelResource7" />
                                        </th>
                                        <th>
                                            <asp:Label Text="City" runat="server" meta:resourcekey="LabelResource8" />
                                        </th>
                                        <th></th>
                                    </tr>                                
                            </HeaderTemplate>
                                    
                            <ItemTemplate>
                                    
                                    <tr>
                                        <asp:Label Text='<%# Eval("Id") %>' CssClass="hidden" ID="RpId" runat="server" meta:resourcekey="RpIdResource1" />
                                        <td>
                                            <%# Eval("Name") %>
                                        </td>
                                        <td>
                                            <%# Eval("Surname") %>
                                        </td>
                                        <td id="RpEmail" runat="server">
                                        </td>
                                        <td>
                                            <%# Eval("Telephone") %>
                                        </td>
                                        <td>
                                            <%# Eval("Admin").ToString() == "True" ? "Administrator" : "User" %>
                                        </td>
                                        <td>
                                            <%# Eval("City") %>
                                        </td>
                                        <td>
                                            <asp:HyperLink 
                                                NavigateUrl='<%# "~/Update.aspx?Id=" + Eval("id") %>' 
                                                Text="Edit"
                                                CssClass='<%# GotAdminPrivileges() ? "btn btn-primary" : "hidden" %>'
                                                runat="server" meta:resourcekey="HyperLinkResource1" />
                                        </td>
                                    </tr>

                            </ItemTemplate>

                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>                        
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
