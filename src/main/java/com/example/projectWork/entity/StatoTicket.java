package com.example.projectWork.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "stato_ticket")
public class StatoTicket {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String stato;

    // Costruttore vuoto
    public StatoTicket() {
    }

    // Getter e setter
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getStato() {
        return stato;
    }

    public void setStato(String stato) {
        this.stato = stato;
    }

}
