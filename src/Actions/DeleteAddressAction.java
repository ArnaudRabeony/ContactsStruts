package Actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import ActionForms.DeleteListActionForm;
import ServiceEntities.AdresseService;

public class DeleteAddressAction extends Action
{
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		DeleteListActionForm f = (DeleteListActionForm)form;
		
		int[] toDelete = f.getIdsToDelete();

		AdresseService as = new AdresseService();
		
		for(int i=0;i<toDelete.length;i++)
			as.deleteAdresse(toDelete[i]);
		
		return mapping.findForward("success");
	}
}
