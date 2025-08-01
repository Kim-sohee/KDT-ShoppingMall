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
import shoppingmall.domain.Member;
import shoppingmall.model.order.CartService;

@Controller
public class OrderController {
	
	@Autowired
	private CartService cartService;


	
	@PostMapping("/product/order")
	@ResponseBody
	public Map<String, String> goToOrder(@RequestBody List<Integer> cartIds, HttpSession session) {
	    Member member = (Member) session.getAttribute("member");
	    if (member == null) {
	        System.out.println("[경고] 세션에 member가 없습니다. 로그인 유지를 확인해주세요.");
	    } else {
	        session.setAttribute("member", member); // ✅ 다시 넣어줘서 GET에서도 보장되게
	    }

	    List<Cart> orderItems = cartService.getCartItemsByIds(cartIds);
	    session.setAttribute("orderItems", orderItems);

	    Map<String, String> map = new HashMap<>();
	    map.put("url", "/product/order"); // 실제 URL
	    return map;
	}
	
	@GetMapping("/product/order")
	public String showOrderPage(HttpSession session, Model model) {
	    Member member = (Member) session.getAttribute("member");
	    if (member == null) {
	        return "redirect:/shop/login"; 
	    }

	    List<Cart> orderItems = (List<Cart>) session.getAttribute("orderItems");

	    model.addAttribute("orderItems", orderItems);
	    model.addAttribute("member", member);

	    return "shop/product/order";
	}

	
	
}
