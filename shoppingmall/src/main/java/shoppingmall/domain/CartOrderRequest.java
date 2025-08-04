package shoppingmall.domain;

import java.util.List;

public class CartOrderRequest {

    private List<String> cartIds;
    private int usedPoint;
    private String roadAddress;
    private String zonecode;
    private String detailAddress;
    private String addressAlias;

    public List<String> getCartIds() { return cartIds; }
    public void setCartIds(List<String> cartIds) { this.cartIds = cartIds; }

    public int getUsedPoint() { return usedPoint; }
    public void setUsedPoint(int usedPoint) { this.usedPoint = usedPoint; }

    public String getRoadAddress() { return roadAddress; }
    public void setRoadAddress(String roadAddress) { this.roadAddress = roadAddress; }

    public String getZonecode() { return zonecode; }
    public void setZonecode(String zonecode) { this.zonecode = zonecode; }

    public String getDetailAddress() { return detailAddress; }
    public void setDetailAddress(String detailAddress) { this.detailAddress = detailAddress; }

    public String getAddressAlias() { return addressAlias; }
    public void setAddressAlias(String addressAlias) { this.addressAlias = addressAlias; }
}
