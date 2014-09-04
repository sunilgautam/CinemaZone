package cinema.domain.pojo;

public class AUserInfo
{
    private String userId;
    private String mobileNo;
    private String email;

    public AUserInfo()
    {
	
    }

    public AUserInfo(String userId, String mobileNo, String email)
    {
	this.userId = userId;
	this.mobileNo = mobileNo;
	this.email = email;
    }

    public String getUserId()
    {
	return userId;
    }

    public void setUserId(String userId)
    {
	this.userId = userId;
    }

    public String getMobileNo()
    {
	return mobileNo;
    }

    public void setMobileNo(String mobileNo)
    {
	this.mobileNo = mobileNo;
    }

    public String getEmail()
    {
	return email;
    }

    public void setEmail(String email)
    {
	this.email = email;
    }

    @Override
    public String toString()
    {
	return this.userId + "||" + this.email + "||" + this.mobileNo;
    }
}
