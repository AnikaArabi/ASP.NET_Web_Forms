<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Departments.aspx.cs" Inherits="EmployeeGradeTracking.EmployeeGradeTracking.Departments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <link href="/Content/Icons/font/bootstrap-icons.css" rel="stylesheet" />
    <style>
        th a {
            text-decoration: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row px-2">
        <div class="col-12 border-bottom mb-3">
            <h2 class="display-4" style="background-color:teal; color:white; text-align:center; border:outset;">Departments </h2>
        </div>
        <div class="col-6 border-end">
            <h3 class="display-6">Add New</h3>
            <asp:FormView ID="fvDepartments" DefaultMode="Insert" runat="server" DataKeyNames="DepartmentId" DataSourceID="dsDepartments">

                <InsertItemTemplate>
                    <div class="form-group row mb-1">
                        <label class="col-form-label col-form-label-sm col-4"">DepartmentName:</label>
                        <div class="col-8">
                            <asp:TextBox ID="DepartmentNameTextBox" ValidationGroup="fv-in" CssClass="form-control form-control-sm" runat="server" Text='<%# Bind("DepartmentName") %>' />
                            <asp:RequiredFieldValidator ValidationGroup="fv-in" CssClass="text-danger err" ID="RequiredFieldValidator3" ControlToValidate="DepartmentNameTextBox" runat="server" ErrorMessage="Department Name is required"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                        <div class="col-12">
                            <div class="d-flex justify-content-end">
                            <asp:LinkButton ValidationGroup="fv-in" CssClass="btn btn-success btn-sm" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text=""><i class="bi bi-plus-circle"></i> Insert</asp:LinkButton>
                            &nbsp;<asp:LinkButton CssClass="btn btn-secondary btn-sm" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text=""><i class="bi bi-x"></i> Cancel</asp:LinkButton>
                            </div>
                        </div>
                      <br />
                </InsertItemTemplate>
            </asp:FormView>
        </div>
        <div class="col-6 border-end">
            <h3 class="display-6">Edit/Delete</h3>
            <asp:GridView Width="100%" ID="gvDepartments" CssClass="table table-bordered table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="DepartmentId" DataSourceID="dsDepartments" AllowPaging="True" AllowSorting="True" OnRowDataBound="gvDepartments_RowDataBound">
                <HeaderStyle CssClass="table-primary" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="DepartmentId" HeaderText="Department Id" InsertVisible="False" ReadOnly="True" SortExpression="DepartmentId" />
                    <asp:TemplateField HeaderText="Department Name" SortExpression="DepartmentName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" ValidationGroup="gv-e" CssClass="form-control form-control-sm" runat="server" Text='<%# Bind("DepartmentName") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="TextBox1" ValidationGroup="gv-e" ID="RequiredFieldValidator1" Text="Department name is required" CssClass="text-danger err" runat="server" ErrorMessage="Department Name is required"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("DepartmentName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ValidationGroup="gv-ed" ID="LinkButton1" runat="server" CssClass="btn btn-success btn-sm rounded-circle" CausesValidation="True" CommandName="Update" Text="Update"><i class="bi bi-save"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-secondary btn-sm rounded-circle" CausesValidation="False" CommandName="Cancel" Text="Cancel"><i class="bi bi-x"></i></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" CssClass="btn btn-primary btn-sm rounded-circle" runat="server" CausesValidation="False" CommandName="Edit"><i class="bi bi-pencil"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" CssClass="btn btn-danger btn-sm rounded-circle" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"><i class="bi bi-trash"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="dsDepartments" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" DeleteCommand="DELETE FROM [Departments] WHERE [DepartmentId] = @DepartmentId" InsertCommand="INSERT INTO [Departments] ([DepartmentName]) VALUES (@DepartmentName)" SelectCommand="SELECT * FROM [Departments]" UpdateCommand="UPDATE [Departments] SET [DepartmentName] = @DepartmentName WHERE [DepartmentId] = @DepartmentId">
                <DeleteParameters>
                    <asp:Parameter Name="DepartmentId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="DepartmentName" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="DepartmentName" Type="String" />
                    <asp:Parameter Name="DepartmentId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
