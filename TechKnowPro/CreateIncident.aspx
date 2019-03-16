<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateIncident.aspx.cs" Inherits="TechKnowPro.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 139px;
        }
        .auto-style3 {
            width: 398px;
        }
        .auto-style4 {
            width: 186px;
        }
        .auto-style5 {
            width: 128px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div><h1>Incident Report Page</h1>
        </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Select a customer*</td>
                <td class="auto-style3">
                    <asp:DropDownList ID="ddlCustomer" runat="server" DataSourceID="SqlDataSourceCustomer" DataTextField="name" DataValueField="user_id" OnSelectedIndexChanged="ddlCustomer_SelectedIndexChanged" AppendDataBoundItems="True" AutoPostBack="True">
                        <asp:ListItem Value="null">-- Select a Customer --</asp:ListItem>
                    </asp:DropDownList>

                    <asp:SqlDataSource ID="SqlDataSourceCustomer" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT user_id, CONCAT(first_name,' ',last_name) AS name FROM Customers"></asp:SqlDataSource>
                </td>
                <td class="auto-style4">Report Date &amp; Time</td>
                <td>
                    <asp:TextBox ID="txtDateTime" runat="server" AutoPostBack="True" ReadOnly="true"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Customer ID</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtCustomerID" runat="server" AutoPostBack="True" EnableViewState="False" ReadOnly="true"></asp:TextBox>

                </td>
                <td class="auto-style4">Incident #</td>
                <td>
                    <asp:TextBox ID="txtIncident" runat="server" AutoPostBack="True" ReadOnly="true"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblProduct" runat="server" Text="Product"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtProduct" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4">Status</td>
                <td>
                    <asp:DropDownList ID="ddlStatus" runat="server" Height="22px" Width="127px">
                        <asp:ListItem Selected="True">New</asp:ListItem>
                        <asp:ListItem>In Progress</asp:ListItem>
                        <asp:ListItem>Closed</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Brief"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtBrief" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        <p>
            Description of Problem*</p>
        <p>
            <asp:TextBox ID="txtDescription" runat="server" Height="77px" TextMode="MultiLine" Width="1301px"></asp:TextBox>
        </p>
        <table class="auto-style1">
            <tr>
                <td class="auto-style5">Method of Contact</td>
                <td>
                    <asp:RadioButtonList ID="rblContact" runat="server" Height="25px" RepeatDirection="Horizontal" Width="340px">
                        <asp:ListItem>Email</asp:ListItem>
                        <asp:ListItem>Phone</asp:ListItem>
                        <asp:ListItem>In Person</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
        </table>
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btbSubmit_Click" />
        <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" />
    </form>
</body>
</html>
