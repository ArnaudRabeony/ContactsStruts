package Actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import ActionForms.CreateGroupActionForm;
import Models.Groupe;
import ServiceEntities.ContactService;
import ServiceEntities.GroupeService;

public class CreateGroupAction extends Action
{
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		CreateGroupActionForm f = (CreateGroupActionForm) form;
		
		GroupeService gs = new GroupeService();
		Groupe g = gs.createGroupe(f.getNomGroupe());
		String[] addToGroup = f.getAddToGroup();
		
		if(addToGroup!=null && addToGroup.length!=0)
		{
			ContactService cs = new ContactService();
			int idGroupe = gs.getGroupIdByName(g.getNom());
			
			for(int i=0;i<addToGroup.length;i++)
				cs.addContactToGroup(Integer.valueOf(addToGroup[i]), idGroupe);
		}
		
		return mapping.findForward("success");
	}
}
