package shoppingmall.shop.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;
import shoppingmall.domain.AgeRange;
import shoppingmall.domain.Cart;
import shoppingmall.domain.CartOrderRequest;
import shoppingmall.domain.Delivery;
import shoppingmall.domain.Difficulty;
import shoppingmall.domain.Member;
import shoppingmall.domain.OrderDetail;
import shoppingmall.domain.OrderSummary;
import shoppingmall.domain.PlayerRange;
import shoppingmall.domain.Product;
import shoppingmall.domain.ProductSnapshot;
import shoppingmall.domain.Status;
import shoppingmall.domain.Theme;
import shoppingmall.model.order.CartService;
import shoppingmall.model.order.OrderDetailService;
import shoppingmall.model.order.OrderSummaryService;
import shoppingmall.model.product.ProductSnapshotService;

@Slf4j
@Controller
public class OrderController {


	@Autowired
	private CartService cartService;

	@Autowired
	private OrderSummaryService orderSummaryService;
	
	@Autowired
	private ProductSnapshotService productSnapshotService;
	
	@Autowired
	private OrderDetailService orderDetailservice;
	

  

	@PostMapping("/product/order")
	@ResponseBody
	public Map<String, String> goToOrder(@RequestBody CartOrderRequest request, HttpSession session) {
	    List<String> cartIds = request.getCartIds();
	    int usedPoint = request.getUsedPoint();

	    Member member = (Member) session.getAttribute("member");
	    if (member == null) {
	        Map<String, String> error = new HashMap<>();
	        error.put("error", "로그인이 필요합니다.");
	        return error;
	    }

	    List<Cart> orderItems = cartService.selectByMember(member.getMember_id());
	    session.setAttribute("orderItems", orderItems);
	    session.setAttribute("selectedCartIds", cartIds);
	    session.setAttribute("usedPoint", usedPoint);

	    int totalPrice = 0;
	    for (Cart cart : orderItems) {
	        if (cart.getProduct() != null) {
	            totalPrice += cart.getProduct().getPrice() * cart.getQuantity();
	        }
	    }

	    session.setAttribute("totalPrice", totalPrice);

	    Map<String, String> result = new HashMap<>();
	    result.put("url", "/shop/product/order");
	    return result;
	}



	@GetMapping("/product/order")
	public String showOrderPage(HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("member");
		if (member == null) {
			return "redirect:/shop/loginform";
		}

		List<Cart> orderItems = (List<Cart>) session.getAttribute("orderItems");

		model.addAttribute("orderItems", orderItems);
		model.addAttribute("member", member);

		return "/shop/product/order";
	}

	@GetMapping("/product/orderSuccess")
	public String tossSuccess(@RequestParam("paymentKey") String paymentKey, @RequestParam("orderId") String orderId,
			@RequestParam("amount") int amount, Model model, HttpSession session) {
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
				// 로그인한 회원 정보
			    Member member = (Member) session.getAttribute("member");

			    // Toss 응답에서 method (결제수단) 추출
			    ObjectMapper mapper = new ObjectMapper();
			    JsonNode root = mapper.readTree(response.toString());
			    String method = root.path("method").asText(); // 예: "CARD", "TRANSFER"

			    // 포인트, 가격 등은 session에서 받아오거나, 추후 requestParam으로 넘겨도 됨
			    int totalPrice = (int) session.getAttribute("totalPrice");
			    int finalPrice = Integer.parseInt(root.path("totalAmount").asText()); // 결제된 금액
			    int usedPoint = (int) session.getAttribute("usedPoint");
			    
		

			    
			    // 주문 상태 설정 (결제완료 = 1)
			    Status status = new Status();
			    status.setStatus_id(1);

			    // 배송 정보는 임시로 null 또는 기본 배송지 사용
			    Delivery delivery = new Delivery();
			    delivery.setDelivery_id(1); // 기본 배송지 ID (혹은 회원의 default_address 기반)
				
			    // OrderSummary 생성 및 저장
			    OrderSummary summary = new OrderSummary();
			    summary.setTotal_price(totalPrice);
			    summary.setFinal_price(finalPrice);
			    summary.setPayment_type(method); // Toss method 그대로 저장하거나 switch문으로 한글로 매핑해도 됨
			    summary.setPoint_used(usedPoint);
			    summary.setMember(member);
			    summary.setStatus(status);
			    summary.setDelivery(delivery);
			    
			    orderSummaryService.insert(summary);
			    System.out.println("👉 summary ID: " + summary.getOrder_summary_id());
			    //==========summary 작성 끝
			    
			   

			   
			    //=========Order deatil 작성 시작
			    List<Cart> cartList = cartService.selectByMember(member.getMember_id());
			    List<OrderDetail> detailList = new ArrayList<>();
			    for (Cart cart : cartList) {
			        Product product = cart.getProduct();

			        ProductSnapshot snapshot = new ProductSnapshot();
			        snapshot.setProduct_name(product.getProduct_name());
			        snapshot.setPrice(product.getPrice());
			        snapshot.setDiscount_rate(product.getDiscount_rate());
			        snapshot.setProduct_quantity(product.getProduct_quantity());
			        snapshot.setDescription(product.getDescription());
			        snapshot.setRegdate(product.getRegdate());
			        snapshot.setPlay_time(product.getPlay_time());

			        // 내부 객체 null 방지 처리
			        if (product.getTheme() != null) {
			            snapshot.setTheme(product.getTheme());
			        } else {
			            Theme theme = new Theme();
			            theme.setTheme_id(1); // 기본값 또는 예외 처리
			            snapshot.setTheme(theme);
			        }

			        if (product.getPlayerRange() != null) {
			            snapshot.setPlayerRange(product.getPlayerRange());
			        } else {
			            PlayerRange pr = new PlayerRange();
			            pr.setPlayer_range_id(1);
			            snapshot.setPlayerRange(pr);
			        }

			        if (product.getAgeRange() != null) {
			            snapshot.setAgeRange(product.getAgeRange());
			        } else {
			            AgeRange ar = new AgeRange();
			            ar.setAge_range_id(1);
			            snapshot.setAgeRange(ar);
			        }

			        if (product.getDifficulty() != null) {
			            snapshot.setDifficulty(product.getDifficulty());
			        } else {
			            Difficulty diff = new Difficulty();
			            diff.setDifficulty_id(1);
			            snapshot.setDifficulty(diff);
			        }

			        // 이미지 디버깅 로그
			        if (!product.getProductImages().isEmpty()) {
			            log.debug("✅ 이미지 있음. (갯수: {})", product.getProductImages().size());
			        } else {
			            log.debug("❌ 이미지 없음");
			        }

			        productSnapshotService.insert(snapshot);

			        OrderDetail detail = new OrderDetail();
			        detail.setOrderSummary(summary);
			        detail.setProductSnapshot(snapshot);
			        detail.setQuantity_real(cart.getQuantity());
			        orderDetailservice.insert(detail);

			        detailList.add(detail);
			    }

			    
			    cartService.deleteByMemberId(member.getMember_id());
			    
			    
			    model.addAttribute("orderSummary", summary);
			    model.addAttribute("orderDetails", detailList); // 반복 출력용
			    model.addAttribute("member", member);
			    model.addAttribute("delivery", delivery); // optional
			    // JSP에서 필요한 값들 추가
			    model.addAttribute("totalPrice", totalPrice);
			    model.addAttribute("discount", 0); // 할인 정책 없다면 0으로
			    model.addAttribute("finalPrice", finalPrice);
			    model.addAttribute("earnedPoint", finalPrice / 100); // 예: 1% 적립이라면
			    
			    
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
