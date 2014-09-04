package cinema.common;

import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.interceptor.CookiesAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.util.ServletContextAware;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ValidationAware;
import cinema.util.Constants;

public class BaseAction extends ActionSupport implements SessionAware, CookiesAware, ServletRequestAware, ServletResponseAware, ServletContextAware, RequestAware, ValidationAware, Constants
{
    private static final long serialVersionUID = 1L;
    private Map<String, Object> userRequest;
    private Map<String, Object> userSession;
    private Map<String, String> userCookies;
    private HttpServletRequest servletRequestObject;
    private HttpServletResponse servletResponseObject;
    // 30 11 12
    private ServletContext servletContextObject;

    @Override
    public void setRequest(Map<String, Object> request)
    {
	userRequest = request;
    }

    @Override
    public void setSession(Map<String, Object> session)
    {
	userSession = session;
    }

    @Override
    public void setCookiesMap(Map<String, String> cookies)
    {
	userCookies = cookies;
    }

    public Map<String, Object> getRequest()
    {
	return this.userRequest;
    }

    public Map<String, Object> getSession()
    {
	return this.userSession;
    }

    public Map<String, String> getCookies()
    {
	return this.userCookies;
    }

    @Override
    public void setServletRequest(HttpServletRequest servletRequestObject)
    {
	this.servletRequestObject = servletRequestObject;
    }

    public HttpServletRequest getServletRequestObject()
    {
	return servletRequestObject;
    }

    public void setServletRequestObject(HttpServletRequest servletRequestObject)
    {
	this.servletRequestObject = servletRequestObject;
    }

    @Override
    public void setServletResponse(HttpServletResponse servletResponseObject)
    {
	this.servletResponseObject = servletResponseObject;
    }

    public HttpServletResponse getServletResponseObject()
    {
	return servletResponseObject;
    }

    public void setServletResponseObject(HttpServletResponse servletResponseObject)
    {
	this.servletResponseObject = servletResponseObject;
    }

    // 30 11 12
    @Override
    public void setServletContext(ServletContext servletContextObject)
    {
	this.servletContextObject = servletContextObject;
    }

    public ServletContext getServletContextObject()
    {
	return servletContextObject;
    }

    public void setServletContextObject(ServletContext servletContextObject)
    {
	this.servletContextObject = servletContextObject;
    }
}
