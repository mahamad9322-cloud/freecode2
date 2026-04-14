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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    schwarzschild_radius_km numeric(20,0) NOT NULL,
    is_rotating boolean NOT NULL,
    mass_solar_masses integer,
    spin_parameter numeric(4,3),
    description text
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galactic_core_radius numeric(12,2) NOT NULL,
    has_supermassive_black_hole boolean NOT NULL,
    has_life boolean DEFAULT false,
    age_in_billions_of_years integer,
    num_stars_estimated bigint DEFAULT 0,
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
    name character varying(100) NOT NULL,
    planet_id integer,
    diameter_km numeric(9,0) NOT NULL,
    has_atmosphere boolean NOT NULL,
    is_tidally_locked boolean DEFAULT true,
    orbital_period_days numeric(6,2),
    surface_gravity_m_s2 numeric(5,3),
    description text
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
    name character varying(100) NOT NULL,
    star_id integer,
    diameter_km numeric(10,0) NOT NULL,
    has_rings boolean NOT NULL,
    has_life boolean DEFAULT false,
    age_in_millions_of_years integer,
    avg_temp_celsius integer,
    rotation_period_days numeric(5,2),
    planet_type text,
    description text
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
    name character varying(100) NOT NULL,
    galaxy_id integer,
    spectral_type character varying(20) NOT NULL,
    has_planetary_system boolean NOT NULL,
    is_neutron_star boolean DEFAULT false,
    mass_solar_masses numeric(6,3) NOT NULL,
    luminosity_index integer,
    surface_temp_kelvin integer,
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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


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
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.black_hole (black_hole_id, name, galaxy_id, schwarzschild_radius_km, is_rotating, mass_solar_masses, spin_parameter, description) FROM stdin;
1	Sagittarius A*	1	12000000	t	4000000	0.990	Supermassive black hole at galaxy center
2	M31 Black Hole	2	150000000	f	140000000	0.000	Black hole in Andromeda
3	Triangulum Central	3	130000	f	30000	0.000	Central black hole
\.


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.galaxy (galaxy_id, name, galactic_core_radius, has_supermassive_black_hole, has_life, age_in_billions_of_years, num_stars_estimated, description) FROM stdin;
1	Milky Way	26000.00	t	t	14	100000000000	Our home galaxy
2	Andromeda	55000.00	t	f	10	1000000000000	Nearest major galaxy
3	Triangulum	15000.00	f	f	10	40000000000	Third largest galaxy in local group
4	Whirlpool	38000.00	t	f	13	100000000000	Famous spiral galaxy
5	Black Eye	22000.00	t	f	13	100000000000	Galaxy with dark dust lane
6	Sombrero	50000.00	t	f	13	800000000000	Edge-on spiral galaxy
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.moon (moon_id, name, planet_id, diameter_km, has_atmosphere, is_tidally_locked, orbital_period_days, surface_gravity_m_s2, description) FROM stdin;
1	Moon	1	3474	f	t	27.32	1.620	Earths natural satellite
2	Phobos	2	23	f	t	0.32	0.006	Inner moon of Mars
3	Deimos	2	13	f	t	1.26	0.003	Outer moon of Mars
4	Io	5	3643	f	t	1.77	1.800	Volcanically active
5	Europa	5	3121	f	t	3.55	1.310	Icy moon with ocean
6	Ganymede	5	5268	f	t	7.16	1.420	Largest moon
7	Callisto	5	4820	f	t	16.69	1.230	Ancient surface
8	Titan	6	5150	t	t	15.95	1.350	Orange moon with atmosphere
9	Enceladus	6	504	f	t	1.37	0.113	Icy moon with geysers
10	Mimas	6	396	f	t	0.94	0.064	Crater-riddled moon
11	Tethys	6	1062	f	t	1.89	0.145	Icy surface
12	Alpha Moon A	7	8000	f	t	10.50	2.670	Large moon
13	Alpha Moon B	7	5000	f	t	25.34	1.680	Medium moon
14	Vega Moon I	8	2500	f	t	5.20	0.840	Small moon
15	Vega Moon II	8	3000	f	t	15.67	1.010	Medium moon
16	Rigel Moon	9	4500	f	f	8.90	1.510	Active moon
17	Proxima I Moon	10	1000	f	t	2.50	0.330	Small moon
18	Altair Moon A	11	3500	f	t	12.00	1.180	Icy moon
19	Altair Moon B	11	2800	f	t	35.50	0.940	Rocky moon
20	Mercury II Moon	12	500	f	t	0.75	0.170	Tiny moon
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.planet (planet_id, name, star_id, diameter_km, has_rings, has_life, age_in_millions_of_years, avg_temp_celsius, rotation_period_days, planet_type, description) FROM stdin;
1	Earth	1	12742	f	t	4540	15	1.00	Terrestrial	Our planet
2	Mars	1	6779	f	f	4540	-65	1.03	Terrestrial	Red planet
3	Venus	1	12104	f	f	4540	464	243.00	Terrestrial	Hot planet
4	Mercury	1	4879	f	f	4540	167	58.65	Terrestrial	Closest to sun
5	Jupiter	1	139820	t	f	4540	-110	0.41	Gas Giant	Gas giant
6	Saturn	1	116460	t	f	4540	-140	0.43	Gas Giant	Ringed planet
7	Alpha Centauri A b	4	129000	f	f	4600	1200	0.05	Super-Earth	Exoplanet
8	Vega Z	5	80000	f	f	4500	600	0.50	Super-Earth	Hot planet
9	Rigel III	6	95000	f	f	4400	800	0.70	Super-Earth	Desert planet
10	Proxima I	7	11000	f	f	4200	340	0.87	Terrestrial	Potentially habitable
11	Altair Prime	8	50000	t	f	4300	500	0.55	Super-Earth	Large planet
12	Mercury II	2	3000	f	f	4500	1500	2.50	Terrestrial	Hot rocky planet
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.star (star_id, name, galaxy_id, spectral_type, has_planetary_system, is_neutron_star, mass_solar_masses, luminosity_index, surface_temp_kelvin, description) FROM stdin;
1	Sun	1	G2V	t	f	1.000	100	5778	Our star
2	Sirius	1	A1V	f	f	2.063	2600	10000	Brightest star
3	Betelgeuse	1	M2Ib	f	f	16.500	140000	3500	Red supergiant
4	Alpha Centauri A	1	G2V	t	f	1.100	155	5790	Nearby star
5	Vega	2	A0V	f	f	2.135	4000	9602	Bright blue star
6	Rigel	2	B8I	f	f	17.000	120000	12100	Blue supergiant
7	Proxima Centauri	3	M6V	t	f	0.120	0	3042	Nearest star
8	Altair	3	A7V	t	f	1.860	11	7550	Subgiant star
\.


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 4, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


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
-- Name: black_hole black_hole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

