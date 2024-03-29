<%@include file="partials/header.jsp" %>

<div class="col-md-4 col-md-offset-4">
    <h1>Login</h1>
    <br>
    <%
        String error = (String) session.getAttribute("error");
        if (error != null) {
    %>
    <div class="alert alert-danger" role="alert">
        <%= error%>
    </div>
    <%
            session.removeAttribute("error");
        }
    %>

    <form action="Relay" method="post">
        <input type="hidden" name="action" value="Login"/>

        <div class="form-group">
            <label for="username">Username</label>
            <input class="form-control" type="" name="username" id="username" placeholder="Username"/>
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input class="form-control" type="password" name="password" id="password" placeholder="Password"/>
        </div>

        <button type="submit" class="btn btn-primary">Login</button>
    </form>
</div>

<%@include file="partials/footer.jsp" %>