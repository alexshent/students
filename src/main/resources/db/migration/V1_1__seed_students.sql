--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Debian 14.5-1.pgdg110+1)
-- Dumped by pg_dump version 14.4

-- Started on 2022-09-14 01:13:47 UTC

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
-- TOC entry 3360 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

--COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 22884)
-- Name: grade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grade (
    id uuid NOT NULL,
    value integer NOT NULL,
    subject_id uuid
);


ALTER TABLE public.grade OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 22889)
-- Name: grade_person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grade_person (
    grade_id uuid NOT NULL,
    students_id uuid NOT NULL
);


ALTER TABLE public.grade_person OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 22892)
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
-- TOC entry 212 (class 1259 OID 22899)
-- Name: person_grade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person_grade (
    student_id uuid NOT NULL,
    grades_id uuid NOT NULL
);


ALTER TABLE public.person_grade OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 22902)
-- Name: studygroup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.studygroup (
    id uuid NOT NULL,
    name character varying(255)
);


ALTER TABLE public.studygroup OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 22907)
-- Name: studygroup_person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.studygroup_person (
    studygroup_id uuid NOT NULL,
    students_id uuid NOT NULL
);


ALTER TABLE public.studygroup_person OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 22910)
-- Name: subject; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subject (
    id uuid NOT NULL,
    code character varying(255),
    name character varying(255)
);


ALTER TABLE public.subject OWNER TO postgres;

--
-- TOC entry 3348 (class 0 OID 22884)
-- Dependencies: 209
-- Data for Name: grade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grade (id, value, subject_id) FROM stdin;
6e23d26f-161e-4059-b691-7103c28889ed	10	41e369c0-cd5e-4240-8617-79f19fbead5c
e2a79666-1b0e-4597-be0f-d0cb00897477	8	41e369c0-cd5e-4240-8617-79f19fbead5c
66a6f37c-da4f-4e60-b708-08f6bd7a9996	6	eafda53a-391d-43db-a57a-4fbd9575159a
e78051ef-67d1-43f6-aa6e-14bb429bd6e9	4	eafda53a-391d-43db-a57a-4fbd9575159a
\.


--
-- TOC entry 3349 (class 0 OID 22889)
-- Dependencies: 210
-- Data for Name: grade_person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grade_person (grade_id, students_id) FROM stdin;
\.


--
-- TOC entry 3350 (class 0 OID 22892)
-- Dependencies: 211
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.person (dtype, id, birthdate, firstname, lastname, enrollmentdate, studygroup_id, subject_id) FROM stdin;
Educator	141211b3-5eee-46ef-869c-5e3c255ac540	1970-03-15	EducatorFN1	EducatorLN1	\N	\N	41e369c0-cd5e-4240-8617-79f19fbead5c
Educator	f85ac0be-cd54-401b-a898-b7a5d0df0acf	1970-03-15	EFN2	ELN2	\N	\N	eafda53a-391d-43db-a57a-4fbd9575159a
Student	bcd02b9a-484a-417b-9da5-874dcdc6c60f	2022-09-14	FN1	LN1	1999-03-11	\N	\N
Student	638fd0e9-c102-45e6-b759-4cfd2fd1930c	2022-09-14	FN2	LN2	1999-03-11	\N	\N
Student	a7a747e3-a443-435a-bd52-1c9829902752	2022-09-14	FN3	LN3	1999-03-11	\N	\N
Student	24c298fd-7ce5-4884-8adf-c2fa9d45a65a	2022-09-14	FN4	LN4	1999-03-11	\N	\N
Student	f232f6db-49d7-4d77-91b5-60da2f9e6a0b	2022-09-14	FN5	LN5	1999-03-11	\N	\N
\.


--
-- TOC entry 3351 (class 0 OID 22899)
-- Dependencies: 212
-- Data for Name: person_grade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.person_grade (student_id, grades_id) FROM stdin;
bcd02b9a-484a-417b-9da5-874dcdc6c60f	6e23d26f-161e-4059-b691-7103c28889ed
bcd02b9a-484a-417b-9da5-874dcdc6c60f	66a6f37c-da4f-4e60-b708-08f6bd7a9996
bcd02b9a-484a-417b-9da5-874dcdc6c60f	e2a79666-1b0e-4597-be0f-d0cb00897477
bcd02b9a-484a-417b-9da5-874dcdc6c60f	e78051ef-67d1-43f6-aa6e-14bb429bd6e9
24c298fd-7ce5-4884-8adf-c2fa9d45a65a	6e23d26f-161e-4059-b691-7103c28889ed
24c298fd-7ce5-4884-8adf-c2fa9d45a65a	66a6f37c-da4f-4e60-b708-08f6bd7a9996
24c298fd-7ce5-4884-8adf-c2fa9d45a65a	e2a79666-1b0e-4597-be0f-d0cb00897477
24c298fd-7ce5-4884-8adf-c2fa9d45a65a	e78051ef-67d1-43f6-aa6e-14bb429bd6e9
\.


--
-- TOC entry 3352 (class 0 OID 22902)
-- Dependencies: 213
-- Data for Name: studygroup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.studygroup (id, name) FROM stdin;
c6fdd412-3401-46a9-8660-36a33329c0df	Group1
bd40f063-3f18-4bc6-83a1-4ef51fb16ce2	Group2
\.


