package Actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import ActionForms.SearchContactActionForm;
import ActionForms.SearchPhoneActionForm;
import Models.Adresse;
import Models.Contact;
import Models.Telephone;
import ServiceEntities.AdresseService;
import ServiceEntities.ContactService;
import ServiceEntities.TelephoneService;

public class SearchContactAction  extends Action
{
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		SearchContactActionForm f = (SearchContactActionForm)form;
		
		ContactService cs = new ContactService();
		Contact c = cs.getContactById(f.getSelectedId());
		
		if(c != null)
		{
			request.setAttribute("nomResult", c.getNom());
			request.setAttribute("prenomResult", c.getPrenom());
			request.setAttribute("emailResult", c.getEmail());
			request.setAttribute("idResult", c.getId());
			return mapping.findForward("success");
		}
		else
			return mapping.findForward("error");
	}
}
