package httpclientserver01;

import java.net.InetAddress;
import java.net.Socket;
import java.net.ServerSocket;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URLDecoder;

public class HttpServer {

    static ServerSocket sPassivo;
    static Socket sAtivo;
    static InetAddress localAddress;
    static BufferedReader entrada;
    static String linha;
    static String subLinha;
    static String caixa_de_texto = "default...";
    static boolean já_encontrou;
    static String requestType;

    public static void main(String[] args) {
        System.out.println("[HttpServer.main] Iniciou.");
        try {
            sPassivo = new ServerSocket(8070, 50, null);   // null - recebe de todo e qualquer endereço IP deste servidor
            if (sPassivo != null) {
                System.out.println("[HttpServer.main] Fez bind.");
            } else {
                System.out.println("[HttpServer.main] Erro na criação do soquete.");
                System.exit(-1);
            }

            char[] buff = new char[4096];
            int tam = 0;
            int inicio = 0;
            int pos_newline = 0;

            while (true) {
                //=== Vai esperar por pedido de conexão
                sAtivo = sPassivo.accept();
                System.out.println("=================================== Servidor recebeu um novo pedido");

                //=== Vai ler o pedido todo
                for (int i = 0; i < 4096; i++) {
                    buff[i] = 0;
                }
                caixa_de_texto = "";
                linha = "";

                entrada = new BufferedReader(new InputStreamReader(sAtivo.getInputStream()));
                tam = entrada.read(buff, 0, 4096);
                if (tam == -1) {
                    break;
                }
                linha = new String(buff, 0, tam);
System.out.println("========== Request recebido:\n"+linha);                
System.out.println("========== Fim do request.\n");                
                requestType = linha.substring(0, 3);
                //System.out.println("\n=== Tipo do request: " + requestType);
                inicio = 0;
                pos_newline = 0;

                if (requestType.equals("GET")) {
                    if(linha.substring(0,12).equals("GET /favicon")){
                //System.out.println("\n=== PEDIDO DE FAVICON.ICO !\n");
                    }else{
                        pos_newline = linha.indexOf('\n', inicio);
                        if (pos_newline == -1) {
                            subLinha = linha.substring(inicio);
                //System.out.println(subLinha);
                            break;
                        } else if (pos_newline == (inicio + 1)) {
                System.out.println("(=== linha vazia ===)");
                        } else {
                            subLinha = linha.substring(inicio, pos_newline);
                            if (subLinha != null) {
                //System.out.println(subLinha);
                                caixa_de_texto = pegar_valor_da_caixa_de_texto(subLinha);
                            }
                        }
                    }
                } else if (requestType.equals("POS")) {  // POST
                    //=== Vai separar as linhas e pegar valor da caixa_de_texto
                    do {
                        pos_newline = linha.indexOf('\n', inicio);
                        if (pos_newline == -1) {
                            subLinha = linha.substring(inicio);
                //System.out.println(subLinha);
                            caixa_de_texto = pegar_valor_da_caixa_de_texto(subLinha);
                            if(caixa_de_texto==null)caixa_de_texto="...vazio...";
                //System.out.println("\nCaixa de texto 1: " + caixa_de_texto);
                            break;
                        } else if (pos_newline == (inicio + 1)) {
                System.out.println("(=== linha vazia ===)");
                        } else {
                            subLinha = linha.substring(inicio, pos_newline);
                            if (subLinha != null) {
                //System.out.println("+++++ "+subLinha);
                                caixa_de_texto = pegar_valor_da_caixa_de_texto(subLinha);
                                if(caixa_de_texto==null)caixa_de_texto="...vazio...";
                System.out.println("\nCaixa de texto 2: " + caixa_de_texto);
                            }
                        }
                        inicio = pos_newline + 1;
                    } while (true);
                }
                System.out.println("=================================== Fim da transação.\n\n");

                //=== Vai responder
                construir_e_enviar_resposta(sAtivo, caixa_de_texto);
                sAtivo.shutdownOutput();
            }
        } catch (Exception e) {
            System.out.println("=== ERRO: " + e);
        }
    }
//------------------------------------------------------------------------------

    static void construir_e_enviar_resposta(Socket s, String texto) {
        try {
            char[] buff1 = new char[4096];
            char[] buff2 = new char[4096];

            BufferedReader primeira_metade
                    = new BufferedReader(new FileReader("primeira_metade.html.part"));
            int tam_primeira_metade = primeira_metade.read(buff1, 0, 4096);

            BufferedReader segunda_metade
                    = new BufferedReader(new FileReader("segunda_metade.html.part"));
            int tam_segunda_metade = segunda_metade.read(buff2, 0, 4096);

            PrintWriter ps = new PrintWriter(sAtivo.getOutputStream());

            ps.print("HTTP/1.0 200 OK\n"
                    + "Content-type: text/html\n"
                    + "\n");
            ps.write(buff1, 0, tam_primeira_metade);

//texto="Quebra galho...";
            ps.write(texto);
            ps.write(buff2, 0, tam_segunda_metade);

            ps.flush();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
//------------------------------------------------------------------------------
    static String pegar_valor_da_caixa_de_texto(String linha) {
//System.out.println("===== linha: "+linha);
        int pos = linha.indexOf("=");
        String ret = linha.substring(pos+1);
        try{
        ret = URLDecoder.decode(ret, "UTF-8");
        }catch(Exception e){
            e.printStackTrace();
        }
//        System.out.println(ret);
        return ret;
    }
}
