package Actions;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import ActionForms.LoginValidationForm;
import Models.Groupe;
import ServiceEntities.GroupeService;

public class LoginAction extends Action
{
	public ActionForward execute(final ActionMapping pMapping,ActionForm pForm, final HttpServletRequest pRequest,final HttpServletResponse pResponse)
	{
		LoginValidationForm f = (LoginValidationForm)pForm;
		
		 HttpSession session = pRequest.getSession(false);
		 if(session == null)
			 session.setAttribute("nom", f.getNom());
		
		 GroupeService gs = new GroupeService();
		 ArrayList<Groupe> groupes = gs.getGroups();
		 
		 pRequest.setAttribute("groupes", groupes);
		 
		 return pMapping.findForward("success");
	}
}
