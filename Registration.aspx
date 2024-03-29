﻿<%@ Page Title="Sign up" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="TechKnowPro.Registration" %>
<%@ MasterType VirtualPath="~/Layout.Master" %>

<asp:Content ID="SignupHead" ContentPlaceHolderID="headPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="SignupBody" ContentPlaceHolderID="bodyPlaceHolder" runat="server">
<asp:Label CssClass="ErrorMessage" ID="errormessage" runat="server" Text=""></asp:Label>
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">Your UserID</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TxtUserID" runat="server" Enabled="False" ReadOnly="True" Width="180px" CssClass="readonly"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Firstname*</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TxtFirstname" runat="server" Width="180px"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="ErrorMessage" ID="rfvFirstname" runat="server" ErrorMessage="Firstname Required" ControlToValidate="TxtFirstname" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtFirstname" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Firstname must contain only alphabet characters" ValidationExpression="^[a-zA-Z ]*$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Lastname*</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TxtLastname" runat="server" CssClass="auto-style6" Width="180px"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="ErrorMessage" ID="rfvLastname" runat="server" ErrorMessage="Lastname Required" ControlToValidate="TxtLastname" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TxtLastname" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Lastname must contain only alphabet characters" ValidationExpression="^[a-zA-Z ]*$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Address*</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TxtAddress" runat="server" Width="180px"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="ErrorMessage" ID="rfvAddress" runat="server" ErrorMessage="Address Required" ControlToValidate="TxtAddress"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Email*</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TxtEmail" runat="server" Width="180px" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="ErrorMessage" ID="rfvEmail" runat="server" ErrorMessage="Email Required" ControlToValidate="TxtEmail" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="EmailUsageCheck" runat="server" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Invalid Email. This email has been used!" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Password*</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TxtPassword" runat="server" Width="180px" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="ErrorMessage" ID="rfvPassword" runat="server" ErrorMessage="Password Required" ControlToValidate="TxtPassword" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TxtPassword" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Password must be 6 - 12 characters in length, contain at least 1 uppercase letter and 1 special character" ValidationExpression="^(?=.*[A-Z])(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,12}$"></asp:RegularExpressionValidator>
                    </td>
                <tr>
                    <td class="auto-style2">Confirm Password*</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TxtConfirmPassword" runat="server" Width="180px" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="ErrorMessage" ID="rfvConfirmPassword" runat="server" ErrorMessage="Please confirm your Password" ControlToValidate="TxtConfirmPassword"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:CheckBox ID="AgreementCheck" runat="server" Text="I agree to the <a href='TermOfService.aspx' target='_blank'>Term of service</a>" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="BtnRegister" runat="server" Text="Sign up" OnClick="BtnRegister_Click" CssClass="btn"/>
                        </td>
                    <td>
                        <asp:Button ID="BtnCancel" runat="server" Text="Cancel" OnClick="BtnCancel_Click" CausesValidation="False" CssClass="btn"/>
                    </td>
                </tr>
            </table>
        </div>
</asp:Content>
