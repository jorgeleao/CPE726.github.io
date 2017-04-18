package leao.primeirotrabalhoSemJS.pagehandlers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import leao.primeirotrabalhoSemJS.IFTratadorDePaginas;

public class Tratador_index_jsp implements IFTratadorDePaginas {
    @Override
    public String processar(HttpServletRequest request, HttpServletResponse response){
        String readonly = null;
        String jspURL = "/index.jsp";
        String nomeDaCasa = request.getParameter("nomeDaCasa");
        String botaoSubmit = request.getParameter("botaoSubmit");
        
        if(botaoSubmit.equals("Salvar")){
        //--- Salvar nome da casa no BD... (parte do modelo)
        
        }else if(botaoSubmit.equals("Editar")){ //-- Redundante, só para documentar...
            readonly = (String)request.getSession().getAttribute("READ_ONLY");
            if(readonly==null){
                readonly = "readonly";
            }else if(readonly.equals("")){
                readonly = "readonly";
            }else{
                readonly = "";
            }
System.out.println("=== readonly:"+readonly);
            request.getSession().setAttribute("READ_ONLY", readonly);
        }
        
        request.getSession().setAttribute("NOME_DA_CASA", nomeDaCasa);
        return jspURL;
    }
}
