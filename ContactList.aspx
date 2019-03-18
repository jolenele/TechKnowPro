<%@ Page Title="Contact List - Manage your contact list" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ContactList.aspx.cs" Inherits="TechKnowPro.ContactList" %>
<%@ MasterType VirtualPath="~/Layout.Master" %>

<asp:Content ID="contactListBody" ContentPlaceHolderID="bodyPlaceHolder" runat="server">
        <div>
            <p>Contact List:</p>
            <table>
                <tr>
                    <td>
                        <asp:ListBox ID="ContactListBox" runat="server" DataSourceID="SqlDataSource1" DataTextField="contact" DataValueField="user_id" Height="109px" Width="362px" AutoPostBack="True"></asp:ListBox>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT CONCAT(username, ' ', phone, ' ', email) AS contact, user_id FROM Contacts"></asp:SqlDataSource>
                    </td>
                    <td class="auto-style2">
                        <asp:Button ID="BtbRemoveContact" runat="server" CssClass="btn" Text="Remove Contact" OnClick="BtbRemoveContact_Click" AutoPostBack="True" />
                        <br/>
                        <asp:Button ID="BtbEmptyList" runat="server" CssClass="btn" Text="Empty List" OnClick="BtbEmptyList_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="BtbSelectCust" runat="server" CssClass="btn" Text="Select Additional Customers" OnClick="BtbSelectCust_Click" />
                    </td>
                </tr>
                </table>
        </div>

</asp:Content>
