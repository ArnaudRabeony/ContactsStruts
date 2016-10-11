package Actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import ActionForms.LoginValidationForm;

public class LoginAction extends Action
{
	public ActionForward execute(final ActionMapping pMapping,ActionForm pForm, final HttpServletRequest pRequest,final HttpServletResponse pResponse)
	{
		LoginValidationForm f = (LoginValidationForm)pForm;
		
		 HttpSession session = pRequest.getSession(false);
		 if(session == null)
			 session.setAttribute("nom", f.getNom());
		
		 return pMapping.findForward("success");
	}
}
