package ActionForms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import ServiceEntities.ContactService;

public class UpdateContactActionForm extends ActionForm
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int idContact;
	private String nom;
	private String prenom;
	private String email;
	private int newAddress;
	
	public int getNewAddress() {
		return newAddress;
	}

	public void setNewAddress(int newAddress) {
		this.newAddress = newAddress;
	}

	public int getIdContact() {
		return idContact;
	}

	public void setIdContact(int idContact) {
		this.idContact = idContact;
	}

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

	public ActionErrors validate(ActionMapping mapping,	HttpServletRequest request) 
		{
			ActionErrors errors = new ActionErrors();
			boolean idIsNullOrEmpty = this.getIdContact() == 0;
			boolean nomIsNullOrEmpty = this.getNom() == null || this.getNom().isEmpty();
			boolean prenomIsNullOrEmpty = this.getPrenom() == null || this.getPrenom().isEmpty();
			boolean emailIsNullOrEmpty = this.getEmail() == null || this.getEmail().isEmpty();
			
			ContactService cs = new ContactService();
			
			if (idIsNullOrEmpty || nomIsNullOrEmpty || prenomIsNullOrEmpty || emailIsNullOrEmpty) 
				errors.add("mainField", new ActionMessage("form.missingField"));
			
			//Faire vérif dans execute pour comparer les anciennes valeurs avec les nouvelles
//			if(cs.contactExists(this.getNom(), this.getPrenom()))
//				errors.add("contactExists", new ActionMessage("form.contact.alreadyExists"));
			
			return errors;
		}
	
}
