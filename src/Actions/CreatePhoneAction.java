package Actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import ActionForms.CreatePhoneActionForm;
import ServiceEntities.TelephoneService;

public class CreatePhoneAction extends Action
{

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		CreatePhoneActionForm f = (CreatePhoneActionForm)form;
		
		TelephoneService ts = new TelephoneService();
		ts.createTelephone(f.getType(), f.getNumeroTel(),Integer.valueOf(f.getContactId()));
		
		return mapping.findForward("success");
	}
}
