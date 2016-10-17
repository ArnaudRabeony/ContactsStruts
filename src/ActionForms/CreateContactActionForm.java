package ActionForms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import ServiceEntities.ContactService;

public class CreateContactActionForm extends ActionForm
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String nom;
	private String prenom;
	private String email;
	
	private int selectedId;
	
	private String numeroTel;
	private String type;
	
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public int getSelectedId() {
		return selectedId;
	}
	public void setSelectedId(int selectedId) {
		this.selectedId = selectedId;
	}
	public String getNumeroTel() {
		return numeroTel;
	}
	public void setNumeroTel(String numeroTel) {
		this.numeroTel = numeroTel;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public ActionErrors validate(ActionMapping mapping,HttpServletRequest request)
	{
		ActionErrors errors = new ActionErrors();
		
		boolean nomIsNullOrEmpty = this.getNom() == null || this.getNom().isEmpty();
		boolean prenomIsNullOrEmpty = this.getPrenom() == null || this.getPrenom().isEmpty();
		boolean emailIsNullOrEmpty = this.getEmail() == null || this.getEmail().isEmpty();
//		boolean idAddressIsNullOrEmpty = this.getSelectedId() == -1;
		
		if (nomIsNullOrEmpty || prenomIsNullOrEmpty || emailIsNullOrEmpty) 
			errors.add("mainField", new ActionMessage("form.missingField"));
//		else if (idAddressIsNullOrEmpty) 
//			errors.add("address", new ActionMessage("form.missingField"));
		else
		{
			String nom = this.getNom();
			String prenom = this.getPrenom();
			
			ContactService cs = new ContactService();
			if(cs.contactExists(nom, prenom))
				errors.add("alreadyExists", new ActionMessage("form.contact.alreadyExists"));
		}
		return errors;
	}
}
