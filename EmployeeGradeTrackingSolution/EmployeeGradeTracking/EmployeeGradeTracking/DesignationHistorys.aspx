<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DesignationHistorys.aspx.cs" Inherits="EmployeeGradeTracking.EmployeeGradeTracking.DesignationHistorys" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <link href="../Content/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <style>
        .err {
            font-size:.800rem;
        }
        th a {
            text-decoration:none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row px-2">
        <div class="col-6 border-end">
            <h3 class="display-6" style="text-align:center">Select Sales</h3>
            <asp:GridView CssClass="table table-bordered table-striped" ID="GridView1" DataKeyNames="EmployeeId"  runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="dsEmployees" OnRowDataBound="GridView1_RowDataBound">
                <SelectedRowStyle CssClass="bg-secondary text-white" />
                <HeaderStyle CssClass="bg-active" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" CssClass="btn btn-primary btn-sm" Text="Select"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="EmployeeName" HeaderText="EmployeeName" SortExpression="EmployeeName" />
                    <%--<asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />--%>
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="DepartmentName" HeaderText="DepartmentName" SortExpression="DepartmentName" />
                    <asp:BoundField DataField="EmployeeId" HeaderText="EmployeeId" InsertVisible="False" ReadOnly="True" SortExpression="EmployeeId" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="dsEmployees" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" SelectCommand="SELECT Employees.EmployeeName, Employees.Email, Employees.Phone, Departments.DepartmentName, Employees.EmployeeId FROM Employees INNER JOIN Departments ON Employees.DepartmentId = Departments.DepartmentId"></asp:SqlDataSource>
         </div>
        <div class="col-6 border-end">
            <h3 class="display-6">Select Designation</h3>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="EmployeeId,DesignationId" DataSourceID="dsDesignationHistorys" InsertItemPosition="LastItem" OnItemInserting="ListView1_ItemInserting">
                
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ValidationGroup="ge" CssClass="btn btn-primary btn-sm" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ValidationGroup="ge" CssClass="btn btn-secondary btn-sm" CausesValidation="false" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label CssClass="form-control" ValidationGroup="ge" ID="EmployeeIdLabel1" runat="server" Text='<%# Eval("EmployeeId") %>' />
                        </td>
                        <td>
                            <asp:Label CssClass="form-control" ValidationGroup="ge" ID="DesignationIdLabel1" runat="server" Text='<%# Eval("DesignationId") %>' />
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="ge" ID="StartDateTextBox" runat="server" Text='<%# Bind("StartDate") %>' />
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="ge" ID="EndDateTextBox" runat="server" Text='<%# Bind("EndDate") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" class="table table-bordered">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td style="width: 150px; text-align: center">
                            <asp:Button CssClass="btn btn-primary btn-sm" ValidationGroup="gi" ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button CssClass="btn btn-secondary btn-sm" ValidationGroup="gi" ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>
                            <asp:HiddenField ID="EmployeeIdTextBox" runat="server" Value='<%# Bind("EmployeeId") %>' />
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="gi" ID="DesignationIdTextBox" runat="server" Text='<%# Bind("DesignationId") %>' />
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="gi" ID="StartDateTextBox" runat="server" Text='<%# Bind("StartDate") %>' />
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="gi" ID="EndDateTextBox" runat="server" Text='<%# Bind("EndDate") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td style="text-align: center">
                            <asp:Button CssClass="btn btn-danger btn-sm" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button CssClass="btn btn-secondary btn-sm" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="EmployeeIdLabel" runat="server" Text='<%# Eval("EmployeeId") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DesignationIdLabel" runat="server" Text='<%# Eval("DesignationId") %>' />
                        </td>
                        <td>
                            <asp:Label ID="StartDateLabel" runat="server" Text='<%# Eval("StartDate") %>' />
                        </td>
                        <td>
                            <asp:Label ID="EndDateLabel" runat="server" Text='<%# Eval("EndDate") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr runat="server" style="">
                                        <th runat="server"></th>
                                        <th runat="server">EmployeeId</th>
                                        <th runat="server">DesignationId</th>
                                        <th runat="server">StartDate</th>
                                        <th runat="server">EndDate</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                
            </asp:ListView>
            <asp:SqlDataSource ID="dsDesignationHistorys" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" DeleteCommand="DELETE FROM [DesignationHistories] WHERE [EmployeeId] = @EmployeeId AND [DesignationId] = @DesignationId" InsertCommand="INSERT INTO [DesignationHistories] ([EmployeeId], [DesignationId], [StartDate], [EndDate]) VALUES (@EmployeeId, @DesignationId, @StartDate, @EndDate)" SelectCommand="SELECT * FROM [DesignationHistories] WHERE ([EmployeeId] = @EmployeeId)" UpdateCommand="UPDATE [DesignationHistories] SET [StartDate] = @StartDate, [EndDate] = @EndDate WHERE [EmployeeId] = @EmployeeId AND [DesignationId] = @DesignationId">
                <DeleteParameters>
                    <asp:Parameter Name="EmployeeId" Type="Int32" />
                    <asp:Parameter Name="DesignationId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="EmployeeId" Type="Int32" />
                    <asp:Parameter Name="DesignationId" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="StartDate" />
                    <asp:Parameter DbType="Date" Name="EndDate" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="EmployeeId" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter DbType="Date" Name="StartDate" />
                    <asp:Parameter DbType="Date" Name="EndDate" />
                    <asp:Parameter Name="EmployeeId" Type="Int32" />
                    <asp:Parameter Name="DesignationId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
