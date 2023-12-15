package com.easyfestival.www.repository;

import java.time.LocalDateTime;
import java.util.List;

import com.easyfestival.www.domain.eventVO;

public interface EventDAO 
{

	int eventRegister(eventVO evo);

	List<eventVO> OneventList(LocalDateTime now);

	eventVO detail(int evNo);

	int eventRemove(int evNo);

	int eventModify(eventVO evo);

	List<eventVO> LasteventList(LocalDateTime now);

}
