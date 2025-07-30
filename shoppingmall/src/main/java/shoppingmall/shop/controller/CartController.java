package shoppingmall.shop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import shoppingmall.domain.Cart;
import shoppingmall.domain.Member;
import shoppingmall.exception.CartException;
import shoppingmall.model.order.CartService;

@Controller
public class CartController {

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

    @ExceptionHandler(CartException.class)
    @ResponseBody
    public String handleCartException(CartException e) {
        return "fail:" + e.getMessage();
    }
}
