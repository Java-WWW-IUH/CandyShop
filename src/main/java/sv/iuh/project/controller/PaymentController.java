package sv.iuh.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import sv.iuh.project.model.OrderDetail;
import sv.iuh.project.model.OrderProduct;
import sv.iuh.project.model.UserShop;
import sv.iuh.project.service.OrderDetailService;
import sv.iuh.project.service.OrderManagementService;

@Controller
@RequestMapping("/payment")
public class PaymentController {
	
	@Autowired
    private OrderDetailService orderDetailService;
	
	@Autowired
    private OrderManagementService orderManagementService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String paymentPage(ModelMap mm, @RequestParam("id") int id, HttpSession session) {
		UserShop userShop = (UserShop) session.getAttribute("userlogin");
        if(userShop == null)
            return "user/login";
        mm.put("user", userShop);
		OrderDetail od = orderDetailService.findById(id);
		mm.put("orderDetail", od);
		return "user/QLDH";
	}
	
	@RequestMapping(value = "paid")
	public String paidAction(@RequestParam("id") int id) {
		OrderDetail od = orderDetailService.findById(id);
		od.setStatusOrderDetail("Đã thanh toán");
		boolean kt = orderDetailService.update(od);
		List<OrderDetail> list = orderDetailService.getOrdersOfUser(od.getOrderID().getOrderID());
		boolean ktOrder = true;
		for(OrderDetail odl : list) {
			if (!odl.getStatusOrderDetail().equalsIgnoreCase("Đã thanh toán")) {
				kt = false;
				break;
			}
		}
		OrderProduct op = orderManagementService.findById(od.getOrderID().getOrderID());
		if (kt) {
			op.setStatusOrder("Đã thanh toán");
			boolean check = orderManagementService.update(op);
		}
		return "redirect:/orderList/show";
	}
}
