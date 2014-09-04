package test;

import org.apache.struts2.ServletActionContext;

import cinema.common.BaseAction;

public class d3 extends BaseAction {
	public d3() {
		super();
	}
	private String mode;
	
	@Override
	public String execute() throws Exception {
		if(mode.equals("ADD")){
			addActionMessage(ServletActionContext.getRequest().getMethod());
		} else {
			addActionMessage("THIS IS EDIT REQUEST");
		}
		return "success";
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}
}
