package cinema.domain.pojo;

public class Upload
{
    private String result;
    private String resource;
    private String thumb;
    private String data;

    public Upload()
    {

    }

    public Upload(String result, String resource, String thumb, String data)
    {
	this.result = result;
	this.resource = resource;
	this.thumb = thumb;
	this.data = data;
    }

    public String getResult()
    {
	return result;
    }

    public void setResult(String result)
    {
	this.result = result;
    }

    public String getResource()
    {
	return resource;
    }

    public void setResource(String resource)
    {
	this.resource = resource;
    }

    public String getThumb()
    {
	return thumb;
    }

    public void setThumb(String thumb)
    {
	this.thumb = thumb;
    }

    public String getData()
    {
	return data;
    }

    public void setData(String data)
    {
	this.data = data;
    }
}