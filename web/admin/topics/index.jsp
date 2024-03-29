<%@page import="integration.Authentication"%>
<%@page import="business.TransferObjects.Topic" %>
<%@page import="integration.DAO" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Iterator" %>

<%  Authentication.mustBeAdministrator(request, response);%>

<%@include file="../../partials/header.jsp" %>

<h1>Topics <a href="<%=path%>/Relay?action=/admin/topics/form.jsp" class="btn btn-sm btn-default">New Topic</a></h1>


<table class="table table-bordered table-hover">
    <thead>
        <tr>
            <th width="5%">#</th>
            <th>Name</th>
            <th width="10%">Actions</th>
        </tr>
    </thead>
    <tbody>

        <% DAO dao = DAO.getQuizDAO();
            ArrayList topics = dao.getTopics();
            Topic aTopic;
            Iterator i = topics.iterator();
            while (i.hasNext()) {
                aTopic = (Topic) i.next();
        %>
        <tr>
            <td><%=aTopic.getId()%>
            </td>
            <td><%=aTopic.getName()%>
            </td>
            <td>
                <a href="<%=path%>/Relay?action=/admin/topics/form.jsp&id=<%=aTopic.getId()%>" class="btn btn-success">Edit</a>
            </td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>

<%@include file="../../partials/footer.jsp" %>