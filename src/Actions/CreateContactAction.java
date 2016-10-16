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
		
		int idAdresse = f.getSelectedId();
		ContactService cs = new ContactService();
		
		System.out.println("adresse selectionnee : "+idAdresse);
		
		if(idAdresse!=0)
		{
			if(idAdresse == -1)
				cs.createContact(f.getNom(), f.getPrenom(), f.getEmail());
			else
				cs.createContactWithAddress(f.getNom(), f.getPrenom(), f.getEmail(),idAdresse);
		}
		
		return mapping.findForward("success");
	}
}
