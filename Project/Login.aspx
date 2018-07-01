<%@ Page Title="Login" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="col-lg-4 col-md-4 col-sm-4"></div>
    
    <div class="col-lg-4 col-md-4 col-sm-4" style="padding:20px 0">

        <div class="form-group">
            <asp:Label Text="Email:" AssociatedControlID="TxtLoginEmail" runat="server" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Email required" ControlToValidate="TxtLoginEmail" Display="Dynamic" ForeColor="Red" ValidationGroup="VgSomething">*</asp:RequiredFieldValidator>
            <asp:CustomValidator ID="UserExistsValidator" runat="server" Display="Dynamic" ErrorMessage="User does not exist" ForeColor="Red" ValidationGroup="VgSomething">*</asp:CustomValidator>
            <asp:CustomValidator ID="PasswordNotCorrectValidator" runat="server" Display="Dynamic" ErrorMessage="Password not correct" ForeColor="Red" ValidationGroup="VgSomething">*</asp:CustomValidator>
            <asp:TextBox ID="TxtLoginEmail" CssClass="form-control" runat="server" />
        </div>

        <div class="form-group">
            <asp:Label Text="Password:" AssociatedControlID="TxtLoginPassword" runat="server" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Email required" ControlToValidate="TxtLoginPassword" Display="Dynamic" ForeColor="Red" ValidationGroup="VgSomething">*</asp:RequiredFieldValidator>
            <asp:TextBox ID="TxtLoginPassword" CssClass="form-control" runat="server" />
        </div>

        <div class="checkbox form-group">
            <asp:CheckBox ID="CbLoginRemember" Text="Remember me" runat="server" />
        </div>

        <div class="form-group">
            <asp:Button ID="BtnLogin" Text="Login" CssClass="btn btn-primary" runat="server" ValidationGroup="VgSomething" OnClick="BtnLogin_Click" />
            <asp:Button ID="BtnLoginInfo" Text="I don't know login info" CssClass="btn btn-danger" OnClick="BtnLoginInfo_Click" runat="server" />
            <hr />
        </div>

        <div class="form-group">
            <asp:ValidationSummary ID="ValidationSummary1" CssClass="alert alert-danger" runat="server" ValidationGroup="VgSomething" />
        </div>
    </div>

    <div class="col-lg-4 col-md-4 col-sm-4"></div>
</asp:Content>
