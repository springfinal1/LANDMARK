package com.easyfestival.www.service;

import java.time.LocalDateTime;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.easyfestival.www.domain.eventVO;
import com.easyfestival.www.repository.EventDAO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class EventServiceImpl implements EventService
{
	@Inject	
	private EventDAO edao;

	@Override
	public int OneventList(eventVO evo) {
		return edao.eventRegister(evo);
	}
	

	@Override
	public List<eventVO> OneventList(LocalDateTime now) {
		return edao.OneventList(now);
	}
	@Override
	public List<eventVO> LasteventList(LocalDateTime now) {
		return edao.LasteventList(now);
	}

	@Override
	public eventVO detail(int evNo) {
		return edao.detail(evNo);
	}

	@Override
	public int eventRemove(int evNo) {
		return edao.eventRemove(evNo);
	}

	@Override
	public int eventModify(eventVO evo) {
		return edao.eventModify(evo);
	}


	@Override
	public int eventRegister(eventVO evo) {
		return edao.eventRegister(evo);
	}

	

	

}
