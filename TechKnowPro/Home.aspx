<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TechKnowPro.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css"/>
    <style>
        #BtnLogout{
            float:right
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="BtnLogout" runat="server" OnClick="BtnLogout_Click" Text="Log out" CssClass="btn" />
        <h1>TechKnow Pro - Incident Report Management Software</h1>
        <h2>Welcome to the TechKnow Pro Support Portal</h2>
        <p>
            <asp:Label ID="LblUsername" runat="server" ViewStateMode="Enabled"></asp:Label>
        </p>
        <b>Getting Started<br />
        </b>
        <asp:Label ID="Lbl1" runat="server">These are where you can go!</asp:Label>
        <br />
        <br />
        <asp:LinkButton ID="LBProfile" runat="server" CssClass="btn" style="text-decoration: none;" PostBackUrl="~/ProfilePage.aspx" Visible="False" ToolTip="Go to Profile to update your profile"><i class="fa fa-address-book-o"></i> Profile</asp:LinkButton>
        <asp:LinkButton ID="LBSurvey" runat="server" CssClass="btn" style="text-decoration: none;" PostBackUrl="~/Survey.aspx" Visible="False" ToolTip="Go to Survey to do survey"><i class="fa fa-thumbs-o-up"></i> Survey</asp:LinkButton>
        <asp:LinkButton ID="LBCustomerInfo" runat="server" CssClass="btn" style="text-decoration: none;" PostBackUrl="~/CustomerInfo.aspx" Visible="False" ToolTip="Go to Customers to search for customer information"><i class="fa fa-male"></i> Customer</asp:LinkButton>
        <asp:LinkButton ID="LBContactList" runat="server" CssClass="btn" style="text-decoration: none;" PostBackUrl="~/ContactList.aspx" Visible="False" ToolTip="Go to Contact List to view list of customers who need contact"><i class="fa fa-list"></i> Contact List</asp:LinkButton>
        <asp:LinkButton ID="LBViewSurvey" runat="server" CssClass="btn" style="text-decoration: none;" PostBackUrl="~/ViewSurvey.aspx" Visible="False" ToolTip="Go to View Survey to view customers' surveys"><i class="fa fa-book"></i> View Survey</asp:LinkButton>
        <asp:LinkButton ID="LBCreateIncident" runat="server" CssClass="btn" style="text-decoration: none;" PostBackUrl="~/CreateIncident.aspx" Visible="False" ToolTip="Go to Create Incidents to search and review client incident reports"><i class="fa fa-edit"></i> Create Incident</asp:LinkButton>
        <asp:LinkButton ID="LBViewIncident" runat="server" CssClass="btn" style="text-decoration: none;" PostBackUrl="~/ViewIncident.aspx" Visible="False" ToolTip="Go to View Incidents to search and review client incident reports"><i class="fa fa-eye"></i> View Incident</asp:LinkButton>
    </form>
</body>
</html>
