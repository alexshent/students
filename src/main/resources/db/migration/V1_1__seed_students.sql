--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Debian 14.5-1.pgdg110+1)
-- Dumped by pg_dump version 14.4

-- Started on 2022-09-14 08:57:13 UTC

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

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

--CREATE SCHEMA public;
--ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3344 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

--COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 23452)
-- Name: grade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grade (
    id uuid NOT NULL,
    value integer NOT NULL,
    subject_id uuid
);


ALTER TABLE public.grade OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 23457)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    dtype character varying(31) NOT NULL,
    id uuid NOT NULL,
    birthdate date,
    firstname character varying(255),
    lastname character varying(255),
    enrollmentdate date,
    studygroup_id uuid,
    subject_id uuid
);


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 23464)
-- Name: person_grade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person_grade (
    students_id uuid NOT NULL,
    grades_id uuid NOT NULL
);


ALTER TABLE public.person_grade OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 23467)
-- Name: studygroup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.studygroup (
    id uuid NOT NULL,
    name character varying(255)
);


ALTER TABLE public.studygroup OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 23472)
-- Name: subject; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subject (
    id uuid NOT NULL,
    code character varying(255),
    name character varying(255)
);


ALTER TABLE public.subject OWNER TO postgres;

--
-- TOC entry 3334 (class 0 OID 23452)
-- Dependencies: 209
-- Data for Name: grade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grade (id, value, subject_id) FROM stdin;
b36f503e-b3c0-4629-8efa-62e160a9004d	10	c16d310a-e214-42a1-9e0e-e155634b31ee
cc8567b8-6aba-466b-be99-1a39ac117738	8	c16d310a-e214-42a1-9e0e-e155634b31ee
b47e32a8-ae1d-467c-aa70-cfa372636f56	6	092b194d-281a-4f89-bde8-d557ee7ed5d6
ede45852-5f40-4938-a9a0-bf37a6221d97	4	092b194d-281a-4f89-bde8-d557ee7ed5d6
\.


--
-- TOC entry 3335 (class 0 OID 23457)
-- Dependencies: 210
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.person (dtype, id, birthdate, firstname, lastname, enrollmentdate, studygroup_id, subject_id) FROM stdin;
Educator	ace910c5-90a1-45a3-ae27-bd631140715b	1970-03-15	EducatorFN1	EducatorLN1	\N	\N	c16d310a-e214-42a1-9e0e-e155634b31ee
Educator	ed1882ef-100d-42f7-bd88-60e46994a781	1970-03-15	EFN2	ELN2	\N	\N	092b194d-281a-4f89-bde8-d557ee7ed5d6
Student	297c4c84-1003-4b11-a64c-74bc0ce4dede	2022-09-14	FN1	LN1	1999-03-11	7af09d41-e96b-41ad-bce0-395990275896	\N
Student	8048b7c8-c324-45a5-ba34-e745c3557ac3	2022-09-14	FN2	LN2	1999-03-11	7af09d41-e96b-41ad-bce0-395990275896	\N
Student	ee8040c6-be64-428e-8d1f-4f652bbf583d	2022-09-14	FN3	LN3	1999-03-11	7af09d41-e96b-41ad-bce0-395990275896	\N
Student	24060fb5-e0c2-417d-9983-d37e6aa387fa	2022-09-14	FN4	LN4	1999-03-11	77903065-d669-4d9a-aaa7-c823e4be2a65	\N
Student	0c393279-cfae-481b-92c8-e8270e7ecba9	2022-09-14	FN5	LN5	1999-03-11	77903065-d669-4d9a-aaa7-c823e4be2a65	\N
\.


--
-- TOC entry 3336 (class 0 OID 23464)
-- Dependencies: 211
-- Data for Name: person_grade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.person_grade (students_id, grades_id) FROM stdin;
297c4c84-1003-4b11-a64c-74bc0ce4dede	b36f503e-b3c0-4629-8efa-62e160a9004d
297c4c84-1003-4b11-a64c-74bc0ce4dede	b47e32a8-ae1d-467c-aa70-cfa372636f56
297c4c84-1003-4b11-a64c-74bc0ce4dede	cc8567b8-6aba-466b-be99-1a39ac117738
297c4c84-1003-4b11-a64c-74bc0ce4dede	ede45852-5f40-4938-a9a0-bf37a6221d97
24060fb5-e0c2-417d-9983-d37e6aa387fa	b36f503e-b3c0-4629-8efa-62e160a9004d
24060fb5-e0c2-417d-9983-d37e6aa387fa	b47e32a8-ae1d-467c-aa70-cfa372636f56
24060fb5-e0c2-417d-9983-d37e6aa387fa	cc8567b8-6aba-466b-be99-1a39ac117738
24060fb5-e0c2-417d-9983-d37e6aa387fa	ede45852-5f40-4938-a9a0-bf37a6221d97
\.


--
-- TOC entry 3337 (class 0 OID 23467)
-- Dependencies: 212
-- Data for Name: studygroup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.studygroup (id, name) FROM stdin;
7af09d41-e96b-41ad-bce0-395990275896	Group1
77903065-d669-4d9a-aaa7-c823e4be2a65	Group2
\.


--
-- TOC entry 3338 (class 0 OID 23472)
-- Dependencies: 213
-- Data for Name: subject; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subject (id, code, name) FROM stdin;
c16d310a-e214-42a1-9e0e-e155634b31ee	S-001	SUBJ1
092b194d-281a-4f89-bde8-d557ee7ed5d6	S-002	SUBJ2
\.


--
-- TOC entry 3183 (class 2606 OID 23456)
-- Name: grade grade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade
    ADD CONSTRAINT grade_pkey PRIMARY KEY (id);


--
-- TOC entry 3185 (class 2606 OID 23463)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 3187 (class 2606 OID 23471)
-- Name: studygroup studygroup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.studygroup
    ADD CONSTRAINT studygroup_pkey PRIMARY KEY (id);


--
-- TOC entry 3189 (class 2606 OID 23478)
-- Name: subject subject_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subject_pkey PRIMARY KEY (id);


--
-- TOC entry 3193 (class 2606 OID 23494)
-- Name: person_grade fkangs0f6mjnp7tt4smbeb9cjiw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person_grade
    ADD CONSTRAINT fkangs0f6mjnp7tt4smbeb9cjiw FOREIGN KEY (grades_id) REFERENCES public.grade(id);


--
-- TOC entry 3190 (class 2606 OID 23479)
-- Name: grade fkep37ymuxqe45lfaysrimbrs2a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade
    ADD CONSTRAINT fkep37ymuxqe45lfaysrimbrs2a FOREIGN KEY (subject_id) REFERENCES public.subject(id);


--
-- TOC entry 3191 (class 2606 OID 23484)
-- Name: person fknljy67qsh9el2t8vm5fi54k2r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT fknljy67qsh9el2t8vm5fi54k2r FOREIGN KEY (studygroup_id) REFERENCES public.studygroup(id);


--
-- TOC entry 3192 (class 2606 OID 23489)
-- Name: person fkta8pkuofuo6etp5hdykm8xhf7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT fkta8pkuofuo6etp5hdykm8xhf7 FOREIGN KEY (subject_id) REFERENCES public.subject(id);


--
-- TOC entry 3194 (class 2606 OID 23499)
-- Name: person_grade fktaia2xoqwajnfnkvdravw7wj0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person_grade
    ADD CONSTRAINT fktaia2xoqwajnfnkvdravw7wj0 FOREIGN KEY (students_id) REFERENCES public.person(id);


-- Completed on 2022-09-14 08:57:13 UTC

--
-- PostgreSQL database dump complete
--

