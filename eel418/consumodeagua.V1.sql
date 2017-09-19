--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.10
-- Dumped by pg_dump version 9.4.10
-- Started on 2017-09-19 01:00:01

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

DROP DATABASE consumodeagua;
--
-- TOC entry 2005 (class 1262 OID 39196)
-- Name: consumodeagua; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE consumodeagua WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';


ALTER DATABASE consumodeagua OWNER TO postgres;

\connect consumodeagua

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2008 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 173 (class 1259 OID 39197)
-- Name: condominos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE condominos (
    apto character varying(4) NOT NULL,
    responsavel text,
    telefone character varying(25),
    email text
);


ALTER TABLE condominos OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 39207)
-- Name: medidas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE medidas (
    apto character varying(4),
    datahora timestamp without time zone,
    nropulsos integer,
    serialmedidas integer NOT NULL,
    hidrometro integer,
    m3noperiodo real,
    nropulsosacumulados integer,
    m3acumulados real,
    custoacumulado real
);


ALTER TABLE medidas OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 39205)
-- Name: medidas_serialmedidas_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE medidas_serialmedidas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE medidas_serialmedidas_seq OWNER TO postgres;

--
-- TOC entry 2009 (class 0 OID 0)
-- Dependencies: 174
-- Name: medidas_serialmedidas_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE medidas_serialmedidas_seq OWNED BY medidas.serialmedidas;


--
-- TOC entry 1886 (class 2604 OID 39210)
-- Name: serialmedidas; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medidas ALTER COLUMN serialmedidas SET DEFAULT nextval('medidas_serialmedidas_seq'::regclass);


--
-- TOC entry 1888 (class 2606 OID 39204)
-- Name: apto_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY condominos
    ADD CONSTRAINT apto_pk PRIMARY KEY (apto);


--
-- TOC entry 1890 (class 2606 OID 39212)
-- Name: serialmedidas_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY medidas
    ADD CONSTRAINT serialmedidas_pk PRIMARY KEY (serialmedidas);


--
-- TOC entry 1891 (class 2606 OID 39213)
-- Name: apto_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medidas
    ADD CONSTRAINT apto_fk FOREIGN KEY (apto) REFERENCES condominos(apto);


--
-- TOC entry 2007 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-09-19 01:00:01

--
-- PostgreSQL database dump complete
--

