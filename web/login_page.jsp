<%@ page import="kz.bitlab.javaee.sprint2.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% User currentUser = (User) session.getAttribute("currentUser"); %>
<html>
<head>
    <title>BITLAB SHOP</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container-sm mt-3" style="width: 980px">
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid mx-auto">
            <a class="navbar-brand fw-bold" href="/home">BITLAB SHOP</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="d-flex flex-row-reverse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Top Sales</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="#">New Sales</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="#">By Category</a>
                    </li>
                    <%
                        if(currentUser!=null){
                    %>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <%=currentUser.getFullName()%>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/profile">Profile</a></li>
                            <li><a class="dropdown-item" href="/profile">Profile</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="/logout">Logout</a></li>
                        </ul>
                    </li>
                    <%
                    }else{
                    %>
                    <li class="nav-item">
                        <a class="nav-link active" href="/login">Sign In</a>
                    </li>
                    <%
                        }
                    %>
                </ul>
            </div>
        </div>
    </nav>
    <hr />
</div>
<div class="container-sm mt-3 shadow " style="border-radius: 3px; width: 100%; padding: 0; width: 940px">
    <div class="fs-5 p-3" style="background-color: #f7f7f7">
        Login Page
    </div>
    <div class="fs-6 p-4">
        <form action="/login" method="post">
            <div class="input-group mb-3">
                <span class="input-group-text" id="user_email">Email</span>
                <input type="email" class="form-control"  required name="email" >
            </div>
            <div class="input-group mb-3">
                <span class="input-group-text" id="user_password">Password</span>
                <input type="password" class="form-control"  required name="password" >
            </div>
            <button class="btn btn-success">Login</button>
        </form>
    </div>
</div>
</body>
</html>
