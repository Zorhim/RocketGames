package model;

import java.util.Collection;
import java.util.LinkedHashMap;

public class Carrello {
    public static class ProdottoQuantita {
        private Prodotto prodotto;
        private int quantita;

        private ProdottoQuantita(Prodotto prodotto, int quantita) {
            this.prodotto = prodotto;
            this.quantita = quantita;
        }

        // Quantità di prodotti nel carrello
        public int getQuantita() {
            return quantita;
        }

        //Impostare la quantità di prodotti nel carrello
        public void setQuantita(int quantita) {
            this.quantita = quantita;
        }

        //Ritorna i dati relativi ad un prodotto
        public Prodotto getProdotto() {
            return prodotto;
        }

        //Ritorna il totale del prezzo del prodotto nel carrello (in centesimi) data la sua quantità
        public long getPrezzoTotCent() {
            return quantita * prodotto.getPrezzoCent();
        }

        //Ritorna il totale del prezzo del prodotto nel carrello (in euro) data la sua quantità
        public String getPrezzoTotEuro() {
            return String.format("%.2f", quantita * prodotto.getPrezzoCent() / 100.);
        }
    }

    private LinkedHashMap<Integer, ProdottoQuantita> prodotti = new LinkedHashMap<>(); //Lista dei prodotti in carrello

    //Ritorna i valori della variabile "prodotti"
    public Collection<ProdottoQuantita> getProdotti() {
        return prodotti.values();
    }

    //Ritorna il valore di un prodotto dato il suo id
    public ProdottoQuantita get(int prodId) {
        return prodotti.get(prodId);
    }

    //Inserisce un prodotto e la sua quantità nel carrello
    public void put(Prodotto prodotto, int quantita) {
        prodotti.put(prodotto.getId(), new ProdottoQuantita(prodotto, quantita));
    }

    //Rimuove un prodotto dal carrello dato il suo id
    public ProdottoQuantita remove(int prodId) {
        return prodotti.remove(prodId);
    }

    //Ritorna il prezzo in centesimi di tutti i prodotti in carrello
    public long getPrezzoTotCent() {
        return prodotti.values().stream().mapToLong(p -> p.getPrezzoTotCent()).sum();
    }

    //Ritorna il prezzo in euro di tutti i prodotti in carrello
    public String getPrezzoTotEuro() {
        return String.format("%.2f", getPrezzoTotCent() / 100.);
    }

    @Override
    public String toString() {
        return "Carrello [prodotti=" + prodotti + "]";
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((prodotti == null) ? 0 : prodotti.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Carrello other = (Carrello) obj;
        if (prodotti == null) {
            if (other.prodotti != null)
                return false;
        } else if (!prodotti.equals(other.prodotti))
            return false;
        return true;
    }

}
