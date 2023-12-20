package com.easyfestival.www.repository;

import java.time.LocalDateTime;
import java.util.List;

import com.easyfestival.www.domain.eventDTO;
import com.easyfestival.www.domain.eventVO;
import com.easyfestival.www.domain.prizeVO;
import com.easyfestival.www.domain.rouletteVO;

public interface EventDAO 
{

	int eventRegister(eventDTO edto);

	List<eventVO> OneventList(LocalDateTime now);

	eventVO detail(int evNo);

	int eventRemove(int evNo);

	int eventModify(eventVO evo);

	List<eventVO> LasteventList(LocalDateTime now);

	int registerPrize(prizeVO prvo);

	int lastEvno();

	void rouletteRegister(rouletteVO rlvo);

	String getPrize(int evNo);

	

}
