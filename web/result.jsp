<%@page import="business.TransferObjects.TopicInterface" %>
<%@page import="integration.DAO" %>
<% String score = session.getAttribute("quizScore") != null ? session.getAttribute("quizScore").toString() : "0";
    Integer topicId = Integer.parseInt(session.getAttribute("quizTopicId").toString());
    DAO dao = DAO.getQuizDAO();
    TopicInterface topic = dao.getTopic(topicId);
%>

<%@include file="partials/header.jsp" %>
<h1>
    <small>Your score is:</small>
    <%= score%>
    points!
</h1>
<%@include file="partials/footer.jsp" %>