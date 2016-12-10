package Ajax;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import ServiceEntities.ContactService;
import ServiceEntities.GroupeService;

public class AjaxCheckerAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception 
	{ 
		AjaxChecker f = (AjaxChecker)form;
		
		String type = f.getCheck();
		String val = f.getVal();
		
		response.setContentType("text/text;charset=utf-8");
//		response.setHeader("cache-control", "no-cache");
		PrintWriter out = response.getWriter();
		String res = "";
		switch(type)
		{
			case "groupName" :
				GroupeService gs = new GroupeService();
				res = gs.groupExists(val) ? "ko" : "ok";
				
				System.out.println(val+": "+res);
				out.println(res);
				break;
		
			case "name" : 
			
				if(val.contains("-"))
				{
					String names[] = val.split("-");
					String nom = names[0];
					String prenom = names[1];
					
					ContactService cs = new ContactService();
					res = cs.contactExists(nom, prenom) ? "ko" : "ok";
					
					System.out.println(val+": "+res);
					out.println(res);
				}
				
				break;	
			
			case "email" : 
				
				ContactService cs = new ContactService();
				res = cs.mailExists(val) ? "ko" : "ok";
				
				System.out.println(val+": "+res);
				out.println(res);
				break;
				
			default : break;
		}
		
		out.flush();
		return null;
	}
}
