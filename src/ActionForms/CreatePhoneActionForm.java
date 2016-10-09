package ActionForms;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMessage;

import Models.Telephone;
import ServiceEntities.ContactService;
import ServiceEntities.TelephoneService;

public class CreatePhoneActionForm extends ActionForm
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String numeroTel;
	private String type;
	private int contactId;
	
	public int getContactId() {
		return contactId;
	}
	public void setContactId(int contactId) {
		this.contactId = contactId;
	}
	public String getNumeroTel() {
		return numeroTel;
	}
	public void setNumeroTel(String numero) {
		this.numeroTel = numero;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public ActionErrors validate()
	{
		ActionErrors errors = new ActionErrors();
		
		boolean numIsNullOrEmpty = this.getNumeroTel() == null || this.getNumeroTel().isEmpty();
		boolean typeIsNullOrEmpty = this.getType() == null || this.getType().isEmpty();
		boolean contactIsNullOrEmpty = this.getContactId()==0;
		
		if (numIsNullOrEmpty || typeIsNullOrEmpty || contactIsNullOrEmpty) 
			errors.add("mainField", new ActionMessage("form.missingField"));
		else
		{
			TelephoneService ts = new TelephoneService();
			if(ts.telephoneExists(this.getType(), this.getNumeroTel()))
				errors.add("alreadyExists", new ActionMessage("form.telephone.alreadyExists"));
		}
		
		return errors;
	}
}
