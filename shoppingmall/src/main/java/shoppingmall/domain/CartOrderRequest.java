package shoppingmall.domain;

import java.util.List;

public class CartOrderRequest {
    private List<String> cartIds;
    private int usedPoint;

    public List<String> getCartIds() { return cartIds; }
    public void setCartIds(List<String> cartIds) { this.cartIds = cartIds; }

    public int getUsedPoint() { return usedPoint; }
    public void setUsedPoint(int usedPoint) { this.usedPoint = usedPoint; }
}
