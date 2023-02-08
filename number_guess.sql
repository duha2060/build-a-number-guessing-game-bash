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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    number_guesses integer NOT NULL,
    user_id integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (20, 513, 33);
INSERT INTO public.games VALUES (21, 998, 34);
INSERT INTO public.games VALUES (22, 534, 33);
INSERT INTO public.games VALUES (23, 772, 33);
INSERT INTO public.games VALUES (24, 745, 33);
INSERT INTO public.games VALUES (25, 9, 36);
INSERT INTO public.games VALUES (26, 182, 37);
INSERT INTO public.games VALUES (27, 607, 37);
INSERT INTO public.games VALUES (28, 857, 38);
INSERT INTO public.games VALUES (29, 994, 38);
INSERT INTO public.games VALUES (30, 373, 37);
INSERT INTO public.games VALUES (31, 869, 37);
INSERT INTO public.games VALUES (32, 280, 37);
INSERT INTO public.games VALUES (33, 1, 36);
INSERT INTO public.games VALUES (34, 1, 36);
INSERT INTO public.games VALUES (35, 1, 36);
INSERT INTO public.games VALUES (36, 500, 39);
INSERT INTO public.games VALUES (37, 186, 39);
INSERT INTO public.games VALUES (38, 120, 40);
INSERT INTO public.games VALUES (39, 840, 40);
INSERT INTO public.games VALUES (40, 308, 39);
INSERT INTO public.games VALUES (41, 906, 39);
INSERT INTO public.games VALUES (42, 63, 39);
INSERT INTO public.games VALUES (43, 232, 41);
INSERT INTO public.games VALUES (44, 280, 41);
INSERT INTO public.games VALUES (45, 281, 42);
INSERT INTO public.games VALUES (46, 178, 42);
INSERT INTO public.games VALUES (47, 986, 41);
INSERT INTO public.games VALUES (48, 234, 41);
INSERT INTO public.games VALUES (49, 733, 41);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (33, 'user_1675856757854');
INSERT INTO public.users VALUES (34, 'user_1675856757853');
INSERT INTO public.users VALUES (35, 'asdfghjklpoiuytrewqzxc');
INSERT INTO public.users VALUES (36, 'alo');
INSERT INTO public.users VALUES (37, 'user_1675856950915');
INSERT INTO public.users VALUES (38, 'user_1675856950914');
INSERT INTO public.users VALUES (39, 'user_1675857136462');
INSERT INTO public.users VALUES (40, 'user_1675857136461');
INSERT INTO public.users VALUES (41, 'user_1675857177260');
INSERT INTO public.users VALUES (42, 'user_1675857177259');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 49, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 42, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

