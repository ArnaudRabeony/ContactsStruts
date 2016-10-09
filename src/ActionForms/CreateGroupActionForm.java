package ActionForms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import Models.Groupe;
import ServiceEntities.GroupeService;
import ServiceEntities.TelephoneService;

public class CreateGroupActionForm extends ActionForm
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String nomGroupe;
	String addMembers;
	String[] addToGroup;
	
	public String getNomGroupe() {
		return nomGroupe;
	}
	public void setNomGroupe(String nomGroupe) {
		this.nomGroupe = nomGroupe;
	}
	public String getAddMembers() {
		return addMembers;
	}
	public void setAddMembers(String addMembers) {
		this.addMembers = addMembers;
	}
	public String[] getAddToGroup() {
		return addToGroup;
	}
	public void setAddToGroup(String[] addToGroup) {
		this.addToGroup = addToGroup;
	}
	
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request)
	{
		ActionErrors errors = new ActionErrors();
		
		boolean nomIsNullOrEmpty = this.getNomGroupe() == null || this.getNomGroupe().isEmpty();
		boolean addMembersIsNullOrEmpty = this.getAddMembers() == null || this.getAddMembers().isEmpty();
		
		if (nomIsNullOrEmpty || addMembersIsNullOrEmpty) 
			errors.add("mainField", new ActionMessage("form.missingField"));
		else
		{
			GroupeService gs = new GroupeService();
			
			if(gs.exists(this.getNomGroupe()))
				errors.add("alreadyExists", new ActionMessage("form.group.alreadyExists"));
		}
		return errors;
	}
}
