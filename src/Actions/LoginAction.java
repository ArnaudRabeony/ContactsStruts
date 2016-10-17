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
import Models.Adresse;
import Models.Contact;
import Models.Groupe;
import ServiceEntities.AdresseService;
import ServiceEntities.ContactService;
import ServiceEntities.GroupeService;

public class LoginAction extends Action
{
	public ActionForward execute(final ActionMapping pMapping,ActionForm pForm, final HttpServletRequest pRequest,final HttpServletResponse pResponse)
	{
		LoginValidationForm f = (LoginValidationForm)pForm;
		
		 HttpSession session = pRequest.getSession();
		 session.setAttribute("user", f.getNom());
		
		 GroupeService gs = new GroupeService();
		 ArrayList<Groupe> groupes = gs.getGroups();
		 
		 ContactService cs = new ContactService();
		 ArrayList<Contact> contacts = cs.getContacts();
		 session.setAttribute("allContacts", contacts);
		
		 AdresseService as = new AdresseService();
		 ArrayList<Adresse> adresses = as.getAdresses();
		 session.setAttribute("allAdresses", adresses);
		 
		 session.setAttribute("groupes", groupes);
		 
		 return pMapping.findForward("success");
	}
}
