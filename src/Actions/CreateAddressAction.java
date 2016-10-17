package Actions;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import ActionForms.CreateAddressActionForm;
import Models.Adresse;
import ServiceEntities.AdresseService;

public class CreateAddressAction extends Action
{
	public ActionForward execute(ActionMapping mapping, ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception 
	{ 
		CreateAddressActionForm f = (CreateAddressActionForm)form;
		
		AdresseService as = new AdresseService();
		as.createAdresse(f.getNumeroAdresse()+" "+f.getRue(), f.getVille(), f.getCodep(), f.getPays());
		
		HttpSession session = request.getSession();
		ArrayList<Adresse> adresses = as.getAdresses();
		session.setAttribute("allAdresses", adresses);
		
		return mapping.findForward("success");
	}
}
