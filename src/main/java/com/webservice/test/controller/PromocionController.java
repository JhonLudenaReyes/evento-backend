package com.webservice.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.webservice.test.model.entity.Promocion;
import com.webservice.test.service.PromocionService;

@RestController
@RequestMapping("promociones")
public class PromocionController {

	@Autowired
	private PromocionService promocionService;

	@CrossOrigin(origins = "http://localhost:4200")
	@GetMapping("/get-promocion/{idPromocion}")
	public ResponseEntity<Promocion> getPromocion(@PathVariable("idPromocion") int idPromocion) {
		return promocionService.getPromocion(idPromocion)
				.map(promocion -> new ResponseEntity<>(promocion, HttpStatus.OK))
				.orElse(new ResponseEntity<>(HttpStatus.NOT_FOUND));
	}

	@CrossOrigin(origins = "http://localhost:4200")
	@GetMapping("/get-promociones")
	public ResponseEntity<List<Promocion>> getPromociones() {
		return promocionService.getPromociones().map(promocion -> new ResponseEntity<>(promocion, HttpStatus.OK))
				.orElse(new ResponseEntity<>(HttpStatus.NOT_FOUND));
	}

	@CrossOrigin(origins = "http://localhost:4200")
	@PostMapping("/save")
	public ResponseEntity<Promocion> save(@RequestBody Promocion promocion) {
		return new ResponseEntity<>(promocionService.save(promocion), HttpStatus.CREATED);
	}

}
