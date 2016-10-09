package ActionForms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import ServiceEntities.GroupeService;
import ServiceEntities.TelephoneService;

public class DeletePhoneActionForm  extends ActionForm
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
			TelephoneService ts = new TelephoneService();
			if(!ts.telephoneExists(this.getSelectedId()))
				errors.add("invalid", new ActionMessage("form.phone.doesNotExists"));
		}

		return errors;
	}
}

