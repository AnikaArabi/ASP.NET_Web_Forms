<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DesignationsUserCtrl.ascx.cs" Inherits="EmployeeGradeTracking.DesignationsUserCtrl" %>
<div class="row">
    <div class="col-12">
        <h2 class="display-4">Designations</h2>
        <asp:ListView ID="lvDesignations" runat="server" DataKeyNames="DesignationId" DataSourceID="obsDesignations" InsertItemPosition="LastItem">

            <EditItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button CssClass="btn btn-primary btn-sm" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button CssClass="btn btn-secondary btn-sm" CausesValidation="false" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>[Auto]</td>
                    <td>
                        <asp:TextBox CssClass="form-control" ID="DesignationTextBox" runat="server" Text='<%# Bind("Designation") %>' />
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
                        <asp:Button CssClass="btn btn-primary btn-sm" ID="Button1" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button CssClass="btn btn-secondary btn-sm" ID="Button2" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:TextBox CssClass="form-control" ID="DesignationTextBox" runat="server" Text='<%# Bind("Designation") %>' />
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
                        <asp:Label ID="DesignationIdLabel" runat="server" Text='<%# Eval("DesignationId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DesignationLabel" runat="server" Text='<%# Eval("Designation") %>' />
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
                                    <th runat="server">DesignationId</th>
                                    <th runat="server">Designation</th>
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
        <asp:SqlDataSource ID="dsDesignations" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" DeleteCommand="DELETE FROM [Designations] WHERE [DesignationId] = @DesignationId" InsertCommand="INSERT INTO [Designations] ([Designation]) VALUES (@Designation)" SelectCommand="SELECT * FROM [Designations]" UpdateCommand="UPDATE [Designations] SET [Designation] = @Designation WHERE [DesignationId] = @DesignationId">
            <DeleteParameters>
                <asp:Parameter Name="DesignationId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Designation" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Designation" Type="String" />
                <asp:Parameter Name="DesignationId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:ObjectDataSource ID="obsDesignations" runat="server" DataObjectTypeName="EmployeeGradeTracking.BILL.DesignationDTO" DeleteMethod="Delete" InsertMethod="Insert" SelectCountMethod="DesignationCount" SelectMethod="GetAll" TypeName="EmployeeGradeTracking.BILL.DesignationRepo" UpdateMethod="Update"></asp:ObjectDataSource>
    </div>
</div>
