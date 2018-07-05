<%@ Page Title="Edit data" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="Project.Edit" %>
<%@ Reference Control="~/Models/Controls/EditPersonControl.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <script>
        window.onload = function () {
            document.getElementById("BtnMasterEdit").className = "btn btn-primary";
        }
    </script>

    <div class="person-holder">
        <asp:HyperLink ID="BtlNoPersons" NavigateUrl="~/Add.aspx" Text="No users to edit. Add a user?" CssClass="hidden" runat="server" />

        <asp:PlaceHolder ID="EditContent" runat="server">
        
        </asp:PlaceHolder>        
    </div>
</asp:Content>
