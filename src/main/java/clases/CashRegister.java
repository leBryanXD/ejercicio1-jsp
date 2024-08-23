package clases;

import clases.Transaction;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class CashRegister {
    private List<Transaction> transactions;
    private HashMap<String, Double> exchangeRates;

    public CashRegister() {
        this.transactions = new ArrayList<>();
        this.exchangeRates = new HashMap<>();
        // Se definen las tasas de conversión en relación al dólar (USD)
        exchangeRates.put("USD", 1.0);
        exchangeRates.put("GTQ", 0.13); // Quetzal
        exchangeRates.put("HNL", 0.041); // Lempira
        exchangeRates.put("EUR", 1.1); // Euro
        exchangeRates.put("NIO", 0.027); // Córdobas
    }

    public double calculateChange(String currency, double productPrice, double amountGiven) {
        if (productPrice < 0 || amountGiven < 0) {
            throw new IllegalArgumentException("No se aceptan cantidades negativas.");
        }

        double exchangeRate = exchangeRates.getOrDefault(currency, 1.0);
        double priceInUSD = productPrice * exchangeRate;
        double amountInUSD = amountGiven * exchangeRate;
        double change = amountInUSD - priceInUSD;

        // Redondeo a 5 céntimos favoreciendo a la empresa
        change = Math.floor(change * 20) / 20.0;

        // Registrar la transacción
        transactions.add(new Transaction(currency, productPrice, amountGiven, change));

        return change / exchangeRate; // Se devuelve el cambio en la moneda original
    }

    public List<Transaction> getTransactions() {
        return transactions;
    }
}
