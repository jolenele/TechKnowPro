<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Layout.Master" CodeBehind="SuccessfulResetPassword.aspx.cs" Inherits="TechKnowPro.Scripts.SuccessfulResetPassword" %>
<%@ MasterType VirtualPath="~/Layout.Master" %>


<asp:Content ID="SuccessResetHead" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="SuccessResetBody" ContentPlaceHolderID="bodyPlaceHolder" runat="server">
    <div><h2>Your account's password has been reset.</h2>
            <p>Please use the new password we have sent to you by email to login.</p>
            <asp:Button ID="Btn" runat="server" Text="Back to Login Page" OnClick="Btn_Click" CssClass="btn"/>
        </div>
</asp:Content>