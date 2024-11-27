package com.example.projectWork.mapper;

import com.example.projectWork.entity.Ticket;

import jakarta.persistence.EntityManager;

import com.example.projectWork.dto.TicketDTO;
import com.example.projectWork.entity.StatoTicket;

public class TicketMapper {

    public static TicketDTO toDTO(Ticket ticket) {
        TicketDTO ticketDTO = new TicketDTO();
        ticketDTO.setId(ticket.getId());
        ticketDTO.setDescrizione(ticket.getDescrizione());
        ticketDTO.setDataCreazione(ticket.getDataCreazione());
        ticketDTO.setStato(ticket.getStato().getStato());  // Assuming StatoTicket has a getStato() method
        return ticketDTO;
    }

    public static Ticket toEntity(TicketDTO ticketDTO, EntityManager entityManager) {
        Ticket ticket = new Ticket();
        ticket.setId(ticketDTO.getId());
        ticket.setDescrizione(ticketDTO.getDescrizione());
        ticket.setDataCreazione(ticketDTO.getDataCreazione());

        // Usando il metodo valueOf per ottenere il StatoTicket dalla stringa
        StatoTicket stato = StatoTicket.valueOf(ticketDTO.getStato(), entityManager);
        ticket.setStato(stato);

        return ticket;
    }
}