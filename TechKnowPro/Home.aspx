<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TechKnowPro.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css"/>
    <style>
        #BtnLogout{
            float:right
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="BtnLogout" runat="server" OnClick="BtnLogout_Click" Text="Log out" />
        <h1>TechKnow Pro - Incident Report Management Software</h1>
        <h2>Welcome to the TechKnow Pro Support Portal</h2>
        <p>
            <asp:Label ID="LblUsername" runat="server" ViewStateMode="Enabled"></asp:Label>
        </p>
        <b>Getting Started<br />
        </b>
        <asp:Label ID="Lbl1" runat="server"></asp:Label>
        <br />
        <asp:Label ID="Lbl2" runat="server"></asp:Label>
        <br />
        <asp:Label ID="Lbl3" runat="server"></asp:Label>
        <br />
        <asp:Label ID="Lbl4" runat="server"></asp:Label>
        <br />
    </form>
</body>
</html>
