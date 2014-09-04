package cinema.domain.pojo;

public class UserInfo
{
    private String userId;
    private String fName;
    private String lName;
    private String gender;
    private String mobileNo;
    private String city;
    private String email;

    private String userName;

    public UserInfo()
    {
    }

    public UserInfo(String userId, String fName, String lName, String gender, String mobileNo, String city, String email)
    {
	this.userId = userId;
	this.fName = fName;
	this.lName = lName;
	this.gender = gender;
	this.mobileNo = mobileNo;
	this.city = city;
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

    public String getfName()
    {
	return fName;
    }

    public void setfName(String fName)
    {
	this.fName = fName;
    }

    public String getlName()
    {
	return lName;
    }

    public void setlName(String lName)
    {
	this.lName = lName;
    }

    public String getGender()
    {
	return gender;
    }

    public void setGender(String gender)
    {
	this.gender = gender;
    }

    public String getMobileNo()
    {
	return mobileNo;
    }

    public void setMobileNo(String mobileNo)
    {
	this.mobileNo = mobileNo;
    }

    public String getCity()
    {
	return city;
    }

    public void setCity(String city)
    {
	this.city = city;
    }

    public String getEmail()
    {
	return email;
    }

    public void setEmail(String email)
    {
	this.email = email;
    }

    public String getUserName()
    {
	return this.email.substring(0, this.email.indexOf("@"));
    }

    public void setUserName(String userName)
    {
	this.userName = userName;
    }

    @Override
    public String toString()
    {
	return this.userId + "||" + this.getUserName() + "||" + this.email + "||" + this.fName + "||" + this.lName + "||" + this.gender + "||" + this.mobileNo + "||" + this.city;
    }
}
