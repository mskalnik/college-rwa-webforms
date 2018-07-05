<%@ Page Title="Add a person" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="Project.Add" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">

    <div class="add-person-container">
        <div class="add-person-form">
            <%-- First column --%>
            <div class="col-lg-4 col-md-4 col-sm-4">
                <div class="form-group">
                    <asp:Label ID="LblName" AssociatedControlID="TxtName" runat="server" Text="Name:"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtName" Display="Dynamic" ErrorMessage="Name is required" ForeColor="Red" ValidationGroup="MyValidationGroup">*</asp:RequiredFieldValidator>
                    <asp:TextBox ID="TxtName" CssClass="form-control" runat="server" />
                </div>
                <div class="form-group">
                    <asp:Label ID="LblSurname" AssociatedControlID="TxtSurname" runat="server" Text="Surname:"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtSurname" Display="Dynamic" ErrorMessage="Surname is required" ForeColor="Red" ValidationGroup="MyValidationGroup">*</asp:RequiredFieldValidator>
                    <asp:TextBox ID="TxtSurname" CssClass="form-control" runat="server" />
                </div>
                <div class="form-group">
                    <asp:Label ID="LblEmail" AssociatedControlID="TxtEmail" runat="server" Text="Email:"></asp:Label>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtEmail" Display="Dynamic" ErrorMessage="Wrong email format" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="MyValidationGroup">*</asp:RegularExpressionValidator>
                    <asp:TextBox ID="TxtEmail" CssClass="form-control" runat="server" />
                    <asp:TextBox ID="TxtEmail1" CssClass="form-control hidden" runat="server" />
                    <asp:TextBox ID="TxtEmail2" CssClass="form-control hidden" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtEmail" Display="Dynamic" ErrorMessage="Email is required" ForeColor="Red" ValidationGroup="MyValidationGroup">*</asp:RequiredFieldValidator>
                    <asp:LinkButton Text="Add more email adressess..." ID="BtnAddMoreEmail" runat="server" />
                </div>
            </div>

            <%-- 2nd column --%>
            <div class="col-lg-4 col-md-4 col-sm-4">
                <div class="form-group">
                    <asp:Label ID="LblTelephone" AssociatedControlID="TxtTelephone" runat="server" Text="Telephone:"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TxtTelephone" Display="Dynamic" ErrorMessage="Telephone is required" ForeColor="Red" ValidationGroup="MyValidationGroup">*</asp:RequiredFieldValidator>
                    <asp:TextBox ID="TxtTelephone" CssClass="form-control" runat="server" />
                </div>
                <div class="form-group">
                    <asp:Label ID="LblCity" AssociatedControlID="DdlCity" runat="server" Text="City:"></asp:Label>
                    <asp:DropDownList runat="server" CssClass="form-control" ID="DdlCity" />
                </div>
                <div class="form-group">
                    <asp:Label ID="LblStatus" AssociatedControlID="DdlStatus" runat="server" Text="Status:"></asp:Label>
                    <asp:DropDownList runat="server" CssClass="form-control" ID="DdlStatus">
                        <asp:ListItem Text="Admin" Value="true" />
                        <asp:ListItem Text="Korisnik" Value="false" />
                    </asp:DropDownList>
                </div>
            </div>

            <%-- 3rd column --%>
            <div class="col-lg-4 col-md-4 col-sm-4">
                <div class="form-group">
                    <asp:Label ID="LblPassword" AssociatedControlID="TxtPassword" runat="server" Text="Password:"></asp:Label>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TxtPasswordRepeat" ControlToValidate="TxtPassword" Display="Dynamic" ErrorMessage="Passwords must match" ForeColor="Red" ValidationGroup="MyValidationGroup">*</asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TxtPassword" Display="Dynamic" ErrorMessage="Password is required" ForeColor="Red" ValidationGroup="MyValidationGroup">*</asp:RequiredFieldValidator>
                    <asp:TextBox ID="TxtPassword" TextMode="Password" CssClass="form-control" runat="server" />
                </div>
                <div class="form-group">
                    <asp:Label ID="LblPasswordRepeat" AssociatedControlID="TxtPasswordRepeat" runat="server" Text="Repeat password:"></asp:Label>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="TxtPassword" ControlToValidate="TxtPasswordRepeat" Display="Dynamic" ErrorMessage="Passwords must match" ForeColor="Red" ValidationGroup="MyValidationGroup">*</asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TxtPasswordRepeat" Display="Dynamic" ErrorMessage="Password repeat is required" ForeColor="Red" ValidationGroup="MyValidationGroup">*</asp:RequiredFieldValidator>
                    <asp:TextBox ID="TxtPasswordRepeat" TextMode="Password" CssClass="form-control" runat="server" />
                </div>
                <div class="form-group">
                    <asp:Button Text="Add" CssClass="btn btn-primary add-button" runat="server" ValidationGroup="MyValidationGroup" ID="BtnAdd" OnClick="BtnAdd_Click" />
                </div>
            </div>

            <%-- Summary --%>
            <div class="col-lg-12 col-md-12 col-sm-12">
                <asp:ValidationSummary ID="ValidationSummary1" CssClass="alert alert-danger" runat="server" ForeColor="Red" ValidationGroup="MyValidationGroup" />
            </div>
        </div>
    </div>

    <script>
        window.onload = function() {
            document.getElementById("BtnMasterAdd").className = "btn btn-primary";

            //*************************************************************************
            //************************Add more emails button***************************
            //*************************************************************************
            var hiddenElements  = document.getElementsByClassName('hidden');
            var addButton       = document.getElementById('Content_BtnAddMoreEmail');         

            addButton.onclick = function () {
                if (hiddenElements.length == 1)
                    addButton.classList.add('hidden');
                var current = hiddenElements[0];
                hiddenElements[0].classList.remove('hidden');
                current.focus();
                return false;
            }
            //*************************************************************************
        }
    </script>
</asp:Content>
