package Actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import ActionForms.DeletePhoneActionForm;
import ServiceEntities.TelephoneService;

public class DeletePhoneAction extends Action
{
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		DeletePhoneActionForm f = (DeletePhoneActionForm)form;
		
		TelephoneService ts = new TelephoneService();
		ts.deleteTelephone(f.getSelectedId());
		
		return mapping.findForward("success");
	}
}
