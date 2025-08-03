package shoppingmall.shop.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpSession;
import java.util.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
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
			session.setAttribute("member", member);
		}

		List<Cart> orderItems = cartService.selectByMember(member.getMember_id());
		session.setAttribute("orderItems", orderItems);

		Map<String, String> map = new HashMap<>();
		map.put("url", "/shop/product/order"); // 실제 URL
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

		return "/shop/product/order";
	}

	@GetMapping("/product/orderSuccess")
	public String tossSuccess(@RequestParam("paymentKey") String paymentKey, @RequestParam("orderId") String orderId,
			@RequestParam("amount") int amount, Model model) {
		String secretKey = "test_sk_DnyRpQWGrN2nZM4A1za2rKwv1M9E"; 

		try {
			URL url = new URL("https://api.tosspayments.com/v1/payments/confirm");
			HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
			connection.setRequestMethod("POST");
			connection.setDoOutput(true);
			connection.setRequestProperty("Content-Type", "application/json");

			String encodedAuth = Base64.getEncoder().encodeToString((secretKey + ":").getBytes("UTF-8"));
			connection.setRequestProperty("Authorization", "Basic " + encodedAuth);

			// JSON 본문 생성
			String jsonBody = String.format("{\"paymentKey\":\"%s\",\"orderId\":\"%s\",\"amount\":%d}", paymentKey,
					orderId, amount);

			try (OutputStream os = connection.getOutputStream()) {
				byte[] input = jsonBody.getBytes("utf-8");
				os.write(input, 0, input.length);
			}

			// 응답 받기
			int responseCode = connection.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
			} else {
				br = new BufferedReader(new InputStreamReader(connection.getErrorStream(), "utf-8"));
			}

			StringBuilder response = new StringBuilder();
			String responseLine;
			while ((responseLine = br.readLine()) != null) {
				response.append(responseLine.trim());
			}

			model.addAttribute("response", response.toString());
			model.addAttribute("status", responseCode);

			
			if (responseCode == 200) {
				//DB에 OrderSummary, OrderDeatil 을 넣어주어야함
				
				
				return "shop/product/orderSuccess"; // 성공 화면
				
			} else {
				model.addAttribute("error", "결제 인증 실패");
				return "shop/product/orderFail"; // 실패 화면
			}

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", "서버 오류 발생: " + e.getMessage());
			return "shop/product/orderFail";
		}
	}

	@GetMapping("/shop/product/orderFail")
	public String tossFail(@RequestParam("code") String code, @RequestParam("message") String message, Model model) {
		model.addAttribute("errorCode", code);
		model.addAttribute("errorMessage", message);
		return "shop/product/orderFail";
	}
}
