--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin (
    admin_id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL
);


ALTER TABLE public.admin OWNER TO postgres;

--
-- Name: admin_admin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_admin_id_seq OWNER TO postgres;

--
-- Name: admin_admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_admin_id_seq OWNED BY public.admin.admin_id;


--
-- Name: admin_movie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_movie (
    admin_id integer NOT NULL,
    movie_id integer NOT NULL
);


ALTER TABLE public.admin_movie OWNER TO postgres;

--
-- Name: admin_theatre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_theatre (
    admin_id integer NOT NULL,
    theatre_id integer NOT NULL
);


ALTER TABLE public.admin_theatre OWNER TO postgres;

--
-- Name: booked_seat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booked_seat (
    booked_seat_id integer NOT NULL,
    booking_id integer,
    seat_id integer,
    show_id integer,
    status character varying(30)
);


ALTER TABLE public.booked_seat OWNER TO postgres;

--
-- Name: booked_seat_booked_seat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booked_seat_booked_seat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.booked_seat_booked_seat_id_seq OWNER TO postgres;

--
-- Name: booked_seat_booked_seat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booked_seat_booked_seat_id_seq OWNED BY public.booked_seat.booked_seat_id;


--
-- Name: booking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking (
    booking_id integer NOT NULL,
    booking_time timestamp without time zone NOT NULL,
    total_amount numeric(10,2),
    user_id integer,
    show_id integer,
    status character varying(30)
);


ALTER TABLE public.booking OWNER TO postgres;

--
-- Name: booking_booking_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_booking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.booking_booking_id_seq OWNER TO postgres;

--
-- Name: booking_booking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_booking_id_seq OWNED BY public.booking.booking_id;


--
-- Name: movie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie (
    movie_id integer NOT NULL,
    title character varying(200) NOT NULL,
    description text,
    language character varying(50),
    genre character varying(50),
    duration_minutes integer,
    release_date date,
    poster_url character varying(300),
    audio_type character varying(50)
);


ALTER TABLE public.movie OWNER TO postgres;

--
-- Name: movie_movie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movie_movie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.movie_movie_id_seq OWNER TO postgres;

--
-- Name: movie_movie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movie_movie_id_seq OWNED BY public.movie.movie_id;


--
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    payment_id integer NOT NULL,
    amount numeric(10,2),
    payment_method character varying(50),
    transaction_id integer,
    booking_id integer,
    payment_status boolean
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- Name: payment_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payment_payment_id_seq OWNER TO postgres;

--
-- Name: payment_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_payment_id_seq OWNED BY public.payment.payment_id;


--
-- Name: row; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."row" (
    row_id integer NOT NULL,
    row_type character varying(50) DEFAULT 'Classic'::character varying,
    screen_id integer
);


ALTER TABLE public."row" OWNER TO postgres;

--
-- Name: row_row_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.row_row_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.row_row_id_seq OWNER TO postgres;

--
-- Name: row_row_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.row_row_id_seq OWNED BY public."row".row_id;


--
-- Name: screen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.screen (
    screen_id integer NOT NULL,
    name character varying(100) NOT NULL,
    capacity integer,
    theatre_id integer
);


ALTER TABLE public.screen OWNER TO postgres;

--
-- Name: screen_screen_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.screen_screen_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.screen_screen_id_seq OWNER TO postgres;

--
-- Name: screen_screen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.screen_screen_id_seq OWNED BY public.screen.screen_id;


--
-- Name: seat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seat (
    seat_id integer NOT NULL,
    seat_number integer NOT NULL,
    type character varying(50),
    row_id integer
);


ALTER TABLE public.seat OWNER TO postgres;

--
-- Name: seat_seat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seat_seat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seat_seat_id_seq OWNER TO postgres;

--
-- Name: seat_seat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.seat_seat_id_seq OWNED BY public.seat.seat_id;


--
-- Name: show; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.show (
    show_id integer NOT NULL,
    show_time timestamp without time zone NOT NULL,
    price numeric(10,2),
    movie_id integer,
    screen_id integer
);


ALTER TABLE public.show OWNER TO postgres;

--
-- Name: show_show_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.show_show_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.show_show_id_seq OWNER TO postgres;

