<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Survey.aspx.cs" Inherits="TechKnowPro.Survey" %>

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
            width: 136px;
        }
        .auto-style4 {
            width: 162px;
        }
        .auto-style5 {
            width: 7px;
        }
        .auto-style6 {
            width: 162px;
            height: 31px;
        }
        .auto-style7 {
            width: 7px;
            height: 31px;
        }
        .auto-style8 {
            height: 31px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Surveys - Collect feedback from customers</h2>
        </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblCustomer" runat="server" Text="Customer ID"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblCustomerID" runat="server" CssClass="readonly"></asp:Label>
                </td>
            </tr>
        </table>
        <div>
            <asp:DropDownList ID="ddlIncident" runat="server" Height="50px" Width="400px" OnSelectedIndexChanged="ddlIncident_SelectedIndexChanged" AutoPostBack="True" DataSourceID="SqlDStest" DataTextField="display" DataValueField="Id">
                <asp:ListItem Value="0">- Select an incident -</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDStest" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [Id], concat('Incident for Product ', Product, ', ', Status, ', ', Report_Date_Time, ' - ', Brief) as display FROM [Incidents] WHERE ([Customer_ID] = @Customer_ID)">
                <SelectParameters>
                    <asp:SessionParameter Name="Customer_ID" SessionField="user_id" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            
        </div>
        <div>
            <p>Please rate this incident by the following catagories</p>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style4">Response Time</td>
                    <td class="auto-style5"> <asp:RadioButtonList ID="rblTime" runat="server" Width="650px" RepeatDirection="Horizontal">
                            <asp:ListItem>Not Satisfied</asp:ListItem> 
                            <asp:ListItem>Somewhat Satisfied</asp:ListItem>
                            <asp:ListItem>Satisfied</asp:ListItem>
                            <asp:ListItem>Completely Satisfied</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td> 
                        <asp:RequiredFieldValidator ID="rfvTime" runat="server" ControlToValidate="rblTime" Display="Dynamic" ErrorMessage="Please choose an option"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Technician Efficiency</td>
                    <td class="auto-style5">
                        <asp:RadioButtonList ID="rblEfficiency" runat="server" Width="650px" RepeatDirection="Horizontal">
                            <asp:ListItem>Not Satisfied</asp:ListItem> 
                            <asp:ListItem>Somewhat Satisfied</asp:ListItem>
                            <asp:ListItem>Satisfied</asp:ListItem>
                            <asp:ListItem>Completely Satisfied</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvEfficiency" runat="server" ControlToValidate="rblEfficiency" Display="Dynamic" ErrorMessage="Please choose an option"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">Problem Resolution</td>
                    <td class="auto-style7">
                        <asp:RadioButtonList ID="rblResolution" runat="server" Width="650px" RepeatDirection="Horizontal">
                            <asp:ListItem>Not Satisfied</asp:ListItem> 
                            <asp:ListItem>Somewhat Satisfied</asp:ListItem>
                            <asp:ListItem>Satisfied</asp:ListItem>
                            <asp:ListItem>Completely Satisfied</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="auto-style8">
                        <asp:RequiredFieldValidator ID="rfvResolution" runat="server" ControlToValidate="rblResolution" Display="Dynamic" ErrorMessage="Please choose an option"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Additional Comments</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txtComments" runat="server" Height="61px" TextMode="MultiLine" Width="469px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:CheckBox ID="ckbContact" runat="server" Text="Please contact me to discuss this incident" AutoPostBack="True" OnCheckedChanged="ckbContact_CheckedChanged" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:RadioButtonList ID="rblContactMethod" runat="server" RepeatDirection="Horizontal" AppendDataBoundItems="True" AutoPostBack="True" Visible="False">
                            <asp:ListItem Value="email">Contact via Email</asp:ListItem>
                            <asp:ListItem Value="phone">Contact via phone</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </div>
        <asp:Button ID="BtnSubmit" runat="server" Text="Submit" OnClick="BtnSubmit_Click" />
        <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" CausesValidation="False" />
    </form>
</body>
</html>
