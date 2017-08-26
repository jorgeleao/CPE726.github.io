package httpclientserver01;

import java.net.InetAddress;
import java.net.Socket;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintStream;

public class HttpClient {

    static Socket sCliente;
    static InetAddress remoteAddress;
    static HttpServer m;
    static BufferedReader entrada;
    static String linha;
    static PrintStream saida;

    public static void main(String[] args) {
        try {
            for (;;) {
                remoteAddress = InetAddress.getLocalHost();
                sCliente = new Socket(remoteAddress, 8070);
                saida = new PrintStream(sCliente.getOutputStream());
                entrada = new BufferedReader(new InputStreamReader(sCliente.getInputStream()));
                        
                // GET, HEAD, POST, PUT, DELETE, TRACE, CONNECT
                
//----------------------------------------------
/*
                String request = 
                        "GET / HTTP/1.1\n" +
                        "Host: localhost:8070\n" +
                        "Keep-Alive: 115\n"+
                        "Connection: keep-alive\n"+
                        "Content-Type: application/x-www-form-urlencoded\n"+
                        "Content-Length: 40\n" +
                        "\n" +
                        "NOME=VALOR&NOME2=aaaaaaaaaa&CAIXA_DE_TEXTO=ABCDEfghi&botao=ENVIAR";
*/
//----------------------------------------------
                
                String data = "CAIXA_DE_TEXTO=ABCDEfghi";
                String request =
                        "POST localhost:8070 HTTP/1.1\r\n"
                        + "Host: localhost:"+(new Integer(8087)).toString()+"\r\n"
                        + "Content-Type: application/x-www-form-urlencoded\r\n"
                        + "Content-Length: " + data.length() + "\r\n"
                        + "\r\n"
                        + data + "\n";
 
//----------------------------------------------
System.out.println("=== request HTTP: "+request+"\n=== fim request");                            
                saida.print(request);
                saida.flush();
                sCliente.shutdownOutput();
//--------------------------------------------
                System.out.println("\n[HttpClient.main] Recebeu response: ");
                do {
                    linha = entrada.readLine();
                    if (linha != null) {
                        if (linha.equals("")) {
                            System.out.println("(linha vazia)");
                        }else{
                            System.out.println(linha);
                        }
                    }
                } while (entrada.ready());
                System.out.println("=== FIM ===\n\n");
                Thread.sleep(1000);
            }
        } catch (Exception e) {
            System.out.println("[HttpClient.main] ERRO: " + e);
        }

    }
}
