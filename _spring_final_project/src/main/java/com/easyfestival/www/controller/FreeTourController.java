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
	
		
		return new ResponseEntity<List<AirplaneDTO>>(searchVal,HttpStatus.OK);
	}
	
	@PostMapping("city")
	public String getCity(AirplaneInfoVO aivo, Model m, String pepleCount) throws IOException, ParseException {
 
		
		String adult="";
		String child="";
		String infant="";
		String seat="";
		
		String pep [] = pepleCount.split(",");
		for(int i=0; i<pep.length; i++) {
			if(pep[i].contains("성인")) {
				adult = pep[i];
			}else if(pep[i].contains("소아")) {
				child = pep[i];
			}else if(pep[i].contains("유아")){
				infant = pep[i];
			}else {
				// 좌석
				seat = pep[i];
			}
		}
		m.addAttribute("adult", adult);
		m.addAttribute("child", child);
		m.addAttribute("infant", infant);
		m.addAttribute("seat", seat);

		String departureAirport = aivo.getDeparture(); // 출발공항
		
		m.addAttribute("startAirport", departureAirport);
		
		
		String arrivalAirport = aivo.getArrival(); // 도착공항
		m.addAttribute("endAirport", arrivalAirport);
		//공항 코드 구하기
		String departureAirportCode = fsv.getDepartureAirport(arrivalAirport);
		
		String arrivalAirportCode = fsv.getArrivalAirport(arrivalAirport);

		
		List<AirInfoVO> depInfo = fhd.getDepartureInfo(arrivalAirportCode,aivo); // 출발 정보 / 인천 -> 해외
		List<AirArrInfoVO> arrInfo = fhd.getArrivalInfo(departureAirportCode, aivo); // 도착 정보 / 해외 -> 인천
		
		
		
		
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
