package ActionForms;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import Models.Contact;
import Models.Groupe;
import ServiceEntities.ContactService;
import ServiceEntities.GroupeService;

public class UpdateGroupActionForm  extends ActionForm
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String nomGroupe;
	String addMembers;
	String[] members;
	int selectedId;
	
	public int getSelectedId() {
		return selectedId;
	}
	public void setSelectedId(int selectedId) {
		this.selectedId = selectedId;
	}
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
	public String[] getMembers() {
		return members;
	}
	public void setMembers(String[] addToGroup) {
		this.members = addToGroup;
	}
	
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request)
	{
		ActionErrors errors = new ActionErrors();
		
		boolean nomIsNullOrEmpty = this.getNomGroupe() == null || this.getNomGroupe().isEmpty();
		boolean addMembersIsNullOrEmpty = this.getMembers() == null;

		if (nomIsNullOrEmpty || addMembersIsNullOrEmpty) 
			errors.add("mainField", new ActionMessage("form.missingField"));

		return errors;
	}
}