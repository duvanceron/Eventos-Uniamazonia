<%@ Page Title="" Language="C#" MasterPageFile="~/Shared/Layout.Master" AutoEventWireup="true" CodeBehind="ViewCrystalReport.aspx.cs" Inherits="EventosUniamazonia.Views.ViewsReports.ViewCrystalReport" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Vista reportes</title>
    <meta name="description" content="vista reportes" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="../../Means/css/styleGlobal.css" />
    <link rel="stylesheet" href="../../Means/fonts/style.css" />
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <CR:CrystalReportViewer ID="CrystalReportEvents" runat="server" AutoDataBind="true" />
</asp:Content>
