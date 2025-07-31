package shoppingmall.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import shoppingmall.domain.Cart;
import shoppingmall.domain.Member;
import shoppingmall.exception.CartException;
import shoppingmall.model.order.CartService;

@Controller
public class CartController {
	//장바구니 관련 컨트롤러
	
    @Autowired
    private CartService cartService;

    @PostMapping("/cart/regist")
    @ResponseBody
    public String regist(@RequestBody Cart cart, HttpSession session) {
        Member member = (Member) session.getAttribute("member");

        if (member == null) {
            return "fail:login_required";
        }

        cart.setMember(member);
        cartService.insert(cart); 

        return "success";
    }
    
    @GetMapping("/cart/list")
    public String list(HttpSession session, Model model) {
        Member member = (Member) session.getAttribute("member");
        if (member == null) {
            return "redirect:shop/login";
        }

        List<Cart> cartList = cartService.selectByMember(member.getMember_id());
        model.addAttribute("cartList", cartList);
        
        int totalPrice = 0;
        for (Cart cart : cartList) {
            int price = cart.getProduct().getPrice();    // 상품 1개 가격
            int quantity = cart.getQuantity();           // 수량
            totalPrice += price * quantity;              // 누적합 계산
        }
        
        int discount = 10000;
        int deliveryFee = 0;

        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("discount", discount);
        model.addAttribute("deliveryFee", deliveryFee);

        return "product/list"; // /WEB-INF/views/cart/list.jsp
    }
    
    

    @ExceptionHandler(CartException.class)
    @ResponseBody
    public String handleCartException(CartException e) {
        return "fail:" + e.getMessage();
    }
}