--
-- Name: show_show_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.show_show_id_seq OWNED BY public.show.show_id;


--
-- Name: theatre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.theatre (
    theatre_id integer NOT NULL,
    name character varying(100) NOT NULL,
    address character varying(200),
    city character varying(100),
    manager_id integer
);


ALTER TABLE public.theatre OWNER TO postgres;

--
-- Name: theatre_theatre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.theatre_theatre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.theatre_theatre_id_seq OWNER TO postgres;

--
-- Name: theatre_theatre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.theatre_theatre_id_seq OWNED BY public.theatre.theatre_id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    user_id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    phone_number character varying(30)
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_user_id_seq OWNER TO postgres;

--
-- Name: user_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_user_id_seq OWNED BY public."user".user_id;


--
-- Name: admin admin_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin ALTER COLUMN admin_id SET DEFAULT nextval('public.admin_admin_id_seq'::regclass);


--
-- Name: booked_seat booked_seat_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booked_seat ALTER COLUMN booked_seat_id SET DEFAULT nextval('public.booked_seat_booked_seat_id_seq'::regclass);


--
-- Name: booking booking_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking ALTER COLUMN booking_id SET DEFAULT nextval('public.booking_booking_id_seq'::regclass);


--
-- Name: movie movie_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie ALTER COLUMN movie_id SET DEFAULT nextval('public.movie_movie_id_seq'::regclass);


--
-- Name: payment payment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment ALTER COLUMN payment_id SET DEFAULT nextval('public.payment_payment_id_seq'::regclass);


--
-- Name: row row_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."row" ALTER COLUMN row_id SET DEFAULT nextval('public.row_row_id_seq'::regclass);


--
-- Name: screen screen_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.screen ALTER COLUMN screen_id SET DEFAULT nextval('public.screen_screen_id_seq'::regclass);


--
-- Name: seat seat_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seat ALTER COLUMN seat_id SET DEFAULT nextval('public.seat_seat_id_seq'::regclass);


--
-- Name: show show_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.show ALTER COLUMN show_id SET DEFAULT nextval('public.show_show_id_seq'::regclass);


--
-- Name: theatre theatre_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.theatre ALTER COLUMN theatre_id SET DEFAULT nextval('public.theatre_theatre_id_seq'::regclass);


--
-- Name: user user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN user_id SET DEFAULT nextval('public.user_user_id_seq'::regclass);


--
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin (admin_id, name, email, password) FROM stdin;
1	Admin1	admin1@example.com	password123
2	Admin2	admin2@example.com	password123
3	Admin3	admin3@example.com	password123
4	Admin4	admin4@example.com	password123
5	Admin5	admin5@example.com	password123
\.


--
-- Data for Name: admin_movie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_movie (admin_id, movie_id) FROM stdin;
1	1
2	2
3	3
\.


--
-- Data for Name: admin_theatre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_theatre (admin_id, theatre_id) FROM stdin;
1	1
1	2
2	2
3	3
\.


--
-- Data for Name: booked_seat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booked_seat (booked_seat_id, booking_id, seat_id, show_id, status) FROM stdin;
1	1	1	1	BOOKED
2	1	2	1	BOOKED
3	2	3	2	BOOKED
\.


--
-- Data for Name: booking; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking (booking_id, booking_time, total_amount, user_id, show_id, status) FROM stdin;
1	2025-06-10 12:00:00	40.00	1	1	CONFIRMED
2	2025-06-11 15:30:00	25.00	2	2	CANCELLED
3	2025-06-12 17:45:00	15.00	3	3	CONFIRMED
\.


--
-- Data for Name: movie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie (movie_id, title, description, language, genre, duration_minutes, release_date, poster_url, audio_type) FROM stdin;
1	Movie1	Description of Movie1	English	Action	120	2024-01-01	https://example.com/poster1.jpg	Stereo
2	Movie2	Description of Movie2	Polish	Comedy	90	2023-06-15	https://example.com/poster2.jpg	Dolby
3	Movie3	Description of Movie3	German	Drama	110	2022-12-12	https://example.com/poster3.jpg	Mono
\.


