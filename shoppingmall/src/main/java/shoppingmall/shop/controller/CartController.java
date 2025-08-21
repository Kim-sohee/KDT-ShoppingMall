package shoppingmall.shop.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import shoppingmall.domain.Cart;
import shoppingmall.domain.Member;
import shoppingmall.exception.CartException;
import shoppingmall.model.order.CartService;

@Controller
public class CartController {
    @Autowired
    private CartService cartService;
    //장바구니 관련 컨트롤러
//    @GetMapping("/test/login")
//    public String fakeLogin(HttpSession session) {
//    	Member member = new Member();
//    	member.setMember_id(1);
//    	member.setMember_name("홍길동");
//    	
//    
//    	
//    	session.setAttribute("member", member);
//    	return "redirect:/shop/cart/list"; // 장바구니 목록 테스트용
//    }

    @PostMapping("/cart/regist")
    @ResponseBody
    public String regist(@RequestBody Cart cart, HttpSession session) {
        Member member = (Member) session.getAttribute("member");

//        if (member == null) {
//            return "fail:login_required";
//        }

        cart.setMember(member);
        cartService.insert(cart); 

        return "success";
    }
    
    @GetMapping("/cart/list")
    public String list(HttpSession session, Model model) {
        Member member = (Member) session.getAttribute("member");
       if (member == null) {
    	   return "redirect:/shop/member/loginform";
 
       }

        List<Cart> cartList = cartService.selectByMember(member.getMember_id());
        model.addAttribute("cartList", cartList);
        
        int totalPrice = 0;
        for (Cart cart : cartList) {
            int price = cart.getProduct().getPrice();    // 상품 1개 가격
            int quantity = cart.getQuantity();           // 수량
            totalPrice += price * quantity;              // 누적합 계산
        }
        
        int discount = 0;
        int deliveryFee = 0;

        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("discount", discount);
        model.addAttribute("deliveryFee", deliveryFee);

        return "shop/product/cart"; 
    }
    
    @GetMapping("/cart/delete")
    public String deleteCartItem(@RequestParam("cart_id") int cartId, HttpSession session) {
        Member member = (Member) session.getAttribute("member");
        
        cartService.deleteCartItem(cartId); 

        return "redirect:/shop/cart/list"; 
    }
    
    @PostMapping("/cart/update")
    @ResponseBody
    public ResponseEntity<?> updateQuantity(@RequestBody Map<String, Object> data, HttpSession session) {
        Member member = (Member) session.getAttribute("member");
        Object cartIdObj = data.get("cart_id");
        Object quantityObj = data.get("quantity");

        int cartId = (cartIdObj instanceof Integer)
            ? (Integer) cartIdObj
            : Integer.parseInt(cartIdObj.toString());

        int quantity = (quantityObj instanceof Integer)
            ? (Integer) quantityObj
            : Integer.parseInt(quantityObj.toString());

        cartService.updateQuantity(cartId, quantity, member.getMember_id());
        return ResponseEntity.ok().build();
    }
    
    @PostMapping("/cart/delete")
    @ResponseBody
    public ResponseEntity<Void> deleteSelected(@RequestBody List<Integer> cartIds) {
        cartService.deleteSelectedItems(cartIds);
        return ResponseEntity.ok().build();
    }
    
    @ExceptionHandler(CartException.class)
    @ResponseBody
    public String handleCartException(CartException e) {
        return "fail:cart is null" + e.getMessage();
    }
}
