<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SuccessfulRegister.aspx.cs" Inherits="TechKnowPro.SuccessfulRegister" %>

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
            <asp:Label ID="Label2" runat="server"></asp:Label>
        </div>
        <asp:Button ID="BtnGoBack" runat="server" OnClick="BtnGoBack_Click" Text="Go back to Login Page" />
    </form>
</body>
</html>
