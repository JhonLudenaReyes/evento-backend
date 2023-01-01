package com.webservice.test.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webservice.test.model.dao.EventoDaoRepository;
import com.webservice.test.model.entity.Evento;


@Service
public class EventoService {
	
	@Autowired
	private EventoDaoRepository eventoDaoRepository;
	
	public Optional<Evento> getEvento(int idEvento){
		return eventoDaoRepository.findByIdEvento(idEvento);
	}
	
	public Optional<List<Evento>> getEvents(){
		return eventoDaoRepository.findAllByEstado("A");
	}
	
	public Evento save(Evento evento) {
		return eventoDaoRepository.save(evento);
	}

}
