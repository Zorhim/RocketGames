package model;

import javax.swing.*;
import javax.swing.plaf.IconUIResource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProdottoDAO {
    public List<Prodotto> doRetrieveAll(int offset, int limit){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con
                    .prepareStatement("SELECT id, nome, descrizione, prezzoCent FROM prodotto LIMIT ?, ?");
            ps.setInt(1, offset);
            ps.setInt(2, limit);
            ResultSet rs = ps.executeQuery();
            ArrayList<Prodotto> prodotti = new ArrayList<>();
            while (rs.next()){
                Prodotto p = new Prodotto();
                p.setId(rs.getInt(1));
                p.setNome(rs.getString(2));
                p.setDescrizione(rs.getString(3));
                p.setPrezzoCent(rs.getLong(4));
                p.setCategorie(getCategorie(con, p.getId()));
                prodotti.add(p);
            }
            return prodotti;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private static List<Categoria> getCategorie(Connection con, int idProdotto) throws SQLException {
        PreparedStatement ps = con
                .prepareStatement("SELECT id, nome, descrizione FROM categoria LEFT JOIN prodotto_categoria ON id=idcategoria WHERE idprodotto = ?");
        ps.setInt(1, idProdotto);
        ArrayList<Categoria> categorie = new ArrayList<>();
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Categoria c = new Categoria();
            c.setId(rs.getInt(1));
            c.setNome(rs.getString(2));
            c.setDescrizione(rs.getString(3));
            categorie.add(c);
        }
        return categorie;
    }


}
