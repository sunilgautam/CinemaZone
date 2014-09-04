package test;

import cinema.common.BaseAction;

public class index extends BaseAction {
    private static final long serialVersionUID = 1L;
    @Override
    public String execute() throws Exception {
        System.out.println("{ INDEX EXECUTED }");
        return "success";
    }
}
