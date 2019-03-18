<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Layout.Master" CodeBehind="SuccessfulConfirmation.aspx.cs" Inherits="TechKnowPro.SuccessfulConfirmation" %>
<%@ MasterType VirtualPath="~/Layout.Master" %>



<asp:Content ID="SuccessConfirmHead" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="SuccessConfirmBody" ContentPlaceHolderID="bodyPlaceHolder" runat="server">
    <div>
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </div>
        <div>
            <asp:Button ID="BtnBack" runat="server" Text="Back to Login Page" OnClick="BtnBack_Click" CssClass="btn"/>
        </div>
  
</asp:Content>
