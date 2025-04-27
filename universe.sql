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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    diameter integer NOT NULL,
    radius integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    diameter integer NOT NULL,
    radius integer,
    has_residents boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    diameter integer NOT NULL,
    radius integer,
    has_residents boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_colors; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_colors (
    planet_id integer NOT NULL,
    color character varying(10) NOT NULL,
    planet_colors_id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.planet_colors OWNER TO freecodecamp;

--
-- Name: planet_colors_record_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_colors_record_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_colors_record_seq OWNER TO freecodecamp;

--
-- Name: planet_colors_record_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_colors_record_seq OWNED BY public.planet_colors.planet_colors_id;


--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    diameter integer NOT NULL,
    radius integer,
    energy numeric(10,2),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_colors planet_colors_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_colors ALTER COLUMN planet_colors_id SET DEFAULT nextval('public.planet_colors_record_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Galaxy1', NULL, 26000000, 13000000);
INSERT INTO public.galaxy VALUES (3, 'Galaxy2', NULL, 26000000, 13000000);
INSERT INTO public.galaxy VALUES (4, 'Galaxy3', NULL, 26000000, 13000000);
INSERT INTO public.galaxy VALUES (5, 'Galaxy4', NULL, 26000000, 13000000);
INSERT INTO public.galaxy VALUES (6, 'Galaxy5', NULL, 26000000, 13000000);
INSERT INTO public.galaxy VALUES (7, 'Galaxy6', NULL, 26000000, 13000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Moon1', NULL, 34000, 17000, true, 2);
INSERT INTO public.moon VALUES (3, 'Moon2', NULL, 34000, 17000, true, 3);
INSERT INTO public.moon VALUES (5, 'Moon3', NULL, 34000, 17000, true, 3);
INSERT INTO public.moon VALUES (6, 'Moon4', NULL, 34000, 17000, true, 3);
INSERT INTO public.moon VALUES (7, 'Moon5', NULL, 34000, 17000, true, 3);
INSERT INTO public.moon VALUES (8, 'Moon6', NULL, 34000, 17000, true, 3);
INSERT INTO public.moon VALUES (9, 'Moon7', NULL, 34000, 17000, true, 3);
INSERT INTO public.moon VALUES (10, 'Moon8', NULL, 34000, 17000, true, 3);
INSERT INTO public.moon VALUES (11, 'Moon9', NULL, 34000, 17000, true, 3);
INSERT INTO public.moon VALUES (12, 'Moon10', NULL, 34000, 17000, true, 3);
INSERT INTO public.moon VALUES (13, 'Moon11', NULL, 34000, 17000, true, 3);
INSERT INTO public.moon VALUES (14, 'Moon12', NULL, 34000, 17000, true, 3);
INSERT INTO public.moon VALUES (15, 'Moon13', NULL, 34000, 17000, true, 3);
INSERT INTO public.moon VALUES (16, 'Moon14', NULL, 34000, 17000, true, 3);
INSERT INTO public.moon VALUES (17, 'Moon15', NULL, 34000, 17000, true, 3);
INSERT INTO public.moon VALUES (18, 'Moon16', NULL, 34000, 17000, true, 3);
INSERT INTO public.moon VALUES (19, 'Moon17', NULL, 34000, 17000, true, 3);
INSERT INTO public.moon VALUES (20, 'Moon18', NULL, 34000, 17000, true, 3);
INSERT INTO public.moon VALUES (21, 'Moon19', NULL, 34000, 17000, true, 3);
INSERT INTO public.moon VALUES (22, 'Moon20', NULL, 34000, 17000, true, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Planet1', NULL, 3223232, 1611500, true, 2);
INSERT INTO public.planet VALUES (3, 'Planet2', NULL, 3223232, 1611500, true, 2);
INSERT INTO public.planet VALUES (4, 'Planet3', NULL, 3223232, 1611500, true, 3);
INSERT INTO public.planet VALUES (5, 'Planet4', NULL, 3223232, 1611500, true, 4);
INSERT INTO public.planet VALUES (6, 'Planet5', NULL, 3223232, 1611500, true, 4);
INSERT INTO public.planet VALUES (7, 'Planet6', NULL, 3223232, 1611500, true, 4);
INSERT INTO public.planet VALUES (8, 'Planet7', NULL, 3223232, 1611500, true, 4);
INSERT INTO public.planet VALUES (9, 'Planet8', NULL, 3223232, 1611500, true, 4);
INSERT INTO public.planet VALUES (10, 'Planet9', NULL, 3223232, 1611500, true, 4);
INSERT INTO public.planet VALUES (11, 'Planet10', NULL, 3223232, 1611500, true, 4);
INSERT INTO public.planet VALUES (12, 'Planet11', NULL, 3223232, 1611500, true, 4);
INSERT INTO public.planet VALUES (13, 'Planet12', NULL, 3223232, 1611500, true, 4);


--
-- Data for Name: planet_colors; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_colors VALUES (2, 'blue', 1, NULL);
INSERT INTO public.planet_colors VALUES (3, 'green', 2, NULL);
INSERT INTO public.planet_colors VALUES (3, 'red', 3, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Star1', NULL, 100000, 50000, 129838.00, 2);
INSERT INTO public.star VALUES (3, 'Star2', NULL, 100000, 50000, 129838.00, 3);
INSERT INTO public.star VALUES (4, 'Star3', NULL, 100000, 50000, 129838.00, 3);
INSERT INTO public.star VALUES (5, 'Star4', NULL, 100000, 50000, 129838.00, 3);
INSERT INTO public.star VALUES (6, 'Star5', NULL, 100000, 50000, 129838.00, 3);
INSERT INTO public.star VALUES (7, 'Star6', NULL, 100000, 50000, 129838.00, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_colors_record_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_colors_record_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique_name UNIQUE (name);


--
-- Name: planet_colors planet_colors_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_colors
    ADD CONSTRAINT planet_colors_pkey PRIMARY KEY (planet_colors_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique_name UNIQUE (name);


--
-- Name: planet_colors record_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_colors
    ADD CONSTRAINT record_unique UNIQUE (planet_colors_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique_name UNIQUE (name);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: moon moon_belongs_to_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_belongs_to_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_belongs_to_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_belongs_to_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet_colors planet_colors_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_colors
    ADD CONSTRAINT planet_colors_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_belongs_to_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_belongs_to_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

