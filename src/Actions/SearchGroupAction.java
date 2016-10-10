package Actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import ActionForms.SearchGroupActionForm;
import Models.Adresse;
import Models.Groupe;
import ServiceEntities.GroupeService;

public class SearchGroupAction extends Action
{
	
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		SearchGroupActionForm f = (SearchGroupActionForm)form;
		System.out.println("Selected group : "+f.getSelectedId());
		GroupeService gs = new GroupeService();
		Groupe g = gs.getGroupById(f.getSelectedId());

		if(g != null)
		{
			System.out.println(g.getNom());
			request.setAttribute("errorNomGroupe", g.getNom());
			request.setAttribute("errorId", f.getSelectedId());
			return mapping.findForward("success");
		}
		else		
			return mapping.findForward("error");
	}
}

