package Ajax;

import org.apache.struts.action.ActionForm;

public class AjaxChecker extends ActionForm
{
	private String check;
	private String val;
	
	public String getCheck() {
		return check;
	}
	public void setCheck(String check) {
		this.check = check;
	}
	public String getVal() {
		return val;
	}
	public void setVal(String val) {
		this.val = val;
	}
}
