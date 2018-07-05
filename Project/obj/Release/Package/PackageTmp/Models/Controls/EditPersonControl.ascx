<%@ Control Language="C#" AutoEventWireup="true" ClassName="EditPersonControl" CodeBehind="EditPersonControl.ascx.cs" Inherits="Project.Models.Controls.EditPersonControl" %>

<div class="person col-lg-4 col-md-4 col-sm-4">
    <asp:Label ID="LblId" CssClass="hidden" runat="server" meta:resourcekey="LblIdResource1" />
    <table>
        <%-- Name --%>
        <tr>
            <td>
                <asp:Label ID="LblName" AssociatedControlID="TxtName" Text="Name:" runat="server" meta:resourcekey="LblNameResource1" />
            </td>
            <td>
                <asp:TextBox ID="TxtName"  CssClass="form-control input-sm" runat="server" meta:resourcekey="TxtNameResource1" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name required" ControlToValidate="TxtName" Display="Dynamic" ForeColor="Red" ValidationGroup="MyValidation" meta:resourcekey="RequiredFieldValidator1Resource1">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <%-- Surname --%>
        <tr>
            <td>
                <asp:Label ID="LblSurname"  AssociatedControlID="TxtSurname" Text="Surname:" runat="server" meta:resourcekey="LblSurnameResource1" />
            </td>
            <td>
                <asp:TextBox ID="TxtSurname"  CssClass="form-control input-sm" runat="server" meta:resourcekey="TxtSurnameResource1" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Surname required" ControlToValidate="TxtSurname" Display="Dynamic" ForeColor="Red" ValidationGroup="MyValidation" meta:resourcekey="RequiredFieldValidator2Resource1">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <%-- Email dropdown --%>
        <tr>
            <td></td>
            <td>
                <asp:DropDownList ID="DdlEmail" CssClass="form-control input-sm" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DdlEmail_SelectedIndexChanged" meta:resourcekey="DdlEmailResource1" />
            </td>
            <td></td>
        </tr>
        <%-- Email edit --%>
        <tr>
            <td>
                <asp:Label ID="LblEmail" AssociatedControlID="TxtEmail" Text="Email:" runat="server" meta:resourcekey="LblEmailResource1" />
            </td>
            <td>
                <div class="input-group input-group-sm">
                    <asp:TextBox ID="TxtEmail" CssClass="form-control" runat="server" meta:resourcekey="TxtEmailResource1" />
                    <asp:LinkButton ID="BtnEditEmail" CssClass="input-group-addon btn btn-sm" runat="server" ValidationGroup="MyValidation" OnClick="BtnEditEmail_Click" meta:resourcekey="BtnEditEmailResource1">
                        <span aria-hidden="true" style="color:blue;" class="glyphicon glyphicon-save" />
                    </asp:LinkButton>
                </div>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email required" ControlToValidate="TxtEmail" Display="Dynamic" ForeColor="Red" ValidationGroup="MyValidation" meta:resourcekey="RequiredFieldValidator3Resource1">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtEmail" Display="Dynamic" ErrorMessage="Wrong email format" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="MyValidation" meta:resourcekey="RegularExpressionValidator1Resource1">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <%-- Telephone --%>
        <tr>
            <td>
                <asp:Label ID="LblTelephone" AssociatedControlID="TxtTelephone" Text="Telephone:" runat="server" meta:resourcekey="LblTelephoneResource1" />
            </td>
            <td>
                <asp:TextBox ID="TxtTelephone" CssClass="form-control input-sm" runat="server" meta:resourcekey="TxtTelephoneResource1" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Telephone required" ControlToValidate="TxtTelephone" Display="Dynamic" ForeColor="Red" ValidationGroup="MyValidation" meta:resourcekey="RequiredFieldValidator4Resource1">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <%-- Password --%>
        <tr>
            <td>
                <asp:Label ID="LblPassword" AssociatedControlID="TxtPassword" Text="Password:" runat="server" meta:resourcekey="LblPasswordResource1" />
            </td>
            <td>
                <asp:TextBox ID="TxtPassword" CssClass="form-control input-sm" runat="server" meta:resourcekey="TxtPasswordResource1" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Password required" ControlToValidate="TxtPassword" Display="Dynamic" ForeColor="Red" ValidationGroup="MyValidation" meta:resourcekey="RequiredFieldValidator5Resource1">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <%-- Status --%>
        <tr>
            <td>
                <asp:Label ID="LblStatus" AssociatedControlID="DdlStatus" Text="Status:" runat="server" meta:resourcekey="LblStatusResource1" />
            </td>
            <td>
                <asp:DropDownList ID="DdlStatus" CssClass="form-control input-sm" runat="server" meta:resourcekey="DdlStatusResource1">
                    <asp:ListItem Text="Admin" Value="True" meta:resourcekey="ListItemResource1" />
                    <asp:ListItem Text="User" Value="False" meta:resourcekey="ListItemResource2" />
                </asp:DropDownList>
            </td>
            <td></td>
        </tr>
        <%-- City --%>
        <tr>
            <td>
                <asp:Label ID="LblCity" AssociatedControlID="DdlCity" Text="City:" runat="server" meta:resourcekey="LblCityResource1" />
            </td>
            <td>
                <asp:DropDownList ID="DdlCity" CssClass="form-control input-sm" runat="server" meta:resourcekey="DdlCityResource1" />
            </td>
            <td></td>
        </tr>
        <%-- Buttons --%>
        <tr>
            <td></td>
            <td>
                <asp:Button Text="Edit" ID="BtnEdit" CssClass="btn btn-primary" ValidationGroup="MyValidation" runat="server" OnClick="BtnEdit_Click" meta:resourcekey="BtnEditResource1" />
                <asp:Button 
                    Text="Delete" 
                    ID="BtnDelete" 
                    CssClass="btn btn-warning" 
                    ValidationGroup="MyValidation" 
                    runat="server"
                    OnClientClick="return confirm('Sure you want to delete? ');"
                    OnClick="BtnDelete_Click" meta:resourcekey="BtnDeleteResource1" />
            </td>
            <td></td>
        </tr>
        <%-- Summary --%>
        <tr>
            <td colspan="3">
                <asp:ValidationSummary ID="ValidationSummary13" CssClass="alert alert-danger" runat="server" ForeColor="Red" ValidationGroup="MyValidation" meta:resourcekey="ValidationSummary13Resource1" />
            </td>
        </tr>
    </table>    
</div>