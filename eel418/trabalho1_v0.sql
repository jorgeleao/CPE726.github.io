--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
-- Dumped by pg_dump version 11.5

-- Started on 2019-10-22 00:23:41

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

DROP DATABASE IF EXISTS trabalho1_v0;
--
-- TOC entry 2816 (class 1262 OID 74038)
-- Name: trabalho1_v0; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE trabalho1_v0 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';


ALTER DATABASE trabalho1_v0 OWNER TO postgres;

\connect trabalho1_v0

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

--
-- TOC entry 197 (class 1259 OID 74041)
-- Name: imagens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.imagens (
    serial_imagens integer NOT NULL,
    x integer NOT NULL,
    y integer NOT NULL,
    imagem bytea
);


ALTER TABLE public.imagens OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 74039)
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
-- TOC entry 2817 (class 0 OID 0)
-- Dependencies: 196
-- Name: imagens_serial_imagens_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.imagens_serial_imagens_seq OWNED BY public.imagens.serial_imagens;


--
-- TOC entry 2686 (class 2604 OID 74044)
-- Name: imagens serial_imagens; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagens ALTER COLUMN serial_imagens SET DEFAULT nextval('public.imagens_serial_imagens_seq'::regclass);


--
-- TOC entry 2688 (class 2606 OID 74049)
-- Name: imagens imagens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagens
    ADD CONSTRAINT imagens_pkey PRIMARY KEY (serial_imagens);


--
-- TOC entry 2689 (class 1259 OID 74050)
-- Name: xy_ndx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX xy_ndx ON public.imagens USING btree (x, y);


-- Completed on 2019-10-22 00:23:43

--
-- PostgreSQL database dump complete
--

