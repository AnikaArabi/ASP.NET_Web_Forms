<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="EmployeeGradeTracking.EmployeeGradeTracking.Employees" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <link href="../Content/bootstrap-datepicker.standalone.css" rel="stylesheet" />
    <link href="../Content/Icons/font/bootstrap-icons.css" rel="stylesheet" />
    <style>
        
        th a {
            text-decoration: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row">
        <div class="col-12">
            <h3>Employee of Departments </h3>
        </div>
    </div>
     <div class="row">
        <div class="col-12">
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="EmployeeId" DataSourceID="obsEmployees" InsertItemPosition="LastItem">
                
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="EmployeeIdLabel1" runat="server" Text='<%# Eval("EmployeeId") %>' />
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control form-control-sm" ValidationGroup="lv-in" ID="EmployeeNameTextBox" runat="server" Text='<%# Bind("EmployeeName") %>' />
                            <asp:RequiredFieldValidator ValidationGroup="lv-ed" CssClass="text-danger err" ControlToValidate="employeeNameTextBox" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control form-control-sm" ValidationGroup="lv-in" ID="JoiningDateTextBox" runat="server" Text='<%# Bind("JoiningDate") %>' />
                            <asp:RequiredFieldValidator ValidationGroup="lv-ed" CssClass="text-danger err" ControlToValidate="JoinDateTextBox" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Join date required"></asp:RequiredFieldValidator>

                        </td>
                        <td>
                            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="lv-ed" CssClass="text-danger err" ControlToValidate="employeeEmailTextBox" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Email required"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ValidationGroup="lv-ed" CssClass="text-danger err" ControlToValidate="employeeEmailTextBox" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid email"></asp:RegularExpressionValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                            <asp:RequiredFieldValidator ValidationGroup="lv-ed" CssClass="text-danger err" ControlToValidate="employeePhoneTextBox" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Phone required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:CheckBox CssClass="form-control form-control-sm" ID="isActiveCheckBox" runat="server" Checked='<%# Bind("isActive") %>' />
                        </td>
                        
                        <td>
                            <img src='<%# Eval("Picture", "Uploads/{0}") %>' class="img-thumbnail" style="width:50px" />
                            <asp:FileUpload ValidationGroup="lv-ed" ID="fu" runat="server" />
                            <asp:HiddenField  ID="HiddenField1" runat="server" Value='<%# Bind("Picture") %>' />
                            
                            
                        </td>
                        <td>
                            <asp:DropDownList CssClass="form-select form-select-sm" ValidationGroup="lv-ed" ID="DepartmentIdTextBox" runat="server" Text='<%# Bind("DepartmentId") %>' DataTextField="DepartmentName" DataValueField="DepartmentId">

                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ValidationGroup="lv-ed" CssClass="text-danger err" ControlToValidate="DepartmentIdTextBox" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Department id required"></asp:RequiredFieldValidator>
                        </td>
                         <td>
                            <asp:LinkButton ID="LinkButton1" ValidationGroup="lv-ed" CssClass="btn btn-primary btn-sm rounded-circle" runat="server" CommandName="Update" Text="Update"><i class="bi bi-save"></i></asp:LinkButton>
                            <asp:LinkButton ID="LinkButton2" CssClass="btn btn-secondary btn-sm rounded-circle" CausesValidation="false" runat="server" CommandName="Cancel" Text=""><i class="bi bi-x"></i></asp:LinkButton>
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                       
                        <td>-</td>
                        <td>
                            <asp:TextBox CssClass="form-control form-control-sm" ValidationGroup="lv-in" ID="EmployeeNameTextBox" runat="server" Text='<%# Bind("EmployeeName") %>' />
                            <asp:RequiredFieldValidator ValidationGroup="lv-in" CssClass="text-danger err" ControlToValidate="employeeNameTextBox" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="JoiningDateTextBox" CssClass="form-control form-control-sm date" ValidationGroup="lv-in" runat="server" Text='<%# Bind("JoiningDate") %>' />
                            <asp:RequiredFieldValidator ValidationGroup="lv-in" CssClass="text-danger err" ControlToValidate="JoiningDateTextBox" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Name required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control form-control-sm" ValidationGroup="lv-in" ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="lv-in" CssClass="text-danger err" ControlToValidate="EmailTextBox" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Email required"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ValidationGroup="lv-in" CssClass="text-danger err" ControlToValidate="EmailTextBox" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid email"></asp:RegularExpressionValidator>
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control form-control-sm" ValidationGroup="lv-in"  ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                            <asp:RequiredFieldValidator ValidationGroup="lv-in" CssClass="text-danger err" ControlToValidate="PhoneTextBox" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Phone required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:CheckBox ID="isActiveCheckBox" runat="server" Checked='<%# Bind("isActive") %>' />
                        </td>
                        <td>
                            <asp:FileUpload ValidationGroup="gi" ID="fu" runat="server" />
                            <asp:HiddenField  ID="PictureTextBox" runat="server" Value='<%# Bind("Picture") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="gi" ControlToValidate="fu" CssClass="text-danger" ID="RequiredFieldValidator7" runat="server" ErrorMessage="Emp. Name Required"></asp:RequiredFieldValidator>
                            
                        </td>
                        <td>
                            <asp:DropDownList CssClass="form-select form-select-sm" ValidationGroup="lv-ed" ID="DepartmentIdTextBox" runat="server" Text='<%# Bind("DepartmentId") %>' DataTextField="DepartmentName" DataValueField="DepartmentId">
                                <asp:ListItem Text="Select" Value="" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ValidationGroup="lv-ed" CssClass="text-danger err" ControlToValidate="DepartmentIdTextBox" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Department id required"></asp:RequiredFieldValidator>
                        </td>
                         <td>
                            <asp:LinkButton ValidationGroup="lv-in" CssClass="btn btn-secondary btn-sm rounded-circle" ID="InsertButton" runat="server" CommandName="Insert" Text=""><i class="bi bi-plus"></i></asp:LinkButton>
                            <asp:LinkButton CausesValidation="false" CssClass="btn btn-danger btn-sm rounded-circle" ID="CancelButton" runat="server" CommandName="Cancel" Text=""><i class="bi bi-x"></i></asp:LinkButton>
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
                            <asp:Label ID="PictureLabel" runat="server" Text='<%# Eval("Picture") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DepartmentIdLabel" runat="server" Text='<%# Eval("DepartmentId") %>' />
                        </td>
                        <td>
                            <asp:LinkButton CausesValidation="false" CssClass="btn btn-secondary btn-sm rounded-circle" ID="EditButton" runat="server" CommandName="Edit" Text=""><i class="bi bi-pencil"></i></asp:LinkButton>
                            <asp:LinkButton CausesValidation="false" CssClass="btn btn-danger btn-sm rounded-circle" ID="DeleteButton" runat="server" CommandName="Delete" Text=""><i class="bi bi-trash"></i></asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" class="table">
                        <tr runat="server">
                            <td runat="server">
                                <table class="table table-bordered table-striped" id="itemPlaceholderContainer" runat="server" border="0" style="">
                                     <thead class="table-light">
                                    <tr runat="server" style="">
                                        
                                        <th runat="server">EmployeeId</th>
                                        <th runat="server">EmployeeName</th>
                                        <th runat="server">JoiningDate</th>
                                        <th runat="server">Email</th>
                                        <th runat="server">Phone</th>
                                        <th runat="server">isActive</th>
                                        <th runat="server">Picture</th>
                                        <th runat="server">Department</th>
                                        <th runat="server"></th>
                                    </tr>
                                   </thead>
                                    <tbody>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="btn btn-sm"  ShowFirstPageButton="True" ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
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
                            <asp:Label ID="PictureLabel" runat="server" Text='<%# Eval("Picture") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DepartmentIdLabel" runat="server" Text='<%# Eval("DepartmentId") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="obsEmployees" runat="server" DataObjectTypeName="EmployeeGradeTracking.BILL.EmployeeDTO" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="GetAll" TypeName="EmployeeGradeTracking.BILL.EmployeeManage" UpdateMethod="Update"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="obsDepartments" runat="server" SelectMethod="BranchDropItems" TypeName="EmployeeGradeTracking.BILL.EmployeeManage"></asp:ObjectDataSource>
        </div>
    </div>

&nbsp; 

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
     <script src="../Scripts/bootstrap-datepicker.js"></script>
    <script>
        $(() => {
            $(".date").datepicker({
                format: "yyyy-mm-dd"
            });
        })
    </script>
</asp:Content>
