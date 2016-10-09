package Actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import ActionForms.DeleteAddressActionForm;
import Models.Adresse;
import ServiceEntities.AdresseService;

public class SearchAddressAction extends Action
{
	
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		DeleteAddressActionForm f = (DeleteAddressActionForm)form;
		
		AdresseService cs = new AdresseService();
		Adresse c = cs.getAdresseById(f.getSelectedId());
		
		if(c != null)
		{
			String num = c.getRue().split(" ")[0];
			String rue = c.getRue().replace(num, "").substring(1);
			request.setAttribute("errorId",f.getSelectedId());
			request.setAttribute("errorNumero", num);
			request.setAttribute("errorRue", rue);
			request.setAttribute("errorVille", c.getVille());
			request.setAttribute("errorCodePostal", c.getCodePostal());
			request.setAttribute("errorPays", c.getPays());
			request.getRequestDispatcher("searchAddress.jsp").forward(request, response);
			return mapping.findForward("success");
		}
		
		return mapping.findForward("error");
	}
}
