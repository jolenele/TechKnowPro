<%@ Page Title="Surveys - Collect feedback from customers" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Survey.aspx.cs" Inherits="TechKnowPro.Survey" %>
<%@ MasterType VirtualPath="~/Layout.Master" %>


<asp:Content ID="SurveyBody" ContentPlaceHolderID="bodyPlaceHolder" runat="server">
   <div>
            <h2></h2>
        </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblCustomer" runat="server" Text="Customer ID"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TxtCustomerID" runat="server" CssClass="readonly" ReadOnly="True" Width="171px"></asp:TextBox>
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <div>
            <asp:ListBox ID="lbxIncident" runat="server"  OnSelectedIndexChanged="lbxIncident_SelectedIndexChanged" AutoPostBack="True" DataSourceID="DoSurvey" DataTextField="display" DataValueField="Id" Width="229px">
                <asp:ListItem Value="0">- Select an incident -</asp:ListItem>
            </asp:ListBox>
            
            <asp:SqlDataSource ID="DoSurvey" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [Id], concat('Incident for Product ',[Product],', ', [Status],', ', [Report_Date_Time],' - ', [Brief]) as display FROM [Incidents] WHERE (([Customer_ID] = @Customer_ID) AND ([Survey] = @Survey) AND ([Status] = @Status))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TxtCustomerID" Name="Customer_ID" PropertyName="Text" Type="String" />
                    <asp:Parameter DefaultValue="0" Name="Survey" Type="Int32" />
                    <asp:Parameter DefaultValue="Closed" Name="Status" Type="String" />
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
        <asp:Button ID="BtnSubmit" runat="server" Text="Submit" OnClick="BtnSubmit_Click" CssClass="btn"/>
        <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" CausesValidation="False" CssClass="btn"/>


</asp:Content>