<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyConfirmation.aspx.cs" Inherits="TechKnowPro.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Survey Complete</h1>
            <p>Thank you for your feedback!</p>
            <p>A customer representative will contact you within 24hrs.</p>
            <asp:Button ID="btnHome" runat="server" Text="Home" OnClick="btnReturn_Click"/>
            <asp:Button ID="btnReturn" runat="server" Text="Return to Survey" OnClick="btnReturn_Click" />
        </div>
    </form>
</body>
</html>
