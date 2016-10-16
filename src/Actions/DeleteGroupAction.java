package Actions;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import ActionForms.DeleteListActionForm;
import Models.Contact;
import ServiceEntities.GroupeService;
import ServiceEntities.MembreService;

public class DeleteGroupAction extends Action
{
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		DeleteListActionForm f = (DeleteListActionForm)form;
		
		int[] toDelete = f.getIdsToDelete();
		System.out.println("Supprimer groupes");
		GroupeService gs = new GroupeService();
		MembreService ms = new MembreService();		
		
		for(int i=0;i<toDelete.length;i++)
		{
			int idGroupe =toDelete[i];
			ArrayList<Contact> members = ms.getMembersByGroupId(idGroupe);
			
			for(Contact c : members)
				ms.removeContactFromGroup(c.getId(), idGroupe);
			
			gs.deleteGroup(idGroupe);
		}
		
		return mapping.findForward("success");
	}
}
