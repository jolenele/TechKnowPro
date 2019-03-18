<%@ Page Title="Reset Your Password" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="TechKnowPro.ForgotPassword" %>
<%@ MasterType VirtualPath="~/Layout.Master" %>

<asp:Content ID="fogotPWHead" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="fogotPWBody" ContentPlaceHolderID="bodyPlaceHolder" runat="server">
        <div>
            <table class="auto-style1">
        <tr>
            <td class="auto-style2">Your email:</td>
            <td>
                <asp:TextBox ID="TxtEmail" runat="server" Width="200px"></asp:TextBox>
                <asp:Label ID="errormessage" runat="server" CssClass="ErrorMessage"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Button ID="BtnReset" runat="server" OnClick="BtnReset_Click" Text="Reset" CssClass="btn"/>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
        </div>
</asp:Content>
