package br.ufsm.cav.artedigital.falharpraforaapp.model;


import javax.persistence.*;

@Entity
@Table
public class Obra {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID_OBRA", unique = true)
    private Long id;

    @Column(name = "IMAGEM")
    private byte[] imagem;

    public Obra() {
    }

    public Obra(byte[] imagem) {
        this.imagem = imagem;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public byte[] getImagem() {
        return imagem;
    }

    public void setImagem(byte[] imagem) {
        this.imagem = imagem;
    }
}
