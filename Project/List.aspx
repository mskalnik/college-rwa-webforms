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
        <div id="accordin" class="panel-group">
            <%-- FIRST PANEL --%>
            <div class="panel panel-default">
                <%-- Header --%>
                <div id="headingTwo" class="panel-heading" role="tab">
                    <div class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#gridViewContent">
                            <asp:Label Text="Grid View" runat="server" />
                        </a>
                    </div>
                </div>
                <%-- Content --%>
                <div id="gridViewContent" class="panel-collapse collapse in">
                    <div class="panel-body">
                        <asp:GridView ID="GwPersons" CssClass="table table-hover" runat="server" AutoGenerateColumns="False" DataSourceID="PersonListDataSource" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible="False" />
                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                <asp:BoundField DataField="Surname" HeaderText="Surname" SortExpression="Surname" />
                                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                <asp:BoundField DataField="Telephone" SortExpression="Telephone" HeaderText="Telephone" />
                                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" Visible="False" />
                                <asp:CheckBoxField DataField="Admin" HeaderText="Admin" SortExpression="Admin" />
                                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" Visible="False" />
                                <asp:CommandField ShowEditButton="True" />
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <HeaderStyle BackColor="#333333" ForeColor="White" Font-Bold="True" />
                            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle Wrap="False" />
                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F7F7F7" />
                            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                            <SortedDescendingHeaderStyle BackColor="#242121" />
                        </asp:GridView>
                        <asp:ObjectDataSource ID="PersonListDataSource" runat="server" DataObjectTypeName="System.Guid" DeleteMethod="DeletePerson" SelectMethod="GetPersons" TypeName="Project.Models.BLL.Manager" UpdateMethod="UpdatePerson"></asp:ObjectDataSource>
                    </div>
                </div>
            </div>

            <%-- SECOND PANEL --%>
            <div class="panel panel-default">
                <%-- Header --%>
                <div id="headingOne" class="panel-heading">
                    <h4 class="panel-title">
                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#repeaterContent">
                            <asp:Label Text="Repeater" runat="server" />
                        </a>
                    </h4>
                </div>
                <%-- Content --%>
                <div id="repeaterContent" aria-expanded="false" class="panel-collapse collapse">
                    <div class="panel-body">
                        repiter
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
