<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="KendoGridExample._Default" %>

<asp:Content runat="server" ID="HeadContent" ContentPlaceHolderID="HeadContent">
    <link href="<%: ResolveUrl("~/Content/kendo/2013.1.319/kendo.common.min.css") %>" rel="stylesheet" />
    <link href="<%: ResolveUrl("~/Content/kendo/2013.1.319/kendo.default.min.css") %>" rel="stylesheet" />
</asp:Content>
<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1><%: Title %>.</h1>
                <h2>Modify this template to jump-start your ASP.NET application.</h2>
            </hgroup>
            <p>
                To learn more about ASP.NET, visit <a href="http://asp.net" title="ASP.NET Website">http://asp.net</a>.
                The page features <mark>videos, tutorials, and samples</mark> to help you get the most from ASP.NET.
                If you have any questions about ASP.NET visit
                <a href="http://forums.asp.net/18.aspx" title="ASP.NET Forum">our forums</a>.
            </p>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <asp:ScriptManagerProxy runat="server">
        <Scripts>
            <asp:ScriptReference Path="~/Scripts/kendo/2013.1.319/kendo.web.min.js" />
        </Scripts>
    </asp:ScriptManagerProxy>
    <h3>Here is a grid:</h3>
    <div id="myGrid"></div>
    <script type="text/javascript">
        var pagePath = '<%: ResolveUrl("~/Default.aspx")%>';
        $(document).ready(function () {
            $("#myGrid").kendoGrid({
                serverPaging: true,
                pageable: true,
                dataSource: {
                    transport: {
                        read: function (options) {
                            $.ajax({
                                url: pagePath + "/GetItems",
                                type: "POST",
                                dataType: "json",
                                contentType: "application/json; charset=utf-8",
                                data: options.data,
                                success: function (result) {
                                    // it worked, great!
                                    options.success(result.d);
                                    alert('woo-yea.');
                                },
                                error: function (a, b, c) {
                                    // It failed, let's try again using the no parameter pagemethod
                                    alert('failed, lets try the no param method');
                                    $.ajax({
                                        url: pagePath + "/GetItemsBlank",
                                        type: "POST",
                                        dataType: "json",
                                        contentType: "application/json; charset=utf-8",
                                        data: options.data,
                                        success: function (result) {
                                            options.success(result.d);
                                            alert('woo-yea, worked eventually but with no paging parameters :(');
                                        },
                                        error: function (a, b, c) {
                                            alert('alternative method failed as well -_-');
                                        }
                                    });
                                }
                            });
                        }
                    },
                    schema: { data: "Items", total: "TotalItemCount" }
                }
            });
        });
    </script>
</asp:Content>
