package eel418.consumodeagua.dto;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

public class LeiturasDTO implements Serializable{
    final float COEF_PULSOS = 0.3F;
    final float CUSTO_POR_VOLUME = 0.005F;
    
    private String apto = "";
    private String lognumber = "";
    private Timestamp datahora;
    private Timestamp datahoraMaisrecente;
    private Timestamp datahoraz;
    private Timestamp datahorazMaisrecente;
    private int nropulsos = 0;
    private int hidrometro = 0;
    private int hidrometroMaisRecente = 0;
    private int nropulsosacumuladosMaisRecente = 0;
    private float volnoperiodo = 0F;
    private float custonoperiodo = 0F;
    private int nropulsosacumulados = 0;
    private float volacumulado = 0F;
    private float custoacumulado = 0F;

    public void calcularColunas(){
        long timestamp = datahora.getTime();
        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(timestamp);
        int intMesDatahora = cal.get(Calendar.MONTH);
        
        timestamp = datahoraMaisrecente.getTime();
        cal = Calendar.getInstance();
        cal.setTimeInMillis(timestamp);
        int intMesDatahoraMaisrecente = cal.get(Calendar.MONTH);
        if(intMesDatahora>intMesDatahoraMaisrecente){
            nropulsosacumulados = 0;
        }else{
            nropulsosacumulados = nropulsosacumuladosMaisRecente+nropulsos;
        }
        datahoraz = datahora;
        hidrometro = hidrometroMaisRecente + nropulsos;
        volnoperiodo = COEF_PULSOS * nropulsos;
        custonoperiodo = CUSTO_POR_VOLUME * volnoperiodo;
        volacumulado = COEF_PULSOS * nropulsosacumulados;
        custoacumulado = CUSTO_POR_VOLUME * volacumulado;
    }

    public Timestamp getDatahoraMaisrecente() {
        return datahoraMaisrecente;
    }

    public void setDatahoraMaisrecente(Timestamp datahoraMaisrecente) {
        this.datahoraMaisrecente = datahoraMaisrecente;
    }

    public Timestamp getDatahorazMaisrecente() {
        return datahorazMaisrecente;
    }

    public void setDatahorazMaisrecente(Timestamp datahorazMaisrecente) {
        this.datahorazMaisrecente = datahorazMaisrecente;
    }

    public int getNropulsosacumuladosMaisRecente() {
        return nropulsosacumuladosMaisRecente;
    }

    public void setNropulsosacumuladosMaisRecente(int nropulsosacumuladosMaisRecente) {
        this.nropulsosacumuladosMaisRecente = nropulsosacumuladosMaisRecente;
    }

    public int getHidrometroMaisRecente() {
        return hidrometroMaisRecente;
    }

    public void setHidrometroMaisRecente(int hidrometroMaisRecente) {
        this.hidrometroMaisRecente = hidrometroMaisRecente;
    }

    public String getApto() {
        return apto;
    }

    public void setApto(String apto) {
        this.apto = apto;
    }

    public String getLognumber() {
        return lognumber;
    }

    public void setLognumber(String lognumber) {
        this.lognumber = lognumber;
    }

    public Timestamp getDatahora() {
        return datahora;
    }

    public void setDatahora(Timestamp datahora) {
        this.datahora = datahora;
    }

    public Timestamp getDatahoraz() {
        return datahoraz;
    }

    public void setDatahoraz(Timestamp datahoraz) {
        this.datahoraz = datahoraz;
    }

    public int getNropulsos() {
        return nropulsos;
    }

    public void setNropulsos(int nropulsos) {
        this.nropulsos = nropulsos;
    }

    public int getHidrometro() {
        return hidrometro;
    }

    public void setHidrometro(int hidrometro) {
        this.hidrometro = hidrometro;
    }

    public float getVolnoperiodo() {
        return volnoperiodo;
    }

    public void setVolnoperiodo(float volnoperiodo) {
        this.volnoperiodo = volnoperiodo;
    }

    public float getCustonoperiodo() {
        return custonoperiodo;
    }

    public void setCustonoperiodo(float custonoperiodo) {
        this.custonoperiodo = custonoperiodo;
    }

    public int getNropulsosacumulados() {
        return nropulsosacumulados;
    }

    public void setNropulsosacumulados(int nropulsosacumulados) {
        this.nropulsosacumulados = nropulsosacumulados;
    }

    public float getVolacumulado() {
        return volacumulado;
    }

    public void setVolacumulado(float volacumulado) {
        this.volacumulado = volacumulado;
    }

    public float getCustoacumulado() {
        return custoacumulado;
    }

    public void setCustoacumulado(float custoacumulado) {
        this.custoacumulado = custoacumulado;
    }
    
}
