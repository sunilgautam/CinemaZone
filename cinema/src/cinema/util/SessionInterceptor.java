package cinema.util;

import java.util.Map;
import org.apache.log4j.Logger;
import cinema.domain.pojo.AdminInfo;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class SessionInterceptor extends AbstractInterceptor implements Constants
{
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(SessionInterceptor.class);

    public void init()
    {
	
    }

    public void destroy()
    {
	
    }

    @Override
    public String intercept(ActionInvocation invocation) throws Exception
    {
	try
	{
	    Map<String, Object> session = invocation.getInvocationContext().getSession();
	    if (session.get(ADMIN_HANDLE) != null)
	    {
		if ((AdminInfo) session.get(ADMIN_HANDLE) != null)
		{
		    return invocation.invoke();
		}
		else
		{
		    logger.info("[SessionInterceptor::SESSION EXPIRED]");
		    return DEFAULT_LOGIN_URI;
		}
	    }
	    else
	    {
		logger.info("[SessionInterceptor::SESSION EXPIRED]");
		return DEFAULT_LOGIN_URI;
	    }
	}
	catch (Exception ex)
	{
	    logger.error("Exception occured while invoking SessionInterceptor #" + ex);
	    return DEFAULT_LOGIN_URI;
	}
    }
}
