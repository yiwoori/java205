package com.bitcamp.firstSpring;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.bitcamp.firstSpring.member.domain.*;

@Controller
@RequestMapping("/order/order")
public class OrderControlloer {
	
	@RequestMapping(method = RequestMethod.GET)
	public String getOrderForm() {
		return "order/orderForm";	//	/WEB-INF/views/order/orderForm.jsp (없으면 404)
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String order(
			OrderCommand orderCommand
			) {
		
		System.out.println(orderCommand);
		
		return "order/order";		//	/WEB-INF/views/order/order.jsp (없으면 404)
	}

}
