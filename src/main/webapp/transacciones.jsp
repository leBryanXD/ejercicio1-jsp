<%@ page import="clases.CashRegister" %>
<%@ page import="clases.Transaction" %>
<%@ page import="java.util.List" %>

<%
    CashRegister cashRegister = (CashRegister) session.getAttribute("cashRegister");
    if (cashRegister == null) {
        cashRegister = new CashRegister();
        session.setAttribute("cashRegister", cashRegister);
    }
    List<Transaction> transactions = cashRegister.getTransactions();
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transacciones del Día</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="mb-4">Transacciones del Día</h1>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Fecha</th>
                    <th>Moneda</th>
                    <th>Precio del Producto</th>
                    <th>Cantidad Recibida</th>
                    <th>Cambio</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (transactions != null && !transactions.isEmpty()) {
                        for (Transaction transaction : transactions) {
                %>
                <tr>
                    <td><%= transaction.getDate() %></td>
                    <td><%= transaction.getCurrency() %></td>
                    <td>$<%= String.format("%.2f", transaction.getProductPrice()) %></td>
                    <td>$<%= String.format("%.2f", transaction.getAmountGiven()) %></td>
                    <td>$<%= String.format("%.2f", transaction.getChange()) %></td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="5" class="text-center">No se han realizado transacciones.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <a href="index.jsp" class="btn btn-secondary">Volver al inicio</a>
    </div>
</body>
</html>
