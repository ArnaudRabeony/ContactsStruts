package Actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import ActionForms.DeleteAddressActionForm;
import ServiceEntities.AdresseService;

public class DeleteAddressAction extends Action
{
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		DeleteAddressActionForm f = (DeleteAddressActionForm)form;
		
		AdresseService as = new AdresseService();
		as.deleteAdresse(f.getSelectedId());
		
		return mapping.findForward("success");
	}
}
