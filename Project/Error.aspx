<%@ Page Title="Error" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="Project.Error" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:Label ID="ErrorMessage" CssClass="text-danger" runat="server" meta:resourcekey="ErrorMessageResource1" />
</asp:Content>