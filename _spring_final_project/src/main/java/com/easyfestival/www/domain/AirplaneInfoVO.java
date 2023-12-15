package com.easyfestival.www.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class AirplaneInfoVO {
	
	private String date;
	private String departure;
	private String arrival;
	private String pepleCount;
}
