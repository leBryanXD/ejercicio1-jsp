package clases;


import java.util.Date;
import java.text.SimpleDateFormat;

public class Transaction {
    private String date;
    private String currency;
    private double productPrice;
    private double amountGiven;
    private double change;

    public Transaction(String currency, double productPrice, double amountGiven, double change) {
        this.date = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss").format(new Date());
        this.currency = currency;
        this.productPrice = productPrice;
        this.amountGiven = amountGiven;
        this.change = change;
    }

    public String getDate() {
        return date;
    }

    public String getCurrency() {
        return currency;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public double getAmountGiven() {
        return amountGiven;
    }

    public double getChange() {
        return change;
    }

    @Override
    public String toString() {
        return "Fecha: " + date +
                ", Moneda: " + currency +
                ", Precio del Producto: " + productPrice +
                ", Cantidad Recibida: " + amountGiven +
                ", Cambio: " + change;
    }
}
