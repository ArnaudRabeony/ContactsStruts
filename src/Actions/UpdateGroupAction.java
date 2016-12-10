package Actions;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import ActionForms.UpdateGroupActionForm;
import Models.Contact;
import Models.Groupe;
import ServiceEntities.ContactService;
import ServiceEntities.GroupeService;
import ServiceEntities.MembreService;

public class UpdateGroupAction extends Action
{

	public ActionForward execute(ActionMapping mapping, ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception 
	{
		UpdateGroupActionForm f = (UpdateGroupActionForm)form;
		
		int idGroupe = f.getSelectedId();
		String nom = f.getNomGroupe();
		String[] membersIdList = f.getMembers();
		
		GroupeService gs = new GroupeService();
		MembreService ms = new MembreService();
		Groupe g = gs.getGroupById(idGroupe);
		
		ArrayList<Contact> previousList = ms.getMembersByGroupId(idGroupe);
		
		System.out.println("nom grp : " +f.getNomGroupe());
		boolean nameHasChanged = !g.getNom().equals(nom);
		
		int previousNumber = previousList.size();
		int newNumber = 0;
		boolean membersNumberHasChanged = false;
		
		System.out.println("membres avant "+previousNumber);
		
		if(membersIdList!=null)
			newNumber = membersIdList.length;

		System.out.println("membres apres "+ newNumber);
		if(previousNumber != newNumber)
			membersNumberHasChanged=true;
		
		System.out.println("name has changed "+nameHasChanged);
		System.out.println("Members have changed "+membersNumberHasChanged);
		
		if(nameHasChanged && !gs.groupExists(nom))// || !addressHasChanged)
			gs.updateGroupe(idGroupe, nom);
		
		ContactService cs = new ContactService();
		if(membersIdList!=null)
		{
			for(Contact c : cs.getContacts())
				if(ms.getGroupIdByContactId(c.getId()).contains(idGroupe))
					ms.removeContactFromGroup(c.getId(), idGroupe);
			
			for(String newContactId : membersIdList)
			{
				Contact c = cs.getContactById(Integer.valueOf(newContactId));
				ms.addContactToGroup(c.getId(), idGroupe);
			}
		}
		else
		{
			for(Contact c : cs.getContacts())
				if(ms.getGroupIdByContactId(c.getId()).contains(idGroupe))
					ms.removeContactFromGroup(c.getId(), idGroupe);
		}
		
		return mapping.findForward("success");
	}
}
