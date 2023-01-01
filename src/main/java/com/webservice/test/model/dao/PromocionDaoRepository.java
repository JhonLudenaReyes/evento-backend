package com.webservice.test.model.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.webservice.test.model.entity.Promocion;

public interface PromocionDaoRepository extends JpaRepository<Promocion, Integer> {
	
	Optional<Promocion> findByIdPromocionAndEstado(int idPromocion, String estado);
	
	Optional<List<Promocion>> findAllByEstado(String estado);

}
