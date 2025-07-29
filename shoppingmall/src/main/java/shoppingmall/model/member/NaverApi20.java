package shoppingmall.model.member;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class NaverApi20 extends DefaultApi20 {

	    private static final String AUTHORIZE_URL = "https://nid.naver.com/oauth2.0/authorize";
	    private static final String ACCESS_TOKEN_URL = "https://nid.naver.com/oauth2.0/token";

	    protected NaverApi20() {
	    }

	    private static class InstanceHolder {
	        private static final NaverApi20 INSTANCE = new NaverApi20();
	    }

	    public static NaverApi20 instance() {
	        return InstanceHolder.INSTANCE;
	    }

	    @Override
	    public String getAccessTokenEndpoint() {
	        return ACCESS_TOKEN_URL;
	    }

	    @Override
	    protected String getAuthorizationBaseUrl() {
	        return AUTHORIZE_URL;
	    }
}
