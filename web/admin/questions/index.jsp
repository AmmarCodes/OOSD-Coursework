<%@page import="integration.Authentication"%>
<%@page import="business.TransferObjects.Question" %>
<%@page import="integration.DAO" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Iterator" %>

<%  Authentication.mustBeAdministrator(request, response);%>

<%@include file="../../partials/header.jsp" %>

<h1>Questions <a href="<%=path%>/Relay?action=/admin/questions/form.jsp" class="btn btn-sm btn-default">New Question</a></h1>

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
            ArrayList questions = dao.getQuestions();
            Question aQuestion;
            Iterator i = questions.iterator();
            while (i.hasNext()) {
                aQuestion = (Question) i.next();
        %>
        <tr>
            <td><%=aQuestion.getId()%>
            </td>
            <td><%=aQuestion.getTitle()%>
            </td>
            <td>
                <a href="<%=path%>/Relay?action=/admin/questions/form.jsp&id=<%=aQuestion.getId()%>" class="btn btn-success">Edit</a>
            </td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>

<%@include file="../../partials/footer.jsp" %>