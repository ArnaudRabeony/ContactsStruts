package Actions;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import ActionForms.CreateContactActionForm;
import Models.Adresse;
import Models.Contact;
import ServiceEntities.AdresseService;
import ServiceEntities.ContactService;
import ServiceEntities.TelephoneService;

public class CreateContactAction extends Action
{
	public ActionForward execute(ActionMapping mapping, ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception 
	{ 
		CreateContactActionForm f = (CreateContactActionForm)form;
		
		int idAdresse = f.getSelectedId();
		String numeroTel = f.getNumeroTel();
		String typeTel = f.getType();
		
		ContactService cs = new ContactService();
		Contact contact = null;
		
		System.out.println("adresse selectionnee : "+idAdresse);
		
		if(idAdresse!=0)
		{
			if(idAdresse == -1)
				contact = cs.createContact(f.getNom(), f.getPrenom(), f.getEmail());
			else
				contact = cs.createContactWithAddress(f.getNom(), f.getPrenom(), f.getEmail(),idAdresse);
		}
		
		if(numeroTel != null && typeTel != null && contact !=null)
			if(!numeroTel.isEmpty())//PhoneNumber Matcher
			{
				TelephoneService ts = new TelephoneService();
				ts.createTelephone(typeTel, numeroTel, cs.getIdByContact(contact));
			}
		
		HttpSession session = request.getSession();
		ArrayList<Contact> contacts = cs.getContacts();
		session.setAttribute("allContacts", contacts);
		
		return mapping.findForward("success");
	}
}
