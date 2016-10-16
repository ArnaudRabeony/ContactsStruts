package ActionForms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class CreateAddressActionForm extends ActionForm
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String numeroAdresse;
	private String rue;
	private String ville;
	private String codep;
	private String pays;

	public String getNumeroAdresse() {
		return numeroAdresse;
	}
	
	public void setNumeroAdresse(String numeroAdresse) {
		this.numeroAdresse = numeroAdresse;
	}
	
	public String getRue() {
		return rue;
	}
	public void setRue(String rue) {
		this.rue = rue;
	}
	public String getVille() {
		return ville;
	}
	public void setVille(String ville) {
		this.ville = ville;
	}
	public String getCodep() {
		return codep;
	}
	public void setCodep(String codep) {
		this.codep = codep;
	}
	public String getPays() {
		return pays;
	}
	public void setPays(String pays) {
		this.pays = pays;
	}
	
	public ActionErrors validate(ActionMapping mapping,	HttpServletRequest request) 
	{
		ActionErrors errors = new ActionErrors();
		
		boolean numIsNullOrEmpty = this.getNumeroAdresse() == null || this.getNumeroAdresse().isEmpty();
		boolean rueIsNullOrEmpty = this.getRue() == null || this.getRue().isEmpty();
		boolean codepIsNullOrEmpty = this.getCodep() == null || this.getCodep().isEmpty();
		boolean villeIsNullOrEmpty = this.getVille() == null || this.getVille().isEmpty();
		boolean paysIsNullOrEmpty = this.getPays() == null || this.getPays().isEmpty();
		
		if (numIsNullOrEmpty || rueIsNullOrEmpty || codepIsNullOrEmpty || villeIsNullOrEmpty || paysIsNullOrEmpty) 
			errors.add("mainField", new ActionMessage("form.missingField"));
		
		return errors;
	}
}
