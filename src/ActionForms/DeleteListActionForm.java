package ActionForms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

public class DeleteListActionForm extends ActionForm
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int[] idsToDelete;

	public int[] getIdsToDelete() {
		return idsToDelete;
	}

	public void setIdsToDelete(int[] idsToDelete) {
		this.idsToDelete = idsToDelete;
	}
	
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request)
	{
		return new ActionErrors();
	}
}
