<%@ Page Title="Setup" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Setup.aspx.cs" Inherits="Project.Setup" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
<asp:Content ID="Head" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content" ContentPlaceHolderID="Content" runat="server">
    <div class="col-lg-4 col-md-4 col-sm-4"></div>

    <div class="col-lg-4 col-md-4 col-sm-4">
        <div class="form-group">
            <asp:Label Text="Theme:" ID="LblTheme" runat="server" meta:resourcekey="LblThemeResource1"/>
            <asp:DropDownList 
                    runat="server" 
                    ID="DdlTheme" 
                    CssClass="form-control"
                    AutoPostBack="True"
                    OnSelectedIndexChanged="DdlTheme_SelectedIndexChanged" meta:resourcekey="DdlThemeResource1">
                <asp:ListItem Text="--- Choose ---" Value="0" meta:resourcekey="ListItemResource1"/>
                <asp:ListItem Text="Default" Value="default" meta:resourcekey="ListItemResource2"/>
                <asp:ListItem Text="Blue" Value="blue" meta:resourcekey="ListItemResource3"/>
                <asp:ListItem Text="Red" Value="red" meta:resourcekey="ListItemResource4"/>
                <asp:ListItem Text="90's" Value="90s" meta:resourcekey="ListItemResource11" />
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <asp:Label Text="Language:" ID="LblLang" runat="server" meta:resourcekey="LblLangResource1"/>
            <asp:DropDownList 
                    runat="server" 
                    ID="DdlLanguage" 
                    CssClass="form-control" 
                    AutoPostBack="True"
                    OnSelectedIndexChanged="DdlLanguage_SelectedIndexChanged" meta:resourcekey="DdlLanguageResource1">
                <asp:ListItem Text="--- Choose ---" Value="0" meta:resourcekey="ListItemResource5"/>
                <asp:ListItem Text="Croatian" Value="hr" meta:resourcekey="ListItemResource6"/>
                <asp:ListItem Text="English" Value="en" meta:resourcekey="ListItemResource7"/>
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <asp:Label Text="Repository:" ID="LblRepository" runat="server" meta:resourcekey="LblRepositoryResource1"/>
            <asp:DropDownList runat="server" ID="DdlRepository" CssClass="form-control" meta:resourcekey="DdlRepositoryResource1">
                <asp:ListItem Text="--- Choose ---" Value="0" meta:resourcekey="ListItemResource8"/>
                <asp:ListItem Text="DataBase" Value="db" meta:resourcekey="ListItemResource9"/>
                <asp:ListItem Text="Text" Value="txt" meta:resourcekey="ListItemResource10"/>
            </asp:DropDownList>
        </div>
    </div>

    <script>
        window.onload = function() {
            document.getElementById("BtnMasterSetup").className = "btn btn-primary";
        }
    </script>

</asp:Content>
