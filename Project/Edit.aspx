<%@ Page Title="Edit data" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="Project.Edit" %>
<%@ Reference Control="~/Models/Controls/EditPersonControl.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <script>
        window.onload = function () {
            document.getElementById("BtnMasterEdit").className = "btn btn-primary";
        }

        function confirmDelete() {
            ('#confirm').click(function () {
                return true;
            });

            ('#dont-confirm').click(function () {
                return false;
            });
        }
    </script>

    <div class="person-holder">
        <asp:HyperLink ID="BtlNoPersons" NavigateUrl="~/Add.aspx" Text="No users to edit. Add a user?" CssClass="hidden" runat="server" />

        <asp:PlaceHolder ID="EditContent" runat="server">
        
        </asp:PlaceHolder>        
    </div>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Modal title</h4>
          </div>
          <div class="modal-body">
            ...
          </div>
          <div class="modal-footer">
            <button type="button" id="dont-confirm" class="btn btn-default" data-dismiss="modal">Close</button>
            <button type="button" id="confirm" class="btn btn-primary">Save changes</button>
          </div>
        </div>
      </div>
    </div>

</asp:Content>
