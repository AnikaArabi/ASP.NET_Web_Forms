<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Grades.aspx.cs" Inherits="EmployeeGradeTracking.EmployeeGradeTracking.Grades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row">
        <div class="col-12">
            <h2 class="display-4">Designations</h2>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="GradeId" DataSourceID="dsGrades" InsertItemPosition="LastItem">
                
                <EditItemTemplate>
                    <tr style="">
                        <td>
                        <asp:Button CssClass="btn btn-primary btn-sm" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button CssClass="btn btn-secondary btn-sm" CausesValidation="false" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                        <td>[Auto]</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="GradeTextBox" runat="server" Text='<%# Bind("Grade") %>' />
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
                            <asp:TextBox CssClass="form-control" ID="GradeTextBox" runat="server" Text='<%# Bind("Grade") %>' />
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
                            <asp:Label ID="GradeIdLabel" runat="server" Text='<%# Eval("GradeId") %>' />
                        </td>
                        <td>
                            <asp:Label ID="GradeLabel" runat="server" Text='<%# Eval("Grade") %>' />
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
                                        <th runat="server">GradeId</th>
                                        <th runat="server">Grade</th>
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
            <asp:SqlDataSource ID="dsGrades" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" DeleteCommand="DELETE FROM [Grades] WHERE [GradeId] = @GradeId" InsertCommand="INSERT INTO [Grades] ([Grade]) VALUES (@Grade)" SelectCommand="SELECT * FROM [Grades]" UpdateCommand="UPDATE [Grades] SET [Grade] = @Grade WHERE [GradeId] = @GradeId">
                <DeleteParameters>
                    <asp:Parameter Name="GradeId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Grade" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Grade" Type="String" />
                    <asp:Parameter Name="GradeId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
