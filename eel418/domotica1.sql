--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.10
-- Dumped by pg_dump version 9.4.10
-- Started on 2017-05-08 12:58:20

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

DROP DATABASE IF EXISTS domotica1;
--
-- TOC entry 2021 (class 1262 OID 27606)
-- Name: domotica1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE domotica1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';


ALTER DATABASE domotica1 OWNER TO postgres;

\connect domotica1

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
-- TOC entry 2024 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 174 (class 1259 OID 27609)
-- Name: ambientes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ambientes (
    serialambientes integer NOT NULL,
    nome text
);


ALTER TABLE ambientes OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 27607)
-- Name: ambientes_serialambientes_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ambientes_serialambientes_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ambientes_serialambientes_seq OWNER TO postgres;

--
-- TOC entry 2025 (class 0 OID 0)
-- Dependencies: 173
-- Name: ambientes_serialambientes_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ambientes_serialambientes_seq OWNED BY ambientes.serialambientes;


--
-- TOC entry 177 (class 1259 OID 28023)
-- Name: dispositivos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE dispositivos (
    serialdispositivo integer NOT NULL,
    nome text,
    serialambientes integer
);


ALTER TABLE dispositivos OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 28021)
-- Name: dispositivos_serialdispositivo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE dispositivos_serialdispositivo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dispositivos_serialdispositivo_seq OWNER TO postgres;

--
-- TOC entry 2026 (class 0 OID 0)
-- Dependencies: 176
-- Name: dispositivos_serialdispositivo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE dispositivos_serialdispositivo_seq OWNED BY dispositivos.serialdispositivo;


--
-- TOC entry 175 (class 1259 OID 27618)
-- Name: nomedacasa; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE nomedacasa (
    nome text NOT NULL
);


ALTER TABLE nomedacasa OWNER TO postgres;

--
-- TOC entry 1894 (class 2604 OID 27612)
-- Name: serialambientes; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ambientes ALTER COLUMN serialambientes SET DEFAULT nextval('ambientes_serialambientes_seq'::regclass);


--
-- TOC entry 1895 (class 2604 OID 28026)
-- Name: serialdispositivo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dispositivos ALTER COLUMN serialdispositivo SET DEFAULT nextval('dispositivos_serialdispositivo_seq'::regclass);


--
-- TOC entry 2013 (class 0 OID 27609)
-- Dependencies: 174
-- Data for Name: ambientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO ambientes VALUES (1, 'Quarto 1');
INSERT INTO ambientes VALUES (2, 'Quarto 2');
INSERT INTO ambientes VALUES (3, 'Sala');
INSERT INTO ambientes VALUES (4, 'Cozinha');
INSERT INTO ambientes VALUES (5, 'Banheiro');


--
-- TOC entry 2027 (class 0 OID 0)
-- Dependencies: 173
-- Name: ambientes_serialambientes_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ambientes_serialambientes_seq', 5, true);


--
-- TOC entry 2016 (class 0 OID 28023)
-- Dependencies: 177
-- Data for Name: dispositivos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO dispositivos VALUES (1, 'Luz teto', 3);
INSERT INTO dispositivos VALUES (2, 'Luz mesa do canto', 3);
INSERT INTO dispositivos VALUES (3, 'Ar condicionado', 3);
INSERT INTO dispositivos VALUES (4, 'TV', 3);
INSERT INTO dispositivos VALUES (5, 'Ventilador', 3);
INSERT INTO dispositivos VALUES (6, 'Ar condicionado', 1);
INSERT INTO dispositivos VALUES (7, 'Luz teto', 1);
INSERT INTO dispositivos VALUES (8, 'Luz cabeceira', 1);
INSERT INTO dispositivos VALUES (9, 'Despertador', 1);
INSERT INTO dispositivos VALUES (10, 'Luz teto', 2);
INSERT INTO dispositivos VALUES (11, 'Alarme gás', 4);
INSERT INTO dispositivos VALUES (12, 'Alarme gás', 5);


--
-- TOC entry 2028 (class 0 OID 0)
-- Dependencies: 176
-- Name: dispositivos_serialdispositivo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('dispositivos_serialdispositivo_seq', 12, true);


--
-- TOC entry 2014 (class 0 OID 27618)
-- Dependencies: 175
-- Data for Name: nomedacasa; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO nomedacasa VALUES ('Copacabana');


--
-- TOC entry 1899 (class 2606 OID 28038)
-- Name: name_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY nomedacasa
    ADD CONSTRAINT name_pk PRIMARY KEY (nome);


--
-- TOC entry 1897 (class 2606 OID 27617)
-- Name: serialambientes_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ambientes
    ADD CONSTRAINT serialambientes_pk PRIMARY KEY (serialambientes);


--
-- TOC entry 1901 (class 2606 OID 28031)
-- Name: serialdispositivo_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY dispositivos
    ADD CONSTRAINT serialdispositivo_pk PRIMARY KEY (serialdispositivo);


--
-- TOC entry 1902 (class 2606 OID 28032)
-- Name: serialambientes_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dispositivos
    ADD CONSTRAINT serialambientes_fk FOREIGN KEY (serialambientes) REFERENCES ambientes(serialambientes);


--
-- TOC entry 2023 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-05-08 12:58:20

--
-- PostgreSQL database dump complete
--

