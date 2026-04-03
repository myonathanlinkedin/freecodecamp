--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    galaxy_types text,
    distance_from_earth numeric,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_description; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_description (
    galaxy_description_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    notes character varying(100)
);


ALTER TABLE public.galaxy_description OWNER TO freecodecamp;

--
-- Name: galaxy_description_galaxy_description_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_description_galaxy_description_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_description_galaxy_description_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_description_galaxy_description_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_description_galaxy_description_id_seq OWNED BY public.galaxy_description.galaxy_description_id;


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
    planet_id integer NOT NULL,
    is_spherical boolean,
    radius_km integer NOT NULL,
    discovery_year integer
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
    star_id integer NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean,
    mass_index numeric
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
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    is_spherical boolean,
    brightness integer,
    spectral_type character varying(10)
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
-- Name: galaxy_description galaxy_description_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_description ALTER COLUMN galaxy_description_id SET DEFAULT nextval('public.galaxy_description_galaxy_description_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', NULL, 0, true, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', NULL, 2.5, true, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', NULL, 3.0, false, NULL);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', NULL, 28, true, NULL);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', NULL, 23, false, NULL);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', NULL, 17, true, NULL);


--
-- Data for Name: galaxy_description; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_description VALUES (1, 'Type A', 'Spiral galaxy', NULL);
INSERT INTO public.galaxy_description VALUES (2, 'Type B', 'Elliptical galaxy', NULL);
INSERT INTO public.galaxy_description VALUES (3, 'Type C', 'Irregular galaxy', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, NULL, 1737, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, NULL, 11, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, NULL, 6, NULL);
INSERT INTO public.moon VALUES (4, 'Io', 3, NULL, 1821, NULL);
INSERT INTO public.moon VALUES (5, 'Europa', 3, NULL, 1560, NULL);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, NULL, 2634, NULL);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, NULL, 2410, NULL);
INSERT INTO public.moon VALUES (8, 'Titan', 6, NULL, 2574, NULL);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, NULL, 252, NULL);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, NULL, 198, NULL);
INSERT INTO public.moon VALUES (11, 'Tethys', 6, NULL, 531, NULL);
INSERT INTO public.moon VALUES (12, 'Dione', 6, NULL, 561, NULL);
INSERT INTO public.moon VALUES (13, 'Rhea', 6, NULL, 763, NULL);
INSERT INTO public.moon VALUES (14, 'Iapetus', 6, NULL, 734, NULL);
INSERT INTO public.moon VALUES (15, 'Miranda', 7, NULL, 235, NULL);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, NULL, 578, NULL);
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, NULL, 584, NULL);
INSERT INTO public.moon VALUES (18, 'Titania', 7, NULL, 788, NULL);
INSERT INTO public.moon VALUES (19, 'Oberon', 7, NULL, 761, NULL);
INSERT INTO public.moon VALUES (20, 'Triton', 8, NULL, 1353, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'Mars', 1, false, NULL, NULL);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, false, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'Venus', 1, false, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'Mercury', 1, false, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, false, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, false, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, false, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'Proxima b', 2, false, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 3, false, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Osiris', 4, false, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Methuselah', 5, false, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, true, NULL, NULL);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 1, true, NULL, NULL);
INSERT INTO public.star VALUES (3, 'Sirius', 1, true, NULL, NULL);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, true, NULL, NULL);
INSERT INTO public.star VALUES (5, 'Rigel', 1, true, NULL, NULL);
INSERT INTO public.star VALUES (6, 'Vega', 1, true, NULL, NULL);


--
-- Name: galaxy_description_galaxy_description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_description_galaxy_description_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy_description galaxy_description_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_description
    ADD CONSTRAINT galaxy_description_name_key UNIQUE (name);


--
-- Name: galaxy_description galaxy_description_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_description
    ADD CONSTRAINT galaxy_description_pkey PRIMARY KEY (galaxy_description_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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

