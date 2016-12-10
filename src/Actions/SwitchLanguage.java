package Actions;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.jstl.core.Config;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import ActionForms.SwitchLanguageActionForm;


public class SwitchLanguage extends Action
{
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		 SwitchLanguageActionForm f = (SwitchLanguageActionForm)form;
		 
		 HttpSession session = request.getSession();
		 
	     String newLang = f.getLang();
	     response.setHeader("Content-Language", newLang);
//	     session.setAttribute("lang", newLang);
	     
	     Config.set( session, Config.FMT_LOCALE, new java.util.Locale(newLang));
	     System.out.println(session.getAttribute("locale"));
//	     request.setAttribute("javax.servlet.jsp.jstl.fmt.fallbackLocale.request",newLang);
	     return	 mapping.findForward("success");
	}
}
