package com.easyfestival.www.service;

import java.util.List;

import com.easyfestival.www.handler.PagingHandler;
import com.easyfestival.www.security.AuthVO;
import com.easyfestival.www.security.UserVO;

public interface UserService {
	
	int userJoin(UserVO uvo);

	UserVO getId(String id);

	int authUser(AuthVO avo);

	List<UserVO> getList();

	int modifyUser(UserVO uvo);

	int deleteUser(String id);

	int getUserCount();

	List<UserVO> getList(PagingHandler ph);
	
	List<AuthVO> selectAuths(String username);

	UserVO getId(String name, String email);
}
