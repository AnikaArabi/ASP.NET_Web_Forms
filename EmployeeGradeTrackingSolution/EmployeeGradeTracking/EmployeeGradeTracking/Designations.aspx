<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Designations.aspx.cs" Inherits="EmployeeGradeTracking.EmployeeGradeTracking.Designations" %>

<%@ Register Src="~/DesignationsUserCtrl.ascx" TagPrefix="uc1" TagName="DesignationsUserCtrl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <uc1:DesignationsUserCtrl runat="server" id="DesignationsUserCtrl" />
</asp:Content>
