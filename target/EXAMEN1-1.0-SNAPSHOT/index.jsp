<%@page import="clases.ProductList"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="clases.Product" %>

<%
    ProductList productList = (ProductList) session.getAttribute("productList");
    if (productList == null) {
        productList = new ProductList();
        session.setAttribute("productList", productList);
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aplicación de Facturación</title>
    <!-- Enlace a Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="mb-4">Capturar Producto</h1>
        <form action="index.jsp" method="post" class="row g-3">
            <div class="col-md-6">
                <label for="code" class="form-label">Código</label>
                <input type="text" class="form-control" id="code" name="code" required>
            </div>
            <div class="col-md-6">
                <label for="name" class="form-label">Nombre</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="col-md-6">
                <label for="quantity" class="form-label">Cantidad</label>
                <input type="number" class="form-control" id="quantity" name="quantity" required>
            </div>
            <div class="col-md-6">
                <label for="unitPrice" class="form-label">Precio Unitario</label>
                <input type="number" step="0.01" class="form-control" id="unitPrice" name="unitPrice" required>
            </div>
            <div class="col-12">
                <button type="submit" class="btn btn-primary">Agregar Producto</button>
            </div>
        </form>

        <%
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String code = request.getParameter("code");
                String name = request.getParameter("name");
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                double unitPrice = Double.parseDouble(request.getParameter("unitPrice"));

                Product product = new Product(code, name, quantity, unitPrice);
                productList.addProduct(product);
        %>
            <div class="alert alert-success mt-4" role="alert">
                Producto agregado exitosamente: <strong><%= name %></strong>
            </div>
        <%
            }
        %>
        
        <div class="mt-4">
            <a href="factura.jsp" class="btn btn-success">Ver Factura</a>
        </div>
    </div>

</body>
</html>
