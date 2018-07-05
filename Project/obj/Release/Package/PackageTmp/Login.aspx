<%@ Page Title="Login" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project.Login" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="col-lg-4 col-md-4 col-sm-4"></div>
    
    <div class="col-lg-4 col-md-4 col-sm-4" style="padding:20px 0">

        <div class="form-group">
            <asp:Label Text="Email:" AssociatedControlID="TxtLoginEmail" runat="server" meta:resourcekey="LabelResource1" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Email required" ControlToValidate="TxtLoginEmail" Display="Dynamic" ForeColor="Red" ValidationGroup="VgSomething" meta:resourcekey="RequiredFieldValidator1Resource1">*</asp:RequiredFieldValidator>
            <asp:CustomValidator ID="UserExistsValidator" runat="server" Display="Dynamic" ErrorMessage="User does not exist" ForeColor="Red" ValidationGroup="VgSomething" meta:resourcekey="UserExistsValidatorResource1">*</asp:CustomValidator>
            <asp:CustomValidator ID="PasswordNotCorrectValidator" runat="server" Display="Dynamic" ErrorMessage="Password not correct" ForeColor="Red" ValidationGroup="VgSomething" meta:resourcekey="PasswordNotCorrectValidatorResource1">*</asp:CustomValidator>
            <asp:TextBox ID="TxtLoginEmail" CssClass="form-control" runat="server" meta:resourcekey="TxtLoginEmailResource1" />
        </div>

        <div class="form-group">
            <asp:Label Text="Password:" AssociatedControlID="TxtLoginPassword" runat="server" meta:resourcekey="LabelResource2" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Email required" ControlToValidate="TxtLoginPassword" Display="Dynamic" ForeColor="Red" ValidationGroup="VgSomething" meta:resourcekey="RequiredFieldValidator2Resource1">*</asp:RequiredFieldValidator>
            <asp:TextBox ID="TxtLoginPassword" TextMode="Password" CssClass="form-control" runat="server" meta:resourcekey="TxtLoginPasswordResource1" />
        </div>

        <div class="form-group">
                <asp:CheckBox ID="CbLoginRemember" CssClass="cbGlupiBootstrap" Text="Remember me" runat="server" meta:resourcekey="CbLoginRememberResource1" />
        </div>

        <div class="form-group">
            <asp:Button ID="BtnLogin" Text="Login" CssClass="btn btn-primary" runat="server" ValidationGroup="VgSomething" OnClick="BtnLogin_Click" meta:resourcekey="BtnLoginResource1" />
            <asp:Button ID="BtnLoginInfo" Text="I don't know login info" CssClass="btn btn-danger" OnClick="BtnLoginInfo_Click" runat="server" meta:resourcekey="BtnLoginInfoResource1" />
        </div>

        <div class="form-group">
            <asp:Panel ID="PnlInfo" runat="server" class="hidden">
                <p>admin@email.com</p>
                <p>123</p>
            </asp:Panel>
            <asp:ValidationSummary ID="ValidationSummary1" CssClass="alert alert-danger" runat="server" ValidationGroup="VgSomething" meta:resourcekey="ValidationSummary1Resource1" />
        </div>
    </div>

    <div class="col-lg-4 col-md-4 col-sm-4"></div>
</asp:Content>
