--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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

SET default_table_access_method = heap;

--
-- Name: user_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_info (
    user_name character varying(22) NOT NULL,
    num_games integer DEFAULT 0 NOT NULL,
    min_guess integer
);


ALTER TABLE public.user_info OWNER TO freecodecamp;

--
-- Data for Name: user_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_info VALUES ('user_1746728203631', 1, 659);
INSERT INTO public.user_info VALUES ('dokimi2', 1, 3);
INSERT INTO public.user_info VALUES ('dokimi', 1, 3);
INSERT INTO public.user_info VALUES ('DOKIMI2', 2, 4);
INSERT INTO public.user_info VALUES ('dokimi3', 2, 1);
INSERT INTO public.user_info VALUES ('user_1746729614218', 2, 123);
INSERT INTO public.user_info VALUES ('user_1746729614219', 5, 71);
INSERT INTO public.user_info VALUES ('user_1746728203632', 2, 1);
INSERT INTO public.user_info VALUES ('user_1746729774010', 2, 55);
INSERT INTO public.user_info VALUES ('user_1746729774011', 5, 8);


--
-- Name: user_info user_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_pkey PRIMARY KEY (user_name);


--
-- PostgreSQL database dump complete
--

