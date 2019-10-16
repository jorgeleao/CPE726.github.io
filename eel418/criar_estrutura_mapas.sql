--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
-- Dumped by pg_dump version 11.5

-- Started on 2019-10-16 09:31:14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;


\c mapas

--
-- TOC entry 197 (class 1259 OID 65849)
-- Name: imagens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.imagens (
    serial_imagens integer NOT NULL,
    arquivo_imagem bytea,
    nome text
);


ALTER TABLE public.imagens OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 65847)
-- Name: imagens_serial_imagens_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.imagens_serial_imagens_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.imagens_serial_imagens_seq OWNER TO postgres;

--
-- TOC entry 2815 (class 0 OID 0)
-- Dependencies: 196
-- Name: imagens_serial_imagens_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.imagens_serial_imagens_seq OWNED BY public.imagens.serial_imagens;


--
-- TOC entry 2686 (class 2604 OID 65852)
-- Name: imagens serial_imagens; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagens ALTER COLUMN serial_imagens SET DEFAULT nextval('public.imagens_serial_imagens_seq'::regclass);


--
-- TOC entry 2688 (class 2606 OID 65857)
-- Name: imagens serial_imagens_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagens
    ADD CONSTRAINT serial_imagens_pk PRIMARY KEY (serial_imagens);


-- Completed on 2019-10-16 09:31:18

--
-- PostgreSQL database dump complete
--

