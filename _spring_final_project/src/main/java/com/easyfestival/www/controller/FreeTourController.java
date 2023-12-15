package com.easyfestival.www.controller;


import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.json.simple.parser.ParseException;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.easyfestival.www.domain.AirArrInfoVO;
import com.easyfestival.www.domain.AirInfoVO;
import com.easyfestival.www.domain.AirplaneDTO;
import com.easyfestival.www.domain.AirplaneInfoVO;
import com.easyfestival.www.handler.FreetourHandler;
import com.easyfestival.www.service.FreetourService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/freetour/*")
public class FreeTourController {
	
	@Inject
	private FreetourService fsv;
	
	@Inject
	private FreetourHandler fhd;
	
	@GetMapping("air")
	public String air() {
		return "/freetour/air";
	}
	
	@GetMapping(value="/search/{place}" , produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<AirplaneDTO>> searchPlace(@PathVariable String place){
		
		List<AirplaneDTO> searchVal = fsv.getSearch(place);
		log.info(searchVal+"검색내용 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
		
		return new ResponseEntity<List<AirplaneDTO>>(searchVal,HttpStatus.OK);
	}
	
	@PostMapping("city")
	public String getCity(AirplaneInfoVO aivo, Model m) throws IOException, ParseException {
 
		log.info(aivo+"<<<<<<<<<<<<<<<<<<<<<aiv");
		
		
		// 인원수 , 좌석
		
		String adult = ""; //성인
		String child = ""; // 소아
		String infant = ""; // 유아
		
		String seat = ""; // 일반(기본가격100%), 프리미엄(기본가격(150%), 비즈니스(기본가격200%) ,일등(기본가격(300%)
		
		 
		String departureAirport = aivo.getDeparture(); // 출발공항
		
		m.addAttribute("startAirport", departureAirport);
		
		
		String arrivalAirport = aivo.getArrival(); // 도착공항
		m.addAttribute("endAirport", arrivalAirport);
		//공항 코드 구하기
		String departureAirportCode = fsv.getDepartureAirport(arrivalAirport);
		
		String arrivalAirportCode = fsv.getArrivalAirport(arrivalAirport);
		
		log.info(departureAirportCode+"검색코드<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
		log.info(arrivalAirportCode+"검색코드<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
		
		List<AirInfoVO> depInfo = fhd.getDepartureInfo(arrivalAirportCode,aivo); // 출발 정보 / 인천 -> 해외
		List<AirArrInfoVO> arrInfo = fhd.getArrivalInfo(departureAirportCode, aivo); // 도착 정보 / 해외 -> 인천
		
		// 편명이 같은거끼리 묶기
		
		
		
		
		if(arrInfo != null) {
			
			
			m.addAttribute("arrInfo", arrInfo);
		}else {
			m.addAttribute("arrInfo", "noAirInfo");
		}
		
		if(depInfo != null) {
				
			
			m.addAttribute("depInfo", depInfo);
		}else {
			m.addAttribute("depInfo", "noAirInfo");
		}
		
		return "/freetour/city";
	}
	
}
