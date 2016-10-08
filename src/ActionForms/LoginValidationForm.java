package ActionForms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class LoginValidationForm extends ActionForm {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected String nom;
	protected String password;

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public ActionErrors validate(ActionMapping mapping,	HttpServletRequest request) 
	{
		ActionErrors errors = new ActionErrors();
		
		boolean nomIsNullOrEmpty = this.getNom() == null || this.getNom().isEmpty();
		boolean passwordIsNullOrEmpty = this.getPassword() == null || this.getPassword().isEmpty();
		
		if (nomIsNullOrEmpty) 
			errors.add("nom", new ActionMessage("form.missingField"));
		else if (passwordIsNullOrEmpty) 
			errors.add("password", new ActionMessage("form.missingField"));
		else if (nomIsNullOrEmpty && passwordIsNullOrEmpty) 
			errors.add("nomAndPassword", new ActionMessage("form.missingField"));
		else if (!this.getNom().equals(this.getPassword())) 
			errors.add("nomAndPassword", new ActionMessage("form.login.failed"));
		
		return errors;
	}
}
