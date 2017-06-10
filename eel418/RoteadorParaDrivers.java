public class RoteadorParaDrivers extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF8");
        IFdosDrivers driver;
        JsonObject jsonDoPedido = LerJSONdoRequest.get(request);
        try {
            String nomeDoDriver = jsonDoPedido.getString("nomeDoDriver");
            driver = (IFdosDrivers) Class.forName(nomeDoDriver).newInstance();
            String strJSON = driver.processar(jsonDoPedido);
            response.setContentType("application/json;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.print(strJSON);
            out.flush();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
