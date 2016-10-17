package Actions;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import ActionForms.DeleteListActionForm;
import Models.Contact;
import ServiceEntities.ContactService;

public class DeleteContactAction extends Action
{
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		DeleteListActionForm f = (DeleteListActionForm)form;
		
		int[] toDelete = f.getIdsToDelete();

		ContactService cs = new ContactService();
		
		for(int i=0;i<toDelete.length;i++)
			cs.deleteContact(toDelete[i]);
		
		HttpSession session = request.getSession();
		ArrayList<Contact> contacts = cs.getContacts();
		session.setAttribute("allContacts", contacts);
		
		return mapping.findForward("success");
	}
}
