<%@ Page Title="Welcome to the TechKnow Pro Support Portal" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TechKnowPro.Home" %>
<%@ MasterType VirtualPath="~/Layout.Master" %>

<asp:Content id="homeBody" contentplaceholderid="bodyPlaceholder" runat="server">
    <div class="welcome">
    <asp:Label ID="LblUsername" runat="server" ViewStateMode="Enabled"></asp:Label>
        <p><b>Getting Started<br /></b></p>
        <asp:Label ID="Lbl1" runat="server">These are where you can go!</asp:Label>
    </div>
        <asp:LinkButton ID="LBProfile" runat="server" CssClass="btn" style="text-decoration: none;" PostBackUrl="~/ProfilePage.aspx" Visible="False" ToolTip="Go to Profile to update your profile"><i class="fa fa-address-book-o"></i> Profile</asp:LinkButton>
        <asp:LinkButton ID="LBSurvey" runat="server" CssClass="btn" style="text-decoration: none;" PostBackUrl="~/Survey.aspx" Visible="False" ToolTip="Go to Survey to do survey"><i class="fa fa-thumbs-o-up"></i> Survey</asp:LinkButton>
        <asp:LinkButton ID="LBCustomerInfo" runat="server" CssClass="btn" style="text-decoration: none;" PostBackUrl="~/CustomerInfo.aspx" Visible="False" ToolTip="Go to Customers to search for customer information"><i class="fa fa-male"></i> Customer</asp:LinkButton>
        <asp:LinkButton ID="LBContactList" runat="server" CssClass="btn" style="text-decoration: none;" PostBackUrl="~/ContactList.aspx" Visible="False" ToolTip="Go to Contact List to view list of customers who need contact"><i class="fa fa-list"></i> Contact List</asp:LinkButton>
        <asp:LinkButton ID="LBViewSurvey" runat="server" CssClass="btn" style="text-decoration: none;" PostBackUrl="~/ViewSurvey.aspx" Visible="False" ToolTip="Go to View Survey to view customers' surveys"><i class="fa fa-book"></i> View Survey</asp:LinkButton>
        <asp:LinkButton ID="LBCreateIncident" runat="server" CssClass="btn" style="text-decoration: none;" PostBackUrl="~/CreateIncident.aspx" Visible="False" ToolTip="Go to Create Incidents to search and review client incident reports"><i class="fa fa-edit"></i> Create Incident</asp:LinkButton>
        <asp:LinkButton ID="LBViewIncident" runat="server" CssClass="btn" style="text-decoration: none;" PostBackUrl="~/ViewIncident.aspx" Visible="False" ToolTip="Go to View Incidents to search and review client incident reports"><i class="fa fa-eye"></i> View Incident</asp:LinkButton>
    
    <div class="member">
        <p><b>Group Members</b></p>
        <p>1. Nga Le - 101102629</p>
        <p>2. Duc Thinh Le - 101110291</p>
    </div>
</asp:Content>
   

