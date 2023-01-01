package com.webservice.test.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.webservice.test.model.entity.Evento;
import com.webservice.test.service.EventoService;

@RestController
@RequestMapping("eventos")
public class EventoController {

	@Autowired
	private EventoService eventoService;

	@CrossOrigin(origins = "http://localhost:4200")
	@GetMapping("/get-event/{idEvent}")
	public ResponseEntity<Evento> getUsuarioLogin(@PathVariable("idEvent") int idEvent) {
		return eventoService.getEvento(idEvent).map(event -> new ResponseEntity<>(event, HttpStatus.OK))
				.orElse(new ResponseEntity<>(HttpStatus.NOT_FOUND));
	}

	@CrossOrigin(origins = "http://localhost:4200")
	@GetMapping("/events")
	public ResponseEntity<List<Evento>> getEvents() {
		return eventoService.getEvents().map(event -> new ResponseEntity<>(event, HttpStatus.OK))
				.orElse(new ResponseEntity<>(HttpStatus.NOT_FOUND));
	}

	@CrossOrigin(origins = "http://localhost:4200")
	@PostMapping("/save")
	public ResponseEntity<Evento> save(@RequestBody Evento evento) {
		return new ResponseEntity<>(eventoService.save(evento), HttpStatus.CREATED);
	}
	
	@CrossOrigin(origins = "http://localhost:4200")
	@PutMapping("/update")
	public ResponseEntity<Evento> update(@RequestBody Evento evento){
		Optional<Evento> optionalEvento = eventoService.getEvento(evento.getIdEvento());
		if(optionalEvento.isPresent()) {
			return new ResponseEntity<>(eventoService.save(evento), HttpStatus.OK);
		}else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}
	
	@CrossOrigin(origins = "http://localhost:4200")
	@PutMapping("/delete/{idEvento}")
	public ResponseEntity<Evento> delete(@PathVariable("idEvento") int idEvento){
		Optional<Evento> optionalEvento = eventoService.getEvento(idEvento);
		if(optionalEvento.isPresent()) {
			Evento updateEvento = optionalEvento.get();
			updateEvento.setEstado("I");
			return new ResponseEntity<>(eventoService.save(updateEvento), HttpStatus.OK);
		}else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}

}
