<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PolicyBuilder.Models.policyData>" %>
<%@ Import Namespace="policyDB.EntityClasses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="breadcrumb">
        <% if (Model.Condition.TargetCollectionViaTargetCondition[0].Policy[0].Set == false)
           { %>
            <%= Html.ActionLink("< back to policy", "EditPolicy", new { id = Model.PolicyLink.Id })%>
            <%}
           else
           { %>
            <%= Html.ActionLink("< back to policy set", "EditPolicySet", new { id = Model.PolicyLink.Id })%>
            <% } %>
    </div>

    <h2><%= ViewData["title"] %></h2>

    <div class="detailPanel">
        <table>
            <tr>
                <th colspan="4"><%= ViewData["title"] %></th>
            </tr>
        <% if (Model.Condition.Children.Count > 0)
           { %>
            <tr>
                <th>match attribute</th>
                <th>against</th>
                <th>order</th>
                <th>&nbsp;</th>
            </tr>
        <%
            int idx = 0;
            foreach (DecisionNodeEntity ame in Model.Condition.Children)
            {
                if (idx++ > 0)
                {
                %>
                <tr>
                    <td colspan="4"><%= Model.Condition.CombineAnd ? "and" : "or"%></td>
                </tr>
                <%
            } %>
            <% if (ame.Type == PolicyBuilder.constants.attributeMatchType)
               { %>
                <tr>
                    <td><%= Model.GetMatchName(ame)%></td>
                    <td><%= Model.GetMatchString(ame)%></td>
                    <td>
                        <% using (Html.BeginForm("DecisionNodeOrder", "policy", new { id = Model.Condition.Id, id2 = ame.Id, linkId = Model.PolicyLink.Id }, FormMethod.Post))
                           {%>
                           <input type="hidden" name="backTo" value="<%= ViewData["backTo"] %>" />
                        <button name="up" type="submit"><img src="/Content/upArrow.png" /></button><button name="down" type="submit"><img src="/Content/downArrow.png" /></button>
                        <% } %>
                    </td>
                    <td><%= Html.ActionLink("edit", "EditMatch", new { id = ame.Id, linkId = Model.PolicyLink.Id })%> | <%= Html.ActionLink("delete", "DeleteDecisionNode", new { id = ame.Id, linkId = Model.PolicyLink.Id })%></td>
                </tr>
            <%}
            }
           }
           else
           {%>
           <tr>
            <td colspan="4">there is no condition - everything will match</td>
           </tr>
           <% } %>
            <tr>
                <td colspan="4" class="actionPanel"><%= Html.ActionLink("add attribute match","CreateMatch",new { id=Model.Condition.Id, linkId = Model.PolicyLink.Id }) %></td>
            </tr>
        </table>
    </div>

</asp:Content>
