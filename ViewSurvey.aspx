<%@ Page Title="View Survey" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ViewSurvey.aspx.cs" Inherits="TechKnowPro.WebForm2" %>
<%@ MasterType VirtualPath="~/Layout.Master" %>

<asp:Content ID="viewSurveyBody" ContentPlaceHolderID="bodyPlaceHolder" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">Select a customer</td>
        <td>
            <asp:DropDownList ID="ddlCustomer" runat="server" ToolTip="- Select User -" Width="149px" DataSourceID="SqlDSSurveyList1" DataTextField="username" DataValueField="user_id" OnSelectedIndexChanged="ddlCustomer_SelectedIndexChanged" AppendDataBoundItems="True" AutoPostBack="True">
                <asp:ListItem Value="0">- Select User -</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDSSurveyList1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [user_id], [username] FROM [Customers]"></asp:SqlDataSource>
                
        </td>
            <td class="auto-style4">Customer ID</td>
            <td>
                <asp:TextBox ID="txtCustomerID" runat="server" CssClass="readonly" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
    </table>
    <div>
        <p>Survey Listing</p>
        <p>
            <asp:ListBox ID="lbxSurveyList" runat="server" DataSourceID="SDSSurveyList" DataTextField="surveyList" DataValueField="Id"   
                OnSelectedIndexChanged="ddlCustomer_SelectedIndexChanged" OnTextChanged="ddlCustomer_SelectedIndexChanged" Width="405px"></asp:ListBox>
               
            <asp:SqlDataSource ID="SDSSurveyList" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [surveys].[Id], concat('Survey result for incident ', [Incidents].[Incident_number]) as surveyList FROM [Surveys] inner join [incidents] on [surveys].[incident_id] = [incidents].[id] WHERE ([surveys].[Customer_ID] = @Customer_ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtCustomerID" Name="Customer_ID" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
               
        </p>
        <asp:Button ID="btnRetrieve" runat="server" Text="Retrieve Survey Details" OnClick="btnRetrieve_Click" CssClass="btn"/>
    </div>
    <div>
        <p>Customer Rating</p>

    </div>
    <table class="auto-style1">
        <tr>
            <td class="auto-style5">Response Time</td>
            <td class="auto-style8">
                <asp:Label ID="lblTime" runat="server" ></asp:Label>
            </td>
            <td class="auto-style10">Contact to discuss Incident</td>
            <td>
                <asp:Label ID="lblContact" runat="server" ></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Technician Efficiency</td>
            <td class="auto-style8">
                <asp:Label ID="lblEfficicency" runat="server" ></asp:Label>
            </td>
            <td class="auto-style10">Preferred Contact Method</td>
            <td>
                <asp:Label ID="lblMethod" runat="server" ></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Problem Resolution</td>
            <td class="auto-style8">
                <asp:Label ID="lblResolution" runat="server" ></asp:Label>
            </td>
            <td class="auto-style10">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style6">Additional Comments</td>
            <td class="auto-style7" colspan="3">
                <asp:TextBox ID="txtComment" runat="server" Height="45px" OnTextChanged="btnRetrieve_Click" TextMode="MultiLine" Width="445px"></asp:TextBox>
            </td>
        </tr>
    </table>


</asp:Content>