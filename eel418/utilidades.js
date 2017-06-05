
var TAMANHO_DA_PAGINA_DE_RESULTADOS = 10;

//------------------------------------------------------------------------------
function allPropNonNull(obj){
  for(var key in obj){
      if(obj[key]===undefined || obj[key]===null || obj[key]===""){
          return false;
      }
   }
   return true;
}
//------------------------------------------------------------------------------
function getFormData($form){
    var unindexed_array = $form.serializeArray();
    var indexed_array = {};
    $.map(unindexed_array, function(n, i){
        indexed_array[n['name']] = n['value'];
    });
    return indexed_array;
}
//------------------------------------------------------------------------------
function linkPadrao(idLink,clickCallBack){
//    document.getElementById(idLink).style.setProperty('text-decoration', 'none');
    document.getElementById(idLink).addEventListener(
            'click', clickCallBack);
    document.getElementById(idLink).addEventListener(
            'mouseover', function () {
                document.getElementById(idLink).style.setProperty('text-decoration', 'underline');
            });
    document.getElementById(idLink).addEventListener(
            'mouseout', function () {
                document.getElementById(idLink).style.setProperty('text-decoration', 'none');
            });
}
//------------------------------------------------------------------------------
function linkMenu(idLink,div,clickCallBack){
    document.getElementById(div).style.setProperty('border', '2px solid white');
    document.getElementById(idLink).addEventListener(
            'click', clickCallBack);
    document.getElementById(div).addEventListener(
            'mouseover', function () {
                document.getElementById(div).style.setProperty('border', '2px solid #dddddd');
            });
    document.getElementById(div).addEventListener(
            'mouseout', function () {
                document.getElementById(div).style.setProperty('border', '2px solid white');
            });
}
//==============================================================================
var ControleDePaginas = function(nroPaginas,prefixo){
    this.nroPaginas = nroPaginas;
    this.prefixo = prefixo;
    this.estado = prefixo+0;
    
    this.mudarParaPagina = function (idPagina) {
        var pagina;
        for(var i=1;i<=this.nroPaginas;i++){
            pagina = prefixo+i;
            if(pagina===idPagina){
//                if(document.getElementById(pagina)!==null && document.getElementById(pagina) !== undefined)
                document.getElementById(pagina).style.display = 'block';
            }else{
//                if(document.getElementById(pagina)!==null && document.getElementById(pagina) !== undefined)
                document.getElementById(pagina).style.display = 'none';
            }
        }
    };
    
    this.mudarParaPagina(prefixo+0);
};
//------------------------------------------------------------------------------
var ObjDialogo = function(id) {
    var el = document.getElementById(id);
    this.elementoDialogo = document.getElementById(id);
    
    this.escreverMsgNormal = function (texto) {
        this.elementoDialogo.innerHTML = "";
        this.elementoDialogo.removeAttribute('class');
        setTimeout(function(){
            el.innerHTML = texto;
            el.setAttribute('class', 'gradCircAzul');
        }, 50);
    };
    this.escreverMsgAviso = function (texto) {
        this.elementoDialogo.innerHTML = "";
        this.elementoDialogo.removeAttribute('class');
        setTimeout(function(){
            el.innerHTML = texto;
            el.setAttribute('class', 'gradCircAmarelo');
        }, 50);
    };
    this.escreverMsgErro = function (texto) {
        this.elementoDialogo.innerHTML = "";
        this.elementoDialogo.removeAttribute('class');
        setTimeout(function(){
            el.innerHTML = texto;
            el.setAttribute('class', 'gradCircVermelho');
        }, 50);
    };
    this.limparDialogo = function() {
        this.elementoDialogo.innerHTML = "";
        this.elementoDialogo.removeAttribute('class');
    };
    this.setSpinningWheel = function(width){
        this.elementoDialogo.removeAttribute('class');
        this.elementoDialogo.innerHTML = '<br><img src="./images/spinningwheel45.gif" style="width:'+width+';"/>';
    };
};
//------------------------------------------------------------------------------
function resetTextAreaCursor(txtElement) { 
    if (txtElement.setSelectionRange) { 
        txtElement.focus(); 
        txtElement.setSelectionRange(0, 0); 
    } else if (txtElement.createTextRange) { 
        var range = txtElement.createTextRange();  
        range.moveStart('character', 0); 
        range.select(); 
    } 
}
//------------------------------------------------------------------------------
function fazerPedidoPostAJAX(sendData, destino, callBack) {
    var data = JSON.stringify(sendData);
    var objPedidoAJAX = new XMLHttpRequest();
    objPedidoAJAX.open('POST', destino);
    objPedidoAJAX.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
//    objPedidoAJAX.timeout = 10000;
    objPedidoAJAX.responseType = 'json';
    objPedidoAJAX.onreadystatechange = function () {
        var DONE = 4; // readyState 4 means the request is done.
        var OK = 200; // status 200 is a successful return.
        if (objPedidoAJAX.readyState === DONE) {
            if (objPedidoAJAX.status === OK) {
                respJsonAtual = objPedidoAJAX.response;
                callBack(objPedidoAJAX);
            } else {
//                alert('Deu erro status: ' + objPedidoAJAX.status);
            }
        } else {
//                alert('Deu erro readyState: ' + objPedidoAJAX.readyState);
        }
    };
    objPedidoAJAX.send(data);
}
//------------------------------------------------------------------------------
function callBack(objPedidoAJAX) { //--- MODELO DE CALLBACK
    document.getElementById("idLoading1").removeAttribute("class");
    document.getElementById("idLoading2").removeAttribute("class");
    try {
        popularTabelaDeResultados(objPedidoAJAX.response);
    } catch (erro) {
        //...        
    }
}
//------------------------------------------------------------------------------
var ObjetoControlePaginacaoDeDados = function (fazerPedidoBusca,idPaginaDestino) {
    this.paginaAtual = 1;

    this.mostrarPrimeiraPagina = function () {
        this.paginaAtual = 1;
        document.getElementById(idPaginaDestino).value = this.paginaAtual;
        fazerPedidoBusca(this.paginaAtual);
//        dialogo.escreverMsgNormal('<br>Mostrando primeira página...');
    };

    this.mostrarPaginaNumero = function (nro) {
        this.paginaAtual = nro;
        document.getElementById(idPaginaDestino).value = this.paginaAtual;
        fazerPedidoBusca(this.paginaAtual);
//        dialogo.escreverMsgNormal('<br>Mostrando página '+nro);
    };

    this.mostrarPaginaAnterior = function () {
        this.paginaAtual = document.getElementById(idPaginaDestino).value;
        if (    respJsonAtual !== null &&
                this.paginaAtual !== null &&
                this.paginaAtual > 1) {
            this.paginaAtual--;
            document.getElementById(idPaginaDestino).value = this.paginaAtual;
            fazerPedidoBusca(this.paginaAtual);
//            dialogo.escreverMsgNormal('<br>Mostrando página anterior...');
            return true;
        } else {
            dialogo.escreverMsgErro('<br>Não há pagina anterior.');
            return false;
        };
    };

    this.mostrarProximaPagina = function () {
        var nroPaginas = Math.floor((respJsonAtual.nroRows - 1) / TAMANHO_DA_PAGINA_DE_RESULTADOS) + 1;
        this.paginaAtual = document.getElementById(idPaginaDestino).value;
        var paginaAtual = this.paginaAtual;
//alert("nroPaginas:"+nroPaginas+"\npaginaAtual:"+paginaAtual+"\nthis.paginaAtual:"+this.paginaAtual);        
        if (    respJsonAtual !== null &&
                paginaAtual !== null &&
                paginaAtual < nroPaginas) {
            paginaAtual++;
            this.paginaAtual = paginaAtual;
            document.getElementById(idPaginaDestino).value = paginaAtual;
//alert("nroPaginas:"+nroPaginas+"\npaginaAtual:"+paginaAtual+"\nthis.paginaAtual:"+this.paginaAtual);        
            fazerPedidoBusca(this.paginaAtual);
//            dialogo.escreverMsgNormal('<br>Mostrando próxima página...');
            return true;
        } else {
            dialogo.escreverMsgErro('<br>Não há próxima pagina.');
            return false;
        };
    };
};
//------------------------------------------------------------------------------

