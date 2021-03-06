package Actions;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import ActionForms.UpdateContactActionForm;
import ActionForms.UpdatePhoneActionForm;
import Models.Adresse;
import Models.Contact;
import Models.Telephone;
import ServiceEntities.ContactService;
import ServiceEntities.TelephoneService;

public class UpdateContactAction extends Action
{
	public ActionForward execute(ActionMapping mapping, ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception 
	{ 
		UpdateContactActionForm f = (UpdateContactActionForm)form;
		System.out.println("updateContactAction");

		String nom = f.getNom();
		String prenom = f.getPrenom();
		String email = f.getEmail();
		int idContact = f.getIdContact();
		int idAdresse = f.getNewAddress();
		HttpSession session = request.getSession();

		ContactService cs = new ContactService();
		if(cs.contactExists(idContact))
		{
			System.out.println("contact existe et peut etre modif");
			Contact c = cs.getContactById(idContact);
			
			boolean contactHasChanged = !c.getNom().equals(nom) || !c.getPrenom().equals(prenom) || (!c.getEmail().equals(email));
			System.out.println("contact a changé : "+contactHasChanged);
			boolean addressHasChanged = c.getIdAdresse()!=idAdresse;
			System.out.println("adresse a changé : "+addressHasChanged);

			if(addressHasChanged && !contactHasChanged || (contactHasChanged && !cs.contactExists(nom, prenom)))
				cs.updateContact(idContact, nom, prenom, email,idAdresse);
//			else if(!cs.contactExists(nom, prenom))
//				return mapping.findForward("alreadyExists");
			else
				cs.updateContact(idContact, nom, prenom, email);
			
			ArrayList<Contact> contacts = cs.getContacts();
			session.setAttribute("allContacts", contacts);
			
			return mapping.findForward("success");
		}
		else
			return mapping.findForward("error");
	}	
}