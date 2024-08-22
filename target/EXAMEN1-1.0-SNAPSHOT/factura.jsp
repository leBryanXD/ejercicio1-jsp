<%@page import="clases.ProductList"%>
<%@page import="java.util.List"%>
<%@page import="clases.Product"%>

<%
    // Obtener la lista de productos de la sesión
    ProductList productList = (ProductList) session.getAttribute("productList");
    double totalAmount = 0;

    if (productList != null) {
        totalAmount = productList.getTotalAmount();
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Factura - Empresa X</title>
    <!-- Enlace a Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="mb-4">Factura</h1>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Código</th>
                    <th>Nombre</th>
                    <th>Cantidad</th>
                    <th>Precio Unitario</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (productList != null && !productList.getProducts().isEmpty()) {
                        for (Product product : productList.getProducts()) {
                %>
                <tr>
                    <td><%= product.getCode() %></td>
                    <td><%= product.getName() %></td>
                    <td><%= product.getQuantity() %></td>
                    <td>$<%= String.format("%.2f", product.getUnitPrice()) %></td>
                    <td>$<%= String.format("%.2f", product.getTotalPrice()) %></td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="5" class="text-center">No hay productos en la factura.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
            <tfoot>
                <tr>
                    <th colspan="4" class="text-end">Total a Pagar</th>
                    <th>$<%= String.format("%.2f", totalAmount) %></th>
                </tr>
            </tfoot>
        </table>

        <div class="mt-4">
            <a href="index.jsp" class="btn btn-primary">Agregar más productos</a>
            <form action="factura.jsp" method="post" style="display:inline;">
                <input type="hidden" name="reset" value="true" />
                <button type="submit" class="btn btn-danger">Resetear factura</button>
            </form>
        </div>

        <%
            // Opción para resetear la factura
            if ("true".equals(request.getParameter("reset"))) {
                session.removeAttribute("productList");
                response.sendRedirect("factura.jsp");
            }
        %>
    </div>

</body>
</html>
