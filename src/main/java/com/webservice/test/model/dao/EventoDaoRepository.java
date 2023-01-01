package com.webservice.test.model.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.webservice.test.model.entity.Evento;

public interface EventoDaoRepository extends JpaRepository<Evento, Integer> {
	
	Optional<Evento> findByIdEvento(int idEvento);
	
	Optional<List<Evento>> findAllByEstado(String estado);

}
