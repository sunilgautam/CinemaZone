package test;

import cinema.common.BaseAction;

public class d2 extends BaseAction
{
    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    public d2()
    {
	super();
    }

    private String txt1;

    public String getTxt1()
    {
	return txt1;
    }

    public void setTxt1(String txt1)
    {
	this.txt1 = txt1;
    }

    @Override
    public String execute() throws Exception
    {
	addActionError("!!!! ERROR");
	addActionMessage("????????????MESSAGE");
	return "success";
    }
}
