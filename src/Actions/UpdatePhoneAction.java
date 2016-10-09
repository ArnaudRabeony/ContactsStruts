package Actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import ActionForms.UpdateAddressActionForm;
import ActionForms.UpdatePhoneActionForm;
import Models.Adresse;
import Models.Telephone;
import ServiceEntities.AdresseService;
import ServiceEntities.TelephoneService;

public class UpdatePhoneAction extends Action
{
	public ActionForward execute(ActionMapping mapping, ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception 
	{ 
		UpdatePhoneActionForm f = (UpdatePhoneActionForm)form;
		System.out.println("updatePhoneAction");

		String numero = f.getNumeroTel();
		String type = f.getType();
		int idTelephone = f.getSelectedId();
		
		TelephoneService ts = new TelephoneService();
		if(ts.telephoneExists(idTelephone))
		{
			Telephone t = ts.getTelephoneById(idTelephone);
			
			System.out.println(t.getNumber()+" "+t.getPhoneKind());
			boolean phoneHasChanged = !t.getNumber().equals(numero) || !t.getPhoneKind().equals(type) || (!t.getNumber().equals(numero) && !t.getPhoneKind().equals(type));
			System.out.println(phoneHasChanged);
			
			if(phoneHasChanged && !ts.telephoneExists(type, numero))// || !addressHasChanged)
			{
				ts.updateNumero(idTelephone,type,numero);
				return mapping.findForward("success");
			}
			else
				return mapping.findForward("alreadyExistsError");
		}
		else
			return mapping.findForward("doesNotExistsError");
	}		
}
