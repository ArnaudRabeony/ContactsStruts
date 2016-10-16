package Actions;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import ActionForms.DeleteGroupActionForm;
import Models.Contact;
import ServiceEntities.ContactService;
import ServiceEntities.GroupeService;
import ServiceEntities.MembreService;

public class DeleteGroupAction extends Action
{
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		DeleteGroupActionForm f = (DeleteGroupActionForm)form;
		
		GroupeService gs = new GroupeService();
		MembreService ms = new MembreService();
		ArrayList<Contact> members = ms.getMembersByGroupId(f.getSelectedId());
		gs.deleteGroup(f.getSelectedId());
		
		ContactService cs = new ContactService();
		
		for(Contact c : members)
			ms.removeContactFromGroup(c.getId(), f.getSelectedId());
		
		return mapping.findForward("success");
	}
}
