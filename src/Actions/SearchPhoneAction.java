package Actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import ActionForms.SearchAddressActionForm;
import ActionForms.SearchPhoneActionForm;
import Models.Adresse;
import Models.Telephone;
import ServiceEntities.AdresseService;
import ServiceEntities.TelephoneService;

public class SearchPhoneAction extends Action
{
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		SearchPhoneActionForm f = (SearchPhoneActionForm)form;
		
		AdresseService cs = new AdresseService();
		Adresse c = cs.getAdresseById(f.getSelectedId());
		
		TelephoneService ts = new TelephoneService();
		Telephone t = ts.getTelephoneById(f.getSelectedId());

		if(t != null)
		{
			System.out.println(t.getNumber());
			request.setAttribute("errorPhoneType", t.getPhoneKind());
			request.setAttribute("errorPhone", t.getNumber());
			return mapping.findForward("success");
		}
		else
			return mapping.findForward("error");
	}
}