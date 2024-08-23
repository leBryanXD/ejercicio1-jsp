<%@ page import="java.util.List" %>
<%@ page import="clases.CashRegister" %>
<%@ page import="clases.Transaction" %>
<%
    CashRegister cashRegister = (CashRegister) session.getAttribute("cashRegister");
    if (cashRegister == null) {
        cashRegister = new CashRegister();
        session.setAttribute("cashRegister", cashRegister);
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Capturar Transacción</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="mb-4">Capturar Transacción</h1>
        <form action="capturaTransaccion.jsp" method="post" class="mb-4">
            <div class="mb-3">
                <label for="currency" class="form-label">Moneda</label>
                <select name="currency" id="currency" class="form-select" required>
                    <option value="USD">USD</option>
                    <option value="GTQ">Quetzal</option>
                    <option value="HNL">Lempira</option>
                    <option value="EUR">Euro</option>
                    <option value="NIO">Córdoba</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="productPrice" class="form-label">Precio del Producto</label>
                <input type="number" step="0.01" name="productPrice" id="productPrice" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="amountGiven" class="form-label">Cantidad Recibida</label>
                <input type="number" step="0.01" name="amountGiven" id="amountGiven" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary">Calcular Cambio</button>
        </form>

        <% 
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String currency = request.getParameter("currency");
                double productPrice = Double.parseDouble(request.getParameter("productPrice"));
                double amountGiven = Double.parseDouble(request.getParameter("amountGiven"));

                try {
                    double change = cashRegister.calculateChange(currency, productPrice, amountGiven);
                    out.println("<div class='alert alert-success'>El cambio a devolver en " + currency + " es: " + String.format("%.2f", change) + "</div>");
                } catch (IllegalArgumentException e) {
                    out.println("<div class='alert alert-danger'>" + e.getMessage() + "</div>");
                }
            }
        %>
        
        <a href="index.jsp" class="btn btn-secondary">Volver al inicio</a>
        <a href="transacciones.jsp" class="btn btn-info">Ver Transacciones del Día</a>
    </div>
</body>
</html>
