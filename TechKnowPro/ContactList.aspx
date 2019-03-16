<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactList.aspx.cs" Inherits="TechKnowPro.ContactList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 234px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Button ID="BtnLogout" runat="server" OnClick="BtnLogout_Click" Text="Log out" />
    <div>
        <h1>TechKnow Pro - Incident Report Management Software</h1>
        <h3>Contact List - Manage your contact list</h3>
    </div>
    <div>
        <p>Contact List:</p>
        <table>
            <tr>
                <td>
                    <asp:ListBox ID="ContactListBox" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="contact" DataValueField="user_id" Height="109px" OnSelectedIndexChanged="ContactListBox_SelectedIndexChanged" Width="362px"></asp:ListBox>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT CONCAT(username, ' ', phone, ' ', email) AS contact, user_id FROM Contacts"></asp:SqlDataSource>
                </td>
                <td class="auto-style2">
                    <asp:Button ID="BtbRemoveContact" runat="server" Text="Remove Contact" OnClick="BtbRemoveContact_Click" />
                    <asp:Button ID="BtbEmptyList" runat="server" Text="Empty List" OnClick="BtbEmptyList_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="BtbSelectCust" runat="server" Text="Select Additional Customers" OnClick="BtbSelectCust_Click" />
                </td>
            </tr>
            </table>
    </div>
    </form>
</body>
</html>
