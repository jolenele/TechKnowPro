<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SuccessfulResetPassword.aspx.cs" Inherits="TechKnowPro.Scripts.SuccessfulResetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div><h2>Your account's password has been reset.</h2>
            <p>Please use the new password we have sent to you by email to login.</p>
            <asp:Button ID="Btn" runat="server" Text="Back to Login Page" OnClick="Btn_Click" />
        </div>
    </form>
</body>
</html>
