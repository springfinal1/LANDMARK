package com.easyfestival.www.service;


import java.time.LocalDateTime;
import java.util.List;

import com.easyfestival.www.domain.eventVO;

public interface EventService {

	int OneventList(eventVO evo);

	List<eventVO> OneventList(LocalDateTime now);

	eventVO detail(int evNo);

	int eventRemove(int evNo);

	int eventModify(eventVO evo);

	List<eventVO> LasteventList(LocalDateTime now);

	int eventRegister(eventVO evo);



}