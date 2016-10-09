package Actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import ActionForms.DeleteContactActionForm;
import ServiceEntities.ContactService;

public class DeleteContactAction extends Action
{
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		DeleteContactActionForm f = (DeleteContactActionForm)form;
		
		ContactService cs = new ContactService();
		cs.deleteContact(f.getSelectedId());
		
		return mapping.findForward("success");
	}
}
