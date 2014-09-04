package cinema.domain.pojo;

public class User
{
    private String userId;
    private String firstName;
    private String lastName;
    private String gender;
    private String mobileNo;
    private String cityId;
    private String cityName;
    private String email;
    private String password;
    private String confPassword;

    public User()
    {

    }

    public User(String userId, String firstName, String lastName, String gender, String mobileNo, String cityId, String cityName, String email)
    {
	this.userId = userId;
	this.firstName = firstName;
	this.lastName = lastName;
	this.gender = gender;
	this.mobileNo = mobileNo;
	this.cityId = cityId;
	this.cityName = cityName;
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

    public String getFirstName()
    {
	return firstName;
    }

    public void setFirstName(String firstName)
    {
	this.firstName = firstName;
    }

    public String getLastName()
    {
	return lastName;
    }

    public void setLastName(String lastName)
    {
	this.lastName = lastName;
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

    public String getCityId()
    {
	return cityId;
    }

    public void setCityId(String cityId)
    {
	this.cityId = cityId;
    }

    public String getCityName()
    {
	return cityName;
    }

    public void setCityName(String cityName)
    {
	this.cityName = cityName;
    }

    public String getEmail()
    {
	return email;
    }

    public void setEmail(String email)
    {
	this.email = email;
    }

    public String getPassword()
    {
	return password;
    }

    public void setPassword(String password)
    {
	this.password = password;
    }

    public String getConfPassword()
    {
	return confPassword;
    }

    public void setConfPassword(String confPassword)
    {
	this.confPassword = confPassword;
    }
}
