<%@ Page Title="Person List" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="Project.List" %>
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
                            <asp:Label Text="GridView" runat="server" />
                        </a>
                    </h4>
                    </div>
                </div>
                <%-- Content --%>
                <div id="collapseOne" class="panel-collapse collapse in">
                    <div class="panel-body">

                        <asp:GridView ID="GwPersons" CssClass="table table-hover" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnRowCancelingEdit="GwPersons_RowCancelingEdit" OnRowEditing="GwPersons_RowEditing" OnRowUpdating="GwPersons_RowUpdating" OnRowDataBound="GwPersons_RowDataBound">
                            <Columns>
                                <asp:TemplateField HeaderText="Id" Visible="False">
                                    <EditItemTemplate>
                                        <asp:Label ID="LblId" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="LblId" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name:">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TxName" CssClass="form-control input-sm" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="LblName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Surname:">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TxtSurname" CssClass="form-control input-sm" runat="server" Text='<%# Bind("Surname") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="LblSurname" runat="server" Text='<%# Bind("Surname") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Email:">
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Phone:">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TxtPhone" CssClass="form-control input-sm" runat="server" Text='<%# Bind("Telephone") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="LblPhone" runat="server" Text='<%# Bind("Telephone") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Status:" ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DdlEmail" CssClass="form-control input-sm" runat="server"
                                            SelectedValue='<%# Eval("Admin").ToString() %>'>
                                            <asp:ListItem Value="True">Admin</asp:ListItem>
                                            <asp:ListItem Value="False">User</asp:ListItem>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:DropDownList ID="DdlEmail" CssClass="form-control input-sm" disabled="disabled" runat="server"
                                            SelectedValue='<%# Eval("Admin").ToString() %>'>
                                            <asp:ListItem Value="True">Admin</asp:ListItem>
                                            <asp:ListItem Value="False">User</asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ShowEditButton="True" ControlStyle-CssClass="noAdmin" />
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
                            <asp:Label Text="Repeater" runat="server" />
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
                                            <asp:Label Text="Name:" runat="server" />
                                        </th>
                                        <th>
                                            <asp:Label Text="Surname:" runat="server" />
                                        </th>
                                        <th>
                                            <asp:Label Text="Email:" runat="server" />
                                        </th>
                                        <th>
                                            <asp:Label Text="Telephone:" runat="server" />
                                        </th>
                                        <th>
                                            <asp:Label Text="Status:" runat="server" />
                                        </th>
                                        <th>
                                            <asp:Label Text="City" runat="server" />
                                        </th>
                                        <th></th>
                                    </tr>                                
                            </HeaderTemplate>
                                    
                            <ItemTemplate>
                                    
                                    <tr>
                                        <asp:Label Text='<%# Eval("Id") %>' CssClass="hidden" ID="RpId" runat="server" />
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
                                            <asp:HyperLink NavigateUrl='<%# "~/Update.aspx?Id=" + Eval("id") %>' Text="Edit" 
                                                CssClass="btn btn-primary noAdmin"
                                                runat="server" />
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
