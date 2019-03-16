<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SuccessfulConfirmation.aspx.cs" Inherits="TechKnowPro.SuccessfulConfirmation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </div>
        <div>
            <asp:Button ID="BtnBack" runat="server" Text="Back to Login Page" OnClick="BtnBack_Click" />
        </div>
    </form>
</body>
</html>
