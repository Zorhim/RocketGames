package model;

import java.util.List;
import java.util.Objects;

public class Prodotto {
    private int id;
    private String nome;
    private String descrizione;
    private long prezzoCent;
    private List<Categoria> categorie;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    public long getPrezzoCent() {
        return prezzoCent;
    }

    public String getPrezzoEuro(){
        return String.format("%.2f", prezzoCent/100.);
    }

    public void setPrezzoCent(long prezzoCent) {
        this.prezzoCent = prezzoCent;
    }

    public List<Categoria> getCategorie() {
        return categorie;
    }

    public void setCategorie(List<Categoria> categorie) {
        this.categorie = categorie;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Prodotto prodotto = (Prodotto) o;
        return id == prodotto.id &&
                prezzoCent == prodotto.prezzoCent &&
                Objects.equals(nome, prodotto.nome) &&
                Objects.equals(descrizione, prodotto.descrizione) &&
                Objects.equals(categorie, prodotto.categorie);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, nome, descrizione, prezzoCent, categorie);
    }

    @Override
    public String toString() {
        return "Prodotto{" +
                "id=" + id +
                ", nome='" + nome + '\'' +
                ", descrizione='" + descrizione + '\'' +
                ", prezzoCent=" + prezzoCent +
                ", categorie=" + categorie +
                '}';
    }
}