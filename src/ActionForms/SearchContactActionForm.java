package ActionForms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import ServiceEntities.AdresseService;
import ServiceEntities.ContactService;

public class SearchContactActionForm extends ActionForm
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int selectedId;

	public int getSelectedId() {
		return selectedId;
	}

	public void setSelectedId(int selectedId) {
		this.selectedId = selectedId;
	}
	
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request)
	{
		ActionErrors errors = new ActionErrors();
		
		boolean idIsNullOrEmpty = this.getSelectedId() == -1;
		
		if(!idIsNullOrEmpty)
		{
			System.out.println(this.getSelectedId());
			ContactService cs = new ContactService();
			if(!cs.contactExists(this.getSelectedId()))
				errors.add("invalid", new ActionMessage("form.contact.doesNotExists"));
		}

		return errors;
	}
}
