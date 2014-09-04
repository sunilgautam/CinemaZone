package cinema.domain.pojo;

public class AdminInfo
{
    private String adminId = null;
    private String userName = null;
    private String email = null;

    public AdminInfo()
    {
	
    }

    @Override
    public String toString()
    {
	return "AdminInfo{" + "adminId=" + adminId + ", userName=" + userName + ", email=" + email + "}";
    }

    public AdminInfo(String userId, String userName, String email)
    {
	this.adminId = userId;
	this.userName = userName;
	this.email = email;
    }

    public String getAdminId()
    {
	return adminId;
    }

    public void setAdminId(String adminId)
    {
	this.adminId = adminId;
    }

    public String getUserName()
    {
	return userName;
    }

    public void setUserName(String userName)
    {
	this.userName = userName;
    }

    public String getEmail()
    {
	return email;
    }

    public void setEmail(String email)
    {
	this.email = email;
    }
}
