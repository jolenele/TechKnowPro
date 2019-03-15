<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerInfo.aspx.cs" Inherits="TechKnowPro.CustomerInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <asp:Button ID="BtnLogout" runat="server" OnClick="BtnLogout_Click" Text="Log out" />
    <form id="form1" runat="server">
        <div>
            <h1>TechKnow Pro - Incident Report Management Software</h1>
            <h3>Customer - Search and view your customer contact information</h3>
        </div>
        <div>
             <table>
                <tr>
                    <td>Select a customer</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                 <tr>
                     <td>Address:</td>
                     <td>
                         <asp:Label ID="LblAddress" runat="server" Text=""></asp:Label>
                     </td>
                 </tr>
                 <tr>
                     <td>Phone:</td>
                     <td>
                         <asp:Label ID="LblPhone" runat="server" Text=""></asp:Label>
                     </td>
                 </tr>
                 <tr>
                     <td>Email:</td>
                     <td>
                         <asp:Label ID="LblEmail" runat="server" Text=""></asp:Label>
                     </td>
                 </tr>
            </table>
            
        </div>
        <div>
            <table>
                <tr>
                    <td>
                        <asp:Button ID="BtbAddToContact" runat="server" Text="Add to Contact List" />
                    </td>
                    <td>
                        <asp:Button ID="BtbDisplayContact" runat="server" Text="Display Contact List" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
