--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.5
-- Dumped by pg_dump version 9.5.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.expenses DROP CONSTRAINT expenses_pkey;
ALTER TABLE public.expenses ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.expenses_id_seq;
DROP TABLE public.expenses;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: expenses; Type: TABLE; Schema: public; Owner: jko
--

CREATE TABLE expenses (
    id integer NOT NULL,
    amount numeric(13,2) NOT NULL,
    memo character varying(255) NOT NULL,
    created_on date DEFAULT now() NOT NULL,
    CONSTRAINT expenses_amount_check CHECK ((amount >= 0.01))
);


ALTER TABLE expenses OWNER TO jko;

--
-- Name: expenses_id_seq; Type: SEQUENCE; Schema: public; Owner: jko
--

CREATE SEQUENCE expenses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE expenses_id_seq OWNER TO jko;

--
-- Name: expenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jko
--

ALTER SEQUENCE expenses_id_seq OWNED BY expenses.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jko
--

ALTER TABLE ONLY expenses ALTER COLUMN id SET DEFAULT nextval('expenses_id_seq'::regclass);


--
-- Data for Name: expenses; Type: TABLE DATA; Schema: public; Owner: jko
--

INSERT INTO expenses VALUES (1, 99999999999.99, 'lots o coffee', '2017-03-08');
INSERT INTO expenses VALUES (2, 0.01, 'not much at all', '2017-03-08');
INSERT INTO expenses VALUES (6, 19.04, 'coffee filters', '2017-03-08');
INSERT INTO expenses VALUES (7, 100000000.98, 'coffee plantation', '2017-03-08');
INSERT INTO expenses VALUES (8, 0.34, 'sugar packette', '2017-03-08');
INSERT INTO expenses VALUES (9, 2.00, 'coffee', '2017-03-10');
INSERT INTO expenses VALUES (10, 4.32, 'tea', '2017-03-10');
INSERT INTO expenses VALUES (11, 23.80, 'dog food', '2017-03-10');


--
-- Name: expenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jko
--

SELECT pg_catalog.setval('expenses_id_seq', 11, true);


--
-- Name: expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: jko
--

ALTER TABLE ONLY expenses
    ADD CONSTRAINT expenses_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

