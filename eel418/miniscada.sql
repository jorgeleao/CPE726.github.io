--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.10
-- Dumped by pg_dump version 9.4.10
-- Started on 2018-09-30 02:55:49

--DROP DATABASE miniscada;
--
-- TOC entry 1998 (class 1262 OID 55944)
-- Name: miniscada; Type: DATABASE; Schema: -; Owner: miniscada
--

--CREATE DATABASE miniscada WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';


--ALTER DATABASE miniscada OWNER TO miniscada;

--\connect miniscada

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
-- TOC entry 2001 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 174 (class 1259 OID 55947)
-- Name: leituras01; Type: TABLE; Schema: public; Owner: miniscada; Tablespace: 
--

CREATE TABLE leituras01 (
    leiturasid integer NOT NULL,
    leitor text,
    serialleitor integer,
    tag01 real,
    tag02 real,
    tag03 real,
    tag04 real,
    datahora timestamp with time zone,
    periodo text,
    datahorarecebido timestamp with time zone
);


ALTER TABLE leituras01 OWNER TO miniscada;

--
-- TOC entry 173 (class 1259 OID 55945)
-- Name: leituras01_leiturasid_seq; Type: SEQUENCE; Schema: public; Owner: miniscada
--

CREATE SEQUENCE leituras01_leiturasid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE leituras01_leiturasid_seq OWNER TO miniscada;

--
-- TOC entry 2002 (class 0 OID 0)
-- Dependencies: 173
-- Name: leituras01_leiturasid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: miniscada
--

ALTER SEQUENCE leituras01_leiturasid_seq OWNED BY leituras01.leiturasid;


--
-- TOC entry 1882 (class 2604 OID 55950)
-- Name: leiturasid; Type: DEFAULT; Schema: public; Owner: miniscada
--

ALTER TABLE ONLY leituras01 ALTER COLUMN leiturasid SET DEFAULT nextval('leituras01_leiturasid_seq'::regclass);


--
-- TOC entry 1884 (class 2606 OID 55955)
-- Name: leiturasid_pk; Type: CONSTRAINT; Schema: public; Owner: miniscada; Tablespace: 
--

ALTER TABLE ONLY leituras01
    ADD CONSTRAINT leiturasid_pk PRIMARY KEY (leiturasid);


--
-- TOC entry 2000 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: miniscada
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM miniscada;
GRANT ALL ON SCHEMA public TO miniscada;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-09-30 02:55:51

--
-- miniscadaQL database dump complete
--

