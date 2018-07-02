<%@ Page Title="Update person" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="Project.Update" %>
<%@ Reference Control="~/Models/Controls/EditPersonControl.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="update-person">
        <asp:HyperLink ID="BtnWrongPerson" NavigateUrl="~/List.aspx" Text="You cant edit that user. Back?" CssClass="hidden" runat="server" />
        <asp:PlaceHolder ID="EditPerson" runat="server" />
    </div>
</asp:Content>