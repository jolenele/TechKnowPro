﻿<%@ Page Title="Customer Information" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="CustomerInfo.aspx.cs" Inherits="TechKnowPro.CustomerInfo" %>
<%@ MasterType VirtualPath="~/Layout.Master" %>


<asp:Content ID="CustInfoBody" ContentPlaceHolderID="bodyPlaceHolder" runat="server">

        <div>
             <table>
                <tr>
                    <td class="auto-style2">Select a customer</td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="CustomerList" runat="server" DataSourceID="Customers" DataTextField="username" DataValueField="user_id" OnSelectedIndexChanged="CustomerList_SelectedIndexChanged" OnDataBinding="CustomerList_SelectedIndexChanged" OnLoad="CustomerList_SelectedIndexChanged" AppendDataBoundItems="True" AutoPostBack="True" OnInit="CustomerList_SelectedIndexChanged">
                            <asp:ListItem Value="0">-Select a customer-</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="Customers" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT username, user_id FROM Customers"></asp:SqlDataSource>
                    </td>
                </tr>
                 <tr>
                     <td class="auto-style3">Address:</td>
                     <td class="auto-style3">
                         <asp:Label ID="LblAddress" runat="server"></asp:Label>
                     </td>
                 </tr>
                 <tr>
                     <td class="auto-style1">Phone:</td>
                     <td class="auto-style1">
                         <asp:Label ID="LblPhone" runat="server"></asp:Label>
                     </td>
                 </tr>
                 <tr>
                     <td>Email:</td>
                     <td>
                         <asp:Label ID="LblEmail" runat="server"></asp:Label>
                     </td>
                 </tr>
            </table>
            
        </div>
        <div>
            <table>
                <tr>
                    <td>
                        <asp:Button ID="BtbAddToContact" runat="server" CssClass="btn" Text="Add to Contact List" OnClick="BtbAddToContact_Click" />
                    </td>
                    <td>
                        <asp:Button ID="BtbDisplayContact" runat="server" CssClass="btn" Text="Display Contact List" OnClick="BtbDisplayContact_Click" />
                    </td>
                </tr>
            </table>
        </div>

</asp:Content>
