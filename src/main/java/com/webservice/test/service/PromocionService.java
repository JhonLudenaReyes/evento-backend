package com.webservice.test.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webservice.test.model.dao.PromocionDaoRepository;
import com.webservice.test.model.entity.Promocion;

@Service
public class PromocionService {
	
	@Autowired
	private PromocionDaoRepository promocionDaoRepository;
	
	public Optional<Promocion> getPromocion(int idPromocion) {
		Optional<Promocion> promocion = promocionDaoRepository.findByIdPromocionAndEstado(idPromocion, "A"); 
		return promocion;
	}
	
	public Optional<List<Promocion>> getPromociones(){
		Optional<List<Promocion>> promociones = promocionDaoRepository.findAllByEstado("A");
		return promociones;
	}
	
	public Promocion save(Promocion promocion) {
		return promocionDaoRepository.save(promocion);
	}

}
