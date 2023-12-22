package com.easyfestival.www.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.easyfestival.www.domain.FreeTitcketOrderVO;
import com.easyfestival.www.domain.OllPayDTO;
import com.easyfestival.www.domain.OrderVO;
import com.easyfestival.www.domain.PayDTO;
import com.easyfestival.www.handler.PagingHandler;
import com.easyfestival.www.repository.OrderDAO;

@Service
public class OrderService {
<<<<<<< HEAD

	@Autowired
	private OrderDAO orderDAO;

	@Autowired
	private PayService payService;

	public int insert_pay(OrderVO orderVO) throws Exception {

		return orderDAO.insert_pay(orderVO);
	}

	public int insert_payinfo(PayDTO payVO) throws Exception {

		return orderDAO.insert_payinfo(payVO);
	}

	public PayDTO getLastPay(PayDTO payVO) throws Exception {

		return orderDAO.getLastPay(payVO);
	}
=======
   
   @Autowired
   private OrderDAO orderDAO;
   
   @Autowired
   private PayService payService;
   

   public int insert_pay(OrderVO orderVO) throws Exception{
      
      
      return orderDAO.insert_pay(orderVO);
   }

   public int insert_payinfo(PayDTO payVO) throws Exception{
      
      return orderDAO.insert_payinfo(payVO);
   }

   public PayDTO getLastPay(PayDTO payVO) throws Exception{
      
      return orderDAO.getLastPay(payVO);
   }
>>>>>>> cb24f3bc9d74f020e0e1a07b4df6554c73d86c98

   public PayDTO getPay(long payNum) {
      // TODO Auto-generated method stub
      return orderDAO.getPay(payNum);
   }

<<<<<<< HEAD
	public OrderVO adminList(OrderVO orderVO) {

		return orderDAO.adminList(orderVO);
	}

	public int payMentCancle(PayDTO payVO) {

		return orderDAO.payMentCancle(payVO.getOrderNum());
	}

	@Transactional
	public int orderCancle(OrderVO orderVO) throws Exception {
		System.out.println("1 : " + orderVO);
		System.out.println("2 : " + orderVO.getOrderNum());
		System.out.println("3 : " + orderVO.getImpUid());
		if (!orderVO.getImpUid().equals("")) {
			String token = payService.getToken();
			Long price = orderVO.getTotalPrice();
			Long refundPrice = price;
			System.out.println("Test ss");
			payService.payMentCancle(token, orderVO.getImpUid(), refundPrice + "", "환불");
			System.out.println("Test ss2222");
		}

		return orderDAO.orderCancle((orderVO.getOrderNum()));
	}
=======

   public OrderVO adminList(OrderVO orderVO) {
      
      return orderDAO.adminList(orderVO);
   }

   public int payMentCancle(PayDTO payVO) {
      
      return orderDAO.payMentCancle(payVO.getOrderNum());
   }
   
   @Transactional
   public int orderCancle(OrderVO orderVO) throws Exception {
      System.out.println("1 : " + orderVO);
      System.out.println("2 : " + orderVO.getOrderNum());
      System.out.println("3 : " + orderVO.getImpUid());
      if(!orderVO.getImpUid().equals("")) {
         String token = payService.getToken(); 
         Long price = orderVO.getTotalPrice();
         Long refundPrice = price ;
         System.out.println("Test ss");
         payService.payMentCancle(token, orderVO.getImpUid(), refundPrice+"", "환불");
         System.out.println("Test ss2222");
      }
      
      return orderDAO.orderCancle((orderVO.getOrderNum()));
   }
>>>>>>> cb24f3bc9d74f020e0e1a07b4df6554c73d86c98

   public int OrderCount(String svNum) {
      // TODO Auto-generated method stub
      return orderDAO.OrderCount(svNum);
   }

   public List<OrderVO> getOrder(PagingHandler ph, String svNum) {
      // TODO Auto-generated method stub
      return orderDAO.getOrder(ph, svNum);
   }

   public List<OllPayDTO> ollOrder(PagingHandler ph, String svNum) {
      // TODO Auto-generated method stub
      return orderDAO.ollOrder(ph, svNum);
   }

   public List<OllPayDTO> ollList(long orderNum) {
      // TODO Auto-generated method stub
      return orderDAO.ollList(orderNum);
   }

   public int updateY(OrderVO orderVO) {
      // TODO Auto-generated method stub
      return orderDAO.updateY(orderVO);
   }

<<<<<<< HEAD
	public String getConfirmation(long orderNum) {
		// TODO Auto-generated method stub
		return orderDAO.getConfirmation(orderNum);
	}

	public List<OllPayDTO> getPackageList(String id) {
		// 마이페이지 패키지예약내역 리스트용
		return orderDAO.getPackageList(id);
	}
=======
   public String getConfirmation(long orderNum) {
      // TODO Auto-generated method stub
      return  orderDAO.getConfirmation(orderNum);
   }

   public List<OllPayDTO> getPackageList(String id) {
      // 마이페이지 패키지예약내역 리스트용
      return orderDAO.getPackageList(id);
   }
>>>>>>> cb24f3bc9d74f020e0e1a07b4df6554c73d86c98

	public int freeinfo_pay(FreeTitcketOrderVO freeTitcketOrderVO) {
		return orderDAO.freeinfo_pay(freeTitcketOrderVO);

<<<<<<< HEAD
	}

=======
>>>>>>> cb24f3bc9d74f020e0e1a07b4df6554c73d86c98
}