package eel418.consumodeagua.dao;

import eel418.consumodeagua.Iniciador;
import eel418.consumodeagua.dto.DadosConsumoDTO;
import eel418.consumodeagua.dto.LeiturasDTO;
import eel418.consumodeagua.dto.ListaDadosConsumoDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

public class LeiturasDAO{

    public static ConnectionFactory cf;
    
//==============================================================================
    public static ListaDadosConsumoDTO lerTodosDadosEntreDatas(
                                                String apto,
                                                Timestamp fromDate,
                                                Timestamp toDate,
                                                int intPaginaAtual){
//System.out.println("fromDate:"+fromDate);
        ListaDadosConsumoDTO lista =  new ListaDadosConsumoDTO();
        DadosConsumoDTO dto = null;
        ResultSet rs = null;
        
        try (Connection conexao = cf.getConnection()) {
            // BEGIN TRANSACTION
            conexao.setAutoCommit(false);

            PreparedStatement comandoCountSQL = conexao.prepareStatement(
                "SELECT count(*) FROM medidas "+
                "WHERE datahora>=? AND datahora<? "+
                "AND apto=?;");
            comandoCountSQL.setTimestamp(1, fromDate);
            comandoCountSQL.setTimestamp(2, toDate);
            comandoCountSQL.setString(3, apto);
            rs = comandoCountSQL.executeQuery();
            if (rs.next()) {
                lista.nroMedidas = rs.getInt(1);
            }
            
            PreparedStatement comandoSQL = conexao.prepareStatement(
                "SELECT * FROM medidas "+
                "WHERE datahora>=? AND datahora<? "+
                "AND apto=? "+
                "ORDER BY datahora ASC limit ? offset ? ;"
            );
            comandoSQL.setTimestamp(1, fromDate);
            comandoSQL.setTimestamp(2, toDate);
            comandoSQL.setString(3, apto);
            comandoSQL.setInt(4, Iniciador.NRO_ITENS_POR_PAGINA);
//================== OFFSET ========================  
            int offset = Iniciador.NRO_ITENS_POR_PAGINA*(intPaginaAtual-1);
            comandoSQL.setInt(5, offset);
            
            rs = comandoSQL.executeQuery();
            while (rs.next()) {
                dto = new DadosConsumoDTO();
                
                dto.setApto(apto);
                dto.setDatahora(rs.getTimestamp("datahora"));
                dto.setDatahoraz(rs.getTimestamp("datahoraz"));
                dto.setNropulsos(rs.getInt("nropulsos"));
                dto.setHidrometro(rs.getInt("hidrometro"));
                dto.setVolnoperiodo(rs.getFloat("volnoperiodo"));
                dto.setCustonoperiodo(rs.getFloat("custonoperiodo"));
                dto.setNropulsosacumulados(rs.getInt("nropulsosacumulados"));
                dto.setVolacumulado(rs.getFloat("volacumulado"));
                dto.setCustoacumulado(rs.getFloat("custoacumulado"));
                dto.setPrimeira(rs.getBoolean("primeira"));
                
                lista.addMedida(dto);
            }
            // END TRANSACTION
            conexao.commit();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }
//==============================================================================
    public static boolean salvarDadosRecebidos(LeiturasDTO dto){
        ResultSet rs = null;
        Timestamp dataMaisRecente = null;
        int hidrometroMaisRecente = 0;
        int nropulsosacumuladosMaisRecente = 0;
        String apto = dto.getApto();
        try (Connection conexao = cf.getConnection()) {
            // BEGIN TRANSACTION
            conexao.setAutoCommit(false);
            
            PreparedStatement comandoSQL = conexao.prepareStatement(
                "SELECT datahora,hidrometro,nropulsosacumulados FROM medidas "+
                "WHERE apto=? AND datahora=(SELECT MAX(datahora) "+
                "FROM medidas WHERE apto=?);"                    
            );
            comandoSQL.setString(1, apto);
            comandoSQL.setString(2, apto);
            rs = comandoSQL.executeQuery();
            if (rs.next()) {
                dataMaisRecente = rs.getTimestamp("datahora");
                hidrometroMaisRecente = rs.getInt("hidrometro");
                nropulsosacumuladosMaisRecente = rs.getInt("nropulsosacumulados");
                dto.setDatahoraMaisrecente(dataMaisRecente);
                dto.setHidrometroMaisRecente(hidrometroMaisRecente);
                dto.setNropulsosacumuladosMaisRecente(nropulsosacumuladosMaisRecente);
                
                dto.calcularColunas();
            }
            
            comandoSQL = conexao.prepareStatement(
        "INSERT INTO medidas ("
                + "apto"
                + ",datahora"
                + ",datahoraz"
                + ",nropulsos"
                + ",hidrometro"
                + ",volnoperiodo"
                + ",custonoperiodo"
                + ",nropulsosacumulados"
                + ",volacumulado"
                + ",custoacumulado"
                + ") VALUES(?,?,?,?,?,?,?,?,?,?);");
            comandoSQL.setString(1,dto.getApto());
            comandoSQL.setTimestamp(2, dto.getDatahora());
            comandoSQL.setTimestamp(3, dto.getDatahoraz());
            comandoSQL.setInt(4,dto.getNropulsos());
            comandoSQL.setInt(5,dto.getHidrometro());
            comandoSQL.setFloat(6,dto.getVolnoperiodo());
            comandoSQL.setFloat(7,dto.getCustonoperiodo());
            comandoSQL.setInt(8,dto.getNropulsosacumulados());
            comandoSQL.setFloat(9,dto.getVolacumulado());
            comandoSQL.setFloat(10,dto.getCustoacumulado());
            int count = comandoSQL.executeUpdate();
            
            conexao.commit();
            return count>0;
        }catch (Exception e) {
                e.printStackTrace();
                return false;
        }
    }
//==============================================================================
}
