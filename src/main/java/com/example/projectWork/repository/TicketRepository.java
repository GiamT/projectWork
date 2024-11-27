package com.example.projectWork.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.projectWork.entity.Cliente;
import com.example.projectWork.entity.Ticket;

@Repository
public interface TicketRepository extends JpaRepository<Ticket, Long> {
    // Metodo per trovare un ticket tramite cliente
    Ticket findByCliente(Cliente cliente);
}