--
-- TOC entry 3353 (class 0 OID 22907)
-- Dependencies: 214
-- Data for Name: studygroup_person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.studygroup_person (studygroup_id, students_id) FROM stdin;
c6fdd412-3401-46a9-8660-36a33329c0df	bcd02b9a-484a-417b-9da5-874dcdc6c60f
c6fdd412-3401-46a9-8660-36a33329c0df	638fd0e9-c102-45e6-b759-4cfd2fd1930c
c6fdd412-3401-46a9-8660-36a33329c0df	a7a747e3-a443-435a-bd52-1c9829902752
bd40f063-3f18-4bc6-83a1-4ef51fb16ce2	24c298fd-7ce5-4884-8adf-c2fa9d45a65a
bd40f063-3f18-4bc6-83a1-4ef51fb16ce2	f232f6db-49d7-4d77-91b5-60da2f9e6a0b
\.


--
-- TOC entry 3354 (class 0 OID 22910)
-- Dependencies: 215
-- Data for Name: subject; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subject (id, code, name) FROM stdin;
41e369c0-cd5e-4240-8617-79f19fbead5c	S-001	SUBJ1
eafda53a-391d-43db-a57a-4fbd9575159a	S-002	SUBJ2
\.


--
-- TOC entry 3191 (class 2606 OID 22888)
-- Name: grade grade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade
    ADD CONSTRAINT grade_pkey PRIMARY KEY (id);


--
-- TOC entry 3193 (class 2606 OID 22898)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 3195 (class 2606 OID 22906)
-- Name: studygroup studygroup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.studygroup
    ADD CONSTRAINT studygroup_pkey PRIMARY KEY (id);


--
-- TOC entry 3199 (class 2606 OID 22916)
-- Name: subject subject_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subject_pkey PRIMARY KEY (id);


--
-- TOC entry 3197 (class 2606 OID 22918)
-- Name: studygroup_person uk_sxfy2gi8vs4gyv0li9r2pvq20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.studygroup_person
    ADD CONSTRAINT uk_sxfy2gi8vs4gyv0li9r2pvq20 UNIQUE (students_id);


--
-- TOC entry 3205 (class 2606 OID 22944)
-- Name: person_grade fkangs0f6mjnp7tt4smbeb9cjiw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person_grade
    ADD CONSTRAINT fkangs0f6mjnp7tt4smbeb9cjiw FOREIGN KEY (grades_id) REFERENCES public.grade(id);


--
-- TOC entry 3207 (class 2606 OID 22954)
-- Name: studygroup_person fkayuu604wjfcmykpepfhjoa0mw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.studygroup_person
    ADD CONSTRAINT fkayuu604wjfcmykpepfhjoa0mw FOREIGN KEY (students_id) REFERENCES public.person(id);


--
-- TOC entry 3200 (class 2606 OID 22919)
-- Name: grade fkep37ymuxqe45lfaysrimbrs2a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade
    ADD CONSTRAINT fkep37ymuxqe45lfaysrimbrs2a FOREIGN KEY (subject_id) REFERENCES public.subject(id);


--
-- TOC entry 3203 (class 2606 OID 22934)
-- Name: person fknljy67qsh9el2t8vm5fi54k2r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT fknljy67qsh9el2t8vm5fi54k2r FOREIGN KEY (studygroup_id) REFERENCES public.studygroup(id);


--
-- TOC entry 3206 (class 2606 OID 22949)
-- Name: person_grade fknspqwnivw02o1u71gmg8lggp0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person_grade
    ADD CONSTRAINT fknspqwnivw02o1u71gmg8lggp0 FOREIGN KEY (student_id) REFERENCES public.person(id);


--
-- TOC entry 3202 (class 2606 OID 22929)
-- Name: grade_person fko84okmnabias7pudkkvpe01mt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade_person
    ADD CONSTRAINT fko84okmnabias7pudkkvpe01mt FOREIGN KEY (grade_id) REFERENCES public.grade(id);


--
-- TOC entry 3208 (class 2606 OID 22959)
-- Name: studygroup_person fkrugyfacnq3wnnpqj3w3j770pa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.studygroup_person
    ADD CONSTRAINT fkrugyfacnq3wnnpqj3w3j770pa FOREIGN KEY (studygroup_id) REFERENCES public.studygroup(id);


--
-- TOC entry 3201 (class 2606 OID 22924)
-- Name: grade_person fksbrrddkwqsvfhehhw9rthjg9v; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade_person
    ADD CONSTRAINT fksbrrddkwqsvfhehhw9rthjg9v FOREIGN KEY (students_id) REFERENCES public.person(id);


--
-- TOC entry 3204 (class 2606 OID 22939)
-- Name: person fkta8pkuofuo6etp5hdykm8xhf7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT fkta8pkuofuo6etp5hdykm8xhf7 FOREIGN KEY (subject_id) REFERENCES public.subject(id);


-- Completed on 2022-09-14 01:13:48 UTC

--
-- PostgreSQL database dump complete
--
