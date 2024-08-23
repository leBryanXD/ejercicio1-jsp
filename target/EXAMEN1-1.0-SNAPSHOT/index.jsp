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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="mb-4">Bienvenido a la Aplicación de Facturación</h1>
        <div class="row">
            <div class="col-md-6">
                <h2>Capturar Producto</h2>
                <form action="index.jsp" method="post">
                    <div class="mb-3">
                        <label for="code" class="form-label">Código</label>
                        <input type="text" name="code" id="code" class="form-control" required />
                    </div>
                    <div class="mb-3">
                        <label for="name" class="form-label">Nombre</label>
                        <input type="text" name="name" id="name" class="form-control" required />
                    </div>
                    <div class="mb-3">
                        <label for="quantity" class="form-label">Cantidad</label>
                        <input type="number" name="quantity" id="quantity" class="form-control" required />
                    </div>
                    <div class="mb-3">
                        <label for="unitPrice" class="form-label">Precio Unitario</label>
                        <input type="number" step="0.01" name="unitPrice" id="unitPrice" class="form-control" required />
                    </div>
                    <button type="submit" class="btn btn-primary">Agregar Producto</button>
                </form>

                <%
                    if ("POST".equalsIgnoreCase(request.getMethod())) {
                        String code = request.getParameter("code");
                        String name = request.getParameter("name");
                        int quantity = Integer.parseInt(request.getParameter("quantity"));
                        double unitPrice = Double.parseDouble(request.getParameter("unitPrice"));

                        Product product = new Product(code, name, quantity, unitPrice);
                        productList.addProduct(product);
                    }
                %>
            </div>

            <div class="col-md-6 d-flex flex-column gap-3">
                <h2>Opciones</h2>
                <a href="factura.jsp" class="btn btn-info mb-3">Ver Factura</a>
                <a href="capturaTransaccion.jsp" class="btn btn-success mb-3">Capturar Transacción</a>
                <a href="transacciones.jsp" class="btn btn-warning mb-3">Ver Transacciones del Día</a>
            </div>
        </div>
    </div>
</body>
</html>
