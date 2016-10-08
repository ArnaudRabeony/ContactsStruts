package Actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import ActionForms.LoginValidationForm;

public class LoginAction extends Action
{
	public ActionForward execute(final ActionMapping pMapping,ActionForm pForm, final HttpServletRequest pRequest,final HttpServletResponse pResponse)
	{
		return pMapping.findForward("success");
	}
}
