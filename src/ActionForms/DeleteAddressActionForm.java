package ActionForms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import ServiceEntities.AdresseService;

public class DeleteAddressActionForm extends ActionForm
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
			AdresseService as = new AdresseService();
			if(!as.addressExists(this.getSelectedId()))
				errors.add("invalid", new ActionMessage("form.address.doesNotExists"));
		}

		return errors;
	}
}
