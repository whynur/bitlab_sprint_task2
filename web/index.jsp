<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.bitlab.javaee.sprint2.model.User" %>
<%@ page import="kz.bitlab.javaee.sprint2.model.Item" %>

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
            <a class="navbar-brand fw-bold">BITLAB SHOP</a>
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
<div class="container text-center" style="width: 980px">
    <p class="fs-2 fw-bold">Welcome to BITLAB SHOP</p>
    <p class="fs-5 fw-light">Electronic devices with high quality and service</p>
</div>
<div class="container text-center" style="width: 980px">
    <div class="row g-2">
        <% ArrayList<Item> items = (ArrayList<Item>) request.getAttribute("products");
        for(int i = 0; i < items.size(); i++){
        %>
        <div class="col-3 m-3 shadow" style="border-radius: 3px; width: 30%; padding: 0;">
            <div class="fs-5" style="background-color: #f7f7f7">
                <%=items.get(i).getName()%>
            </div>
            <div class="fs-4 text-success">
                $<%=items.get(i).getPrice()%>
            </div>
            <div>
                <%=items.get(i).getDescription()%>
            </div>
            <button type="button" class="btn btn-success mt-3 mb-3" style="width: 90%">Buy Now</button>
        </div>
        <%
            }%>
    </div>
</div>
</body>
</html>
