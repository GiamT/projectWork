package com.example.projectWork.service;

import com.example.projectWork.entity.StatoTicket;
import com.example.projectWork.entity.Ticket;
import com.example.projectWork.dto.TicketDTO;
import com.example.projectWork.repository.TicketRepository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityNotFoundException;

import com.example.projectWork.mapper.TicketMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class TicketService {

    @Autowired
    private TicketRepository ticketRepository;

    @Autowired
    private EntityManager entityManager;  // Iniettiamo EntityManager tramite il service

    public TicketDTO createTicket(TicketDTO ticketDTO) {
        Ticket ticket = TicketMapper.toEntity(ticketDTO, entityManager);
        Ticket savedTicket = ticketRepository.save(ticket);
        return TicketMapper.toDTO(savedTicket);
    }

    public List<TicketDTO> getAllTickets() {
        List<Ticket> tickets = ticketRepository.findAll();
        return tickets.stream()
                .map(TicketMapper::toDTO)
                .toList();
    }

    public Optional<TicketDTO> getTicketById(Long id) {
        Optional<Ticket> ticket = ticketRepository.findById(id);
        return ticket.map(TicketMapper::toDTO);
    }

    public TicketDTO updateTicket(Long id, TicketDTO ticketDTO) {
        Optional<Ticket> existingTicket = ticketRepository.findById(id);
        if (existingTicket.isPresent()) {
            Ticket ticket = existingTicket.get();
            ticket.setDescrizione(ticketDTO.getDescrizione());
            ticket.setDataCreazione(ticketDTO.getDataCreazione());
            // Usando il metodo valueOf nel mapper per ottenere il corretto StatoTicket
            StatoTicket stato = StatoTicket.valueOf(ticketDTO.getStato(), entityManager);
            ticket.setStato(stato);
            Ticket updatedTicket = ticketRepository.save(ticket);
            return TicketMapper.toDTO(updatedTicket);
        }
        return null;
    }

    // Metodo per eliminare un ticket
    public void deleteTicket(Long id) {
        // Controlliamo se il ticket esiste prima di tentare di eliminarlo
        Ticket ticket = ticketRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Ticket non trovato con ID: " + id));
        
        // Se il ticket esiste, lo eliminiamo
        ticketRepository.delete(ticket);
    }

}