--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment (payment_id, amount, payment_method, transaction_id, booking_id, payment_status) FROM stdin;
1	40.00	Credit Card	123456	1	t
2	25.00	PayPal	234567	2	f
3	15.00	Cash	345678	3	t
\.


--
-- Data for Name: row; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."row" (row_id, row_type, screen_id) FROM stdin;
1	Classic	1
2	VIP	1
3	Classic	2
4	VIP	3
5	Classic	1
6	Classic	1
7	Classic	1
8	Classic	1
9	Classic	1
10	Classic	1
11	Classic	1
12	Classic	2
13	Classic	2
14	Classic	2
15	Classic	2
16	Classic	2
17	Classic	2
18	Classic	2
19	Classic	2
20	Classic	2
21	Classic	2
22	Classic	3
23	Classic	3
24	Classic	3
25	Classic	3
26	Classic	3
27	Classic	3
28	Classic	3
29	Classic	3
30	Classic	3
31	Classic	3
\.


--
-- Data for Name: screen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.screen (screen_id, name, capacity, theatre_id) FROM stdin;
1	Screen1	100	1
2	Screen2	120	1
3	Screen3	80	2
\.


--
-- Data for Name: seat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.seat (seat_id, seat_number, type, row_id) FROM stdin;
1	1	Regular	1
2	2	Recliner	1
3	1	Wheelchair	2
4	2	Regular	2
5	1	Regular	3
6	3	Regular	2
7	4	Regular	2
8	5	Regular	2
9	6	Regular	2
10	7	Regular	2
11	8	Regular	2
12	9	Regular	2
13	10	Regular	2
14	11	Regular	2
15	12	Regular	2
16	13	Regular	2
17	14	Regular	2
18	15	Regular	2
19	16	Regular	2
20	17	Regular	2
21	18	Regular	2
22	19	Regular	2
23	20	Regular	2
24	2	Regular	1
25	3	Regular	1
26	4	Regular	1
27	5	Regular	1
28	6	Regular	1
29	7	Regular	1
30	8	Regular	1
31	9	Regular	1
32	10	Regular	1
33	11	Regular	1
34	12	Regular	1
35	13	Regular	1
36	14	Regular	1
37	15	Regular	1
38	16	Regular	1
39	17	Regular	1
40	18	Regular	1
41	19	Regular	1
42	20	Regular	1
\.


--
-- Data for Name: show; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.show (show_id, show_time, price, movie_id, screen_id) FROM stdin;
1	2025-06-15 18:00:00	20.00	1	1
2	2025-06-15 20:30:00	25.00	2	2
3	2025-06-16 17:00:00	15.00	3	3
\.


--
-- Data for Name: theatre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.theatre (theatre_id, name, address, city, manager_id) FROM stdin;
1	Theatre1	Street 1 Main	CityX	1
2	Theatre2	Street 2 Main	CityX	2
3	Theatre3	Street 3 Main	CityX	3
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (user_id, name, email, password, phone_number) FROM stdin;
1	User1	user1@example.com	password123	+48123456701
2	User2	user2@example.com	password123	+48123456702
3	User3	user3@example.com	password123	+48123456703
4	User4	user4@example.com	password123	+48123456704
5	User5	user5@example.com	password123	+48123456705
\.


--
-- Name: admin_admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_admin_id_seq', 1, false);


--
-- Name: booked_seat_booked_seat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booked_seat_booked_seat_id_seq', 1, false);


--
-- Name: booking_booking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_booking_id_seq', 1, false);


--
-- Name: movie_movie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movie_movie_id_seq', 1, false);


--
-- Name: payment_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_payment_id_seq', 1, false);


--
-- Name: row_row_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.row_row_id_seq', 31, true);


--
-- Name: screen_screen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.screen_screen_id_seq', 1, false);


--
-- Name: seat_seat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seat_seat_id_seq', 42, true);


--
-- Name: show_show_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.show_show_id_seq', 1, false);


--
-- Name: theatre_theatre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.theatre_theatre_id_seq', 1, false);


--
-- Name: user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_user_id_seq', 1, false);


--
-- Name: admin admin_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_email_key UNIQUE (email);


