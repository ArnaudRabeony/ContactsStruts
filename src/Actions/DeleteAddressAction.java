package Actions;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import ActionForms.DeleteListActionForm;
import Models.Adresse;
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
		
		HttpSession session = request.getSession();
		ArrayList<Adresse> adresses = as.getAdresses();
		session.setAttribute("allAdresses", adresses);
		
		return mapping.findForward("success");
	}
}
