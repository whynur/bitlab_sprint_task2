<%@ page import="kz.bitlab.javaee.sprint2.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% User currentUser = (User) session.getAttribute("currentUser"); %>
<html>
<head>
  <title>Success Login</title>
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
<div>
  <div class="container text-center" style="width: 980px">
    <p class="fs-2 fw-bold">Hello User Profile</p>
    <p class="fs-5 fw-light">This is your profile page</p>
  </div>
</div>
</body>
</html>
