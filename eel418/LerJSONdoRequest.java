package eel418.servlets;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.servlet.http.HttpServletRequest;

public class LerJSONdoRequest {

    public static JsonObject get(HttpServletRequest request) {
        JsonObject jsonDoPedido = null;
        try {
            // Não é um conjunto de pares nome-valor,
            // então tem que ler como se fosse um upload de arquivo...
            BufferedReader br = new BufferedReader(
                    new InputStreamReader(
                            request.getInputStream(), "UTF8"));
            String json = br.readLine();
            br.close();

            //Converter o string em "objeto json" java
            // Criar um JsonReader.
            JsonReader reader = Json.createReader(new StringReader(json));
            // Ler e fazer o parsing do String para o "objeto json" java
            jsonDoPedido = reader.readObject();
            // Acabou, então fechar o reader.
            reader.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonDoPedido;
    }
}
