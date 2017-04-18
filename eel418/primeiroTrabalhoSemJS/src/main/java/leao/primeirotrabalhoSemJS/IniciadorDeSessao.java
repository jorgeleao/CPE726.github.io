package leao.primeirotrabalhoSemJS;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class IniciadorDeSessao implements HttpSessionListener {

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        se.getSession().setAttribute("READ_ONLY", "readonly");
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {

    }
}
