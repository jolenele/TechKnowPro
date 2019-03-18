<%@ Page Title="Survey completed!" MasterPageFile="~/Layout.Master" Language="C#" AutoEventWireup="true" CodeBehind="SurveyConfirmation.aspx.cs" Inherits="TechKnowPro.WebForm1" %>
<%@ MasterType VirtualPath="~/Layout.Master" %>


<asp:Content ID="SurveyConfirmHead" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="SurveyConfirmBody" ContentPlaceHolderID="bodyPlaceHolder" runat="server">
    <div>
            <p>Thank you for your feedback!</p>
            <p>A customer representative will contact you within 24hrs.</p>
            <asp:Button ID="btnReturn" runat="server" Text="Return to Survey" OnClick="btnReturn_Click" CssClass="btn"/>
        </div>

</asp:Content>