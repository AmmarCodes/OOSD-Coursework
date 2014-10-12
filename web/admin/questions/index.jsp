<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="business.TransferObjects.Question"%>
<%@page import="integration.DAO"%>
<%@include file="../../partials/header.jsp" %>

<h1>Questions <a href="./form.jsp" class="btn btn-sm btn-default">New Question</a></h1>


<table class="table table-bordered table-hover">
    <thead>
        <tr>
            <th width="5%">#</th>
            <th>Name</th>
            <th width="10%">Actions</th>
        </tr>
    </thead>
    <tbody>

        <%    DAO dao = DAO.getQuizDAO();
            ArrayList questions = dao.getQuestions();
            Question aQuestion;
            Iterator i = questions.iterator();
            while (i.hasNext()) {
                aQuestion = (Question) i.next();
        %>
        <tr>
            <td><%=aQuestion.getId()%></td>
            <td><%=aQuestion.getTitle()%></td>
            <td>
                <a href="./form.jsp?id=<%=aQuestion.getId()%>" class="btn btn-success">Edit</a>
            </td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>

<%@include file="../../partials/footer.jsp" %>