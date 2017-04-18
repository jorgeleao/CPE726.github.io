<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minha Casa</title>
        <link href="https://fonts.googleapis.com/css?family=Raleway:400,700" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/index.css" />        
    </head>

    <body>
        <br>
        <br>
        <br> 
        <div id="divMaisExterna">
            <form method="GET" action="controller">
            <input type="hidden"
                   name="nomeDoTratadorDePagina"
                   value="leao.primeirotrabalhoSemJS.pagehandlers.Tratador_index_jsp" />
            
                <span id="titulo1">Minha Casa</span>
                <br>
                <br>
                <div id="nomeDaCasa">
                    <input id="nomeDaCasaText" type="text" name="nomeDaCasa" 
                           value="${sessionScope.NOME_DA_CASA}" ${sessionScope.READ_ONLY}/>
                </div>
                
                <input type="submit" name="botaoSubmit" value="Editar"/>
                &nbsp;&nbsp;&nbsp;
                <input type="submit" name="botaoSubmit" value="Salvar"/>
            </form>
        </div>
    </body>
</html>


