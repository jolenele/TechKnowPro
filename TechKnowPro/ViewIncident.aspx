﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewIncident.aspx.cs" Inherits="TechKnowPro.ViewIncident" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css"/>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 130px;
        }
        .auto-style3 {
            width: 434px;
            height: 98px;
        }
        .auto-style4 {
            width: 434px;
            height: 23px;
        }
        .auto-style5 {
            height: 23px;
        }
        .auto-style7 {
            width: 151px;
        }
        .auto-style9 {
            height: 98px;
        }
        .auto-style10 {
            width: 151px;
            height: 23px;
        }
        .auto-style11 {
            width: 226px;
        }
        .auto-style12 {
            width: 226px;
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div><h1>View Incident</h1>
        </div>
        <table class="auto-style1">
        <tr>
            <td class="auto-style2">Select a customer</td>
            <td>
                <asp:DropDownList ID="ddlCustomer" runat="server" ToolTip="- Select User -" Width="149px" DataSourceID="SqlDataSourceViewIncident" DataTextField="username" DataValueField="user_id" OnSelectedIndexChanged="ddlCustomer_SelectedIndexChanged" AppendDataBoundItems="True" AutoPostBack="True">
                    <asp:ListItem Value="0">- Select User -</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceViewIncident" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [user_id], [username] FROM [Customers]"></asp:SqlDataSource>
                
            </td>
        </tr>
    </table>
        <div>
            <p>Incident List</p>
            <p>
                <asp:ListBox ID="lbxIncidentList" runat="server" DataSourceID="SqlDSIncidentList" DataTextField="display" DataValueField="Id"   
                    OnSelectedIndexChanged="ddlCustomer_SelectedIndexChanged" OnTextChanged="ddlCustomer_SelectedIndexChanged" Width="405px" AutoPostBack="True"></asp:ListBox>
            </p>
           <asp:SqlDataSource ID="SqlDSIncidentList" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], concat('Incident for Product ',Product,', ',Status,', ',Report_Date_Time,' - ', Brief) as display FROM [Incidents] WHERE ([Customer_ID] = @Customer_ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlCustomer" Name="Customer_ID" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:Button ID="btnRetrieve" runat="server" Text="Retrieve" OnClick="btnRetrieve_Click" />
        </div>
        <div>
            <asp:Label ID="lblError" runat="server"></asp:Label>
            <br />
            <table class="auto-style1">
                <tr>
                    <td class="auto-style4">Details</td>
                    <td class="auto-style5">Description</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <table>
                            <tr>
                                <td class="auto-style7">
                                    <asp:Label ID="lblCustId" runat="server" Text="Customer ID:"></asp:Label>
                                </td>
                                <td class="auto-style11">
                                    <asp:Label ID="lblValueCustID" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:Label ID="lblDateTime" runat="server" Text="Report Date and Time:"></asp:Label>
                                </td>
                                <td class="auto-style11">
                                    <asp:Label ID="lblValueDateTime" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style10">
                                    <asp:Label ID="lblIncident" runat="server" Text="Incident #:"></asp:Label>
                                </td>
                                <td class="auto-style12">
                                    <asp:Label ID="lblValueIncident" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:Label ID="lblStatus" runat="server" Text="Status:"></asp:Label>
                                </td>
                                <td class="auto-style11">
                                    <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="True">
                                        <asp:ListItem Value="default">- Incident Status -</asp:ListItem>
                                        <asp:ListItem>New</asp:ListItem>
                                        <asp:ListItem>In Progress</asp:ListItem>
                                        <asp:ListItem>Closed</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="auto-style9">

                        <asp:Label ID="lblDescription" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <asp:Button ID="btnHome" runat="server" Text="Home" OnClick="btnHome_Click" />
        <asp:Button ID="btnUpdate" runat="server" Text="Update Status" OnClick="btnUpdate_Click" PostBackUrl="~/ViewIncident.aspx" />
    </form>
    
</body>
</html>