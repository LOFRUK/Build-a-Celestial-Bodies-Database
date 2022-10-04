--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: continent; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.continent (
    continent_id integer NOT NULL,
    name character varying(15) NOT NULL,
    planet_id integer,
    description text,
    country character varying(30)
);


ALTER TABLE public.continent OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    fictional boolean,
    size_in_lightyear numeric(6,3),
    description text
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
    name character varying(30) NOT NULL,
    description text,
    planet_id integer,
    fictional boolean,
    planet_orbiting character varying(15)
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
    name character varying(30) NOT NULL,
    population_by_billion integer,
    continents integer,
    description text,
    planet_have_water boolean,
    planet_have_surface boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

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
    name character varying(30) NOT NULL,
    fictional boolean,
    galaxy_id integer,
    alive boolean,
    description text
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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: continent; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.continent VALUES (1, 'Antartica', 1, NULL, NULL);
INSERT INTO public.continent VALUES (2, 'Europe', 1, NULL, 'United Kingdom');
INSERT INTO public.continent VALUES (3, 'Asia', 1, NULL, 'China');
INSERT INTO public.continent VALUES (4, 'N.America', 1, NULL, 'USA');
INSERT INTO public.continent VALUES (5, 'S.America', 1, NULL, 'Mexico');
INSERT INTO public.continent VALUES (6, 'Africa', 1, NULL, 'Eygpt');
INSERT INTO public.continent VALUES (7, 'Oceania', 1, NULL, 'Australia');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', false, 52.850, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', false, 110.000, NULL);
INSERT INTO public.galaxy VALUES (3, 'Black Eye', false, 26.481, NULL);
INSERT INTO public.galaxy VALUES (4, 'Bode', false, 45.000, NULL);
INSERT INTO public.galaxy VALUES (5, 'Cigar', false, 18.500, NULL);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', false, 65.000, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (19, 'Umbriel', NULL, 7, false, 'Uranus');
INSERT INTO public.moon VALUES (20, 'Ariel', NULL, 7, false, 'Uranus');
INSERT INTO public.moon VALUES (1, 'Luna', NULL, 1, false, 'Earth');
INSERT INTO public.moon VALUES (2, 'Moon', NULL, 1, false, 'Earth');
INSERT INTO public.moon VALUES (3, 'Phobos', NULL, 4, false, 'Mars');
INSERT INTO public.moon VALUES (4, 'Deimos', NULL, 4, false, 'Mars');
INSERT INTO public.moon VALUES (5, 'Europa', NULL, 5, false, 'Jupiter');
INSERT INTO public.moon VALUES (6, 'Io', NULL, 5, false, 'Jupiter');
INSERT INTO public.moon VALUES (7, 'Ganymede', NULL, 5, false, 'Jupiter');
INSERT INTO public.moon VALUES (8, 'Callisto', NULL, 5, false, 'Jupiter');
INSERT INTO public.moon VALUES (9, 'Amalthea', NULL, 5, false, 'Jupiter');
INSERT INTO public.moon VALUES (10, 'Adreastea', NULL, 5, false, 'Jupiter');
INSERT INTO public.moon VALUES (11, 'Titan', NULL, 6, false, 'Saturn');
INSERT INTO public.moon VALUES (12, 'Enceladus', NULL, 6, false, 'Saturn');
INSERT INTO public.moon VALUES (13, 'Mimas', NULL, 6, false, 'Saturn');
INSERT INTO public.moon VALUES (14, 'Dione', NULL, 6, false, 'Saturn');
INSERT INTO public.moon VALUES (15, 'Lapetus', NULL, 6, false, 'Saturn');
INSERT INTO public.moon VALUES (16, 'Miranda', NULL, 7, false, 'Uranus');
INSERT INTO public.moon VALUES (17, 'Titania', NULL, 7, false, 'Uranus');
INSERT INTO public.moon VALUES (18, 'Oberon', NULL, 7, false, 'Uranus');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 7, 7, NULL, true, true, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', NULL, NULL, NULL, true, true, 1);
INSERT INTO public.planet VALUES (3, 'Venus', NULL, NULL, NULL, false, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', NULL, NULL, NULL, true, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', NULL, NULL, NULL, false, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, NULL, NULL, false, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, NULL, NULL, false, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', NULL, NULL, NULL, false, false, 1);
INSERT INTO public.planet VALUES (10, 'Aldeeran', NULL, NULL, NULL, true, true, 3);
INSERT INTO public.planet VALUES (9, 'Tatooine', NULL, NULL, NULL, false, true, 2);
INSERT INTO public.planet VALUES (11, 'Mustafar', NULL, NULL, NULL, false, true, 4);
INSERT INTO public.planet VALUES (12, 'Mongo', NULL, NULL, NULL, true, true, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', false, 1, true, NULL);
INSERT INTO public.star VALUES (2, 'Sun', false, 1, true, NULL);
INSERT INTO public.star VALUES (3, 'Sirius A', false, 1, true, NULL);
INSERT INTO public.star VALUES (4, 'Sirius B', false, 1, true, NULL);
INSERT INTO public.star VALUES (5, 'Lynx', false, 1, true, NULL);
INSERT INTO public.star VALUES (6, 'Eridanus', false, 1, true, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: continent continents_continent_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.continent
    ADD CONSTRAINT continents_continent_id_key UNIQUE (continent_id);


--
-- Name: continent continents_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.continent
    ADD CONSTRAINT continents_pkey PRIMARY KEY (continent_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

