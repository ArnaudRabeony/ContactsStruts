package ActionForms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class UpdatePhoneActionForm extends ActionForm
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int selectedId;
	private String numeroTel;
	private String type;
	private int contactId;
	
	public int getSelectedId() {
		return selectedId;
	}
	public void setSelectedId(int selectedId) {
		this.selectedId = selectedId;
	}
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
	
	public ActionErrors validate(ActionMapping mapping,	HttpServletRequest request) 
		{
			ActionErrors errors = new ActionErrors();
			System.out.println(this.getNumeroTel());
			boolean idIsNullOrEmpty = this.getSelectedId() == 0;
			boolean numIsNullOrEmpty = this.getNumeroTel() == null || this.getNumeroTel().isEmpty();
			boolean typeIsNullOrEmpty = this.getType() == null || this.getType().isEmpty();
			boolean contactIsNullOrEmpty = this.getSelectedId()==0;
			
			System.out.println(idIsNullOrEmpty);
			System.out.println(numIsNullOrEmpty);
			System.out.println(typeIsNullOrEmpty);
			System.out.println(contactIsNullOrEmpty);
			if (idIsNullOrEmpty || numIsNullOrEmpty || typeIsNullOrEmpty || contactIsNullOrEmpty) 
				errors.add("mainField", new ActionMessage("form.missingField"));
			
			System.out.println("taille error : "+errors.size());
			return errors;
		}
	
}
