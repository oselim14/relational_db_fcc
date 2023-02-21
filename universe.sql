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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    visibility_years integer
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comets_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comets_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comets_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comets_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comets_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    planets integer,
    num_stars integer,
    num_moons integer
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
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    distance_to_planet integer,
    galactic_latitude numeric,
    galactic_longitude numeric,
    description text,
    planet_id integer,
    common_name character varying(30)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    number_moons integer,
    moon character varying(30),
    galactic_latitude numeric,
    galactic_longitude numeric,
    description text,
    nasa_interact boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    galactic_longitude numeric,
    galactic_latitude numeric,
    description text,
    active boolean,
    galaxy character varying(30),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comets_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halleys Comet', 75);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 4000);
INSERT INTO public.comet VALUES (3, 'Hyakutake', 14000);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home', NULL, 1000, 224);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest galaxy to the milky way', NULL, 1000, 6);
INSERT INTO public.galaxy VALUES (3, 'Messier 81', 'Located in Ursa Major', NULL, 250, 4);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Lives on the edge of the Virgo supercluster', NULL, 250, 4);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'Lives on the edge of the triangulum constellation', NULL, 750, 5);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Lives on the edge of the Canes Venatici constellation', NULL, 951, 8);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Luna', 1, NULL, NULL, NULL, 'Earths only satellite', 3, 'moon');
INSERT INTO public.moon VALUES ('Jupiter II', 2, NULL, NULL, NULL, 'Jupiters smallest', 6, 'Europa');
INSERT INTO public.moon VALUES ('Ganymede', 3, NULL, NULL, NULL, 'Jupiters largest', 6, 'Ganymede');
INSERT INTO public.moon VALUES ('Callisto', 4, NULL, NULL, NULL, NULL, 6, NULL);
INSERT INTO public.moon VALUES ('Lo', 5, NULL, NULL, NULL, NULL, 6, NULL);
INSERT INTO public.moon VALUES ('Phobos', 6, NULL, NULL, NULL, NULL, 4, NULL);
INSERT INTO public.moon VALUES ('Deimos', 7, NULL, NULL, NULL, NULL, 4, NULL);
INSERT INTO public.moon VALUES ('Europa', 8, NULL, NULL, NULL, NULL, 4, NULL);
INSERT INTO public.moon VALUES ('Titan', 9, NULL, NULL, NULL, NULL, 7, NULL);
INSERT INTO public.moon VALUES ('Enceladus', 10, NULL, NULL, NULL, NULL, 7, NULL);
INSERT INTO public.moon VALUES ('Moon', 11, NULL, NULL, NULL, NULL, 7, NULL);
INSERT INTO public.moon VALUES ('Mimas', 12, NULL, NULL, NULL, NULL, 7, NULL);
INSERT INTO public.moon VALUES ('Tethys', 13, NULL, NULL, NULL, NULL, 7, NULL);
INSERT INTO public.moon VALUES ('Iapetus', 14, NULL, NULL, NULL, NULL, 7, NULL);
INSERT INTO public.moon VALUES ('Dione', 15, NULL, NULL, NULL, NULL, 7, NULL);
INSERT INTO public.moon VALUES ('Rhea', 16, NULL, NULL, NULL, NULL, 7, NULL);
INSERT INTO public.moon VALUES ('Hyperion', 17, NULL, NULL, NULL, NULL, 7, NULL);
INSERT INTO public.moon VALUES ('Phoebe', 18, NULL, NULL, NULL, NULL, 7, NULL);
INSERT INTO public.moon VALUES ('Telesto', 19, NULL, NULL, NULL, NULL, 7, NULL);
INSERT INTO public.moon VALUES ('Daphnis', 20, NULL, NULL, NULL, NULL, 7, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 1, 0, NULL, NULL, NULL, 'Closest to the sun', NULL, 1);
INSERT INTO public.planet VALUES ('Venus', 2, 0, NULL, NULL, NULL, 'One of only 2 planets that is too close to the sun for a moon.', NULL, 2);
INSERT INTO public.planet VALUES ('Earth', 3, 1, NULL, NULL, NULL, 'We live here.', NULL, 3);
INSERT INTO public.planet VALUES ('Mars', 4, 2, NULL, NULL, NULL, 'Second smallest planet in the solor system', NULL, 3);
INSERT INTO public.planet VALUES ('Ceres', 5, 0, NULL, NULL, NULL, 'This is a dwarf planet!', NULL, 4);
INSERT INTO public.planet VALUES ('Jupiter', 6, 92, NULL, NULL, NULL, 'The most moons in the solar system!', NULL, 1);
INSERT INTO public.planet VALUES ('Saturn', 7, 83, NULL, NULL, NULL, 'Its largest moon is bigger than Mercury and Pluto', NULL, 1);
INSERT INTO public.planet VALUES ('Uranus', 8, 27, NULL, NULL, NULL, '4th largest planet', NULL, 2);
INSERT INTO public.planet VALUES ('Neptune', 9, 14, NULL, NULL, NULL, '17 times the mass of earth', NULL, 3);
INSERT INTO public.planet VALUES ('Pluto', 10, 5, NULL, NULL, NULL, 'No longer a planet', NULL, 4);
INSERT INTO public.planet VALUES ('Haumea', 11, 2, NULL, NULL, NULL, 'Our local planetoid', NULL, 4);
INSERT INTO public.planet VALUES ('Makemake', 12, 1, NULL, NULL, NULL, '60% denser than pluto', NULL, 2);
INSERT INTO public.planet VALUES ('Eris', 13, 1, NULL, NULL, NULL, 'Discovered in 2005', NULL, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('sirius', 1, NULL, NULL, 'Brightest star in the sky', true, 'The Milky Way', NULL);
INSERT INTO public.star VALUES ('Vega', 2, NULL, NULL, 'Brightest star in the summer sky', true, 'The Milky Way', NULL);
INSERT INTO public.star VALUES ('Rigel', 3, NULL, NULL, '47,000 times as luminous as the sun', true, 'The Milky Way', NULL);
INSERT INTO public.star VALUES ('Capella A', 4, NULL, NULL, 'Sixth brightest star', true, 'The Milky Way', NULL);
INSERT INTO public.star VALUES ('Pollux', 5, NULL, NULL, '33.7 light years from earth', true, 'The Milky Way', NULL);
INSERT INTO public.star VALUES ('Mimosa', 6, NULL, NULL, 'About 49,000 degrees F', true, 'The Milky Way', NULL);


--
-- Name: comets_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comets_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 13, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: comet comet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name UNIQUE (name);


--
-- Name: comet comets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comets_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: planet planet_moon_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_moon_key UNIQUE (moon);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique UNIQUE (name);


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

