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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('anya', 2, 10);
INSERT INTO public.users VALUES ('user_1743653089730', 2, 218);
INSERT INTO public.users VALUES ('user_1743653089731', 5, 19);
INSERT INTO public.users VALUES ('user_1743653800503', 2, 129);
INSERT INTO public.users VALUES ('user_1743653178219', 2, 26);
INSERT INTO public.users VALUES ('user_1743653800504', 5, 225);
INSERT INTO public.users VALUES ('user_1743653178220', 5, 49);
INSERT INTO public.users VALUES ('user_1743653373781', 2, 520);
INSERT INTO public.users VALUES ('user_1743653912891', 2, 743);
INSERT INTO public.users VALUES ('user_1743653373782', 5, 302);
INSERT INTO public.users VALUES ('user_1743653912892', 5, 45);
INSERT INTO public.users VALUES ('user_1743653421770', 2, 219);
INSERT INTO public.users VALUES ('user_1743653421771', 5, 68);
INSERT INTO public.users VALUES ('gion', 3, 7);
INSERT INTO public.users VALUES ('user_1743653954295', 2, 625);
INSERT INTO public.users VALUES ('user_1743653480229', 2, 99);
INSERT INTO public.users VALUES ('user_1743653480230', 5, 38);
INSERT INTO public.users VALUES ('user_1743653954296', 5, 72);
INSERT INTO public.users VALUES ('user_1743653601830', 2, 163);
INSERT INTO public.users VALUES ('user_1743653601831', 5, 381);
INSERT INTO public.users VALUES ('user_1743654327419', 2, 576);
INSERT INTO public.users VALUES ('user_1743653739762', 2, 604);
INSERT INTO public.users VALUES ('user_1743654327420', 5, 118);
INSERT INTO public.users VALUES ('user_1743653739763', 5, 156);
INSERT INTO public.users VALUES ('user_1743654433921', 2, 118);
INSERT INTO public.users VALUES ('user_1743654433922', 5, 412);
INSERT INTO public.users VALUES ('user_1743654446788', 2, 614);
INSERT INTO public.users VALUES ('user_1743654446789', 5, 174);
INSERT INTO public.users VALUES ('user_1743654498581', 2, 358);
INSERT INTO public.users VALUES ('user_1743654498582', 5, 30);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

