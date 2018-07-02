<%@ Control Language="C#" AutoEventWireup="true" ClassName="EditPersonControl" CodeBehind="EditPersonControl.ascx.cs" Inherits="Project.Models.Controls.EditPersonControl" %>

<div class="person col-lg-4 col-md-4 col-sm-4">
    <asp:Label ID="LblId" CssClass="hidden" runat="server" />
    <table>
        <%-- Name --%>
        <tr>
            <td>
                <asp:Label ID="LblName" AssociatedControlID="TxtName" Text="Name:" runat="server" />
            </td>
            <td>
                <asp:TextBox ID="TxtName"  CssClass="form-control input-sm" runat="server" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name required" ControlToValidate="TxtName" Display="Dynamic" ForeColor="Red" ValidationGroup="MyValidation">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <%-- Surname --%>
        <tr>
            <td>
                <asp:Label ID="LblSurname"  AssociatedControlID="TxtSurname" Text="Surname:" runat="server" />
            </td>
            <td>
                <asp:TextBox ID="TxtSurname"  CssClass="form-control input-sm" runat="server" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Surname required" ControlToValidate="TxtSurname" Display="Dynamic" ForeColor="Red" ValidationGroup="MyValidation">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <%-- Email dropdown --%>
        <tr>
            <td></td>
            <td>
                <asp:DropDownList ID="DdlEmail" CssClass="form-control input-sm" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DdlEmail_SelectedIndexChanged" />
            </td>
            <td></td>
        </tr>
        <%-- Email edit --%>
        <tr>
            <td>
                <asp:Label ID="LblEmail" AssociatedControlID="TxtEmail" Text="Email:" runat="server" />
            </td>
            <td>
                <div class="input-group input-group-sm">
                    <asp:TextBox ID="TxtEmail" CssClass="form-control" runat="server" />
                    <asp:LinkButton ID="BtnEditEmail" CssClass="input-group-addon btn btn-sm" runat="server" OnClick="BtnEditEmail_Click">
                        <span aria-hidden="true" style="color:blue;" class="glyphicon glyphicon-save" />
                    </asp:LinkButton>
                </div>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email required" ControlToValidate="TxtEmail" Display="Dynamic" ForeColor="Red" ValidationGroup="MyValidation">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <%-- Telephone --%>
        <tr>
            <td>
                <asp:Label ID="LblTelephone" AssociatedControlID="TxtTelephone" Text="Telephone:" runat="server" />
            </td>
            <td>
                <asp:TextBox ID="TxtTelephone" CssClass="form-control input-sm" runat="server" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Telephone required" ControlToValidate="TxtTelephone" Display="Dynamic" ForeColor="Red" ValidationGroup="MyValidation">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <%-- Password --%>
        <tr>
            <td>
                <asp:Label ID="LblPassword" AssociatedControlID="TxtPassword" Text="Password:" runat="server" />
            </td>
            <td>
                <asp:TextBox ID="TxtPassword" CssClass="form-control input-sm" runat="server" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Password required" ControlToValidate="TxtPassword" Display="Dynamic" ForeColor="Red" ValidationGroup="MyValidation">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <%-- Status --%>
        <tr>
            <td>
                <asp:Label ID="LblStatus" AssociatedControlID="DdlStatus" Text="Status:" runat="server" />
            </td>
            <td>
                <asp:DropDownList ID="DdlStatus" CssClass="form-control input-sm" runat="server">
                    <asp:ListItem Text="Admin" Value="True" />
                    <asp:ListItem Text="User" Value="False" />
                </asp:DropDownList>
            </td>
            <td></td>
        </tr>
        <%-- City --%>
        <tr>
            <td>
                <asp:Label ID="LblCity" AssociatedControlID="DdlCity" Text="City:" runat="server" />
            </td>
            <td>
                <asp:DropDownList ID="DdlCity" CssClass="form-control input-sm" runat="server" />
            </td>
            <td></td>
        </tr>
        <%-- Buttons --%>
        <tr>
            <td></td>
            <td>
                <asp:Button Text="Edit" ID="BtnEdit" CssClass="btn btn-primary" ValidationGroup="MyValidation" runat="server" OnClick="BtnEdit_Click" />
                <asp:Button Text="Delete" ID="BtnDelete" CssClass="btn btn-warning" ValidationGroup="MyValidation" runat="server" data-toggle="modal" data-target="#myModal" OnClientClick="confirm('Delete person');" OnClick="BtnDelete_Click" />
            </td>
            <td></td>
        </tr>
        <%-- Summary --%>
        <tr>
            <td colspan="3">
                <asp:ValidationSummary ID="ValidationSummary13" CssClass="alert alert-danger" runat="server" ForeColor="Red" ValidationGroup="MyValidation" />
            </td>
        </tr>
    </table>    
</div>