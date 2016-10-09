package Actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import ActionForms.CreateContactActionForm;
import ServiceEntities.ContactService;

public class CreateContactAction extends Action
{
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception 
	{ 
		CreateContactActionForm f = (CreateContactActionForm)form;
		
		ContactService cs = new ContactService();
		cs.createContact(f.getNom(), f.getPrenom(), f.getEmail());
		
		return mapping.findForward("success");
	}
}
