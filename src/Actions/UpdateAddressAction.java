package Actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import ActionForms.CreateAddressActionForm;
import ActionForms.UpdateAddressActionForm;
import Models.Adresse;
import ServiceEntities.AdresseService;

public class UpdateAddressAction extends Action
{
	public ActionForward execute(ActionMapping mapping, ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception 
	{ 
		UpdateAddressActionForm f = (UpdateAddressActionForm)form;
		
		AdresseService as = new AdresseService();
		
		int idAddress = f.getIdAddress();
		String rue = f.getNumeroAdresse()+" "+f.getRue();
		String ville = f.getVille();
		String codep = f.getCodep();
		String pays = f.getPays();
		
		if(as.addressExists(idAddress))
		{
			Adresse a = as.getAdresseById(f.getIdAddress());
			
			System.out.println(a.getRue());
			boolean addressHasChanged = !a.getRue().equals(rue) || !a.getVille().equals(ville) 
					 || !a.getCodePostal().equals(codep) || !a.getPays().equals(pays) ||
		(!a.getRue().equals(rue) && !a.getVille().equals(ville) && !a.getCodePostal().equals(codep) && !a.getPays().equals(pays));
			
			System.out.println(addressHasChanged);
			
			if(addressHasChanged && !as.addressExists(rue,ville,codep,pays))// || !addressHasChanged)
			{
				as.updateAdresse(idAddress,rue,ville,codep,pays);
				return mapping.findForward("success");
			}
			else
				return mapping.findForward("alreadyExistsError");
		}
		else
			return mapping.findForward("doesNotExistsError");
	}
}
