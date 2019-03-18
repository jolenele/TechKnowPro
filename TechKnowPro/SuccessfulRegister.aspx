<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Layout.Master" CodeBehind="SuccessfulRegister.aspx.cs" Inherits="TechKnowPro.SuccessfulRegister" %>
<%@ MasterType VirtualPath="~/Layout.Master" %>



<asp:Content ID="SuccessRegisterHead" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="SuccessRegisterBody" ContentPlaceHolderID="bodyPlaceHolder" runat="server">
    <div>
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </div>
        <div>
            <asp:Label ID="Label2" runat="server"></asp:Label>
        </div>
        <asp:Button ID="BtnGoBack" runat="server" OnClick="BtnGoBack_Click" Text="Go back to Login Page" CssClass="btn"/>

</asp:Content>
