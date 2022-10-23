<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeesSql.aspx.cs" Inherits="EmployeeGradeTracking.EmployeeGradeTracking.EmployeesSql" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <asp:UpdateProgress class="w-100" ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div class="d-flex align-items-center text-primary">
                <span>Loading...</span>
                <div class="spinner-border spinner-border-sm ms-auto" role="status" aria-hidden="true"></div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel class="w-100" ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-12">
                    <h2 class="display-6" style="background-color: teal; color: white; text-align: center; border: outset;">Employees Form</h2>
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="EmployeeId" DataSourceID="dsEmployees" InsertItemPosition="LastItem" OnItemDataBound="ListView1_ItemDataBound" OnItemInserting="ListView1_ItemInserting" OnItemUpdating="ListView1_ItemUpdating">

                        <EditItemTemplate>
                            <tr style="">

                                <td>[Auto]</td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ValidationGroup="ge" ID="EmployeeNameTextBox" runat="server" Text='<%# Bind("EmployeeName") %>' />
                                    <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="ge" ControlToValidate="EmployeeNameTextBox" CssClass="text-danger" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Employee Name is Required"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ValidationGroup="ge" ID="JoiningDateTextBox" runat="server" Text='<%# Bind("JoiningDate") %>' />
                                    <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="ge" ControlToValidate="JoiningDateTextBox" CssClass="text-danger" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Employee Name is Required"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ValidationGroup="ge" ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                                    <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="ge" ControlToValidate="EmailTextBox" CssClass="text-danger" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Employee Name is Required"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ValidationGroup="ge" ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                                    <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="ge" ControlToValidate="PhoneTextBox" CssClass="text-danger" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Employee Name is Required"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:CheckBox CssClass="form-check mt-1" ID="isActiveCheckBox" runat="server" Checked='<%# Bind("isActive") %>' />
                                </td>
                                <td>
                                    <img src='<%# Eval("Picture", "/Uploads/{0}") %>' class="img-thumbnail" style="width: 60px; height: 50px;" />
                                    <asp:FileUpload ValidationGroup="ge" ID="fu" runat="server" />
                                    <asp:HiddenField ID="PictureTextBox" runat="server" Value='<%# Bind("Picture") %>' />
                                </td>
                                <td>
                                    <asp:DropDownList ValidationGroup="ge" ID="DepartmentIdDDL" DataSourceID="dsDepts" CssClass="form-select" runat="server" SelectedValue='<%# Bind("DepartmentId") %>' DataValueField="DepartmentId" DataTextField="DepartmentName" AppendDataBoundItems="True">
                                        <asp:ListItem Value="" Text="Select one" Selected="True" />
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="ge" ControlToValidate="DepartmentIdDDL" CssClass="text-danger" ID="RequiredFieldValidator5" runat="server" ErrorMessage="BloodId is Required"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:Button ValidationGroup="ge" CssClass="btn btn-primary btn-sm" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                    <asp:Button ValidationGroup="ge" CssClass="btn btn-secondary btn-sm" CausesValidation="false" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
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

                                <td>&nbsp;</td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ValidationGroup="gi" ID="EmployeeNameTextBox" runat="server" Text='<%# Bind("EmployeeName") %>' />
                                    <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="gi" ControlToValidate="EmployeeNameTextBox" CssClass="text-danger" ID="RequiredFieldValidator8" runat="server" ErrorMessage="Employee Name is Required"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ValidationGroup="gi" ID="JoiningDateTextBox" runat="server" Text='<%# Bind("JoiningDate") %>' />
                                    <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="gi" ControlToValidate="JoiningDateTextBox" CssClass="text-danger" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Employee Name is Required"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ValidationGroup="gi" ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                                    <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="gi" ControlToValidate="EmailTextBox" CssClass="text-danger" ID="RequiredFieldValidator7" runat="server" ErrorMessage="Employee Name is Required"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control" ValidationGroup="gi" ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                                    <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="gi" ControlToValidate="PhoneTextBox" CssClass="text-danger" ID="RequiredFieldValidator9" runat="server" ErrorMessage="Employee Name is Required"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:CheckBox ID="isActiveCheckBox" runat="server" Checked='<%# Bind("isActive") %>' />
                                </td>
                                <td>
                                    <asp:FileUpload ValidationGroup="gi" ID="fu" runat="server" />
                                    <asp:HiddenField ID="PictureTextBox" runat="server" Value='<%# Bind("Picture") %>' />
                                    <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="gi" ControlToValidate="fu" CssClass="text-danger" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Picture Required"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:DropDownList ValidationGroup="gi" ID="DepartmentIdDDL" DataSourceID="dsDepts" CssClass="form-select" runat="server" SelectedValue='<%# Bind("DepartmentId") %>' DataValueField="DepartmentId" DataTextField="DepartmentName" AppendDataBoundItems="True">
                                        <asp:ListItem Value="" Text="Select one" Selected="True" />
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="gi" ControlToValidate="DepartmentIdDDL" CssClass="text-danger" ID="RequiredFieldValidator10" runat="server" ErrorMessage="BloodId is Required"></asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 150px; text-align: center">
                                    <asp:Button CssClass="btn btn-primary btn-sm" ValidationGroup="gi" ID="Button1" runat="server" CommandName="Insert" Text="Insert" />
                                    <asp:Button CssClass="btn btn-secondary btn-sm" ValidationGroup="gi" ID="Button2" runat="server" CommandName="Cancel" Text="Clear" />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="">

                                <td>
                                    <asp:Label ID="EmployeeIdLabel" runat="server" Text='<%# Eval("EmployeeId") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="EmployeeNameLabel" runat="server" Text='<%# Eval("EmployeeName") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="JoiningDateLabel" runat="server" Text='<%# Eval("JoiningDate") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="PhoneLabel" runat="server" Text='<%# Eval("Phone") %>' />
                                </td>
                                <td>
                                    <asp:CheckBox ID="isActiveCheckBox" runat="server" Checked='<%# Eval("isActive") %>' Enabled="false" />
                                </td>
                                <td>
                                    <img src='<%# Eval("Picture", "/Uploads/{0}") %>' class="img-thumbnail" style="width: 60px; height: 50px;" />
                                </td>
                                <td>
                                    <asp:Label ID="DepartmentIdLabel" runat="server" Text='<%# Eval("DepartmentId") %>' />
                                </td>
                                <td style="text-align: center">
                                    <asp:Button CssClass="btn btn-danger btn-sm" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                    <asp:Button CssClass="btn btn-secondary btn-sm" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server" class="table">
                                <tr runat="server">
                                    <td runat="server">
                                        <table class="table table-bordered table-striped" id="itemPlaceholderContainer" runat="server" border="0" style="text-align: center">
                                            <tr runat="server" style="">
                                                <th runat="server"></th>

                                                <th runat="server">EmployeeName</th>
                                                <th runat="server">JoiningDate</th>
                                                <th runat="server">Email</th>
                                                <th runat="server">Phone</th>
                                                <th runat="server">isActive</th>
                                                <th runat="server">Picture</th>
                                                <th runat="server">DepartmentId</th>
                                            </tr>
                                            <tr id="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style="">
                                        <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                            </Fields>
                                        </asp:DataPager>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>

                    </asp:ListView>
                    <asp:SqlDataSource ID="dsEmployees" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" DeleteCommand="DELETE FROM [Employees] WHERE [EmployeeId] = @EmployeeId" InsertCommand="INSERT INTO [Employees] ([EmployeeName], [JoiningDate], [Email], [Phone], [isActive], [Picture], [DepartmentId]) VALUES (@EmployeeName, @JoiningDate, @Email, @Phone, @isActive, @Picture, @DepartmentId)" SelectCommand="SELECT * FROM [Employees]" UpdateCommand="UPDATE [Employees] SET [EmployeeName] = @EmployeeName, [JoiningDate] = @JoiningDate, [Email] = @Email, [Phone] = @Phone, [isActive] = @isActive, [Picture] = @Picture, [DepartmentId] = @DepartmentId WHERE [EmployeeId] = @EmployeeId">
                        <DeleteParameters>
                            <asp:Parameter Name="EmployeeId" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="EmployeeName" Type="String" />
                            <asp:Parameter DbType="Date" Name="JoiningDate" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="Phone" Type="String" />
                            <asp:Parameter Name="isActive" Type="Boolean" />
                            <asp:Parameter Name="Picture" Type="String" />
                            <asp:Parameter Name="DepartmentId" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="EmployeeName" Type="String" />
                            <asp:Parameter DbType="Date" Name="JoiningDate" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="Phone" Type="String" />
                            <asp:Parameter Name="isActive" Type="Boolean" />
                            <asp:Parameter Name="Picture" Type="String" />
                            <asp:Parameter Name="DepartmentId" Type="Int32" />
                            <asp:Parameter Name="EmployeeId" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsDepts" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" SelectCommand="SELECT * FROM [Departments]"></asp:SqlDataSource>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

