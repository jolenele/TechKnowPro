<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Survey.aspx.cs" Inherits="TechKnowPro.Survey" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
                    <asp:Label ID="lblCustomerID" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <div>
            <asp:DropDownList ID="ddlIncident" runat="server" Height="55px" Width="326px" OnSelectedIndexChanged="ddlIncident_SelectedIndexChanged" AutoPostBack="True" DataSourceID="SqlDStest" DataTextField="display" DataValueField="Id">
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
                    <td> <asp:RadioButtonList ID="rblTime" runat="server" Width="650px" RepeatDirection="Horizontal">
                            <asp:ListItem>Not Satisfied</asp:ListItem> 
                            <asp:ListItem>Somewhat Satisfied</asp:ListItem>
                            <asp:ListItem>Satisfied</asp:ListItem>
                            <asp:ListItem>Completely Satisfied</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Technician Efficiency</td>
                    <td>
                        <asp:RadioButtonList ID="rblEfficiency" runat="server" Width="650px" RepeatDirection="Horizontal">
                            <asp:ListItem>Not Satisfied</asp:ListItem> 
                            <asp:ListItem>Somewhat Satisfied</asp:ListItem>
                            <asp:ListItem>Satisfied</asp:ListItem>
                            <asp:ListItem>Completely Satisfied</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Problem Resolution</td>
                    <td>
                        <asp:RadioButtonList ID="rblResolution" runat="server" Width="650px" RepeatDirection="Horizontal">
                            <asp:ListItem>Not Satisfied</asp:ListItem> 
                            <asp:ListItem>Somewhat Satisfied</asp:ListItem>
                            <asp:ListItem>Satisfied</asp:ListItem>
                            <asp:ListItem>Completely Satisfied</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Additional Comments</td>
                    <td>
                        <asp:TextBox ID="txtComments" runat="server" Height="61px" TextMode="MultiLine" Width="469px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:CheckBox ID="ckbContact" runat="server" Text="Please contact me to discuss this incident" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:RadioButtonList ID="rblContactMethod" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Contact via Email</asp:ListItem>
                            <asp:ListItem>Contact via phone</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
        </div>
        <asp:Button ID="BtnSubmit" runat="server" Text="Submit" OnClick="BtnSubmit_Click" />
    </form>
</body>
</html>
