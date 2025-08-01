package shoppingmall.shop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import shoppingmall.domain.Cart;
import shoppingmall.model.order.CartService;

@Controller
public class OrderController {
	
	@Autowired
	private CartService cartService;


	
	@PostMapping("/product/order")
	@ResponseBody
	public Map<String, String> goToOrder(@RequestBody List<Integer> cartIds, HttpSession session) {
	    List<Cart> orderItems = cartService.getCartItemsByIds(cartIds);
	    session.setAttribute("orderItems", orderItems);
	    Map<String, String> map = new HashMap<>();
	    map.put("url", "/shop/product/order"); // 실제 order.jsp 경로
	    return map;
	}
	
	@GetMapping("/product/order")
	public String showOrderPage(HttpSession session, Model model) {
	    List<Cart> orderItems = (List<Cart>) session.getAttribute("orderItems");
	    model.addAttribute("orderItems", orderItems);
	    return "/shop/product/order"; // 실제 JSP 경로: /WEB-INF/views/shop/cart/product/order.jsp
	}
}