--
-- Name: admin_movie admin_movie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_movie
    ADD CONSTRAINT admin_movie_pkey PRIMARY KEY (admin_id, movie_id);


--
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (admin_id);


--
-- Name: admin_theatre admin_theatre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_theatre
    ADD CONSTRAINT admin_theatre_pkey PRIMARY KEY (admin_id, theatre_id);


--
-- Name: booked_seat booked_seat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booked_seat
    ADD CONSTRAINT booked_seat_pkey PRIMARY KEY (booked_seat_id);


--
-- Name: booking booking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (booking_id);


--
-- Name: movie movie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie
    ADD CONSTRAINT movie_pkey PRIMARY KEY (movie_id);


--
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (payment_id);


--
-- Name: row row_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."row"
    ADD CONSTRAINT row_pkey PRIMARY KEY (row_id);


--
-- Name: screen screen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.screen
    ADD CONSTRAINT screen_pkey PRIMARY KEY (screen_id);


--
-- Name: seat seat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seat
    ADD CONSTRAINT seat_pkey PRIMARY KEY (seat_id);


--
-- Name: show show_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.show
    ADD CONSTRAINT show_pkey PRIMARY KEY (show_id);


--
-- Name: theatre theatre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.theatre
    ADD CONSTRAINT theatre_pkey PRIMARY KEY (theatre_id);


--
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);


--
-- Name: admin_movie admin_movie_admin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_movie
    ADD CONSTRAINT admin_movie_admin_id_fkey FOREIGN KEY (admin_id) REFERENCES public.admin(admin_id);


--
-- Name: admin_movie admin_movie_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_movie
    ADD CONSTRAINT admin_movie_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movie(movie_id);


--
-- Name: admin_theatre admin_theatre_admin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_theatre
    ADD CONSTRAINT admin_theatre_admin_id_fkey FOREIGN KEY (admin_id) REFERENCES public.admin(admin_id);


--
-- Name: admin_theatre admin_theatre_theatre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_theatre
    ADD CONSTRAINT admin_theatre_theatre_id_fkey FOREIGN KEY (theatre_id) REFERENCES public.theatre(theatre_id);


--
-- Name: booked_seat booked_seat_booking_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booked_seat
    ADD CONSTRAINT booked_seat_booking_id_fkey FOREIGN KEY (booking_id) REFERENCES public.booking(booking_id);


--
-- Name: booked_seat booked_seat_seat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booked_seat
    ADD CONSTRAINT booked_seat_seat_id_fkey FOREIGN KEY (seat_id) REFERENCES public.seat(seat_id);


--
-- Name: booked_seat booked_seat_show_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booked_seat
    ADD CONSTRAINT booked_seat_show_id_fkey FOREIGN KEY (show_id) REFERENCES public.show(show_id);


--
-- Name: booking booking_show_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_show_id_fkey FOREIGN KEY (show_id) REFERENCES public.show(show_id);


--
-- Name: booking booking_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(user_id);


--
-- Name: payment payment_booking_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_booking_id_fkey FOREIGN KEY (booking_id) REFERENCES public.booking(booking_id);


--
-- Name: row row_screen_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."row"
    ADD CONSTRAINT row_screen_id_fkey FOREIGN KEY (screen_id) REFERENCES public.screen(screen_id);


--
-- Name: screen screen_theatre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.screen
    ADD CONSTRAINT screen_theatre_id_fkey FOREIGN KEY (theatre_id) REFERENCES public.theatre(theatre_id);


--
-- Name: seat seat_row_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seat
    ADD CONSTRAINT seat_row_id_fkey FOREIGN KEY (row_id) REFERENCES public."row"(row_id);


--
-- Name: show show_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.show
    ADD CONSTRAINT show_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movie(movie_id);


--
-- Name: show show_screen_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.show
    ADD CONSTRAINT show_screen_id_fkey FOREIGN KEY (screen_id) REFERENCES public.screen(screen_id);


--
-- Name: theatre theatre_manager_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.theatre
    ADD CONSTRAINT theatre_manager_id_fkey FOREIGN KEY (manager_id) REFERENCES public.admin(admin_id);


--
-- PostgreSQL database dump complete
--

