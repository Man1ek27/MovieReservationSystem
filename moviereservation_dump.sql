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
    row_id integer,
    status boolean DEFAULT false
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
-- Data for Name: booking; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking (booking_id, booking_time, total_amount, user_id, show_id, status) FROM stdin;
\.


--
-- Data for Name: movie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie (movie_id, title, description, language, genre, duration_minutes, release_date, poster_url, audio_type) FROM stdin;
1	The Shawshank Redemption	Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.	English	Drama	142	1994-09-23	https://example.com/poster_shawshank.jpg	ORIGINAL
2	The Godfather	The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.	English	Crime	175	1972-03-24	https://example.com/poster_godfather.jpg	ORIGINAL
3	The Dark Knight	When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham.	English	Action	152	2008-07-18	https://example.com/poster_darkknight.jpg	ORIGINAL
4	Pulp Fiction	The lives of two mob hitmen, a boxer, a gangster's wife, and a pair of diner bandits intertwine in four tales of violence and redemption.	English	Crime	154	1994-10-14	https://example.com/poster_pulpfiction.jpg	ORIGINAL
5	Forrest Gump	The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama man with an IQ of 75.	English	Drama	142	1994-07-06	https://example.com/poster_forrestgump.jpg	ORIGINAL
6	Inception	A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a CEO.	English	Sci-Fi	148	2010-07-16	https://example.com/poster_inception.jpg	ORIGINAL
7	Fight Club	An insomniac office worker and a devil-may-care soap maker form an underground fight club that evolves into something much more.	English	Drama	139	1999-10-15	https://example.com/poster_fightclub.jpg	ORIGINAL
8	The Matrix	A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.	English	Sci-Fi	136	1999-03-31	https://example.com/poster_matrix.jpg	ORIGINAL
9	Goodfellas	The story of Henry Hill and his life in the mob, covering his relationship with his wife Karen Hill and his partners in crime.	English	Crime	146	1990-09-19	https://example.com/poster_goodfellas.jpg	ORIGINAL
10	The Lord of the Rings: The Fellowship of the Ring	A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth.	English	Fantasy	178	2001-12-19	https://example.com/poster_lotr1.jpg	ORIGINAL
11	Star Wars: Episode IV - A New Hope	Luke Skywalker joins forces with a Jedi Knight, a cocky pilot, a Wookiee and two droids to save the galaxy from the Empire's world-destroying battle station.	English	Sci-Fi	121	1977-05-25	https://example.com/poster_starwars4.jpg	ORIGINAL
12	The Silence of the Lambs	A young FBI cadet must receive the help of an incarcerated and manipulative cannibal killer to catch another serial killer.	English	Thriller	118	1991-02-14	https://example.com/poster_silence.jpg	ORIGINAL
13	Saving Private Ryan	Following the Normandy Landings, a group of U.S. soldiers go behind enemy lines to retrieve a paratrooper whose brothers have been killed in action.	English	War	169	1998-07-24	https://example.com/poster_savingryan.jpg	ORIGINAL
14	Gladiator	A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into slavery.	English	Action	155	2000-05-05	https://example.com/poster_gladiator.jpg	ORIGINAL
15	The Lion King	Lion prince Simba and his father are targeted by his bitter uncle, who wants to ascend the throne himself.	English	Animation	88	1994-06-15	https://example.com/poster_lionking.jpg	ORIGINAL
16	Jurassic Park	During a preview tour, a theme park suffers a major power breakdown that allows its cloned dinosaur exhibits to run amok.	English	Adventure	127	1993-06-11	https://example.com/poster_jurassicpark.jpg	ORIGINAL
17	Titanic	A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated R.M.S. Titanic.	English	Romance	195	1997-12-19	https://example.com/poster_titanic.jpg	ORIGINAL
18	The Avengers	Earth's mightiest heroes must come together and learn to fight as a team to stop the mischievous Loki and his alien army.	English	Action	143	2012-05-04	https://example.com/poster_avengers.jpg	ORIGINAL
19	Avatar	A paraplegic Marine dispatched to the moon Pandora on a unique mission becomes torn between following his orders and protecting the world he feels is his home.	English	Sci-Fi	162	2009-12-18	https://example.com/poster_avatar.jpg	ORIGINAL
\.


--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment (payment_id, amount, payment_method, transaction_id, booking_id, payment_status) FROM stdin;
\.


--
-- Data for Name: row; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."row" (row_id, row_type, screen_id) FROM stdin;
36	Wheelchair	1
37	VIP	1
38	Classic	1
39	Classic	1
40	Classic	1
41	Classic	1
42	Classic	1
43	Classic	1
44	Classic	1
45	VIP	1
46	Wheelchair	2
47	VIP	2
48	Classic	2
49	Classic	2
50	Classic	2
51	Classic	2
52	Classic	2
53	Classic	2
54	Classic	2
55	VIP	2
56	Wheelchair	3
57	VIP	3
58	Classic	3
59	Classic	3
60	Classic	3
61	Classic	3
62	Classic	3
63	Classic	3
64	Classic	3
65	VIP	3
66	Wheelchair	4
67	VIP	4
68	Classic	4
69	Classic	4
70	Classic	4
71	Classic	4
72	Classic	4
73	Classic	4
74	Classic	4
75	Classic	4
76	Classic	4
77	Classic	4
78	Classic	4
79	VIP	4
80	Wheelchair	5
81	VIP	5
82	Classic	5
83	Classic	5
84	Classic	5
85	Classic	5
86	Classic	5
87	Classic	5
88	Classic	5
89	Classic	5
90	VIP	5
91	Wheelchair	6
92	VIP	6
93	Classic	6
94	Classic	6
95	Classic	6
96	Classic	6
97	Classic	6
98	Classic	6
99	Classic	6
100	VIP	6
101	Wheelchair	7
102	VIP	7
103	Classic	7
104	Classic	7
105	Classic	7
106	Classic	7
107	Classic	7
108	Classic	7
109	Classic	7
110	Classic	7
111	Classic	7
112	Classic	7
113	Classic	7
114	VIP	7
115	Wheelchair	8
116	VIP	8
117	Classic	8
118	Classic	8
119	Classic	8
120	Classic	8
121	Classic	8
122	Classic	8
123	Classic	8
124	Classic	8
125	Classic	8
126	VIP	8
127	Wheelchair	9
128	VIP	9
129	Classic	9
130	Classic	9
131	Classic	9
132	Classic	9
133	Classic	9
134	Classic	9
135	Classic	9
136	Classic	9
137	Classic	9
138	VIP	9
139	Wheelchair	10
140	VIP	10
141	Classic	10
142	Classic	10
143	Classic	10
144	Classic	10
145	Classic	10
146	Classic	10
147	Classic	10
148	Classic	10
149	VIP	10
150	Wheelchair	11
151	VIP	11
152	Classic	11
153	Classic	11
154	Classic	11
155	Classic	11
156	Classic	11
157	Classic	11
158	Classic	11
159	Classic	11
160	VIP	11
161	Wheelchair	12
162	VIP	12
163	Classic	12
164	Classic	12
165	Classic	12
166	Classic	12
167	Classic	12
168	Classic	12
169	Classic	12
170	Classic	12
171	VIP	12
172	Wheelchair	13
173	VIP	13
174	Classic	13
175	Classic	13
176	Classic	13
177	Classic	13
178	Classic	13
179	Classic	13
180	Classic	13
181	Classic	13
182	Classic	13
183	Classic	13
184	VIP	13
185	Wheelchair	14
186	VIP	14
187	Classic	14
188	Classic	14
189	Classic	14
190	Classic	14
191	Classic	14
192	Classic	14
193	Classic	14
194	VIP	14
195	Wheelchair	15
196	VIP	15
197	Classic	15
198	Classic	15
199	Classic	15
200	Classic	15
201	Classic	15
202	Classic	15
203	Classic	15
204	Classic	15
205	Classic	15
206	Classic	15
207	VIP	15
208	Wheelchair	16
209	VIP	16
210	Classic	16
211	Classic	16
212	Classic	16
213	Classic	16
214	Classic	16
215	Classic	16
216	Classic	16
217	Classic	16
218	Classic	16
219	VIP	16
220	Wheelchair	17
221	VIP	17
222	Classic	17
223	Classic	17
224	Classic	17
225	Classic	17
226	Classic	17
227	Classic	17
228	Classic	17
229	Classic	17
230	Classic	17
231	VIP	17
232	Wheelchair	18
233	VIP	18
234	Classic	18
235	Classic	18
236	Classic	18
237	Classic	18
238	Classic	18
239	Classic	18
240	Classic	18
241	Classic	18
242	Classic	18
243	VIP	18
244	Wheelchair	19
245	VIP	19
246	Classic	19
247	Classic	19
248	Classic	19
249	Classic	19
250	Classic	19
251	Classic	19
252	Classic	19
253	Classic	19
254	Classic	19
255	Classic	19
256	Classic	19
257	VIP	19
258	Wheelchair	20
259	VIP	20
260	Classic	20
261	Classic	20
262	Classic	20
263	Classic	20
264	Classic	20
265	Classic	20
266	Classic	20
267	Classic	20
268	VIP	20
269	Wheelchair	21
270	VIP	21
271	Classic	21
272	Classic	21
273	Classic	21
274	Classic	21
275	Classic	21
276	Classic	21
277	Classic	21
278	Classic	21
279	VIP	21
280	Wheelchair	22
281	VIP	22
282	Classic	22
283	Classic	22
284	Classic	22
285	Classic	22
286	Classic	22
287	Classic	22
288	Classic	22
289	Classic	22
290	Classic	22
291	Classic	22
292	Classic	22
293	VIP	22
294	Wheelchair	23
295	VIP	23
296	Classic	23
297	Classic	23
298	Classic	23
299	Classic	23
300	Classic	23
301	Classic	23
302	Classic	23
303	Classic	23
304	VIP	23
305	Wheelchair	24
306	VIP	24
307	Classic	24
308	Classic	24
309	Classic	24
310	Classic	24
311	Classic	24
312	Classic	24
313	Classic	24
314	Classic	24
315	Classic	24
316	Classic	24
317	VIP	24
318	Wheelchair	25
319	VIP	25
320	Classic	25
321	Classic	25
322	Classic	25
323	Classic	25
324	Classic	25
325	Classic	25
326	Classic	25
327	VIP	25
328	Wheelchair	26
329	VIP	26
330	Classic	26
331	Classic	26
332	Classic	26
333	Classic	26
334	Classic	26
335	Classic	26
336	Classic	26
337	VIP	26
338	Wheelchair	27
339	VIP	27
340	Classic	27
341	Classic	27
342	Classic	27
343	Classic	27
344	Classic	27
345	Classic	27
346	Classic	27
347	Classic	27
348	Classic	27
349	VIP	27
350	Wheelchair	28
351	VIP	28
352	Classic	28
353	Classic	28
354	Classic	28
355	Classic	28
356	Classic	28
357	Classic	28
358	Classic	28
359	Classic	28
360	Classic	28
361	VIP	28
362	Wheelchair	29
363	VIP	29
364	Classic	29
365	Classic	29
366	Classic	29
367	Classic	29
368	Classic	29
369	Classic	29
370	Classic	29
371	Classic	29
372	Classic	29
373	Classic	29
374	Classic	29
375	VIP	29
376	Wheelchair	30
377	VIP	30
378	Classic	30
379	Classic	30
380	Classic	30
381	Classic	30
382	Classic	30
383	Classic	30
384	Classic	30
385	Classic	30
386	Classic	30
387	Classic	30
388	VIP	30
\.


--
-- Data for Name: screen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.screen (screen_id, name, capacity, theatre_id) FROM stdin;
4	Screen 4	180	1
5	Screen 5	120	1
6	Screen 6	200	1
7	Screen 7	140	1
8	Screen 8	160	1
9	Screen 9	100	1
10	Screen 10	150	1
1	Screen 1	180	1
2	Screen 2	150	1
3	Screen 3	120	1
11	Screen 11	180	2
12	Screen 12	120	2
13	Screen 13	200	2
14	Screen 14	140	2
15	Screen 15	160	2
16	Screen 16	100	2
17	Screen 17	150	2
18	Screen 18	180	2
19	Screen 19	120	2
20	Screen 20	200	3
21	Screen 21	140	3
22	Screen 22	160	3
23	Screen 23	100	3
24	Screen 24	150	3
25	Screen 25	180	3
26	Screen 26	120	3
27	Screen 27	200	3
28	Screen 28	140	3
29	Screen 29	160	3
30	Screen 30	100	3
\.


--
-- Data for Name: seat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.seat (seat_id, seat_number, type, row_id, status) FROM stdin;
247	1	Regular	44	t
261	1	VIP	45	t
262	2	VIP	45	t
264	4	VIP	45	t
142	3	Regular	38	f
150	11	Regular	38	f
151	12	Regular	38	f
152	13	Regular	38	f
153	14	Regular	38	f
154	15	Regular	38	f
155	16	Regular	38	f
156	17	Regular	38	f
157	1	Regular	39	f
158	2	Regular	39	f
159	3	Regular	39	f
161	5	Regular	39	f
165	9	Regular	39	f
166	10	Regular	39	f
167	11	Regular	39	f
168	12	Regular	39	f
169	13	Regular	39	f
170	14	Regular	39	f
171	15	Regular	39	f
172	16	Regular	39	f
173	17	Regular	39	f
174	18	Regular	39	f
175	19	Regular	39	f
176	1	Regular	40	f
177	2	Regular	40	f
178	3	Regular	40	f
180	5	Regular	40	f
182	7	Regular	40	f
183	8	Regular	40	f
184	9	Regular	40	f
185	10	Regular	40	f
186	11	Regular	40	f
187	12	Regular	40	f
189	14	Regular	40	f
190	15	Regular	40	f
191	16	Regular	40	f
192	17	Regular	40	f
193	1	Regular	41	f
194	2	Regular	41	f
195	3	Regular	41	f
197	5	Regular	41	f
199	7	Regular	41	f
200	8	Regular	41	f
201	9	Regular	41	f
202	10	Regular	41	f
203	11	Regular	41	f
204	12	Regular	41	f
205	13	Regular	41	f
207	15	Regular	41	f
212	1	Regular	42	f
213	2	Regular	42	f
214	3	Regular	42	f
218	7	Regular	42	f
219	8	Regular	42	f
220	9	Regular	42	f
221	10	Regular	42	f
222	11	Regular	42	f
224	13	Regular	42	f
226	15	Regular	42	f
228	1	Regular	43	f
229	2	Regular	43	f
232	5	Regular	43	f
235	8	Regular	43	f
236	9	Regular	43	f
237	10	Regular	43	f
238	11	Regular	43	f
239	12	Regular	43	f
240	13	Regular	43	f
243	16	Regular	43	f
244	17	Regular	43	f
255	9	Regular	44	f
256	10	Regular	44	f
257	11	Regular	44	f
258	12	Regular	44	f
260	14	Regular	44	f
268	8	VIP	45	f
269	9	VIP	45	f
270	10	VIP	45	f
272	12	VIP	45	f
273	1	Wheelchair	46	f
274	2	Wheelchair	46	f
275	3	Wheelchair	46	f
276	4	Wheelchair	46	f
277	5	Wheelchair	46	f
278	6	Wheelchair	46	f
279	7	Wheelchair	46	f
280	8	Wheelchair	46	f
281	1	VIP	47	f
282	2	VIP	47	f
283	3	VIP	47	f
284	4	VIP	47	f
285	5	VIP	47	f
127	3	Wheelchair	36	f
133	4	VIP	37	f
143	4	Regular	38	f
130	1	VIP	37	f
140	1	Regular	38	f
141	2	Regular	38	f
144	5	Regular	38	f
160	4	Regular	39	f
162	6	Regular	39	f
179	4	Regular	40	f
210	18	Regular	41	f
211	19	Regular	41	f
208	16	Regular	41	f
209	17	Regular	41	f
271	11	VIP	45	f
134	5	VIP	37	f
135	6	VIP	37	f
136	7	VIP	37	f
137	8	VIP	37	f
145	6	Regular	38	f
146	7	Regular	38	f
147	8	Regular	38	f
148	9	Regular	38	f
149	10	Regular	38	f
163	7	Regular	39	f
164	8	Regular	39	f
286	6	VIP	47	f
287	7	VIP	47	f
288	8	VIP	47	f
289	9	VIP	47	f
290	10	VIP	47	f
291	11	VIP	47	f
292	12	VIP	47	f
293	13	VIP	47	f
294	1	Regular	48	f
295	2	Regular	48	f
296	3	Regular	48	f
297	4	Regular	48	f
298	5	Regular	48	f
299	6	Regular	48	f
300	7	Regular	48	f
301	8	Regular	48	f
302	9	Regular	48	f
303	10	Regular	48	f
304	11	Regular	48	f
305	12	Regular	48	f
306	13	Regular	48	f
307	14	Regular	48	f
308	15	Regular	48	f
309	1	Regular	49	f
310	2	Regular	49	f
311	3	Regular	49	f
312	4	Regular	49	f
313	5	Regular	49	f
314	6	Regular	49	f
315	7	Regular	49	f
316	8	Regular	49	f
317	9	Regular	49	f
318	10	Regular	49	f
319	11	Regular	49	f
320	12	Regular	49	f
321	13	Regular	49	f
322	14	Regular	49	f
323	15	Regular	49	f
324	16	Regular	49	f
325	17	Regular	49	f
326	18	Regular	49	f
327	19	Regular	49	f
328	20	Regular	49	f
329	1	Regular	50	f
330	2	Regular	50	f
331	3	Regular	50	f
332	4	Regular	50	f
333	5	Regular	50	f
334	6	Regular	50	f
335	7	Regular	50	f
336	8	Regular	50	f
337	9	Regular	50	f
338	10	Regular	50	f
339	11	Regular	50	f
340	12	Regular	50	f
341	13	Regular	50	f
342	14	Regular	50	f
343	15	Regular	50	f
344	16	Regular	50	f
345	17	Regular	50	f
346	18	Regular	50	f
347	19	Regular	50	f
348	20	Regular	50	f
349	1	Regular	51	f
265	5	VIP	45	t
266	6	VIP	45	t
245	18	Regular	43	t
246	19	Regular	43	t
227	16	Regular	42	t
138	9	VIP	37	t
139	10	VIP	37	t
350	2	Regular	51	f
351	3	Regular	51	f
352	4	Regular	51	f
353	5	Regular	51	f
354	6	Regular	51	f
355	7	Regular	51	f
356	8	Regular	51	f
357	9	Regular	51	f
358	10	Regular	51	f
359	11	Regular	51	f
360	12	Regular	51	f
361	13	Regular	51	f
362	14	Regular	51	f
363	15	Regular	51	f
364	16	Regular	51	f
365	17	Regular	51	f
366	18	Regular	51	f
367	19	Regular	51	f
368	20	Regular	51	f
369	1	Regular	52	f
370	2	Regular	52	f
371	3	Regular	52	f
372	4	Regular	52	f
373	5	Regular	52	f
374	6	Regular	52	f
375	7	Regular	52	f
376	8	Regular	52	f
377	9	Regular	52	f
378	10	Regular	52	f
379	11	Regular	52	f
380	12	Regular	52	f
381	13	Regular	52	f
382	14	Regular	52	f
383	15	Regular	52	f
384	16	Regular	52	f
385	1	Regular	53	f
386	2	Regular	53	f
387	3	Regular	53	f
388	4	Regular	53	f
389	5	Regular	53	f
390	6	Regular	53	f
391	7	Regular	53	f
392	8	Regular	53	f
393	9	Regular	53	f
394	10	Regular	53	f
395	11	Regular	53	f
396	12	Regular	53	f
397	13	Regular	53	f
398	14	Regular	53	f
399	15	Regular	53	f
400	16	Regular	53	f
401	17	Regular	53	f
402	18	Regular	53	f
403	19	Regular	53	f
404	20	Regular	53	f
405	1	Regular	54	f
406	2	Regular	54	f
407	3	Regular	54	f
408	4	Regular	54	f
409	5	Regular	54	f
410	6	Regular	54	f
411	7	Regular	54	f
412	8	Regular	54	f
413	9	Regular	54	f
414	10	Regular	54	f
415	11	Regular	54	f
416	12	Regular	54	f
417	13	Regular	54	f
418	14	Regular	54	f
419	15	Regular	54	f
420	16	Regular	54	f
421	17	Regular	54	f
422	18	Regular	54	f
423	19	Regular	54	f
424	1	VIP	55	f
425	2	VIP	55	f
426	3	VIP	55	f
427	4	VIP	55	f
428	5	VIP	55	f
429	6	VIP	55	f
430	7	VIP	55	f
431	8	VIP	55	f
432	9	VIP	55	f
433	10	VIP	55	f
434	11	VIP	55	f
435	12	VIP	55	f
436	13	VIP	55	f
437	14	VIP	55	f
438	1	Wheelchair	56	f
439	2	Wheelchair	56	f
440	3	Wheelchair	56	f
441	4	Wheelchair	56	f
442	1	VIP	57	f
443	2	VIP	57	f
444	3	VIP	57	f
445	4	VIP	57	f
446	5	VIP	57	f
447	6	VIP	57	f
448	7	VIP	57	f
449	8	VIP	57	f
450	9	VIP	57	f
451	10	VIP	57	f
452	11	VIP	57	f
453	12	VIP	57	f
454	13	VIP	57	f
455	1	Regular	58	f
456	2	Regular	58	f
457	3	Regular	58	f
458	4	Regular	58	f
459	5	Regular	58	f
460	6	Regular	58	f
461	7	Regular	58	f
462	8	Regular	58	f
463	9	Regular	58	f
464	10	Regular	58	f
465	11	Regular	58	f
466	12	Regular	58	f
467	13	Regular	58	f
468	14	Regular	58	f
469	15	Regular	58	f
470	16	Regular	58	f
471	17	Regular	58	f
472	18	Regular	58	f
473	19	Regular	58	f
474	20	Regular	58	f
475	1	Regular	59	f
476	2	Regular	59	f
477	3	Regular	59	f
478	4	Regular	59	f
479	5	Regular	59	f
480	6	Regular	59	f
481	7	Regular	59	f
482	8	Regular	59	f
483	9	Regular	59	f
484	10	Regular	59	f
485	11	Regular	59	f
486	12	Regular	59	f
487	13	Regular	59	f
488	14	Regular	59	f
489	1	Regular	60	f
490	2	Regular	60	f
491	3	Regular	60	f
492	4	Regular	60	f
493	5	Regular	60	f
494	6	Regular	60	f
495	7	Regular	60	f
496	8	Regular	60	f
497	9	Regular	60	f
498	10	Regular	60	f
499	11	Regular	60	f
500	12	Regular	60	f
501	13	Regular	60	f
502	14	Regular	60	f
503	15	Regular	60	f
504	16	Regular	60	f
505	1	Regular	61	f
506	2	Regular	61	f
507	3	Regular	61	f
508	4	Regular	61	f
509	5	Regular	61	f
510	6	Regular	61	f
511	7	Regular	61	f
512	8	Regular	61	f
513	9	Regular	61	f
514	10	Regular	61	f
515	11	Regular	61	f
516	12	Regular	61	f
517	13	Regular	61	f
518	14	Regular	61	f
519	15	Regular	61	f
520	1	Regular	62	f
521	2	Regular	62	f
522	3	Regular	62	f
523	4	Regular	62	f
524	5	Regular	62	f
525	6	Regular	62	f
526	7	Regular	62	f
527	8	Regular	62	f
528	9	Regular	62	f
529	10	Regular	62	f
530	11	Regular	62	f
531	12	Regular	62	f
532	13	Regular	62	f
533	14	Regular	62	f
534	15	Regular	62	f
535	1	Regular	63	f
536	2	Regular	63	f
537	3	Regular	63	f
538	4	Regular	63	f
539	5	Regular	63	f
540	6	Regular	63	f
541	7	Regular	63	f
542	8	Regular	63	f
543	9	Regular	63	f
544	10	Regular	63	f
545	11	Regular	63	f
546	12	Regular	63	f
547	13	Regular	63	f
548	14	Regular	63	f
549	15	Regular	63	f
550	16	Regular	63	f
551	17	Regular	63	f
552	18	Regular	63	f
553	1	Regular	64	f
554	2	Regular	64	f
555	3	Regular	64	f
556	4	Regular	64	f
557	5	Regular	64	f
558	6	Regular	64	f
559	7	Regular	64	f
560	8	Regular	64	f
561	9	Regular	64	f
562	10	Regular	64	f
563	11	Regular	64	f
564	12	Regular	64	f
565	13	Regular	64	f
566	14	Regular	64	f
567	15	Regular	64	f
568	16	Regular	64	f
569	17	Regular	64	f
570	18	Regular	64	f
571	19	Regular	64	f
572	1	VIP	65	f
573	2	VIP	65	f
574	3	VIP	65	f
575	4	VIP	65	f
576	5	VIP	65	f
577	6	VIP	65	f
578	7	VIP	65	f
579	8	VIP	65	f
580	9	VIP	65	f
581	10	VIP	65	f
582	11	VIP	65	f
583	12	VIP	65	f
584	13	VIP	65	f
585	14	VIP	65	f
586	1	Wheelchair	66	f
587	2	Wheelchair	66	f
588	3	Wheelchair	66	f
589	4	Wheelchair	66	f
590	5	Wheelchair	66	f
591	6	Wheelchair	66	f
592	7	Wheelchair	66	f
593	1	VIP	67	f
594	2	VIP	67	f
595	3	VIP	67	f
596	4	VIP	67	f
597	5	VIP	67	f
598	6	VIP	67	f
599	7	VIP	67	f
600	8	VIP	67	f
601	9	VIP	67	f
602	10	VIP	67	f
603	11	VIP	67	f
604	12	VIP	67	f
605	1	Regular	68	f
606	2	Regular	68	f
607	3	Regular	68	f
608	4	Regular	68	f
609	5	Regular	68	f
610	6	Regular	68	f
611	7	Regular	68	f
612	8	Regular	68	f
613	9	Regular	68	f
614	10	Regular	68	f
615	11	Regular	68	f
616	12	Regular	68	f
617	13	Regular	68	f
618	14	Regular	68	f
619	15	Regular	68	f
620	1	Regular	69	f
621	2	Regular	69	f
622	3	Regular	69	f
623	4	Regular	69	f
624	5	Regular	69	f
625	6	Regular	69	f
626	7	Regular	69	f
627	8	Regular	69	f
628	9	Regular	69	f
629	10	Regular	69	f
630	11	Regular	69	f
631	12	Regular	69	f
632	13	Regular	69	f
633	14	Regular	69	f
634	15	Regular	69	f
635	16	Regular	69	f
636	17	Regular	69	f
637	1	Regular	70	f
638	2	Regular	70	f
639	3	Regular	70	f
640	4	Regular	70	f
641	5	Regular	70	f
642	6	Regular	70	f
643	7	Regular	70	f
644	8	Regular	70	f
645	9	Regular	70	f
646	10	Regular	70	f
647	11	Regular	70	f
648	12	Regular	70	f
649	13	Regular	70	f
650	14	Regular	70	f
651	15	Regular	70	f
652	16	Regular	70	f
653	17	Regular	70	f
654	18	Regular	70	f
655	19	Regular	70	f
656	20	Regular	70	f
657	1	Regular	71	f
658	2	Regular	71	f
659	3	Regular	71	f
660	4	Regular	71	f
661	5	Regular	71	f
662	6	Regular	71	f
663	7	Regular	71	f
664	8	Regular	71	f
665	9	Regular	71	f
666	10	Regular	71	f
667	11	Regular	71	f
668	12	Regular	71	f
669	13	Regular	71	f
670	14	Regular	71	f
671	15	Regular	71	f
672	16	Regular	71	f
673	17	Regular	71	f
674	18	Regular	71	f
675	19	Regular	71	f
676	20	Regular	71	f
677	1	Regular	72	f
678	2	Regular	72	f
679	3	Regular	72	f
680	4	Regular	72	f
681	5	Regular	72	f
682	6	Regular	72	f
683	7	Regular	72	f
684	8	Regular	72	f
685	9	Regular	72	f
686	10	Regular	72	f
687	11	Regular	72	f
688	12	Regular	72	f
689	13	Regular	72	f
690	14	Regular	72	f
691	15	Regular	72	f
692	16	Regular	72	f
693	17	Regular	72	f
694	18	Regular	72	f
695	1	Regular	73	f
696	2	Regular	73	f
697	3	Regular	73	f
698	4	Regular	73	f
699	5	Regular	73	f
700	6	Regular	73	f
701	7	Regular	73	f
702	8	Regular	73	f
703	9	Regular	73	f
704	10	Regular	73	f
705	11	Regular	73	f
706	12	Regular	73	f
707	13	Regular	73	f
708	14	Regular	73	f
709	15	Regular	73	f
710	16	Regular	73	f
711	1	Regular	74	f
712	2	Regular	74	f
713	3	Regular	74	f
714	4	Regular	74	f
715	5	Regular	74	f
716	6	Regular	74	f
717	7	Regular	74	f
718	8	Regular	74	f
719	9	Regular	74	f
720	10	Regular	74	f
721	11	Regular	74	f
722	12	Regular	74	f
723	13	Regular	74	f
724	14	Regular	74	f
725	15	Regular	74	f
726	16	Regular	74	f
727	17	Regular	74	f
728	18	Regular	74	f
729	19	Regular	74	f
730	20	Regular	74	f
731	1	Regular	75	f
732	2	Regular	75	f
733	3	Regular	75	f
734	4	Regular	75	f
735	5	Regular	75	f
736	6	Regular	75	f
737	7	Regular	75	f
738	8	Regular	75	f
739	9	Regular	75	f
740	10	Regular	75	f
741	11	Regular	75	f
742	12	Regular	75	f
743	13	Regular	75	f
744	14	Regular	75	f
745	15	Regular	75	f
746	16	Regular	75	f
747	17	Regular	75	f
748	18	Regular	75	f
749	19	Regular	75	f
750	1	Regular	76	f
751	2	Regular	76	f
752	3	Regular	76	f
753	4	Regular	76	f
754	5	Regular	76	f
755	6	Regular	76	f
756	7	Regular	76	f
757	8	Regular	76	f
758	9	Regular	76	f
759	10	Regular	76	f
760	11	Regular	76	f
761	12	Regular	76	f
762	13	Regular	76	f
763	14	Regular	76	f
764	15	Regular	76	f
765	1	Regular	77	f
766	2	Regular	77	f
767	3	Regular	77	f
768	4	Regular	77	f
769	5	Regular	77	f
770	6	Regular	77	f
771	7	Regular	77	f
772	8	Regular	77	f
773	9	Regular	77	f
774	10	Regular	77	f
775	11	Regular	77	f
776	12	Regular	77	f
777	13	Regular	77	f
778	14	Regular	77	f
779	15	Regular	77	f
780	16	Regular	77	f
781	1	Regular	78	f
782	2	Regular	78	f
783	3	Regular	78	f
784	4	Regular	78	f
785	5	Regular	78	f
786	6	Regular	78	f
787	7	Regular	78	f
788	8	Regular	78	f
789	9	Regular	78	f
790	10	Regular	78	f
791	11	Regular	78	f
792	12	Regular	78	f
793	13	Regular	78	f
794	14	Regular	78	f
795	15	Regular	78	f
796	16	Regular	78	f
797	17	Regular	78	f
798	18	Regular	78	f
799	19	Regular	78	f
800	20	Regular	78	f
801	1	VIP	79	f
802	2	VIP	79	f
803	3	VIP	79	f
804	4	VIP	79	f
805	5	VIP	79	f
806	6	VIP	79	f
807	7	VIP	79	f
808	8	VIP	79	f
809	9	VIP	79	f
810	10	VIP	79	f
811	11	VIP	79	f
812	12	VIP	79	f
813	13	VIP	79	f
814	14	VIP	79	f
815	1	Wheelchair	80	f
816	2	Wheelchair	80	f
817	3	Wheelchair	80	f
818	4	Wheelchair	80	f
819	5	Wheelchair	80	f
820	6	Wheelchair	80	f
821	7	Wheelchair	80	f
822	8	Wheelchair	80	f
823	1	VIP	81	f
824	2	VIP	81	f
825	3	VIP	81	f
826	4	VIP	81	f
827	5	VIP	81	f
828	6	VIP	81	f
829	7	VIP	81	f
830	8	VIP	81	f
831	9	VIP	81	f
832	10	VIP	81	f
833	11	VIP	81	f
834	12	VIP	81	f
835	13	VIP	81	f
836	1	Regular	82	f
837	2	Regular	82	f
838	3	Regular	82	f
839	4	Regular	82	f
840	5	Regular	82	f
841	6	Regular	82	f
842	7	Regular	82	f
843	8	Regular	82	f
844	9	Regular	82	f
845	10	Regular	82	f
846	11	Regular	82	f
847	12	Regular	82	f
848	13	Regular	82	f
849	14	Regular	82	f
850	15	Regular	82	f
851	16	Regular	82	f
852	17	Regular	82	f
853	18	Regular	82	f
854	19	Regular	82	f
855	1	Regular	83	f
856	2	Regular	83	f
857	3	Regular	83	f
858	4	Regular	83	f
859	5	Regular	83	f
860	6	Regular	83	f
861	7	Regular	83	f
862	8	Regular	83	f
863	9	Regular	83	f
864	10	Regular	83	f
865	11	Regular	83	f
866	12	Regular	83	f
867	13	Regular	83	f
868	14	Regular	83	f
869	15	Regular	83	f
870	16	Regular	83	f
871	1	Regular	84	f
872	2	Regular	84	f
873	3	Regular	84	f
874	4	Regular	84	f
875	5	Regular	84	f
876	6	Regular	84	f
877	7	Regular	84	f
878	8	Regular	84	f
879	9	Regular	84	f
880	10	Regular	84	f
881	11	Regular	84	f
882	12	Regular	84	f
883	13	Regular	84	f
884	14	Regular	84	f
885	15	Regular	84	f
886	1	Regular	85	f
887	2	Regular	85	f
888	3	Regular	85	f
889	4	Regular	85	f
890	5	Regular	85	f
891	6	Regular	85	f
892	7	Regular	85	f
893	8	Regular	85	f
894	9	Regular	85	f
895	10	Regular	85	f
896	11	Regular	85	f
897	12	Regular	85	f
898	13	Regular	85	f
899	14	Regular	85	f
900	15	Regular	85	f
901	16	Regular	85	f
902	17	Regular	85	f
903	18	Regular	85	f
904	19	Regular	85	f
905	1	Regular	86	f
906	2	Regular	86	f
907	3	Regular	86	f
908	4	Regular	86	f
909	5	Regular	86	f
910	6	Regular	86	f
911	7	Regular	86	f
912	8	Regular	86	f
913	9	Regular	86	f
914	10	Regular	86	f
915	11	Regular	86	f
916	12	Regular	86	f
917	13	Regular	86	f
918	14	Regular	86	f
919	15	Regular	86	f
920	16	Regular	86	f
921	17	Regular	86	f
922	18	Regular	86	f
923	1	Regular	87	f
924	2	Regular	87	f
925	3	Regular	87	f
926	4	Regular	87	f
927	5	Regular	87	f
928	6	Regular	87	f
929	7	Regular	87	f
930	8	Regular	87	f
931	9	Regular	87	f
932	10	Regular	87	f
933	11	Regular	87	f
934	12	Regular	87	f
935	13	Regular	87	f
936	14	Regular	87	f
937	15	Regular	87	f
938	16	Regular	87	f
939	17	Regular	87	f
940	18	Regular	87	f
941	1	Regular	88	f
942	2	Regular	88	f
943	3	Regular	88	f
944	4	Regular	88	f
945	5	Regular	88	f
946	6	Regular	88	f
947	7	Regular	88	f
948	8	Regular	88	f
949	9	Regular	88	f
950	10	Regular	88	f
951	11	Regular	88	f
952	12	Regular	88	f
953	13	Regular	88	f
954	14	Regular	88	f
955	15	Regular	88	f
956	16	Regular	88	f
957	1	Regular	89	f
958	2	Regular	89	f
959	3	Regular	89	f
960	4	Regular	89	f
961	5	Regular	89	f
962	6	Regular	89	f
963	7	Regular	89	f
964	8	Regular	89	f
965	9	Regular	89	f
966	10	Regular	89	f
967	11	Regular	89	f
968	12	Regular	89	f
969	13	Regular	89	f
970	14	Regular	89	f
971	15	Regular	89	f
972	16	Regular	89	f
973	17	Regular	89	f
974	18	Regular	89	f
975	1	VIP	90	f
976	2	VIP	90	f
977	3	VIP	90	f
978	4	VIP	90	f
979	5	VIP	90	f
980	6	VIP	90	f
981	7	VIP	90	f
982	8	VIP	90	f
983	9	VIP	90	f
984	10	VIP	90	f
985	11	VIP	90	f
986	12	VIP	90	f
987	1	Wheelchair	91	f
988	2	Wheelchair	91	f
989	3	Wheelchair	91	f
990	4	Wheelchair	91	f
991	5	Wheelchair	91	f
992	6	Wheelchair	91	f
993	1	VIP	92	f
994	2	VIP	92	f
995	3	VIP	92	f
996	4	VIP	92	f
997	5	VIP	92	f
998	6	VIP	92	f
999	7	VIP	92	f
1000	8	VIP	92	f
1001	9	VIP	92	f
1002	10	VIP	92	f
1003	11	VIP	92	f
1004	12	VIP	92	f
1005	13	VIP	92	f
1006	14	VIP	92	f
1007	1	Regular	93	f
1008	2	Regular	93	f
1009	3	Regular	93	f
1010	4	Regular	93	f
1011	5	Regular	93	f
1012	6	Regular	93	f
1013	7	Regular	93	f
1014	8	Regular	93	f
1015	9	Regular	93	f
1016	10	Regular	93	f
1017	11	Regular	93	f
1018	12	Regular	93	f
1019	13	Regular	93	f
1020	14	Regular	93	f
1021	1	Regular	94	f
1022	2	Regular	94	f
1023	3	Regular	94	f
1024	4	Regular	94	f
1025	5	Regular	94	f
1026	6	Regular	94	f
1027	7	Regular	94	f
1028	8	Regular	94	f
1029	9	Regular	94	f
1030	10	Regular	94	f
1031	11	Regular	94	f
1032	12	Regular	94	f
1033	13	Regular	94	f
1034	14	Regular	94	f
1035	15	Regular	94	f
1036	16	Regular	94	f
1037	17	Regular	94	f
1038	18	Regular	94	f
1039	1	Regular	95	f
1040	2	Regular	95	f
1041	3	Regular	95	f
1042	4	Regular	95	f
1043	5	Regular	95	f
1044	6	Regular	95	f
1045	7	Regular	95	f
1046	8	Regular	95	f
1047	9	Regular	95	f
1048	10	Regular	95	f
1049	11	Regular	95	f
1050	12	Regular	95	f
1051	13	Regular	95	f
1052	14	Regular	95	f
1053	1	Regular	96	f
1054	2	Regular	96	f
1055	3	Regular	96	f
1056	4	Regular	96	f
1057	5	Regular	96	f
1058	6	Regular	96	f
1059	7	Regular	96	f
1060	8	Regular	96	f
1061	9	Regular	96	f
1062	10	Regular	96	f
1063	11	Regular	96	f
1064	12	Regular	96	f
1065	13	Regular	96	f
1066	14	Regular	96	f
1067	15	Regular	96	f
1068	16	Regular	96	f
1069	17	Regular	96	f
1070	18	Regular	96	f
1071	1	Regular	97	f
1072	2	Regular	97	f
1073	3	Regular	97	f
1074	4	Regular	97	f
1075	5	Regular	97	f
1076	6	Regular	97	f
1077	7	Regular	97	f
1078	8	Regular	97	f
1079	9	Regular	97	f
1080	10	Regular	97	f
1081	11	Regular	97	f
1082	12	Regular	97	f
1083	13	Regular	97	f
1084	14	Regular	97	f
1085	15	Regular	97	f
1086	16	Regular	97	f
1087	17	Regular	97	f
1088	1	Regular	98	f
1089	2	Regular	98	f
1090	3	Regular	98	f
1091	4	Regular	98	f
1092	5	Regular	98	f
1093	6	Regular	98	f
1094	7	Regular	98	f
1095	8	Regular	98	f
1096	9	Regular	98	f
1097	10	Regular	98	f
1098	11	Regular	98	f
1099	12	Regular	98	f
1100	13	Regular	98	f
1101	14	Regular	98	f
1102	15	Regular	98	f
1103	16	Regular	98	f
1104	1	Regular	99	f
1105	2	Regular	99	f
1106	3	Regular	99	f
1107	4	Regular	99	f
1108	5	Regular	99	f
1109	6	Regular	99	f
1110	7	Regular	99	f
1111	8	Regular	99	f
1112	9	Regular	99	f
1113	10	Regular	99	f
1114	11	Regular	99	f
1115	12	Regular	99	f
1116	13	Regular	99	f
1117	14	Regular	99	f
1118	15	Regular	99	f
1119	16	Regular	99	f
1120	17	Regular	99	f
1121	1	VIP	100	f
1122	2	VIP	100	f
1123	3	VIP	100	f
1124	4	VIP	100	f
1125	5	VIP	100	f
1126	6	VIP	100	f
1127	7	VIP	100	f
1128	8	VIP	100	f
1129	9	VIP	100	f
1130	10	VIP	100	f
1131	11	VIP	100	f
1132	12	VIP	100	f
1133	1	Wheelchair	101	f
1134	2	Wheelchair	101	f
1135	3	Wheelchair	101	f
1136	4	Wheelchair	101	f
1137	5	Wheelchair	101	f
1138	6	Wheelchair	101	f
1139	7	Wheelchair	101	f
1140	8	Wheelchair	101	f
1141	1	VIP	102	f
1142	2	VIP	102	f
1143	3	VIP	102	f
1144	4	VIP	102	f
1145	5	VIP	102	f
1146	6	VIP	102	f
1147	7	VIP	102	f
1148	8	VIP	102	f
1149	9	VIP	102	f
1150	10	VIP	102	f
1151	11	VIP	102	f
1152	12	VIP	102	f
1153	1	Regular	103	f
1154	2	Regular	103	f
1155	3	Regular	103	f
1156	4	Regular	103	f
1157	5	Regular	103	f
1158	6	Regular	103	f
1159	7	Regular	103	f
1160	8	Regular	103	f
1161	9	Regular	103	f
1162	10	Regular	103	f
1163	11	Regular	103	f
1164	12	Regular	103	f
1165	13	Regular	103	f
1166	14	Regular	103	f
1167	1	Regular	104	f
1168	2	Regular	104	f
1169	3	Regular	104	f
1170	4	Regular	104	f
1171	5	Regular	104	f
1172	6	Regular	104	f
1173	7	Regular	104	f
1174	8	Regular	104	f
1175	9	Regular	104	f
1176	10	Regular	104	f
1177	11	Regular	104	f
1178	12	Regular	104	f
1179	13	Regular	104	f
1180	14	Regular	104	f
1181	15	Regular	104	f
1182	16	Regular	104	f
1183	1	Regular	105	f
1184	2	Regular	105	f
1185	3	Regular	105	f
1186	4	Regular	105	f
1187	5	Regular	105	f
1188	6	Regular	105	f
1189	7	Regular	105	f
1190	8	Regular	105	f
1191	9	Regular	105	f
1192	10	Regular	105	f
1193	11	Regular	105	f
1194	12	Regular	105	f
1195	13	Regular	105	f
1196	14	Regular	105	f
1197	15	Regular	105	f
1198	16	Regular	105	f
1199	1	Regular	106	f
1200	2	Regular	106	f
1201	3	Regular	106	f
1202	4	Regular	106	f
1203	5	Regular	106	f
1204	6	Regular	106	f
1205	7	Regular	106	f
1206	8	Regular	106	f
1207	9	Regular	106	f
1208	10	Regular	106	f
1209	11	Regular	106	f
1210	12	Regular	106	f
1211	13	Regular	106	f
1212	14	Regular	106	f
1213	15	Regular	106	f
1214	16	Regular	106	f
1215	17	Regular	106	f
1216	18	Regular	106	f
1217	19	Regular	106	f
1218	1	Regular	107	f
1219	2	Regular	107	f
1220	3	Regular	107	f
1221	4	Regular	107	f
1222	5	Regular	107	f
1223	6	Regular	107	f
1224	7	Regular	107	f
1225	8	Regular	107	f
1226	9	Regular	107	f
1227	10	Regular	107	f
1228	11	Regular	107	f
1229	12	Regular	107	f
1230	13	Regular	107	f
1231	14	Regular	107	f
1232	15	Regular	107	f
1233	1	Regular	108	f
1234	2	Regular	108	f
1235	3	Regular	108	f
1236	4	Regular	108	f
1237	5	Regular	108	f
1238	6	Regular	108	f
1239	7	Regular	108	f
1240	8	Regular	108	f
1241	9	Regular	108	f
1242	10	Regular	108	f
1243	11	Regular	108	f
1244	12	Regular	108	f
1245	13	Regular	108	f
1246	14	Regular	108	f
1247	15	Regular	108	f
1248	16	Regular	108	f
1249	17	Regular	108	f
1250	1	Regular	109	f
1251	2	Regular	109	f
1252	3	Regular	109	f
1253	4	Regular	109	f
1254	5	Regular	109	f
1255	6	Regular	109	f
1256	7	Regular	109	f
1257	8	Regular	109	f
1258	9	Regular	109	f
1259	10	Regular	109	f
1260	11	Regular	109	f
1261	12	Regular	109	f
1262	13	Regular	109	f
1263	14	Regular	109	f
1264	15	Regular	109	f
1265	16	Regular	109	f
1266	17	Regular	109	f
1267	18	Regular	109	f
1268	19	Regular	109	f
1269	1	Regular	110	f
1270	2	Regular	110	f
1271	3	Regular	110	f
1272	4	Regular	110	f
1273	5	Regular	110	f
1274	6	Regular	110	f
1275	7	Regular	110	f
1276	8	Regular	110	f
1277	9	Regular	110	f
1278	10	Regular	110	f
1279	11	Regular	110	f
1280	12	Regular	110	f
1281	13	Regular	110	f
1282	14	Regular	110	f
1283	15	Regular	110	f
1284	1	Regular	111	f
1285	2	Regular	111	f
1286	3	Regular	111	f
1287	4	Regular	111	f
1288	5	Regular	111	f
1289	6	Regular	111	f
1290	7	Regular	111	f
1291	8	Regular	111	f
1292	9	Regular	111	f
1293	10	Regular	111	f
1294	11	Regular	111	f
1295	12	Regular	111	f
1296	13	Regular	111	f
1297	14	Regular	111	f
1298	15	Regular	111	f
1299	16	Regular	111	f
1300	17	Regular	111	f
1301	18	Regular	111	f
1302	19	Regular	111	f
1303	20	Regular	111	f
1304	1	Regular	112	f
1305	2	Regular	112	f
1306	3	Regular	112	f
1307	4	Regular	112	f
1308	5	Regular	112	f
1309	6	Regular	112	f
1310	7	Regular	112	f
1311	8	Regular	112	f
1312	9	Regular	112	f
1313	10	Regular	112	f
1314	11	Regular	112	f
1315	12	Regular	112	f
1316	13	Regular	112	f
1317	14	Regular	112	f
1318	15	Regular	112	f
1319	16	Regular	112	f
1320	1	Regular	113	f
1321	2	Regular	113	f
1322	3	Regular	113	f
1323	4	Regular	113	f
1324	5	Regular	113	f
1325	6	Regular	113	f
1326	7	Regular	113	f
1327	8	Regular	113	f
1328	9	Regular	113	f
1329	10	Regular	113	f
1330	11	Regular	113	f
1331	12	Regular	113	f
1332	13	Regular	113	f
1333	14	Regular	113	f
1334	15	Regular	113	f
1335	16	Regular	113	f
1336	17	Regular	113	f
1337	18	Regular	113	f
1338	19	Regular	113	f
1339	1	VIP	114	f
1340	2	VIP	114	f
1341	3	VIP	114	f
1342	4	VIP	114	f
1343	5	VIP	114	f
1344	6	VIP	114	f
1345	7	VIP	114	f
1346	8	VIP	114	f
1347	9	VIP	114	f
1348	10	VIP	114	f
1349	11	VIP	114	f
1350	12	VIP	114	f
1351	1	Wheelchair	115	f
1352	2	Wheelchair	115	f
1353	3	Wheelchair	115	f
1354	4	Wheelchair	115	f
1355	5	Wheelchair	115	f
1356	1	VIP	116	f
1357	2	VIP	116	f
1358	3	VIP	116	f
1359	4	VIP	116	f
1360	5	VIP	116	f
1361	6	VIP	116	f
1362	7	VIP	116	f
1363	8	VIP	116	f
1364	9	VIP	116	f
1365	10	VIP	116	f
1366	11	VIP	116	f
1367	1	Regular	117	f
1368	2	Regular	117	f
1369	3	Regular	117	f
1370	4	Regular	117	f
1371	5	Regular	117	f
1372	6	Regular	117	f
1373	7	Regular	117	f
1374	8	Regular	117	f
1375	9	Regular	117	f
1376	10	Regular	117	f
1377	11	Regular	117	f
1378	12	Regular	117	f
1379	13	Regular	117	f
1380	14	Regular	117	f
1381	15	Regular	117	f
1382	16	Regular	117	f
1383	17	Regular	117	f
1384	18	Regular	117	f
1385	1	Regular	118	f
1386	2	Regular	118	f
1387	3	Regular	118	f
1388	4	Regular	118	f
1389	5	Regular	118	f
1390	6	Regular	118	f
1391	7	Regular	118	f
1392	8	Regular	118	f
1393	9	Regular	118	f
1394	10	Regular	118	f
1395	11	Regular	118	f
1396	12	Regular	118	f
1397	13	Regular	118	f
1398	14	Regular	118	f
1399	15	Regular	118	f
1400	16	Regular	118	f
1401	17	Regular	118	f
1402	1	Regular	119	f
1403	2	Regular	119	f
1404	3	Regular	119	f
1405	4	Regular	119	f
1406	5	Regular	119	f
1407	6	Regular	119	f
1408	7	Regular	119	f
1409	8	Regular	119	f
1410	9	Regular	119	f
1411	10	Regular	119	f
1412	11	Regular	119	f
1413	12	Regular	119	f
1414	13	Regular	119	f
1415	14	Regular	119	f
1416	15	Regular	119	f
1417	16	Regular	119	f
1418	17	Regular	119	f
1419	18	Regular	119	f
1420	19	Regular	119	f
1421	1	Regular	120	f
1422	2	Regular	120	f
1423	3	Regular	120	f
1424	4	Regular	120	f
1425	5	Regular	120	f
1426	6	Regular	120	f
1427	7	Regular	120	f
1428	8	Regular	120	f
1429	9	Regular	120	f
1430	10	Regular	120	f
1431	11	Regular	120	f
1432	12	Regular	120	f
1433	13	Regular	120	f
1434	14	Regular	120	f
1435	15	Regular	120	f
1436	16	Regular	120	f
1437	17	Regular	120	f
1438	18	Regular	120	f
1439	19	Regular	120	f
1440	1	Regular	121	f
1441	2	Regular	121	f
1442	3	Regular	121	f
1443	4	Regular	121	f
1444	5	Regular	121	f
1445	6	Regular	121	f
1446	7	Regular	121	f
1447	8	Regular	121	f
1448	9	Regular	121	f
1449	10	Regular	121	f
1450	11	Regular	121	f
1451	12	Regular	121	f
1452	13	Regular	121	f
1453	14	Regular	121	f
1454	15	Regular	121	f
1455	16	Regular	121	f
1456	17	Regular	121	f
1457	18	Regular	121	f
1458	1	Regular	122	f
1459	2	Regular	122	f
1460	3	Regular	122	f
1461	4	Regular	122	f
1462	5	Regular	122	f
1463	6	Regular	122	f
1464	7	Regular	122	f
1465	8	Regular	122	f
1466	9	Regular	122	f
1467	10	Regular	122	f
1468	11	Regular	122	f
1469	12	Regular	122	f
1470	13	Regular	122	f
1471	14	Regular	122	f
1472	15	Regular	122	f
1473	16	Regular	122	f
1474	17	Regular	122	f
1475	18	Regular	122	f
1476	19	Regular	122	f
1477	1	Regular	123	f
1478	2	Regular	123	f
1479	3	Regular	123	f
1480	4	Regular	123	f
1481	5	Regular	123	f
1482	6	Regular	123	f
1483	7	Regular	123	f
1484	8	Regular	123	f
1485	9	Regular	123	f
1486	10	Regular	123	f
1487	11	Regular	123	f
1488	12	Regular	123	f
1489	13	Regular	123	f
1490	14	Regular	123	f
1491	15	Regular	123	f
1492	16	Regular	123	f
1493	17	Regular	123	f
1494	18	Regular	123	f
1495	19	Regular	123	f
1496	1	Regular	124	f
1497	2	Regular	124	f
1498	3	Regular	124	f
1499	4	Regular	124	f
1500	5	Regular	124	f
1501	6	Regular	124	f
1502	7	Regular	124	f
1503	8	Regular	124	f
1504	9	Regular	124	f
1505	10	Regular	124	f
1506	11	Regular	124	f
1507	12	Regular	124	f
1508	13	Regular	124	f
1509	14	Regular	124	f
1510	15	Regular	124	f
1511	16	Regular	124	f
1512	17	Regular	124	f
1513	18	Regular	124	f
1514	19	Regular	124	f
1515	1	Regular	125	f
1516	2	Regular	125	f
1517	3	Regular	125	f
1518	4	Regular	125	f
1519	5	Regular	125	f
1520	6	Regular	125	f
1521	7	Regular	125	f
1522	8	Regular	125	f
1523	9	Regular	125	f
1524	10	Regular	125	f
1525	11	Regular	125	f
1526	12	Regular	125	f
1527	13	Regular	125	f
1528	14	Regular	125	f
1529	15	Regular	125	f
1530	1	VIP	126	f
1531	2	VIP	126	f
1532	3	VIP	126	f
1533	4	VIP	126	f
1534	5	VIP	126	f
1535	6	VIP	126	f
1536	7	VIP	126	f
1537	8	VIP	126	f
1538	9	VIP	126	f
1539	10	VIP	126	f
1540	11	VIP	126	f
1541	1	Wheelchair	127	f
1542	2	Wheelchair	127	f
1543	3	Wheelchair	127	f
1544	4	Wheelchair	127	f
1545	5	Wheelchair	127	f
1546	6	Wheelchair	127	f
1547	7	Wheelchair	127	f
1548	8	Wheelchair	127	f
1549	1	VIP	128	f
1550	2	VIP	128	f
1551	3	VIP	128	f
1552	4	VIP	128	f
1553	5	VIP	128	f
1554	6	VIP	128	f
1555	7	VIP	128	f
1556	8	VIP	128	f
1557	9	VIP	128	f
1558	10	VIP	128	f
1559	11	VIP	128	f
1560	12	VIP	128	f
1561	1	Regular	129	f
1562	2	Regular	129	f
1563	3	Regular	129	f
1564	4	Regular	129	f
1565	5	Regular	129	f
1566	6	Regular	129	f
1567	7	Regular	129	f
1568	8	Regular	129	f
1569	9	Regular	129	f
1570	10	Regular	129	f
1571	11	Regular	129	f
1572	12	Regular	129	f
1573	13	Regular	129	f
1574	14	Regular	129	f
1575	1	Regular	130	f
1576	2	Regular	130	f
1577	3	Regular	130	f
1578	4	Regular	130	f
1579	5	Regular	130	f
1580	6	Regular	130	f
1581	7	Regular	130	f
1582	8	Regular	130	f
1583	9	Regular	130	f
1584	10	Regular	130	f
1585	11	Regular	130	f
1586	12	Regular	130	f
1587	13	Regular	130	f
1588	14	Regular	130	f
1589	15	Regular	130	f
1590	1	Regular	131	f
1591	2	Regular	131	f
1592	3	Regular	131	f
1593	4	Regular	131	f
1594	5	Regular	131	f
1595	6	Regular	131	f
1596	7	Regular	131	f
1597	8	Regular	131	f
1598	9	Regular	131	f
1599	10	Regular	131	f
1600	11	Regular	131	f
1601	12	Regular	131	f
1602	13	Regular	131	f
1603	14	Regular	131	f
1604	15	Regular	131	f
1605	16	Regular	131	f
1606	17	Regular	131	f
1607	18	Regular	131	f
1608	19	Regular	131	f
1609	20	Regular	131	f
1610	1	Regular	132	f
1611	2	Regular	132	f
1612	3	Regular	132	f
1613	4	Regular	132	f
1614	5	Regular	132	f
1615	6	Regular	132	f
1616	7	Regular	132	f
1617	8	Regular	132	f
1618	9	Regular	132	f
1619	10	Regular	132	f
1620	11	Regular	132	f
1621	12	Regular	132	f
1622	13	Regular	132	f
1623	14	Regular	132	f
1624	15	Regular	132	f
1625	16	Regular	132	f
1626	1	Regular	133	f
1627	2	Regular	133	f
1628	3	Regular	133	f
1629	4	Regular	133	f
1630	5	Regular	133	f
1631	6	Regular	133	f
1632	7	Regular	133	f
1633	8	Regular	133	f
1634	9	Regular	133	f
1635	10	Regular	133	f
1636	11	Regular	133	f
1637	12	Regular	133	f
1638	13	Regular	133	f
1639	14	Regular	133	f
1640	15	Regular	133	f
1641	1	Regular	134	f
1642	2	Regular	134	f
1643	3	Regular	134	f
1644	4	Regular	134	f
1645	5	Regular	134	f
1646	6	Regular	134	f
1647	7	Regular	134	f
1648	8	Regular	134	f
1649	9	Regular	134	f
1650	10	Regular	134	f
1651	11	Regular	134	f
1652	12	Regular	134	f
1653	13	Regular	134	f
1654	14	Regular	134	f
1655	15	Regular	134	f
1656	16	Regular	134	f
1657	17	Regular	134	f
1658	18	Regular	134	f
1659	19	Regular	134	f
1660	1	Regular	135	f
1661	2	Regular	135	f
1662	3	Regular	135	f
1663	4	Regular	135	f
1664	5	Regular	135	f
1665	6	Regular	135	f
1666	7	Regular	135	f
1667	8	Regular	135	f
1668	9	Regular	135	f
1669	10	Regular	135	f
1670	11	Regular	135	f
1671	12	Regular	135	f
1672	13	Regular	135	f
1673	14	Regular	135	f
1674	15	Regular	135	f
1675	16	Regular	135	f
1676	1	Regular	136	f
1677	2	Regular	136	f
1678	3	Regular	136	f
1679	4	Regular	136	f
1680	5	Regular	136	f
1681	6	Regular	136	f
1682	7	Regular	136	f
1683	8	Regular	136	f
1684	9	Regular	136	f
1685	10	Regular	136	f
1686	11	Regular	136	f
1687	12	Regular	136	f
1688	13	Regular	136	f
1689	14	Regular	136	f
1690	15	Regular	136	f
1691	16	Regular	136	f
1692	17	Regular	136	f
1693	18	Regular	136	f
1694	19	Regular	136	f
1695	1	Regular	137	f
1696	2	Regular	137	f
1697	3	Regular	137	f
1698	4	Regular	137	f
1699	5	Regular	137	f
1700	6	Regular	137	f
1701	7	Regular	137	f
1702	8	Regular	137	f
1703	9	Regular	137	f
1704	10	Regular	137	f
1705	11	Regular	137	f
1706	12	Regular	137	f
1707	13	Regular	137	f
1708	14	Regular	137	f
1709	15	Regular	137	f
1710	1	VIP	138	f
1711	2	VIP	138	f
1712	3	VIP	138	f
1713	4	VIP	138	f
1714	5	VIP	138	f
1715	6	VIP	138	f
1716	7	VIP	138	f
1717	8	VIP	138	f
1718	9	VIP	138	f
1719	10	VIP	138	f
1720	11	VIP	138	f
1721	12	VIP	138	f
1722	13	VIP	138	f
1723	14	VIP	138	f
1724	1	Wheelchair	139	f
1725	2	Wheelchair	139	f
1726	3	Wheelchair	139	f
1727	4	Wheelchair	139	f
1728	1	VIP	140	f
1729	2	VIP	140	f
1730	3	VIP	140	f
1731	4	VIP	140	f
1732	5	VIP	140	f
1733	6	VIP	140	f
1734	7	VIP	140	f
1735	8	VIP	140	f
1736	9	VIP	140	f
1737	10	VIP	140	f
1738	11	VIP	140	f
1739	12	VIP	140	f
1740	1	Regular	141	f
1741	2	Regular	141	f
1742	3	Regular	141	f
1743	4	Regular	141	f
1744	5	Regular	141	f
1745	6	Regular	141	f
1746	7	Regular	141	f
1747	8	Regular	141	f
1748	9	Regular	141	f
1749	10	Regular	141	f
1750	11	Regular	141	f
1751	12	Regular	141	f
1752	13	Regular	141	f
1753	14	Regular	141	f
1754	15	Regular	141	f
1755	16	Regular	141	f
1756	17	Regular	141	f
1757	18	Regular	141	f
1758	19	Regular	141	f
1759	20	Regular	141	f
1760	1	Regular	142	f
1761	2	Regular	142	f
1762	3	Regular	142	f
1763	4	Regular	142	f
1764	5	Regular	142	f
1765	6	Regular	142	f
1766	7	Regular	142	f
1767	8	Regular	142	f
1768	9	Regular	142	f
1769	10	Regular	142	f
1770	11	Regular	142	f
1771	12	Regular	142	f
1772	13	Regular	142	f
1773	14	Regular	142	f
1774	15	Regular	142	f
1775	1	Regular	143	f
1776	2	Regular	143	f
1777	3	Regular	143	f
1778	4	Regular	143	f
1779	5	Regular	143	f
1780	6	Regular	143	f
1781	7	Regular	143	f
1782	8	Regular	143	f
1783	9	Regular	143	f
1784	10	Regular	143	f
1785	11	Regular	143	f
1786	12	Regular	143	f
1787	13	Regular	143	f
1788	14	Regular	143	f
1789	15	Regular	143	f
1790	16	Regular	143	f
1791	17	Regular	143	f
1792	18	Regular	143	f
1793	19	Regular	143	f
1794	20	Regular	143	f
1795	1	Regular	144	f
1796	2	Regular	144	f
1797	3	Regular	144	f
1798	4	Regular	144	f
1799	5	Regular	144	f
1800	6	Regular	144	f
1801	7	Regular	144	f
1802	8	Regular	144	f
1803	9	Regular	144	f
1804	10	Regular	144	f
1805	11	Regular	144	f
1806	12	Regular	144	f
1807	13	Regular	144	f
1808	14	Regular	144	f
1809	15	Regular	144	f
1810	1	Regular	145	f
1811	2	Regular	145	f
1812	3	Regular	145	f
1813	4	Regular	145	f
1814	5	Regular	145	f
1815	6	Regular	145	f
1816	7	Regular	145	f
1817	8	Regular	145	f
1818	9	Regular	145	f
1819	10	Regular	145	f
1820	11	Regular	145	f
1821	12	Regular	145	f
1822	13	Regular	145	f
1823	14	Regular	145	f
1824	15	Regular	145	f
1825	16	Regular	145	f
1826	1	Regular	146	f
1827	2	Regular	146	f
1828	3	Regular	146	f
1829	4	Regular	146	f
1830	5	Regular	146	f
1831	6	Regular	146	f
1832	7	Regular	146	f
1833	8	Regular	146	f
1834	9	Regular	146	f
1835	10	Regular	146	f
1836	11	Regular	146	f
1837	12	Regular	146	f
1838	13	Regular	146	f
1839	14	Regular	146	f
1840	15	Regular	146	f
1841	1	Regular	147	f
1842	2	Regular	147	f
1843	3	Regular	147	f
1844	4	Regular	147	f
1845	5	Regular	147	f
1846	6	Regular	147	f
1847	7	Regular	147	f
1848	8	Regular	147	f
1849	9	Regular	147	f
1850	10	Regular	147	f
1851	11	Regular	147	f
1852	12	Regular	147	f
1853	13	Regular	147	f
1854	14	Regular	147	f
1855	15	Regular	147	f
1856	16	Regular	147	f
1857	17	Regular	147	f
1858	18	Regular	147	f
1859	19	Regular	147	f
1860	1	Regular	148	f
1861	2	Regular	148	f
1862	3	Regular	148	f
1863	4	Regular	148	f
1864	5	Regular	148	f
1865	6	Regular	148	f
1866	7	Regular	148	f
1867	8	Regular	148	f
1868	9	Regular	148	f
1869	10	Regular	148	f
1870	11	Regular	148	f
1871	12	Regular	148	f
1872	13	Regular	148	f
1873	14	Regular	148	f
1874	15	Regular	148	f
1875	16	Regular	148	f
1876	17	Regular	148	f
1877	18	Regular	148	f
1878	19	Regular	148	f
1879	1	VIP	149	f
1880	2	VIP	149	f
1881	3	VIP	149	f
1882	4	VIP	149	f
1883	5	VIP	149	f
1884	6	VIP	149	f
1885	7	VIP	149	f
1886	8	VIP	149	f
1887	9	VIP	149	f
1888	10	VIP	149	f
1889	11	VIP	149	f
1890	1	Wheelchair	150	f
1891	2	Wheelchair	150	f
1892	3	Wheelchair	150	f
1893	4	Wheelchair	150	f
1894	5	Wheelchair	150	f
1895	1	VIP	151	f
1896	2	VIP	151	f
1897	3	VIP	151	f
1898	4	VIP	151	f
1899	5	VIP	151	f
1900	6	VIP	151	f
1901	7	VIP	151	f
1902	8	VIP	151	f
1903	9	VIP	151	f
1904	10	VIP	151	f
1905	1	Regular	152	f
1906	2	Regular	152	f
1907	3	Regular	152	f
1908	4	Regular	152	f
1909	5	Regular	152	f
1910	6	Regular	152	f
1911	7	Regular	152	f
1912	8	Regular	152	f
1913	9	Regular	152	f
1914	10	Regular	152	f
1915	11	Regular	152	f
1916	12	Regular	152	f
1917	13	Regular	152	f
1918	14	Regular	152	f
1919	15	Regular	152	f
1920	1	Regular	153	f
1921	2	Regular	153	f
1922	3	Regular	153	f
1923	4	Regular	153	f
1924	5	Regular	153	f
1925	6	Regular	153	f
1926	7	Regular	153	f
1927	8	Regular	153	f
1928	9	Regular	153	f
1929	10	Regular	153	f
1930	11	Regular	153	f
1931	12	Regular	153	f
1932	13	Regular	153	f
1933	14	Regular	153	f
1934	15	Regular	153	f
1935	16	Regular	153	f
1936	17	Regular	153	f
1937	18	Regular	153	f
1938	19	Regular	153	f
1939	20	Regular	153	f
1940	1	Regular	154	f
1941	2	Regular	154	f
1942	3	Regular	154	f
1943	4	Regular	154	f
1944	5	Regular	154	f
1945	6	Regular	154	f
1946	7	Regular	154	f
1947	8	Regular	154	f
1948	9	Regular	154	f
1949	10	Regular	154	f
1950	11	Regular	154	f
1951	12	Regular	154	f
1952	13	Regular	154	f
1953	14	Regular	154	f
1954	15	Regular	154	f
1955	16	Regular	154	f
1956	17	Regular	154	f
1957	1	Regular	155	f
1958	2	Regular	155	f
1959	3	Regular	155	f
1960	4	Regular	155	f
1961	5	Regular	155	f
1962	6	Regular	155	f
1963	7	Regular	155	f
1964	8	Regular	155	f
1965	9	Regular	155	f
1966	10	Regular	155	f
1967	11	Regular	155	f
1968	12	Regular	155	f
1969	13	Regular	155	f
1970	14	Regular	155	f
1971	15	Regular	155	f
1972	16	Regular	155	f
1973	17	Regular	155	f
1974	18	Regular	155	f
1975	19	Regular	155	f
1976	1	Regular	156	f
1977	2	Regular	156	f
1978	3	Regular	156	f
1979	4	Regular	156	f
1980	5	Regular	156	f
1981	6	Regular	156	f
1982	7	Regular	156	f
1983	8	Regular	156	f
1984	9	Regular	156	f
1985	10	Regular	156	f
1986	11	Regular	156	f
1987	12	Regular	156	f
1988	13	Regular	156	f
1989	14	Regular	156	f
1990	15	Regular	156	f
1991	16	Regular	156	f
1992	17	Regular	156	f
1993	1	Regular	157	f
1994	2	Regular	157	f
1995	3	Regular	157	f
1996	4	Regular	157	f
1997	5	Regular	157	f
1998	6	Regular	157	f
1999	7	Regular	157	f
2000	8	Regular	157	f
2001	9	Regular	157	f
2002	10	Regular	157	f
2003	11	Regular	157	f
2004	12	Regular	157	f
2005	13	Regular	157	f
2006	14	Regular	157	f
2007	15	Regular	157	f
2008	16	Regular	157	f
2009	17	Regular	157	f
2010	1	Regular	158	f
2011	2	Regular	158	f
2012	3	Regular	158	f
2013	4	Regular	158	f
2014	5	Regular	158	f
2015	6	Regular	158	f
2016	7	Regular	158	f
2017	8	Regular	158	f
2018	9	Regular	158	f
2019	10	Regular	158	f
2020	11	Regular	158	f
2021	12	Regular	158	f
2022	13	Regular	158	f
2023	14	Regular	158	f
2024	15	Regular	158	f
2025	1	Regular	159	f
2026	2	Regular	159	f
2027	3	Regular	159	f
2028	4	Regular	159	f
2029	5	Regular	159	f
2030	6	Regular	159	f
2031	7	Regular	159	f
2032	8	Regular	159	f
2033	9	Regular	159	f
2034	10	Regular	159	f
2035	11	Regular	159	f
2036	12	Regular	159	f
2037	13	Regular	159	f
2038	14	Regular	159	f
2039	1	VIP	160	f
2040	2	VIP	160	f
2041	3	VIP	160	f
2042	4	VIP	160	f
2043	5	VIP	160	f
2044	6	VIP	160	f
2045	7	VIP	160	f
2046	8	VIP	160	f
2047	9	VIP	160	f
2048	10	VIP	160	f
2049	11	VIP	160	f
2050	12	VIP	160	f
2051	13	VIP	160	f
2052	1	Wheelchair	161	f
2053	2	Wheelchair	161	f
2054	3	Wheelchair	161	f
2055	4	Wheelchair	161	f
2056	1	VIP	162	f
2057	2	VIP	162	f
2058	3	VIP	162	f
2059	4	VIP	162	f
2060	5	VIP	162	f
2061	6	VIP	162	f
2062	7	VIP	162	f
2063	8	VIP	162	f
2064	9	VIP	162	f
2065	10	VIP	162	f
2066	1	Regular	163	f
2067	2	Regular	163	f
2068	3	Regular	163	f
2069	4	Regular	163	f
2070	5	Regular	163	f
2071	6	Regular	163	f
2072	7	Regular	163	f
2073	8	Regular	163	f
2074	9	Regular	163	f
2075	10	Regular	163	f
2076	11	Regular	163	f
2077	12	Regular	163	f
2078	13	Regular	163	f
2079	14	Regular	163	f
2080	15	Regular	163	f
2081	16	Regular	163	f
2082	1	Regular	164	f
2083	2	Regular	164	f
2084	3	Regular	164	f
2085	4	Regular	164	f
2086	5	Regular	164	f
2087	6	Regular	164	f
2088	7	Regular	164	f
2089	8	Regular	164	f
2090	9	Regular	164	f
2091	10	Regular	164	f
2092	11	Regular	164	f
2093	12	Regular	164	f
2094	13	Regular	164	f
2095	14	Regular	164	f
2096	15	Regular	164	f
2097	16	Regular	164	f
2098	1	Regular	165	f
2099	2	Regular	165	f
2100	3	Regular	165	f
2101	4	Regular	165	f
2102	5	Regular	165	f
2103	6	Regular	165	f
2104	7	Regular	165	f
2105	8	Regular	165	f
2106	9	Regular	165	f
2107	10	Regular	165	f
2108	11	Regular	165	f
2109	12	Regular	165	f
2110	13	Regular	165	f
2111	14	Regular	165	f
2112	15	Regular	165	f
2113	16	Regular	165	f
2114	17	Regular	165	f
2115	18	Regular	165	f
2116	19	Regular	165	f
2117	20	Regular	165	f
2118	1	Regular	166	f
2119	2	Regular	166	f
2120	3	Regular	166	f
2121	4	Regular	166	f
2122	5	Regular	166	f
2123	6	Regular	166	f
2124	7	Regular	166	f
2125	8	Regular	166	f
2126	9	Regular	166	f
2127	10	Regular	166	f
2128	11	Regular	166	f
2129	12	Regular	166	f
2130	13	Regular	166	f
2131	14	Regular	166	f
2132	15	Regular	166	f
2133	16	Regular	166	f
2134	17	Regular	166	f
2135	18	Regular	166	f
2136	1	Regular	167	f
2137	2	Regular	167	f
2138	3	Regular	167	f
2139	4	Regular	167	f
2140	5	Regular	167	f
2141	6	Regular	167	f
2142	7	Regular	167	f
2143	8	Regular	167	f
2144	9	Regular	167	f
2145	10	Regular	167	f
2146	11	Regular	167	f
2147	12	Regular	167	f
2148	13	Regular	167	f
2149	14	Regular	167	f
2150	15	Regular	167	f
2151	16	Regular	167	f
2152	17	Regular	167	f
2153	18	Regular	167	f
2154	19	Regular	167	f
2155	20	Regular	167	f
2156	1	Regular	168	f
2157	2	Regular	168	f
2158	3	Regular	168	f
2159	4	Regular	168	f
2160	5	Regular	168	f
2161	6	Regular	168	f
2162	7	Regular	168	f
2163	8	Regular	168	f
2164	9	Regular	168	f
2165	10	Regular	168	f
2166	11	Regular	168	f
2167	12	Regular	168	f
2168	13	Regular	168	f
2169	14	Regular	168	f
2170	15	Regular	168	f
2171	16	Regular	168	f
2172	17	Regular	168	f
2173	18	Regular	168	f
2174	1	Regular	169	f
2175	2	Regular	169	f
2176	3	Regular	169	f
2177	4	Regular	169	f
2178	5	Regular	169	f
2179	6	Regular	169	f
2180	7	Regular	169	f
2181	8	Regular	169	f
2182	9	Regular	169	f
2183	10	Regular	169	f
2184	11	Regular	169	f
2185	12	Regular	169	f
2186	13	Regular	169	f
2187	14	Regular	169	f
2188	15	Regular	169	f
2189	16	Regular	169	f
2190	1	Regular	170	f
2191	2	Regular	170	f
2192	3	Regular	170	f
2193	4	Regular	170	f
2194	5	Regular	170	f
2195	6	Regular	170	f
2196	7	Regular	170	f
2197	8	Regular	170	f
2198	9	Regular	170	f
2199	10	Regular	170	f
2200	11	Regular	170	f
2201	12	Regular	170	f
2202	13	Regular	170	f
2203	14	Regular	170	f
2204	15	Regular	170	f
2205	16	Regular	170	f
2206	17	Regular	170	f
2207	18	Regular	170	f
2208	19	Regular	170	f
2209	20	Regular	170	f
2210	1	VIP	171	f
2211	2	VIP	171	f
2212	3	VIP	171	f
2213	4	VIP	171	f
2214	5	VIP	171	f
2215	6	VIP	171	f
2216	7	VIP	171	f
2217	8	VIP	171	f
2218	9	VIP	171	f
2219	10	VIP	171	f
2220	11	VIP	171	f
2221	12	VIP	171	f
2222	1	Wheelchair	172	f
2223	2	Wheelchair	172	f
2224	3	Wheelchair	172	f
2225	4	Wheelchair	172	f
2226	1	VIP	173	f
2227	2	VIP	173	f
2228	3	VIP	173	f
2229	4	VIP	173	f
2230	5	VIP	173	f
2231	6	VIP	173	f
2232	7	VIP	173	f
2233	8	VIP	173	f
2234	9	VIP	173	f
2235	10	VIP	173	f
2236	11	VIP	173	f
2237	1	Regular	174	f
2238	2	Regular	174	f
2239	3	Regular	174	f
2240	4	Regular	174	f
2241	5	Regular	174	f
2242	6	Regular	174	f
2243	7	Regular	174	f
2244	8	Regular	174	f
2245	9	Regular	174	f
2246	10	Regular	174	f
2247	11	Regular	174	f
2248	12	Regular	174	f
2249	13	Regular	174	f
2250	14	Regular	174	f
2251	15	Regular	174	f
2252	16	Regular	174	f
2253	1	Regular	175	f
2254	2	Regular	175	f
2255	3	Regular	175	f
2256	4	Regular	175	f
2257	5	Regular	175	f
2258	6	Regular	175	f
2259	7	Regular	175	f
2260	8	Regular	175	f
2261	9	Regular	175	f
2262	10	Regular	175	f
2263	11	Regular	175	f
2264	12	Regular	175	f
2265	13	Regular	175	f
2266	14	Regular	175	f
2267	15	Regular	175	f
2268	16	Regular	175	f
2269	17	Regular	175	f
2270	18	Regular	175	f
2271	19	Regular	175	f
2272	20	Regular	175	f
2273	1	Regular	176	f
2274	2	Regular	176	f
2275	3	Regular	176	f
2276	4	Regular	176	f
2277	5	Regular	176	f
2278	6	Regular	176	f
2279	7	Regular	176	f
2280	8	Regular	176	f
2281	9	Regular	176	f
2282	10	Regular	176	f
2283	11	Regular	176	f
2284	12	Regular	176	f
2285	13	Regular	176	f
2286	14	Regular	176	f
2287	15	Regular	176	f
2288	16	Regular	176	f
2289	1	Regular	177	f
2290	2	Regular	177	f
2291	3	Regular	177	f
2292	4	Regular	177	f
2293	5	Regular	177	f
2294	6	Regular	177	f
2295	7	Regular	177	f
2296	8	Regular	177	f
2297	9	Regular	177	f
2298	10	Regular	177	f
2299	11	Regular	177	f
2300	12	Regular	177	f
2301	13	Regular	177	f
2302	14	Regular	177	f
2303	15	Regular	177	f
2304	16	Regular	177	f
2305	17	Regular	177	f
2306	18	Regular	177	f
2307	1	Regular	178	f
2308	2	Regular	178	f
2309	3	Regular	178	f
2310	4	Regular	178	f
2311	5	Regular	178	f
2312	6	Regular	178	f
2313	7	Regular	178	f
2314	8	Regular	178	f
2315	9	Regular	178	f
2316	10	Regular	178	f
2317	11	Regular	178	f
2318	12	Regular	178	f
2319	13	Regular	178	f
2320	14	Regular	178	f
2321	15	Regular	178	f
2322	1	Regular	179	f
2323	2	Regular	179	f
2324	3	Regular	179	f
2325	4	Regular	179	f
2326	5	Regular	179	f
2327	6	Regular	179	f
2328	7	Regular	179	f
2329	8	Regular	179	f
2330	9	Regular	179	f
2331	10	Regular	179	f
2332	11	Regular	179	f
2333	12	Regular	179	f
2334	13	Regular	179	f
2335	14	Regular	179	f
2336	15	Regular	179	f
2337	16	Regular	179	f
2338	17	Regular	179	f
2339	18	Regular	179	f
2340	19	Regular	179	f
2341	1	Regular	180	f
2342	2	Regular	180	f
2343	3	Regular	180	f
2344	4	Regular	180	f
2345	5	Regular	180	f
2346	6	Regular	180	f
2347	7	Regular	180	f
2348	8	Regular	180	f
2349	9	Regular	180	f
2350	10	Regular	180	f
2351	11	Regular	180	f
2352	12	Regular	180	f
2353	13	Regular	180	f
2354	14	Regular	180	f
2355	15	Regular	180	f
2356	16	Regular	180	f
2357	17	Regular	180	f
2358	18	Regular	180	f
2359	19	Regular	180	f
2360	1	Regular	181	f
2361	2	Regular	181	f
2362	3	Regular	181	f
2363	4	Regular	181	f
2364	5	Regular	181	f
2365	6	Regular	181	f
2366	7	Regular	181	f
2367	8	Regular	181	f
2368	9	Regular	181	f
2369	10	Regular	181	f
2370	11	Regular	181	f
2371	12	Regular	181	f
2372	13	Regular	181	f
2373	14	Regular	181	f
2374	15	Regular	181	f
2375	16	Regular	181	f
2376	17	Regular	181	f
2377	18	Regular	181	f
2378	1	Regular	182	f
2379	2	Regular	182	f
2380	3	Regular	182	f
2381	4	Regular	182	f
2382	5	Regular	182	f
2383	6	Regular	182	f
2384	7	Regular	182	f
2385	8	Regular	182	f
2386	9	Regular	182	f
2387	10	Regular	182	f
2388	11	Regular	182	f
2389	12	Regular	182	f
2390	13	Regular	182	f
2391	14	Regular	182	f
2392	15	Regular	182	f
2393	16	Regular	182	f
2394	17	Regular	182	f
2395	1	Regular	183	f
2396	2	Regular	183	f
2397	3	Regular	183	f
2398	4	Regular	183	f
2399	5	Regular	183	f
2400	6	Regular	183	f
2401	7	Regular	183	f
2402	8	Regular	183	f
2403	9	Regular	183	f
2404	10	Regular	183	f
2405	11	Regular	183	f
2406	12	Regular	183	f
2407	13	Regular	183	f
2408	14	Regular	183	f
2409	15	Regular	183	f
2410	16	Regular	183	f
2411	17	Regular	183	f
2412	18	Regular	183	f
2413	19	Regular	183	f
2414	20	Regular	183	f
2415	1	VIP	184	f
2416	2	VIP	184	f
2417	3	VIP	184	f
2418	4	VIP	184	f
2419	5	VIP	184	f
2420	6	VIP	184	f
2421	7	VIP	184	f
2422	8	VIP	184	f
2423	9	VIP	184	f
2424	10	VIP	184	f
2425	1	Wheelchair	185	f
2426	2	Wheelchair	185	f
2427	3	Wheelchair	185	f
2428	4	Wheelchair	185	f
2429	5	Wheelchair	185	f
2430	6	Wheelchair	185	f
2431	7	Wheelchair	185	f
2432	8	Wheelchair	185	f
2433	1	VIP	186	f
2434	2	VIP	186	f
2435	3	VIP	186	f
2436	4	VIP	186	f
2437	5	VIP	186	f
2438	6	VIP	186	f
2439	7	VIP	186	f
2440	8	VIP	186	f
2441	9	VIP	186	f
2442	10	VIP	186	f
2443	11	VIP	186	f
2444	12	VIP	186	f
2445	13	VIP	186	f
2446	14	VIP	186	f
2447	1	Regular	187	f
2448	2	Regular	187	f
2449	3	Regular	187	f
2450	4	Regular	187	f
2451	5	Regular	187	f
2452	6	Regular	187	f
2453	7	Regular	187	f
2454	8	Regular	187	f
2455	9	Regular	187	f
2456	10	Regular	187	f
2457	11	Regular	187	f
2458	12	Regular	187	f
2459	13	Regular	187	f
2460	14	Regular	187	f
2461	15	Regular	187	f
2462	16	Regular	187	f
2463	17	Regular	187	f
2464	18	Regular	187	f
2465	1	Regular	188	f
2466	2	Regular	188	f
2467	3	Regular	188	f
2468	4	Regular	188	f
2469	5	Regular	188	f
2470	6	Regular	188	f
2471	7	Regular	188	f
2472	8	Regular	188	f
2473	9	Regular	188	f
2474	10	Regular	188	f
2475	11	Regular	188	f
2476	12	Regular	188	f
2477	13	Regular	188	f
2478	14	Regular	188	f
2479	15	Regular	188	f
2480	16	Regular	188	f
2481	17	Regular	188	f
2482	1	Regular	189	f
2483	2	Regular	189	f
2484	3	Regular	189	f
2485	4	Regular	189	f
2486	5	Regular	189	f
2487	6	Regular	189	f
2488	7	Regular	189	f
2489	8	Regular	189	f
2490	9	Regular	189	f
2491	10	Regular	189	f
2492	11	Regular	189	f
2493	12	Regular	189	f
2494	13	Regular	189	f
2495	14	Regular	189	f
2496	1	Regular	190	f
2497	2	Regular	190	f
2498	3	Regular	190	f
2499	4	Regular	190	f
2500	5	Regular	190	f
2501	6	Regular	190	f
2502	7	Regular	190	f
2503	8	Regular	190	f
2504	9	Regular	190	f
2505	10	Regular	190	f
2506	11	Regular	190	f
2507	12	Regular	190	f
2508	13	Regular	190	f
2509	14	Regular	190	f
2510	15	Regular	190	f
2511	16	Regular	190	f
2512	17	Regular	190	f
2513	18	Regular	190	f
2514	19	Regular	190	f
2515	20	Regular	190	f
2516	1	Regular	191	f
2517	2	Regular	191	f
2518	3	Regular	191	f
2519	4	Regular	191	f
2520	5	Regular	191	f
2521	6	Regular	191	f
2522	7	Regular	191	f
2523	8	Regular	191	f
2524	9	Regular	191	f
2525	10	Regular	191	f
2526	11	Regular	191	f
2527	12	Regular	191	f
2528	13	Regular	191	f
2529	14	Regular	191	f
2530	15	Regular	191	f
2531	16	Regular	191	f
2532	17	Regular	191	f
2533	18	Regular	191	f
2534	19	Regular	191	f
2535	1	Regular	192	f
2536	2	Regular	192	f
2537	3	Regular	192	f
2538	4	Regular	192	f
2539	5	Regular	192	f
2540	6	Regular	192	f
2541	7	Regular	192	f
2542	8	Regular	192	f
2543	9	Regular	192	f
2544	10	Regular	192	f
2545	11	Regular	192	f
2546	12	Regular	192	f
2547	13	Regular	192	f
2548	14	Regular	192	f
2549	15	Regular	192	f
2550	1	Regular	193	f
2551	2	Regular	193	f
2552	3	Regular	193	f
2553	4	Regular	193	f
2554	5	Regular	193	f
2555	6	Regular	193	f
2556	7	Regular	193	f
2557	8	Regular	193	f
2558	9	Regular	193	f
2559	10	Regular	193	f
2560	11	Regular	193	f
2561	12	Regular	193	f
2562	13	Regular	193	f
2563	14	Regular	193	f
2564	15	Regular	193	f
2565	16	Regular	193	f
2566	17	Regular	193	f
2567	18	Regular	193	f
2568	1	VIP	194	f
2569	2	VIP	194	f
2570	3	VIP	194	f
2571	4	VIP	194	f
2572	5	VIP	194	f
2573	6	VIP	194	f
2574	7	VIP	194	f
2575	8	VIP	194	f
2576	9	VIP	194	f
2577	10	VIP	194	f
2578	11	VIP	194	f
2579	12	VIP	194	f
2580	1	Wheelchair	195	f
2581	2	Wheelchair	195	f
2582	3	Wheelchair	195	f
2583	4	Wheelchair	195	f
2584	5	Wheelchair	195	f
2585	1	VIP	196	f
2586	2	VIP	196	f
2587	3	VIP	196	f
2588	4	VIP	196	f
2589	5	VIP	196	f
2590	6	VIP	196	f
2591	7	VIP	196	f
2592	8	VIP	196	f
2593	9	VIP	196	f
2594	10	VIP	196	f
2595	11	VIP	196	f
2596	1	Regular	197	f
2597	2	Regular	197	f
2598	3	Regular	197	f
2599	4	Regular	197	f
2600	5	Regular	197	f
2601	6	Regular	197	f
2602	7	Regular	197	f
2603	8	Regular	197	f
2604	9	Regular	197	f
2605	10	Regular	197	f
2606	11	Regular	197	f
2607	12	Regular	197	f
2608	13	Regular	197	f
2609	14	Regular	197	f
2610	15	Regular	197	f
2611	16	Regular	197	f
2612	17	Regular	197	f
2613	18	Regular	197	f
2614	19	Regular	197	f
2615	20	Regular	197	f
2616	1	Regular	198	f
2617	2	Regular	198	f
2618	3	Regular	198	f
2619	4	Regular	198	f
2620	5	Regular	198	f
2621	6	Regular	198	f
2622	7	Regular	198	f
2623	8	Regular	198	f
2624	9	Regular	198	f
2625	10	Regular	198	f
2626	11	Regular	198	f
2627	12	Regular	198	f
2628	13	Regular	198	f
2629	14	Regular	198	f
2630	15	Regular	198	f
2631	16	Regular	198	f
2632	1	Regular	199	f
2633	2	Regular	199	f
2634	3	Regular	199	f
2635	4	Regular	199	f
2636	5	Regular	199	f
2637	6	Regular	199	f
2638	7	Regular	199	f
2639	8	Regular	199	f
2640	9	Regular	199	f
2641	10	Regular	199	f
2642	11	Regular	199	f
2643	12	Regular	199	f
2644	13	Regular	199	f
2645	14	Regular	199	f
2646	15	Regular	199	f
2647	16	Regular	199	f
2648	17	Regular	199	f
2649	1	Regular	200	f
2650	2	Regular	200	f
2651	3	Regular	200	f
2652	4	Regular	200	f
2653	5	Regular	200	f
2654	6	Regular	200	f
2655	7	Regular	200	f
2656	8	Regular	200	f
2657	9	Regular	200	f
2658	10	Regular	200	f
2659	11	Regular	200	f
2660	12	Regular	200	f
2661	13	Regular	200	f
2662	14	Regular	200	f
2663	15	Regular	200	f
2664	1	Regular	201	f
2665	2	Regular	201	f
2666	3	Regular	201	f
2667	4	Regular	201	f
2668	5	Regular	201	f
2669	6	Regular	201	f
2670	7	Regular	201	f
2671	8	Regular	201	f
2672	9	Regular	201	f
2673	10	Regular	201	f
2674	11	Regular	201	f
2675	12	Regular	201	f
2676	13	Regular	201	f
2677	14	Regular	201	f
2678	1	Regular	202	f
2679	2	Regular	202	f
2680	3	Regular	202	f
2681	4	Regular	202	f
2682	5	Regular	202	f
2683	6	Regular	202	f
2684	7	Regular	202	f
2685	8	Regular	202	f
2686	9	Regular	202	f
2687	10	Regular	202	f
2688	11	Regular	202	f
2689	12	Regular	202	f
2690	13	Regular	202	f
2691	14	Regular	202	f
2692	15	Regular	202	f
2693	16	Regular	202	f
2694	1	Regular	203	f
2695	2	Regular	203	f
2696	3	Regular	203	f
2697	4	Regular	203	f
2698	5	Regular	203	f
2699	6	Regular	203	f
2700	7	Regular	203	f
2701	8	Regular	203	f
2702	9	Regular	203	f
2703	10	Regular	203	f
2704	11	Regular	203	f
2705	12	Regular	203	f
2706	13	Regular	203	f
2707	14	Regular	203	f
2708	15	Regular	203	f
2709	16	Regular	203	f
2710	17	Regular	203	f
2711	18	Regular	203	f
2712	19	Regular	203	f
2713	1	Regular	204	f
2714	2	Regular	204	f
2715	3	Regular	204	f
2716	4	Regular	204	f
2717	5	Regular	204	f
2718	6	Regular	204	f
2719	7	Regular	204	f
2720	8	Regular	204	f
2721	9	Regular	204	f
2722	10	Regular	204	f
2723	11	Regular	204	f
2724	12	Regular	204	f
2725	13	Regular	204	f
2726	14	Regular	204	f
2727	15	Regular	204	f
2728	1	Regular	205	f
2729	2	Regular	205	f
2730	3	Regular	205	f
2731	4	Regular	205	f
2732	5	Regular	205	f
2733	6	Regular	205	f
2734	7	Regular	205	f
2735	8	Regular	205	f
2736	9	Regular	205	f
2737	10	Regular	205	f
2738	11	Regular	205	f
2739	12	Regular	205	f
2740	13	Regular	205	f
2741	14	Regular	205	f
2742	15	Regular	205	f
2743	16	Regular	205	f
2744	1	Regular	206	f
2745	2	Regular	206	f
2746	3	Regular	206	f
2747	4	Regular	206	f
2748	5	Regular	206	f
2749	6	Regular	206	f
2750	7	Regular	206	f
2751	8	Regular	206	f
2752	9	Regular	206	f
2753	10	Regular	206	f
2754	11	Regular	206	f
2755	12	Regular	206	f
2756	13	Regular	206	f
2757	14	Regular	206	f
2758	15	Regular	206	f
2759	16	Regular	206	f
2760	17	Regular	206	f
2761	1	VIP	207	f
2762	2	VIP	207	f
2763	3	VIP	207	f
2764	4	VIP	207	f
2765	5	VIP	207	f
2766	6	VIP	207	f
2767	7	VIP	207	f
2768	8	VIP	207	f
2769	9	VIP	207	f
2770	10	VIP	207	f
2771	11	VIP	207	f
2772	12	VIP	207	f
2773	13	VIP	207	f
2774	14	VIP	207	f
2775	1	Wheelchair	208	f
2776	2	Wheelchair	208	f
2777	3	Wheelchair	208	f
2778	4	Wheelchair	208	f
2779	5	Wheelchair	208	f
2780	1	VIP	209	f
2781	2	VIP	209	f
2782	3	VIP	209	f
2783	4	VIP	209	f
2784	5	VIP	209	f
2785	6	VIP	209	f
2786	7	VIP	209	f
2787	8	VIP	209	f
2788	9	VIP	209	f
2789	10	VIP	209	f
2790	11	VIP	209	f
2791	1	Regular	210	f
2792	2	Regular	210	f
2793	3	Regular	210	f
2794	4	Regular	210	f
2795	5	Regular	210	f
2796	6	Regular	210	f
2797	7	Regular	210	f
2798	8	Regular	210	f
2799	9	Regular	210	f
2800	10	Regular	210	f
2801	11	Regular	210	f
2802	12	Regular	210	f
2803	13	Regular	210	f
2804	14	Regular	210	f
2805	15	Regular	210	f
2806	1	Regular	211	f
2807	2	Regular	211	f
2808	3	Regular	211	f
2809	4	Regular	211	f
2810	5	Regular	211	f
2811	6	Regular	211	f
2812	7	Regular	211	f
2813	8	Regular	211	f
2814	9	Regular	211	f
2815	10	Regular	211	f
2816	11	Regular	211	f
2817	12	Regular	211	f
2818	13	Regular	211	f
2819	14	Regular	211	f
2820	15	Regular	211	f
2821	16	Regular	211	f
2822	1	Regular	212	f
2823	2	Regular	212	f
2824	3	Regular	212	f
2825	4	Regular	212	f
2826	5	Regular	212	f
2827	6	Regular	212	f
2828	7	Regular	212	f
2829	8	Regular	212	f
2830	9	Regular	212	f
2831	10	Regular	212	f
2832	11	Regular	212	f
2833	12	Regular	212	f
2834	13	Regular	212	f
2835	14	Regular	212	f
2836	15	Regular	212	f
2837	1	Regular	213	f
2838	2	Regular	213	f
2839	3	Regular	213	f
2840	4	Regular	213	f
2841	5	Regular	213	f
2842	6	Regular	213	f
2843	7	Regular	213	f
2844	8	Regular	213	f
2845	9	Regular	213	f
2846	10	Regular	213	f
2847	11	Regular	213	f
2848	12	Regular	213	f
2849	13	Regular	213	f
2850	14	Regular	213	f
2851	15	Regular	213	f
2852	1	Regular	214	f
2853	2	Regular	214	f
2854	3	Regular	214	f
2855	4	Regular	214	f
2856	5	Regular	214	f
2857	6	Regular	214	f
2858	7	Regular	214	f
2859	8	Regular	214	f
2860	9	Regular	214	f
2861	10	Regular	214	f
2862	11	Regular	214	f
2863	12	Regular	214	f
2864	13	Regular	214	f
2865	14	Regular	214	f
2866	15	Regular	214	f
2867	1	Regular	215	f
2868	2	Regular	215	f
2869	3	Regular	215	f
2870	4	Regular	215	f
2871	5	Regular	215	f
2872	6	Regular	215	f
2873	7	Regular	215	f
2874	8	Regular	215	f
2875	9	Regular	215	f
2876	10	Regular	215	f
2877	11	Regular	215	f
2878	12	Regular	215	f
2879	13	Regular	215	f
2880	14	Regular	215	f
2881	15	Regular	215	f
2882	16	Regular	215	f
2883	17	Regular	215	f
2884	18	Regular	215	f
2885	19	Regular	215	f
2886	1	Regular	216	f
2887	2	Regular	216	f
2888	3	Regular	216	f
2889	4	Regular	216	f
2890	5	Regular	216	f
2891	6	Regular	216	f
2892	7	Regular	216	f
2893	8	Regular	216	f
2894	9	Regular	216	f
2895	10	Regular	216	f
2896	11	Regular	216	f
2897	12	Regular	216	f
2898	13	Regular	216	f
2899	14	Regular	216	f
2900	15	Regular	216	f
2901	16	Regular	216	f
2902	1	Regular	217	f
2903	2	Regular	217	f
2904	3	Regular	217	f
2905	4	Regular	217	f
2906	5	Regular	217	f
2907	6	Regular	217	f
2908	7	Regular	217	f
2909	8	Regular	217	f
2910	9	Regular	217	f
2911	10	Regular	217	f
2912	11	Regular	217	f
2913	12	Regular	217	f
2914	13	Regular	217	f
2915	14	Regular	217	f
2916	15	Regular	217	f
2917	16	Regular	217	f
2918	17	Regular	217	f
2919	18	Regular	217	f
2920	19	Regular	217	f
2921	20	Regular	217	f
2922	1	Regular	218	f
2923	2	Regular	218	f
2924	3	Regular	218	f
2925	4	Regular	218	f
2926	5	Regular	218	f
2927	6	Regular	218	f
2928	7	Regular	218	f
2929	8	Regular	218	f
2930	9	Regular	218	f
2931	10	Regular	218	f
2932	11	Regular	218	f
2933	12	Regular	218	f
2934	13	Regular	218	f
2935	14	Regular	218	f
2936	15	Regular	218	f
2937	16	Regular	218	f
2938	17	Regular	218	f
2939	18	Regular	218	f
2940	19	Regular	218	f
2941	1	VIP	219	f
2942	2	VIP	219	f
2943	3	VIP	219	f
2944	4	VIP	219	f
2945	5	VIP	219	f
2946	6	VIP	219	f
2947	7	VIP	219	f
2948	8	VIP	219	f
2949	9	VIP	219	f
2950	10	VIP	219	f
2951	11	VIP	219	f
2952	12	VIP	219	f
2953	1	Wheelchair	220	f
2954	2	Wheelchair	220	f
2955	3	Wheelchair	220	f
2956	4	Wheelchair	220	f
2957	5	Wheelchair	220	f
2958	6	Wheelchair	220	f
2959	1	VIP	221	f
2960	2	VIP	221	f
2961	3	VIP	221	f
2962	4	VIP	221	f
2963	5	VIP	221	f
2964	6	VIP	221	f
2965	7	VIP	221	f
2966	8	VIP	221	f
2967	9	VIP	221	f
2968	10	VIP	221	f
2969	1	Regular	222	f
2970	2	Regular	222	f
2971	3	Regular	222	f
2972	4	Regular	222	f
2973	5	Regular	222	f
2974	6	Regular	222	f
2975	7	Regular	222	f
2976	8	Regular	222	f
2977	9	Regular	222	f
2978	10	Regular	222	f
2979	11	Regular	222	f
2980	12	Regular	222	f
2981	13	Regular	222	f
2982	14	Regular	222	f
2983	15	Regular	222	f
2984	16	Regular	222	f
2985	17	Regular	222	f
2986	1	Regular	223	f
2987	2	Regular	223	f
2988	3	Regular	223	f
2989	4	Regular	223	f
2990	5	Regular	223	f
2991	6	Regular	223	f
2992	7	Regular	223	f
2993	8	Regular	223	f
2994	9	Regular	223	f
2995	10	Regular	223	f
2996	11	Regular	223	f
2997	12	Regular	223	f
2998	13	Regular	223	f
2999	14	Regular	223	f
3000	15	Regular	223	f
3001	1	Regular	224	f
3002	2	Regular	224	f
3003	3	Regular	224	f
3004	4	Regular	224	f
3005	5	Regular	224	f
3006	6	Regular	224	f
3007	7	Regular	224	f
3008	8	Regular	224	f
3009	9	Regular	224	f
3010	10	Regular	224	f
3011	11	Regular	224	f
3012	12	Regular	224	f
3013	13	Regular	224	f
3014	14	Regular	224	f
3015	15	Regular	224	f
3016	16	Regular	224	f
3017	17	Regular	224	f
3018	18	Regular	224	f
3019	19	Regular	224	f
3020	1	Regular	225	f
3021	2	Regular	225	f
3022	3	Regular	225	f
3023	4	Regular	225	f
3024	5	Regular	225	f
3025	6	Regular	225	f
3026	7	Regular	225	f
3027	8	Regular	225	f
3028	9	Regular	225	f
3029	10	Regular	225	f
3030	11	Regular	225	f
3031	12	Regular	225	f
3032	13	Regular	225	f
3033	14	Regular	225	f
3034	15	Regular	225	f
3035	1	Regular	226	f
3036	2	Regular	226	f
3037	3	Regular	226	f
3038	4	Regular	226	f
3039	5	Regular	226	f
3040	6	Regular	226	f
3041	7	Regular	226	f
3042	8	Regular	226	f
3043	9	Regular	226	f
3044	10	Regular	226	f
3045	11	Regular	226	f
3046	12	Regular	226	f
3047	13	Regular	226	f
3048	14	Regular	226	f
3049	1	Regular	227	f
3050	2	Regular	227	f
3051	3	Regular	227	f
3052	4	Regular	227	f
3053	5	Regular	227	f
3054	6	Regular	227	f
3055	7	Regular	227	f
3056	8	Regular	227	f
3057	9	Regular	227	f
3058	10	Regular	227	f
3059	11	Regular	227	f
3060	12	Regular	227	f
3061	13	Regular	227	f
3062	14	Regular	227	f
3063	15	Regular	227	f
3064	16	Regular	227	f
3065	17	Regular	227	f
3066	18	Regular	227	f
3067	19	Regular	227	f
3068	1	Regular	228	f
3069	2	Regular	228	f
3070	3	Regular	228	f
3071	4	Regular	228	f
3072	5	Regular	228	f
3073	6	Regular	228	f
3074	7	Regular	228	f
3075	8	Regular	228	f
3076	9	Regular	228	f
3077	10	Regular	228	f
3078	11	Regular	228	f
3079	12	Regular	228	f
3080	13	Regular	228	f
3081	14	Regular	228	f
3082	15	Regular	228	f
3083	1	Regular	229	f
3084	2	Regular	229	f
3085	3	Regular	229	f
3086	4	Regular	229	f
3087	5	Regular	229	f
3088	6	Regular	229	f
3089	7	Regular	229	f
3090	8	Regular	229	f
3091	9	Regular	229	f
3092	10	Regular	229	f
3093	11	Regular	229	f
3094	12	Regular	229	f
3095	13	Regular	229	f
3096	14	Regular	229	f
3097	15	Regular	229	f
3098	16	Regular	229	f
3099	17	Regular	229	f
3100	1	Regular	230	f
3101	2	Regular	230	f
3102	3	Regular	230	f
3103	4	Regular	230	f
3104	5	Regular	230	f
3105	6	Regular	230	f
3106	7	Regular	230	f
3107	8	Regular	230	f
3108	9	Regular	230	f
3109	10	Regular	230	f
3110	11	Regular	230	f
3111	12	Regular	230	f
3112	13	Regular	230	f
3113	14	Regular	230	f
3114	15	Regular	230	f
3115	16	Regular	230	f
3116	17	Regular	230	f
3117	18	Regular	230	f
3118	1	VIP	231	f
3119	2	VIP	231	f
3120	3	VIP	231	f
3121	4	VIP	231	f
3122	5	VIP	231	f
3123	6	VIP	231	f
3124	7	VIP	231	f
3125	8	VIP	231	f
3126	9	VIP	231	f
3127	10	VIP	231	f
3128	11	VIP	231	f
3129	12	VIP	231	f
3130	1	Wheelchair	232	f
3131	2	Wheelchair	232	f
3132	3	Wheelchair	232	f
3133	4	Wheelchair	232	f
3134	1	VIP	233	f
3135	2	VIP	233	f
3136	3	VIP	233	f
3137	4	VIP	233	f
3138	5	VIP	233	f
3139	6	VIP	233	f
3140	7	VIP	233	f
3141	8	VIP	233	f
3142	9	VIP	233	f
3143	10	VIP	233	f
3144	11	VIP	233	f
3145	12	VIP	233	f
3146	13	VIP	233	f
3147	14	VIP	233	f
3148	1	Regular	234	f
3149	2	Regular	234	f
3150	3	Regular	234	f
3151	4	Regular	234	f
3152	5	Regular	234	f
3153	6	Regular	234	f
3154	7	Regular	234	f
3155	8	Regular	234	f
3156	9	Regular	234	f
3157	10	Regular	234	f
3158	11	Regular	234	f
3159	12	Regular	234	f
3160	13	Regular	234	f
3161	14	Regular	234	f
3162	15	Regular	234	f
3163	16	Regular	234	f
3164	17	Regular	234	f
3165	18	Regular	234	f
3166	19	Regular	234	f
3167	20	Regular	234	f
3168	1	Regular	235	f
3169	2	Regular	235	f
3170	3	Regular	235	f
3171	4	Regular	235	f
3172	5	Regular	235	f
3173	6	Regular	235	f
3174	7	Regular	235	f
3175	8	Regular	235	f
3176	9	Regular	235	f
3177	10	Regular	235	f
3178	11	Regular	235	f
3179	12	Regular	235	f
3180	13	Regular	235	f
3181	14	Regular	235	f
3182	15	Regular	235	f
3183	16	Regular	235	f
3184	17	Regular	235	f
3185	1	Regular	236	f
3186	2	Regular	236	f
3187	3	Regular	236	f
3188	4	Regular	236	f
3189	5	Regular	236	f
3190	6	Regular	236	f
3191	7	Regular	236	f
3192	8	Regular	236	f
3193	9	Regular	236	f
3194	10	Regular	236	f
3195	11	Regular	236	f
3196	12	Regular	236	f
3197	13	Regular	236	f
3198	14	Regular	236	f
3199	15	Regular	236	f
3200	16	Regular	236	f
3201	17	Regular	236	f
3202	1	Regular	237	f
3203	2	Regular	237	f
3204	3	Regular	237	f
3205	4	Regular	237	f
3206	5	Regular	237	f
3207	6	Regular	237	f
3208	7	Regular	237	f
3209	8	Regular	237	f
3210	9	Regular	237	f
3211	10	Regular	237	f
3212	11	Regular	237	f
3213	12	Regular	237	f
3214	13	Regular	237	f
3215	14	Regular	237	f
3216	15	Regular	237	f
3217	16	Regular	237	f
3218	17	Regular	237	f
3219	18	Regular	237	f
3220	19	Regular	237	f
3221	1	Regular	238	f
3222	2	Regular	238	f
3223	3	Regular	238	f
3224	4	Regular	238	f
3225	5	Regular	238	f
3226	6	Regular	238	f
3227	7	Regular	238	f
3228	8	Regular	238	f
3229	9	Regular	238	f
3230	10	Regular	238	f
3231	11	Regular	238	f
3232	12	Regular	238	f
3233	13	Regular	238	f
3234	14	Regular	238	f
3235	15	Regular	238	f
3236	16	Regular	238	f
3237	17	Regular	238	f
3238	18	Regular	238	f
3239	1	Regular	239	f
3240	2	Regular	239	f
3241	3	Regular	239	f
3242	4	Regular	239	f
3243	5	Regular	239	f
3244	6	Regular	239	f
3245	7	Regular	239	f
3246	8	Regular	239	f
3247	9	Regular	239	f
3248	10	Regular	239	f
3249	11	Regular	239	f
3250	12	Regular	239	f
3251	13	Regular	239	f
3252	14	Regular	239	f
3253	15	Regular	239	f
3254	16	Regular	239	f
3255	17	Regular	239	f
3256	18	Regular	239	f
3257	1	Regular	240	f
3258	2	Regular	240	f
3259	3	Regular	240	f
3260	4	Regular	240	f
3261	5	Regular	240	f
3262	6	Regular	240	f
3263	7	Regular	240	f
3264	8	Regular	240	f
3265	9	Regular	240	f
3266	10	Regular	240	f
3267	11	Regular	240	f
3268	12	Regular	240	f
3269	13	Regular	240	f
3270	14	Regular	240	f
3271	15	Regular	240	f
3272	16	Regular	240	f
3273	17	Regular	240	f
3274	1	Regular	241	f
3275	2	Regular	241	f
3276	3	Regular	241	f
3277	4	Regular	241	f
3278	5	Regular	241	f
3279	6	Regular	241	f
3280	7	Regular	241	f
3281	8	Regular	241	f
3282	9	Regular	241	f
3283	10	Regular	241	f
3284	11	Regular	241	f
3285	12	Regular	241	f
3286	13	Regular	241	f
3287	14	Regular	241	f
3288	15	Regular	241	f
3289	16	Regular	241	f
3290	17	Regular	241	f
3291	18	Regular	241	f
3292	19	Regular	241	f
3293	20	Regular	241	f
3294	1	Regular	242	f
3295	2	Regular	242	f
3296	3	Regular	242	f
3297	4	Regular	242	f
3298	5	Regular	242	f
3299	6	Regular	242	f
3300	7	Regular	242	f
3301	8	Regular	242	f
3302	9	Regular	242	f
3303	10	Regular	242	f
3304	11	Regular	242	f
3305	12	Regular	242	f
3306	13	Regular	242	f
3307	14	Regular	242	f
3308	15	Regular	242	f
3309	16	Regular	242	f
3310	17	Regular	242	f
3311	18	Regular	242	f
3312	1	VIP	243	f
3313	2	VIP	243	f
3314	3	VIP	243	f
3315	4	VIP	243	f
3316	5	VIP	243	f
3317	6	VIP	243	f
3318	7	VIP	243	f
3319	8	VIP	243	f
3320	9	VIP	243	f
3321	10	VIP	243	f
3322	11	VIP	243	f
3323	12	VIP	243	f
3324	1	Wheelchair	244	f
3325	2	Wheelchair	244	f
3326	3	Wheelchair	244	f
3327	4	Wheelchair	244	f
3328	5	Wheelchair	244	f
3329	6	Wheelchair	244	f
3330	1	VIP	245	f
3331	2	VIP	245	f
3332	3	VIP	245	f
3333	4	VIP	245	f
3334	5	VIP	245	f
3335	6	VIP	245	f
3336	7	VIP	245	f
3337	8	VIP	245	f
3338	9	VIP	245	f
3339	10	VIP	245	f
3340	11	VIP	245	f
3341	12	VIP	245	f
3342	1	Regular	246	f
3343	2	Regular	246	f
3344	3	Regular	246	f
3345	4	Regular	246	f
3346	5	Regular	246	f
3347	6	Regular	246	f
3348	7	Regular	246	f
3349	8	Regular	246	f
3350	9	Regular	246	f
3351	10	Regular	246	f
3352	11	Regular	246	f
3353	12	Regular	246	f
3354	13	Regular	246	f
3355	14	Regular	246	f
3356	15	Regular	246	f
3357	1	Regular	247	f
3358	2	Regular	247	f
3359	3	Regular	247	f
3360	4	Regular	247	f
3361	5	Regular	247	f
3362	6	Regular	247	f
3363	7	Regular	247	f
3364	8	Regular	247	f
3365	9	Regular	247	f
3366	10	Regular	247	f
3367	11	Regular	247	f
3368	12	Regular	247	f
3369	13	Regular	247	f
3370	14	Regular	247	f
3371	15	Regular	247	f
3372	16	Regular	247	f
3373	17	Regular	247	f
3374	18	Regular	247	f
3375	19	Regular	247	f
3376	20	Regular	247	f
3377	1	Regular	248	f
3378	2	Regular	248	f
3379	3	Regular	248	f
3380	4	Regular	248	f
3381	5	Regular	248	f
3382	6	Regular	248	f
3383	7	Regular	248	f
3384	8	Regular	248	f
3385	9	Regular	248	f
3386	10	Regular	248	f
3387	11	Regular	248	f
3388	12	Regular	248	f
3389	13	Regular	248	f
3390	14	Regular	248	f
3391	15	Regular	248	f
3392	1	Regular	249	f
3393	2	Regular	249	f
3394	3	Regular	249	f
3395	4	Regular	249	f
3396	5	Regular	249	f
3397	6	Regular	249	f
3398	7	Regular	249	f
3399	8	Regular	249	f
3400	9	Regular	249	f
3401	10	Regular	249	f
3402	11	Regular	249	f
3403	12	Regular	249	f
3404	13	Regular	249	f
3405	14	Regular	249	f
3406	15	Regular	249	f
3407	16	Regular	249	f
3408	17	Regular	249	f
3409	1	Regular	250	f
3410	2	Regular	250	f
3411	3	Regular	250	f
3412	4	Regular	250	f
3413	5	Regular	250	f
3414	6	Regular	250	f
3415	7	Regular	250	f
3416	8	Regular	250	f
3417	9	Regular	250	f
3418	10	Regular	250	f
3419	11	Regular	250	f
3420	12	Regular	250	f
3421	13	Regular	250	f
3422	14	Regular	250	f
3423	15	Regular	250	f
3424	1	Regular	251	f
3425	2	Regular	251	f
3426	3	Regular	251	f
3427	4	Regular	251	f
3428	5	Regular	251	f
3429	6	Regular	251	f
3430	7	Regular	251	f
3431	8	Regular	251	f
3432	9	Regular	251	f
3433	10	Regular	251	f
3434	11	Regular	251	f
3435	12	Regular	251	f
3436	13	Regular	251	f
3437	14	Regular	251	f
3438	15	Regular	251	f
3439	16	Regular	251	f
3440	17	Regular	251	f
3441	18	Regular	251	f
3442	19	Regular	251	f
3443	1	Regular	252	f
3444	2	Regular	252	f
3445	3	Regular	252	f
3446	4	Regular	252	f
3447	5	Regular	252	f
3448	6	Regular	252	f
3449	7	Regular	252	f
3450	8	Regular	252	f
3451	9	Regular	252	f
3452	10	Regular	252	f
3453	11	Regular	252	f
3454	12	Regular	252	f
3455	13	Regular	252	f
3456	14	Regular	252	f
3457	1	Regular	253	f
3458	2	Regular	253	f
3459	3	Regular	253	f
3460	4	Regular	253	f
3461	5	Regular	253	f
3462	6	Regular	253	f
3463	7	Regular	253	f
3464	8	Regular	253	f
3465	9	Regular	253	f
3466	10	Regular	253	f
3467	11	Regular	253	f
3468	12	Regular	253	f
3469	13	Regular	253	f
3470	14	Regular	253	f
3471	15	Regular	253	f
3472	1	Regular	254	f
3473	2	Regular	254	f
3474	3	Regular	254	f
3475	4	Regular	254	f
3476	5	Regular	254	f
3477	6	Regular	254	f
3478	7	Regular	254	f
3479	8	Regular	254	f
3480	9	Regular	254	f
3481	10	Regular	254	f
3482	11	Regular	254	f
3483	12	Regular	254	f
3484	13	Regular	254	f
3485	14	Regular	254	f
3486	15	Regular	254	f
3487	16	Regular	254	f
3488	17	Regular	254	f
3489	1	Regular	255	f
3490	2	Regular	255	f
3491	3	Regular	255	f
3492	4	Regular	255	f
3493	5	Regular	255	f
3494	6	Regular	255	f
3495	7	Regular	255	f
3496	8	Regular	255	f
3497	9	Regular	255	f
3498	10	Regular	255	f
3499	11	Regular	255	f
3500	12	Regular	255	f
3501	13	Regular	255	f
3502	14	Regular	255	f
3503	15	Regular	255	f
3504	16	Regular	255	f
3505	17	Regular	255	f
3506	1	Regular	256	f
3507	2	Regular	256	f
3508	3	Regular	256	f
3509	4	Regular	256	f
3510	5	Regular	256	f
3511	6	Regular	256	f
3512	7	Regular	256	f
3513	8	Regular	256	f
3514	9	Regular	256	f
3515	10	Regular	256	f
3516	11	Regular	256	f
3517	12	Regular	256	f
3518	13	Regular	256	f
3519	14	Regular	256	f
3520	1	VIP	257	f
3521	2	VIP	257	f
3522	3	VIP	257	f
3523	4	VIP	257	f
3524	5	VIP	257	f
3525	6	VIP	257	f
3526	7	VIP	257	f
3527	8	VIP	257	f
3528	9	VIP	257	f
3529	10	VIP	257	f
3530	1	Wheelchair	258	f
3531	2	Wheelchair	258	f
3532	3	Wheelchair	258	f
3533	4	Wheelchair	258	f
3534	5	Wheelchair	258	f
3535	6	Wheelchair	258	f
3536	1	VIP	259	f
3537	2	VIP	259	f
3538	3	VIP	259	f
3539	4	VIP	259	f
3540	5	VIP	259	f
3541	6	VIP	259	f
3542	7	VIP	259	f
3543	8	VIP	259	f
3544	9	VIP	259	f
3545	10	VIP	259	f
3546	11	VIP	259	f
3547	12	VIP	259	f
3548	13	VIP	259	f
3549	1	Regular	260	f
3550	2	Regular	260	f
3551	3	Regular	260	f
3552	4	Regular	260	f
3553	5	Regular	260	f
3554	6	Regular	260	f
3555	7	Regular	260	f
3556	8	Regular	260	f
3557	9	Regular	260	f
3558	10	Regular	260	f
3559	11	Regular	260	f
3560	12	Regular	260	f
3561	13	Regular	260	f
3562	14	Regular	260	f
3563	15	Regular	260	f
3564	16	Regular	260	f
3565	17	Regular	260	f
3566	18	Regular	260	f
3567	1	Regular	261	f
3568	2	Regular	261	f
3569	3	Regular	261	f
3570	4	Regular	261	f
3571	5	Regular	261	f
3572	6	Regular	261	f
3573	7	Regular	261	f
3574	8	Regular	261	f
3575	9	Regular	261	f
3576	10	Regular	261	f
3577	11	Regular	261	f
3578	12	Regular	261	f
3579	13	Regular	261	f
3580	14	Regular	261	f
3581	1	Regular	262	f
3582	2	Regular	262	f
3583	3	Regular	262	f
3584	4	Regular	262	f
3585	5	Regular	262	f
3586	6	Regular	262	f
3587	7	Regular	262	f
3588	8	Regular	262	f
3589	9	Regular	262	f
3590	10	Regular	262	f
3591	11	Regular	262	f
3592	12	Regular	262	f
3593	13	Regular	262	f
3594	14	Regular	262	f
3595	1	Regular	263	f
3596	2	Regular	263	f
3597	3	Regular	263	f
3598	4	Regular	263	f
3599	5	Regular	263	f
3600	6	Regular	263	f
3601	7	Regular	263	f
3602	8	Regular	263	f
3603	9	Regular	263	f
3604	10	Regular	263	f
3605	11	Regular	263	f
3606	12	Regular	263	f
3607	13	Regular	263	f
3608	14	Regular	263	f
3609	15	Regular	263	f
3610	16	Regular	263	f
3611	1	Regular	264	f
3612	2	Regular	264	f
3613	3	Regular	264	f
3614	4	Regular	264	f
3615	5	Regular	264	f
3616	6	Regular	264	f
3617	7	Regular	264	f
3618	8	Regular	264	f
3619	9	Regular	264	f
3620	10	Regular	264	f
3621	11	Regular	264	f
3622	12	Regular	264	f
3623	13	Regular	264	f
3624	14	Regular	264	f
3625	15	Regular	264	f
3626	16	Regular	264	f
3627	17	Regular	264	f
3628	1	Regular	265	f
3629	2	Regular	265	f
3630	3	Regular	265	f
3631	4	Regular	265	f
3632	5	Regular	265	f
3633	6	Regular	265	f
3634	7	Regular	265	f
3635	8	Regular	265	f
3636	9	Regular	265	f
3637	10	Regular	265	f
3638	11	Regular	265	f
3639	12	Regular	265	f
3640	13	Regular	265	f
3641	14	Regular	265	f
3642	15	Regular	265	f
3643	16	Regular	265	f
3644	17	Regular	265	f
3645	18	Regular	265	f
3646	19	Regular	265	f
3647	1	Regular	266	f
3648	2	Regular	266	f
3649	3	Regular	266	f
3650	4	Regular	266	f
3651	5	Regular	266	f
3652	6	Regular	266	f
3653	7	Regular	266	f
3654	8	Regular	266	f
3655	9	Regular	266	f
3656	10	Regular	266	f
3657	11	Regular	266	f
3658	12	Regular	266	f
3659	13	Regular	266	f
3660	14	Regular	266	f
3661	15	Regular	266	f
3662	16	Regular	266	f
3663	17	Regular	266	f
3664	18	Regular	266	f
3665	1	Regular	267	f
3666	2	Regular	267	f
3667	3	Regular	267	f
3668	4	Regular	267	f
3669	5	Regular	267	f
3670	6	Regular	267	f
3671	7	Regular	267	f
3672	8	Regular	267	f
3673	9	Regular	267	f
3674	10	Regular	267	f
3675	11	Regular	267	f
3676	12	Regular	267	f
3677	13	Regular	267	f
3678	14	Regular	267	f
3679	15	Regular	267	f
3680	16	Regular	267	f
3681	17	Regular	267	f
3682	18	Regular	267	f
3683	1	VIP	268	f
3684	2	VIP	268	f
3685	3	VIP	268	f
3686	4	VIP	268	f
3687	5	VIP	268	f
3688	6	VIP	268	f
3689	7	VIP	268	f
3690	8	VIP	268	f
3691	9	VIP	268	f
3692	10	VIP	268	f
3693	11	VIP	268	f
3694	12	VIP	268	f
3695	13	VIP	268	f
3696	14	VIP	268	f
3697	1	Wheelchair	269	f
3698	2	Wheelchair	269	f
3699	3	Wheelchair	269	f
3700	4	Wheelchair	269	f
3701	5	Wheelchair	269	f
3702	6	Wheelchair	269	f
3703	7	Wheelchair	269	f
3704	8	Wheelchair	269	f
3705	1	VIP	270	f
3706	2	VIP	270	f
3707	3	VIP	270	f
3708	4	VIP	270	f
3709	5	VIP	270	f
3710	6	VIP	270	f
3711	7	VIP	270	f
3712	8	VIP	270	f
3713	9	VIP	270	f
3714	10	VIP	270	f
3715	11	VIP	270	f
3716	12	VIP	270	f
3717	1	Regular	271	f
3718	2	Regular	271	f
3719	3	Regular	271	f
3720	4	Regular	271	f
3721	5	Regular	271	f
3722	6	Regular	271	f
3723	7	Regular	271	f
3724	8	Regular	271	f
3725	9	Regular	271	f
3726	10	Regular	271	f
3727	11	Regular	271	f
3728	12	Regular	271	f
3729	13	Regular	271	f
3730	14	Regular	271	f
3731	15	Regular	271	f
3732	16	Regular	271	f
3733	17	Regular	271	f
3734	1	Regular	272	f
3735	2	Regular	272	f
3736	3	Regular	272	f
3737	4	Regular	272	f
3738	5	Regular	272	f
3739	6	Regular	272	f
3740	7	Regular	272	f
3741	8	Regular	272	f
3742	9	Regular	272	f
3743	10	Regular	272	f
3744	11	Regular	272	f
3745	12	Regular	272	f
3746	13	Regular	272	f
3747	14	Regular	272	f
3748	15	Regular	272	f
3749	16	Regular	272	f
3750	17	Regular	272	f
3751	1	Regular	273	f
3752	2	Regular	273	f
3753	3	Regular	273	f
3754	4	Regular	273	f
3755	5	Regular	273	f
3756	6	Regular	273	f
3757	7	Regular	273	f
3758	8	Regular	273	f
3759	9	Regular	273	f
3760	10	Regular	273	f
3761	11	Regular	273	f
3762	12	Regular	273	f
3763	13	Regular	273	f
3764	14	Regular	273	f
3765	15	Regular	273	f
3766	16	Regular	273	f
3767	17	Regular	273	f
3768	18	Regular	273	f
3769	1	Regular	274	f
3770	2	Regular	274	f
3771	3	Regular	274	f
3772	4	Regular	274	f
3773	5	Regular	274	f
3774	6	Regular	274	f
3775	7	Regular	274	f
3776	8	Regular	274	f
3777	9	Regular	274	f
3778	10	Regular	274	f
3779	11	Regular	274	f
3780	12	Regular	274	f
3781	13	Regular	274	f
3782	14	Regular	274	f
3783	1	Regular	275	f
3784	2	Regular	275	f
3785	3	Regular	275	f
3786	4	Regular	275	f
3787	5	Regular	275	f
3788	6	Regular	275	f
3789	7	Regular	275	f
3790	8	Regular	275	f
3791	9	Regular	275	f
3792	10	Regular	275	f
3793	11	Regular	275	f
3794	12	Regular	275	f
3795	13	Regular	275	f
3796	14	Regular	275	f
3797	15	Regular	275	f
3798	1	Regular	276	f
3799	2	Regular	276	f
3800	3	Regular	276	f
3801	4	Regular	276	f
3802	5	Regular	276	f
3803	6	Regular	276	f
3804	7	Regular	276	f
3805	8	Regular	276	f
3806	9	Regular	276	f
3807	10	Regular	276	f
3808	11	Regular	276	f
3809	12	Regular	276	f
3810	13	Regular	276	f
3811	14	Regular	276	f
3812	15	Regular	276	f
3813	16	Regular	276	f
3814	17	Regular	276	f
3815	18	Regular	276	f
3816	1	Regular	277	f
3817	2	Regular	277	f
3818	3	Regular	277	f
3819	4	Regular	277	f
3820	5	Regular	277	f
3821	6	Regular	277	f
3822	7	Regular	277	f
3823	8	Regular	277	f
3824	9	Regular	277	f
3825	10	Regular	277	f
3826	11	Regular	277	f
3827	12	Regular	277	f
3828	13	Regular	277	f
3829	14	Regular	277	f
3830	15	Regular	277	f
3831	16	Regular	277	f
3832	17	Regular	277	f
3833	18	Regular	277	f
3834	19	Regular	277	f
3835	20	Regular	277	f
3836	1	Regular	278	f
3837	2	Regular	278	f
3838	3	Regular	278	f
3839	4	Regular	278	f
3840	5	Regular	278	f
3841	6	Regular	278	f
3842	7	Regular	278	f
3843	8	Regular	278	f
3844	9	Regular	278	f
3845	10	Regular	278	f
3846	11	Regular	278	f
3847	12	Regular	278	f
3848	13	Regular	278	f
3849	14	Regular	278	f
3850	15	Regular	278	f
3851	16	Regular	278	f
3852	17	Regular	278	f
3853	1	VIP	279	f
3854	2	VIP	279	f
3855	3	VIP	279	f
3856	4	VIP	279	f
3857	5	VIP	279	f
3858	6	VIP	279	f
3859	7	VIP	279	f
3860	8	VIP	279	f
3861	9	VIP	279	f
3862	10	VIP	279	f
3863	11	VIP	279	f
3864	12	VIP	279	f
3865	13	VIP	279	f
3866	1	Wheelchair	280	f
3867	2	Wheelchair	280	f
3868	3	Wheelchair	280	f
3869	4	Wheelchair	280	f
3870	5	Wheelchair	280	f
3871	6	Wheelchair	280	f
3872	7	Wheelchair	280	f
3873	1	VIP	281	f
3874	2	VIP	281	f
3875	3	VIP	281	f
3876	4	VIP	281	f
3877	5	VIP	281	f
3878	6	VIP	281	f
3879	7	VIP	281	f
3880	8	VIP	281	f
3881	9	VIP	281	f
3882	10	VIP	281	f
3883	11	VIP	281	f
3884	1	Regular	282	f
3885	2	Regular	282	f
3886	3	Regular	282	f
3887	4	Regular	282	f
3888	5	Regular	282	f
3889	6	Regular	282	f
3890	7	Regular	282	f
3891	8	Regular	282	f
3892	9	Regular	282	f
3893	10	Regular	282	f
3894	11	Regular	282	f
3895	12	Regular	282	f
3896	13	Regular	282	f
3897	14	Regular	282	f
3898	15	Regular	282	f
3899	16	Regular	282	f
3900	17	Regular	282	f
3901	18	Regular	282	f
3902	1	Regular	283	f
3903	2	Regular	283	f
3904	3	Regular	283	f
3905	4	Regular	283	f
3906	5	Regular	283	f
3907	6	Regular	283	f
3908	7	Regular	283	f
3909	8	Regular	283	f
3910	9	Regular	283	f
3911	10	Regular	283	f
3912	11	Regular	283	f
3913	12	Regular	283	f
3914	13	Regular	283	f
3915	14	Regular	283	f
3916	15	Regular	283	f
3917	16	Regular	283	f
3918	17	Regular	283	f
3919	1	Regular	284	f
3920	2	Regular	284	f
3921	3	Regular	284	f
3922	4	Regular	284	f
3923	5	Regular	284	f
3924	6	Regular	284	f
3925	7	Regular	284	f
3926	8	Regular	284	f
3927	9	Regular	284	f
3928	10	Regular	284	f
3929	11	Regular	284	f
3930	12	Regular	284	f
3931	13	Regular	284	f
3932	14	Regular	284	f
3933	1	Regular	285	f
3934	2	Regular	285	f
3935	3	Regular	285	f
3936	4	Regular	285	f
3937	5	Regular	285	f
3938	6	Regular	285	f
3939	7	Regular	285	f
3940	8	Regular	285	f
3941	9	Regular	285	f
3942	10	Regular	285	f
3943	11	Regular	285	f
3944	12	Regular	285	f
3945	13	Regular	285	f
3946	14	Regular	285	f
3947	15	Regular	285	f
3948	16	Regular	285	f
3949	17	Regular	285	f
3950	18	Regular	285	f
3951	19	Regular	285	f
3952	20	Regular	285	f
3953	1	Regular	286	f
3954	2	Regular	286	f
3955	3	Regular	286	f
3956	4	Regular	286	f
3957	5	Regular	286	f
3958	6	Regular	286	f
3959	7	Regular	286	f
3960	8	Regular	286	f
3961	9	Regular	286	f
3962	10	Regular	286	f
3963	11	Regular	286	f
3964	12	Regular	286	f
3965	13	Regular	286	f
3966	14	Regular	286	f
3967	15	Regular	286	f
3968	16	Regular	286	f
3969	17	Regular	286	f
3970	1	Regular	287	f
3971	2	Regular	287	f
3972	3	Regular	287	f
3973	4	Regular	287	f
3974	5	Regular	287	f
3975	6	Regular	287	f
3976	7	Regular	287	f
3977	8	Regular	287	f
3978	9	Regular	287	f
3979	10	Regular	287	f
3980	11	Regular	287	f
3981	12	Regular	287	f
3982	13	Regular	287	f
3983	14	Regular	287	f
3984	15	Regular	287	f
3985	16	Regular	287	f
3986	17	Regular	287	f
3987	18	Regular	287	f
3988	19	Regular	287	f
3989	20	Regular	287	f
3990	1	Regular	288	f
3991	2	Regular	288	f
3992	3	Regular	288	f
3993	4	Regular	288	f
3994	5	Regular	288	f
3995	6	Regular	288	f
3996	7	Regular	288	f
3997	8	Regular	288	f
3998	9	Regular	288	f
3999	10	Regular	288	f
4000	11	Regular	288	f
4001	12	Regular	288	f
4002	13	Regular	288	f
4003	14	Regular	288	f
4004	15	Regular	288	f
4005	16	Regular	288	f
4006	17	Regular	288	f
4007	18	Regular	288	f
4008	19	Regular	288	f
4009	20	Regular	288	f
4010	1	Regular	289	f
4011	2	Regular	289	f
4012	3	Regular	289	f
4013	4	Regular	289	f
4014	5	Regular	289	f
4015	6	Regular	289	f
4016	7	Regular	289	f
4017	8	Regular	289	f
4018	9	Regular	289	f
4019	10	Regular	289	f
4020	11	Regular	289	f
4021	12	Regular	289	f
4022	13	Regular	289	f
4023	14	Regular	289	f
4024	15	Regular	289	f
4025	16	Regular	289	f
4026	1	Regular	290	f
4027	2	Regular	290	f
4028	3	Regular	290	f
4029	4	Regular	290	f
4030	5	Regular	290	f
4031	6	Regular	290	f
4032	7	Regular	290	f
4033	8	Regular	290	f
4034	9	Regular	290	f
4035	10	Regular	290	f
4036	11	Regular	290	f
4037	12	Regular	290	f
4038	13	Regular	290	f
4039	14	Regular	290	f
4040	15	Regular	290	f
4041	16	Regular	290	f
4042	1	Regular	291	f
4043	2	Regular	291	f
4044	3	Regular	291	f
4045	4	Regular	291	f
4046	5	Regular	291	f
4047	6	Regular	291	f
4048	7	Regular	291	f
4049	8	Regular	291	f
4050	9	Regular	291	f
4051	10	Regular	291	f
4052	11	Regular	291	f
4053	12	Regular	291	f
4054	13	Regular	291	f
4055	14	Regular	291	f
4056	15	Regular	291	f
4057	16	Regular	291	f
4058	17	Regular	291	f
4059	1	Regular	292	f
4060	2	Regular	292	f
4061	3	Regular	292	f
4062	4	Regular	292	f
4063	5	Regular	292	f
4064	6	Regular	292	f
4065	7	Regular	292	f
4066	8	Regular	292	f
4067	9	Regular	292	f
4068	10	Regular	292	f
4069	11	Regular	292	f
4070	12	Regular	292	f
4071	13	Regular	292	f
4072	14	Regular	292	f
4073	15	Regular	292	f
4074	1	VIP	293	f
4075	2	VIP	293	f
4076	3	VIP	293	f
4077	4	VIP	293	f
4078	5	VIP	293	f
4079	6	VIP	293	f
4080	7	VIP	293	f
4081	8	VIP	293	f
4082	9	VIP	293	f
4083	10	VIP	293	f
4084	1	Wheelchair	294	f
4085	2	Wheelchair	294	f
4086	3	Wheelchair	294	f
4087	4	Wheelchair	294	f
4088	5	Wheelchair	294	f
4089	6	Wheelchair	294	f
4090	7	Wheelchair	294	f
4091	1	VIP	295	f
4092	2	VIP	295	f
4093	3	VIP	295	f
4094	4	VIP	295	f
4095	5	VIP	295	f
4096	6	VIP	295	f
4097	7	VIP	295	f
4098	8	VIP	295	f
4099	9	VIP	295	f
4100	10	VIP	295	f
4101	1	Regular	296	f
4102	2	Regular	296	f
4103	3	Regular	296	f
4104	4	Regular	296	f
4105	5	Regular	296	f
4106	6	Regular	296	f
4107	7	Regular	296	f
4108	8	Regular	296	f
4109	9	Regular	296	f
4110	10	Regular	296	f
4111	11	Regular	296	f
4112	12	Regular	296	f
4113	13	Regular	296	f
4114	14	Regular	296	f
4115	15	Regular	296	f
4116	16	Regular	296	f
4117	17	Regular	296	f
4118	1	Regular	297	f
4119	2	Regular	297	f
4120	3	Regular	297	f
4121	4	Regular	297	f
4122	5	Regular	297	f
4123	6	Regular	297	f
4124	7	Regular	297	f
4125	8	Regular	297	f
4126	9	Regular	297	f
4127	10	Regular	297	f
4128	11	Regular	297	f
4129	12	Regular	297	f
4130	13	Regular	297	f
4131	14	Regular	297	f
4132	1	Regular	298	f
4133	2	Regular	298	f
4134	3	Regular	298	f
4135	4	Regular	298	f
4136	5	Regular	298	f
4137	6	Regular	298	f
4138	7	Regular	298	f
4139	8	Regular	298	f
4140	9	Regular	298	f
4141	10	Regular	298	f
4142	11	Regular	298	f
4143	12	Regular	298	f
4144	13	Regular	298	f
4145	14	Regular	298	f
4146	15	Regular	298	f
4147	1	Regular	299	f
4148	2	Regular	299	f
4149	3	Regular	299	f
4150	4	Regular	299	f
4151	5	Regular	299	f
4152	6	Regular	299	f
4153	7	Regular	299	f
4154	8	Regular	299	f
4155	9	Regular	299	f
4156	10	Regular	299	f
4157	11	Regular	299	f
4158	12	Regular	299	f
4159	13	Regular	299	f
4160	14	Regular	299	f
4161	15	Regular	299	f
4162	1	Regular	300	f
4163	2	Regular	300	f
4164	3	Regular	300	f
4165	4	Regular	300	f
4166	5	Regular	300	f
4167	6	Regular	300	f
4168	7	Regular	300	f
4169	8	Regular	300	f
4170	9	Regular	300	f
4171	10	Regular	300	f
4172	11	Regular	300	f
4173	12	Regular	300	f
4174	13	Regular	300	f
4175	14	Regular	300	f
4176	15	Regular	300	f
4177	16	Regular	300	f
4178	1	Regular	301	f
4179	2	Regular	301	f
4180	3	Regular	301	f
4181	4	Regular	301	f
4182	5	Regular	301	f
4183	6	Regular	301	f
4184	7	Regular	301	f
4185	8	Regular	301	f
4186	9	Regular	301	f
4187	10	Regular	301	f
4188	11	Regular	301	f
4189	12	Regular	301	f
4190	13	Regular	301	f
4191	14	Regular	301	f
4192	15	Regular	301	f
4193	16	Regular	301	f
4194	17	Regular	301	f
4195	18	Regular	301	f
4196	1	Regular	302	f
4197	2	Regular	302	f
4198	3	Regular	302	f
4199	4	Regular	302	f
4200	5	Regular	302	f
4201	6	Regular	302	f
4202	7	Regular	302	f
4203	8	Regular	302	f
4204	9	Regular	302	f
4205	10	Regular	302	f
4206	11	Regular	302	f
4207	12	Regular	302	f
4208	13	Regular	302	f
4209	14	Regular	302	f
4210	15	Regular	302	f
4211	16	Regular	302	f
4212	17	Regular	302	f
4213	18	Regular	302	f
4214	1	Regular	303	f
4215	2	Regular	303	f
4216	3	Regular	303	f
4217	4	Regular	303	f
4218	5	Regular	303	f
4219	6	Regular	303	f
4220	7	Regular	303	f
4221	8	Regular	303	f
4222	9	Regular	303	f
4223	10	Regular	303	f
4224	11	Regular	303	f
4225	12	Regular	303	f
4226	13	Regular	303	f
4227	14	Regular	303	f
4228	15	Regular	303	f
4229	16	Regular	303	f
4230	17	Regular	303	f
4231	18	Regular	303	f
4232	1	VIP	304	f
4233	2	VIP	304	f
4234	3	VIP	304	f
4235	4	VIP	304	f
4236	5	VIP	304	f
4237	6	VIP	304	f
4238	7	VIP	304	f
4239	8	VIP	304	f
4240	9	VIP	304	f
4241	10	VIP	304	f
4242	1	Wheelchair	305	f
4243	2	Wheelchair	305	f
4244	3	Wheelchair	305	f
4245	4	Wheelchair	305	f
4246	5	Wheelchair	305	f
4247	1	VIP	306	f
4248	2	VIP	306	f
4249	3	VIP	306	f
4250	4	VIP	306	f
4251	5	VIP	306	f
4252	6	VIP	306	f
4253	7	VIP	306	f
4254	8	VIP	306	f
4255	9	VIP	306	f
4256	10	VIP	306	f
4257	11	VIP	306	f
4258	12	VIP	306	f
4259	13	VIP	306	f
4260	1	Regular	307	f
4261	2	Regular	307	f
4262	3	Regular	307	f
4263	4	Regular	307	f
4264	5	Regular	307	f
4265	6	Regular	307	f
4266	7	Regular	307	f
4267	8	Regular	307	f
4268	9	Regular	307	f
4269	10	Regular	307	f
4270	11	Regular	307	f
4271	12	Regular	307	f
4272	13	Regular	307	f
4273	14	Regular	307	f
4274	15	Regular	307	f
4275	16	Regular	307	f
4276	17	Regular	307	f
4277	1	Regular	308	f
4278	2	Regular	308	f
4279	3	Regular	308	f
4280	4	Regular	308	f
4281	5	Regular	308	f
4282	6	Regular	308	f
4283	7	Regular	308	f
4284	8	Regular	308	f
4285	9	Regular	308	f
4286	10	Regular	308	f
4287	11	Regular	308	f
4288	12	Regular	308	f
4289	13	Regular	308	f
4290	14	Regular	308	f
4291	15	Regular	308	f
4292	1	Regular	309	f
4293	2	Regular	309	f
4294	3	Regular	309	f
4295	4	Regular	309	f
4296	5	Regular	309	f
4297	6	Regular	309	f
4298	7	Regular	309	f
4299	8	Regular	309	f
4300	9	Regular	309	f
4301	10	Regular	309	f
4302	11	Regular	309	f
4303	12	Regular	309	f
4304	13	Regular	309	f
4305	14	Regular	309	f
4306	15	Regular	309	f
4307	16	Regular	309	f
4308	17	Regular	309	f
4309	18	Regular	309	f
4310	19	Regular	309	f
4311	1	Regular	310	f
4312	2	Regular	310	f
4313	3	Regular	310	f
4314	4	Regular	310	f
4315	5	Regular	310	f
4316	6	Regular	310	f
4317	7	Regular	310	f
4318	8	Regular	310	f
4319	9	Regular	310	f
4320	10	Regular	310	f
4321	11	Regular	310	f
4322	12	Regular	310	f
4323	13	Regular	310	f
4324	14	Regular	310	f
4325	15	Regular	310	f
4326	16	Regular	310	f
4327	17	Regular	310	f
4328	18	Regular	310	f
4329	19	Regular	310	f
4330	20	Regular	310	f
4331	1	Regular	311	f
4332	2	Regular	311	f
4333	3	Regular	311	f
4334	4	Regular	311	f
4335	5	Regular	311	f
4336	6	Regular	311	f
4337	7	Regular	311	f
4338	8	Regular	311	f
4339	9	Regular	311	f
4340	10	Regular	311	f
4341	11	Regular	311	f
4342	12	Regular	311	f
4343	13	Regular	311	f
4344	14	Regular	311	f
4345	15	Regular	311	f
4346	16	Regular	311	f
4347	17	Regular	311	f
4348	18	Regular	311	f
4349	1	Regular	312	f
4350	2	Regular	312	f
4351	3	Regular	312	f
4352	4	Regular	312	f
4353	5	Regular	312	f
4354	6	Regular	312	f
4355	7	Regular	312	f
4356	8	Regular	312	f
4357	9	Regular	312	f
4358	10	Regular	312	f
4359	11	Regular	312	f
4360	12	Regular	312	f
4361	13	Regular	312	f
4362	14	Regular	312	f
4363	15	Regular	312	f
4364	16	Regular	312	f
4365	17	Regular	312	f
4366	18	Regular	312	f
4367	19	Regular	312	f
4368	20	Regular	312	f
4369	1	Regular	313	f
4370	2	Regular	313	f
4371	3	Regular	313	f
4372	4	Regular	313	f
4373	5	Regular	313	f
4374	6	Regular	313	f
4375	7	Regular	313	f
4376	8	Regular	313	f
4377	9	Regular	313	f
4378	10	Regular	313	f
4379	11	Regular	313	f
4380	12	Regular	313	f
4381	13	Regular	313	f
4382	14	Regular	313	f
4383	15	Regular	313	f
4384	16	Regular	313	f
4385	17	Regular	313	f
4386	18	Regular	313	f
4387	19	Regular	313	f
4388	1	Regular	314	f
4389	2	Regular	314	f
4390	3	Regular	314	f
4391	4	Regular	314	f
4392	5	Regular	314	f
4393	6	Regular	314	f
4394	7	Regular	314	f
4395	8	Regular	314	f
4396	9	Regular	314	f
4397	10	Regular	314	f
4398	11	Regular	314	f
4399	12	Regular	314	f
4400	13	Regular	314	f
4401	14	Regular	314	f
4402	1	Regular	315	f
4403	2	Regular	315	f
4404	3	Regular	315	f
4405	4	Regular	315	f
4406	5	Regular	315	f
4407	6	Regular	315	f
4408	7	Regular	315	f
4409	8	Regular	315	f
4410	9	Regular	315	f
4411	10	Regular	315	f
4412	11	Regular	315	f
4413	12	Regular	315	f
4414	13	Regular	315	f
4415	14	Regular	315	f
4416	15	Regular	315	f
4417	1	Regular	316	f
4418	2	Regular	316	f
4419	3	Regular	316	f
4420	4	Regular	316	f
4421	5	Regular	316	f
4422	6	Regular	316	f
4423	7	Regular	316	f
4424	8	Regular	316	f
4425	9	Regular	316	f
4426	10	Regular	316	f
4427	11	Regular	316	f
4428	12	Regular	316	f
4429	13	Regular	316	f
4430	14	Regular	316	f
4431	15	Regular	316	f
4432	16	Regular	316	f
4433	1	VIP	317	f
4434	2	VIP	317	f
4435	3	VIP	317	f
4436	4	VIP	317	f
4437	5	VIP	317	f
4438	6	VIP	317	f
4439	7	VIP	317	f
4440	8	VIP	317	f
4441	9	VIP	317	f
4442	10	VIP	317	f
4443	1	Wheelchair	318	f
4444	2	Wheelchair	318	f
4445	3	Wheelchair	318	f
4446	4	Wheelchair	318	f
4447	5	Wheelchair	318	f
4448	6	Wheelchair	318	f
4449	1	VIP	319	f
4450	2	VIP	319	f
4451	3	VIP	319	f
4452	4	VIP	319	f
4453	5	VIP	319	f
4454	6	VIP	319	f
4455	7	VIP	319	f
4456	8	VIP	319	f
4457	9	VIP	319	f
4458	10	VIP	319	f
4459	11	VIP	319	f
4460	12	VIP	319	f
4461	13	VIP	319	f
4462	1	Regular	320	f
4463	2	Regular	320	f
4464	3	Regular	320	f
4465	4	Regular	320	f
4466	5	Regular	320	f
4467	6	Regular	320	f
4468	7	Regular	320	f
4469	8	Regular	320	f
4470	9	Regular	320	f
4471	10	Regular	320	f
4472	11	Regular	320	f
4473	12	Regular	320	f
4474	13	Regular	320	f
4475	14	Regular	320	f
4476	15	Regular	320	f
4477	16	Regular	320	f
4478	17	Regular	320	f
4479	18	Regular	320	f
4480	19	Regular	320	f
4481	1	Regular	321	f
4482	2	Regular	321	f
4483	3	Regular	321	f
4484	4	Regular	321	f
4485	5	Regular	321	f
4486	6	Regular	321	f
4487	7	Regular	321	f
4488	8	Regular	321	f
4489	9	Regular	321	f
4490	10	Regular	321	f
4491	11	Regular	321	f
4492	12	Regular	321	f
4493	13	Regular	321	f
4494	14	Regular	321	f
4495	15	Regular	321	f
4496	16	Regular	321	f
4497	17	Regular	321	f
4498	18	Regular	321	f
4499	19	Regular	321	f
4500	1	Regular	322	f
4501	2	Regular	322	f
4502	3	Regular	322	f
4503	4	Regular	322	f
4504	5	Regular	322	f
4505	6	Regular	322	f
4506	7	Regular	322	f
4507	8	Regular	322	f
4508	9	Regular	322	f
4509	10	Regular	322	f
4510	11	Regular	322	f
4511	12	Regular	322	f
4512	13	Regular	322	f
4513	14	Regular	322	f
4514	15	Regular	322	f
4515	16	Regular	322	f
4516	17	Regular	322	f
4517	18	Regular	322	f
4518	1	Regular	323	f
4519	2	Regular	323	f
4520	3	Regular	323	f
4521	4	Regular	323	f
4522	5	Regular	323	f
4523	6	Regular	323	f
4524	7	Regular	323	f
4525	8	Regular	323	f
4526	9	Regular	323	f
4527	10	Regular	323	f
4528	11	Regular	323	f
4529	12	Regular	323	f
4530	13	Regular	323	f
4531	14	Regular	323	f
4532	15	Regular	323	f
4533	16	Regular	323	f
4534	1	Regular	324	f
4535	2	Regular	324	f
4536	3	Regular	324	f
4537	4	Regular	324	f
4538	5	Regular	324	f
4539	6	Regular	324	f
4540	7	Regular	324	f
4541	8	Regular	324	f
4542	9	Regular	324	f
4543	10	Regular	324	f
4544	11	Regular	324	f
4545	12	Regular	324	f
4546	13	Regular	324	f
4547	14	Regular	324	f
4548	15	Regular	324	f
4549	16	Regular	324	f
4550	17	Regular	324	f
4551	18	Regular	324	f
4552	19	Regular	324	f
4553	1	Regular	325	f
4554	2	Regular	325	f
4555	3	Regular	325	f
4556	4	Regular	325	f
4557	5	Regular	325	f
4558	6	Regular	325	f
4559	7	Regular	325	f
4560	8	Regular	325	f
4561	9	Regular	325	f
4562	10	Regular	325	f
4563	11	Regular	325	f
4564	12	Regular	325	f
4565	13	Regular	325	f
4566	14	Regular	325	f
4567	15	Regular	325	f
4568	16	Regular	325	f
4569	17	Regular	325	f
4570	18	Regular	325	f
4571	19	Regular	325	f
4572	20	Regular	325	f
4573	1	Regular	326	f
4574	2	Regular	326	f
4575	3	Regular	326	f
4576	4	Regular	326	f
4577	5	Regular	326	f
4578	6	Regular	326	f
4579	7	Regular	326	f
4580	8	Regular	326	f
4581	9	Regular	326	f
4582	10	Regular	326	f
4583	11	Regular	326	f
4584	12	Regular	326	f
4585	13	Regular	326	f
4586	14	Regular	326	f
4587	15	Regular	326	f
4588	16	Regular	326	f
4589	17	Regular	326	f
4590	18	Regular	326	f
4591	19	Regular	326	f
4592	1	VIP	327	f
4593	2	VIP	327	f
4594	3	VIP	327	f
4595	4	VIP	327	f
4596	5	VIP	327	f
4597	6	VIP	327	f
4598	7	VIP	327	f
4599	8	VIP	327	f
4600	9	VIP	327	f
4601	10	VIP	327	f
4602	11	VIP	327	f
4603	12	VIP	327	f
4604	13	VIP	327	f
4605	14	VIP	327	f
4606	1	Wheelchair	328	f
4607	2	Wheelchair	328	f
4608	3	Wheelchair	328	f
4609	4	Wheelchair	328	f
4610	1	VIP	329	f
4611	2	VIP	329	f
4612	3	VIP	329	f
4613	4	VIP	329	f
4614	5	VIP	329	f
4615	6	VIP	329	f
4616	7	VIP	329	f
4617	8	VIP	329	f
4618	9	VIP	329	f
4619	10	VIP	329	f
4620	1	Regular	330	f
4621	2	Regular	330	f
4622	3	Regular	330	f
4623	4	Regular	330	f
4624	5	Regular	330	f
4625	6	Regular	330	f
4626	7	Regular	330	f
4627	8	Regular	330	f
4628	9	Regular	330	f
4629	10	Regular	330	f
4630	11	Regular	330	f
4631	12	Regular	330	f
4632	13	Regular	330	f
4633	14	Regular	330	f
4634	15	Regular	330	f
4635	16	Regular	330	f
4636	17	Regular	330	f
4637	1	Regular	331	f
4638	2	Regular	331	f
4639	3	Regular	331	f
4640	4	Regular	331	f
4641	5	Regular	331	f
4642	6	Regular	331	f
4643	7	Regular	331	f
4644	8	Regular	331	f
4645	9	Regular	331	f
4646	10	Regular	331	f
4647	11	Regular	331	f
4648	12	Regular	331	f
4649	13	Regular	331	f
4650	14	Regular	331	f
4651	1	Regular	332	f
4652	2	Regular	332	f
4653	3	Regular	332	f
4654	4	Regular	332	f
4655	5	Regular	332	f
4656	6	Regular	332	f
4657	7	Regular	332	f
4658	8	Regular	332	f
4659	9	Regular	332	f
4660	10	Regular	332	f
4661	11	Regular	332	f
4662	12	Regular	332	f
4663	13	Regular	332	f
4664	14	Regular	332	f
4665	15	Regular	332	f
4666	16	Regular	332	f
4667	17	Regular	332	f
4668	18	Regular	332	f
4669	19	Regular	332	f
4670	20	Regular	332	f
4671	1	Regular	333	f
4672	2	Regular	333	f
4673	3	Regular	333	f
4674	4	Regular	333	f
4675	5	Regular	333	f
4676	6	Regular	333	f
4677	7	Regular	333	f
4678	8	Regular	333	f
4679	9	Regular	333	f
4680	10	Regular	333	f
4681	11	Regular	333	f
4682	12	Regular	333	f
4683	13	Regular	333	f
4684	14	Regular	333	f
4685	15	Regular	333	f
4686	16	Regular	333	f
4687	17	Regular	333	f
4688	18	Regular	333	f
4689	19	Regular	333	f
4690	1	Regular	334	f
4691	2	Regular	334	f
4692	3	Regular	334	f
4693	4	Regular	334	f
4694	5	Regular	334	f
4695	6	Regular	334	f
4696	7	Regular	334	f
4697	8	Regular	334	f
4698	9	Regular	334	f
4699	10	Regular	334	f
4700	11	Regular	334	f
4701	12	Regular	334	f
4702	13	Regular	334	f
4703	14	Regular	334	f
4704	15	Regular	334	f
4705	16	Regular	334	f
4706	17	Regular	334	f
4707	1	Regular	335	f
4708	2	Regular	335	f
4709	3	Regular	335	f
4710	4	Regular	335	f
4711	5	Regular	335	f
4712	6	Regular	335	f
4713	7	Regular	335	f
4714	8	Regular	335	f
4715	9	Regular	335	f
4716	10	Regular	335	f
4717	11	Regular	335	f
4718	12	Regular	335	f
4719	13	Regular	335	f
4720	14	Regular	335	f
4721	15	Regular	335	f
4722	16	Regular	335	f
4723	17	Regular	335	f
4724	1	Regular	336	f
4725	2	Regular	336	f
4726	3	Regular	336	f
4727	4	Regular	336	f
4728	5	Regular	336	f
4729	6	Regular	336	f
4730	7	Regular	336	f
4731	8	Regular	336	f
4732	9	Regular	336	f
4733	10	Regular	336	f
4734	11	Regular	336	f
4735	12	Regular	336	f
4736	13	Regular	336	f
4737	14	Regular	336	f
4738	1	VIP	337	f
4739	2	VIP	337	f
4740	3	VIP	337	f
4741	4	VIP	337	f
4742	5	VIP	337	f
4743	6	VIP	337	f
4744	7	VIP	337	f
4745	8	VIP	337	f
4746	9	VIP	337	f
4747	10	VIP	337	f
4748	11	VIP	337	f
4749	12	VIP	337	f
4750	13	VIP	337	f
4751	1	Wheelchair	338	f
4752	2	Wheelchair	338	f
4753	3	Wheelchair	338	f
4754	4	Wheelchair	338	f
4755	5	Wheelchair	338	f
4756	6	Wheelchair	338	f
4757	7	Wheelchair	338	f
4758	8	Wheelchair	338	f
4759	1	VIP	339	f
4760	2	VIP	339	f
4761	3	VIP	339	f
4762	4	VIP	339	f
4763	5	VIP	339	f
4764	6	VIP	339	f
4765	7	VIP	339	f
4766	8	VIP	339	f
4767	9	VIP	339	f
4768	10	VIP	339	f
4769	11	VIP	339	f
4770	12	VIP	339	f
4771	13	VIP	339	f
4772	1	Regular	340	f
4773	2	Regular	340	f
4774	3	Regular	340	f
4775	4	Regular	340	f
4776	5	Regular	340	f
4777	6	Regular	340	f
4778	7	Regular	340	f
4779	8	Regular	340	f
4780	9	Regular	340	f
4781	10	Regular	340	f
4782	11	Regular	340	f
4783	12	Regular	340	f
4784	13	Regular	340	f
4785	14	Regular	340	f
4786	15	Regular	340	f
4787	16	Regular	340	f
4788	1	Regular	341	f
4789	2	Regular	341	f
4790	3	Regular	341	f
4791	4	Regular	341	f
4792	5	Regular	341	f
4793	6	Regular	341	f
4794	7	Regular	341	f
4795	8	Regular	341	f
4796	9	Regular	341	f
4797	10	Regular	341	f
4798	11	Regular	341	f
4799	12	Regular	341	f
4800	13	Regular	341	f
4801	14	Regular	341	f
4802	15	Regular	341	f
4803	16	Regular	341	f
4804	17	Regular	341	f
4805	18	Regular	341	f
4806	19	Regular	341	f
4807	1	Regular	342	f
4808	2	Regular	342	f
4809	3	Regular	342	f
4810	4	Regular	342	f
4811	5	Regular	342	f
4812	6	Regular	342	f
4813	7	Regular	342	f
4814	8	Regular	342	f
4815	9	Regular	342	f
4816	10	Regular	342	f
4817	11	Regular	342	f
4818	12	Regular	342	f
4819	13	Regular	342	f
4820	14	Regular	342	f
4821	15	Regular	342	f
4822	16	Regular	342	f
4823	17	Regular	342	f
4824	18	Regular	342	f
4825	1	Regular	343	f
4826	2	Regular	343	f
4827	3	Regular	343	f
4828	4	Regular	343	f
4829	5	Regular	343	f
4830	6	Regular	343	f
4831	7	Regular	343	f
4832	8	Regular	343	f
4833	9	Regular	343	f
4834	10	Regular	343	f
4835	11	Regular	343	f
4836	12	Regular	343	f
4837	13	Regular	343	f
4838	14	Regular	343	f
4839	1	Regular	344	f
4840	2	Regular	344	f
4841	3	Regular	344	f
4842	4	Regular	344	f
4843	5	Regular	344	f
4844	6	Regular	344	f
4845	7	Regular	344	f
4846	8	Regular	344	f
4847	9	Regular	344	f
4848	10	Regular	344	f
4849	11	Regular	344	f
4850	12	Regular	344	f
4851	13	Regular	344	f
4852	14	Regular	344	f
4853	15	Regular	344	f
4854	1	Regular	345	f
4855	2	Regular	345	f
4856	3	Regular	345	f
4857	4	Regular	345	f
4858	5	Regular	345	f
4859	6	Regular	345	f
4860	7	Regular	345	f
4861	8	Regular	345	f
4862	9	Regular	345	f
4863	10	Regular	345	f
4864	11	Regular	345	f
4865	12	Regular	345	f
4866	13	Regular	345	f
4867	14	Regular	345	f
4868	15	Regular	345	f
4869	16	Regular	345	f
4870	1	Regular	346	f
4871	2	Regular	346	f
4872	3	Regular	346	f
4873	4	Regular	346	f
4874	5	Regular	346	f
4875	6	Regular	346	f
4876	7	Regular	346	f
4877	8	Regular	346	f
4878	9	Regular	346	f
4879	10	Regular	346	f
4880	11	Regular	346	f
4881	12	Regular	346	f
4882	13	Regular	346	f
4883	14	Regular	346	f
4884	1	Regular	347	f
4885	2	Regular	347	f
4886	3	Regular	347	f
4887	4	Regular	347	f
4888	5	Regular	347	f
4889	6	Regular	347	f
4890	7	Regular	347	f
4891	8	Regular	347	f
4892	9	Regular	347	f
4893	10	Regular	347	f
4894	11	Regular	347	f
4895	12	Regular	347	f
4896	13	Regular	347	f
4897	14	Regular	347	f
4898	15	Regular	347	f
4899	16	Regular	347	f
4900	17	Regular	347	f
4901	18	Regular	347	f
4902	19	Regular	347	f
4903	20	Regular	347	f
4904	1	Regular	348	f
4905	2	Regular	348	f
4906	3	Regular	348	f
4907	4	Regular	348	f
4908	5	Regular	348	f
4909	6	Regular	348	f
4910	7	Regular	348	f
4911	8	Regular	348	f
4912	9	Regular	348	f
4913	10	Regular	348	f
4914	11	Regular	348	f
4915	12	Regular	348	f
4916	13	Regular	348	f
4917	14	Regular	348	f
4918	15	Regular	348	f
4919	16	Regular	348	f
4920	17	Regular	348	f
4921	1	VIP	349	f
4922	2	VIP	349	f
4923	3	VIP	349	f
4924	4	VIP	349	f
4925	5	VIP	349	f
4926	6	VIP	349	f
4927	7	VIP	349	f
4928	8	VIP	349	f
4929	9	VIP	349	f
4930	10	VIP	349	f
4931	11	VIP	349	f
4932	1	Wheelchair	350	f
4933	2	Wheelchair	350	f
4934	3	Wheelchair	350	f
4935	4	Wheelchair	350	f
4936	5	Wheelchair	350	f
4937	1	VIP	351	f
4938	2	VIP	351	f
4939	3	VIP	351	f
4940	4	VIP	351	f
4941	5	VIP	351	f
4942	6	VIP	351	f
4943	7	VIP	351	f
4944	8	VIP	351	f
4945	9	VIP	351	f
4946	10	VIP	351	f
4947	11	VIP	351	f
4948	12	VIP	351	f
4949	13	VIP	351	f
4950	14	VIP	351	f
4951	1	Regular	352	f
4952	2	Regular	352	f
4953	3	Regular	352	f
4954	4	Regular	352	f
4955	5	Regular	352	f
4956	6	Regular	352	f
4957	7	Regular	352	f
4958	8	Regular	352	f
4959	9	Regular	352	f
4960	10	Regular	352	f
4961	11	Regular	352	f
4962	12	Regular	352	f
4963	13	Regular	352	f
4964	14	Regular	352	f
4965	15	Regular	352	f
4966	1	Regular	353	f
4967	2	Regular	353	f
4968	3	Regular	353	f
4969	4	Regular	353	f
4970	5	Regular	353	f
4971	6	Regular	353	f
4972	7	Regular	353	f
4973	8	Regular	353	f
4974	9	Regular	353	f
4975	10	Regular	353	f
4976	11	Regular	353	f
4977	12	Regular	353	f
4978	13	Regular	353	f
4979	14	Regular	353	f
4980	15	Regular	353	f
4981	1	Regular	354	f
4982	2	Regular	354	f
4983	3	Regular	354	f
4984	4	Regular	354	f
4985	5	Regular	354	f
4986	6	Regular	354	f
4987	7	Regular	354	f
4988	8	Regular	354	f
4989	9	Regular	354	f
4990	10	Regular	354	f
4991	11	Regular	354	f
4992	12	Regular	354	f
4993	13	Regular	354	f
4994	14	Regular	354	f
4995	15	Regular	354	f
4996	1	Regular	355	f
4997	2	Regular	355	f
4998	3	Regular	355	f
4999	4	Regular	355	f
5000	5	Regular	355	f
5001	6	Regular	355	f
5002	7	Regular	355	f
5003	8	Regular	355	f
5004	9	Regular	355	f
5005	10	Regular	355	f
5006	11	Regular	355	f
5007	12	Regular	355	f
5008	13	Regular	355	f
5009	14	Regular	355	f
5010	15	Regular	355	f
5011	1	Regular	356	f
5012	2	Regular	356	f
5013	3	Regular	356	f
5014	4	Regular	356	f
5015	5	Regular	356	f
5016	6	Regular	356	f
5017	7	Regular	356	f
5018	8	Regular	356	f
5019	9	Regular	356	f
5020	10	Regular	356	f
5021	11	Regular	356	f
5022	12	Regular	356	f
5023	13	Regular	356	f
5024	14	Regular	356	f
5025	15	Regular	356	f
5026	16	Regular	356	f
5027	17	Regular	356	f
5028	1	Regular	357	f
5029	2	Regular	357	f
5030	3	Regular	357	f
5031	4	Regular	357	f
5032	5	Regular	357	f
5033	6	Regular	357	f
5034	7	Regular	357	f
5035	8	Regular	357	f
5036	9	Regular	357	f
5037	10	Regular	357	f
5038	11	Regular	357	f
5039	12	Regular	357	f
5040	13	Regular	357	f
5041	14	Regular	357	f
5042	15	Regular	357	f
5043	16	Regular	357	f
5044	17	Regular	357	f
5045	1	Regular	358	f
5046	2	Regular	358	f
5047	3	Regular	358	f
5048	4	Regular	358	f
5049	5	Regular	358	f
5050	6	Regular	358	f
5051	7	Regular	358	f
5052	8	Regular	358	f
5053	9	Regular	358	f
5054	10	Regular	358	f
5055	11	Regular	358	f
5056	12	Regular	358	f
5057	13	Regular	358	f
5058	14	Regular	358	f
5059	1	Regular	359	f
5060	2	Regular	359	f
5061	3	Regular	359	f
5062	4	Regular	359	f
5063	5	Regular	359	f
5064	6	Regular	359	f
5065	7	Regular	359	f
5066	8	Regular	359	f
5067	9	Regular	359	f
5068	10	Regular	359	f
5069	11	Regular	359	f
5070	12	Regular	359	f
5071	13	Regular	359	f
5072	14	Regular	359	f
5073	1	Regular	360	f
5074	2	Regular	360	f
5075	3	Regular	360	f
5076	4	Regular	360	f
5077	5	Regular	360	f
5078	6	Regular	360	f
5079	7	Regular	360	f
5080	8	Regular	360	f
5081	9	Regular	360	f
5082	10	Regular	360	f
5083	11	Regular	360	f
5084	12	Regular	360	f
5085	13	Regular	360	f
5086	14	Regular	360	f
5087	15	Regular	360	f
5088	16	Regular	360	f
5089	17	Regular	360	f
5090	18	Regular	360	f
5091	1	VIP	361	f
5092	2	VIP	361	f
5093	3	VIP	361	f
5094	4	VIP	361	f
5095	5	VIP	361	f
5096	6	VIP	361	f
5097	7	VIP	361	f
5098	8	VIP	361	f
5099	9	VIP	361	f
5100	10	VIP	361	f
5101	11	VIP	361	f
5102	12	VIP	361	f
5103	13	VIP	361	f
5104	14	VIP	361	f
5105	1	Wheelchair	362	f
5106	2	Wheelchair	362	f
5107	3	Wheelchair	362	f
5108	4	Wheelchair	362	f
5109	5	Wheelchair	362	f
5110	1	VIP	363	f
5111	2	VIP	363	f
5112	3	VIP	363	f
5113	4	VIP	363	f
5114	5	VIP	363	f
5115	6	VIP	363	f
5116	7	VIP	363	f
5117	8	VIP	363	f
5118	9	VIP	363	f
5119	10	VIP	363	f
5120	11	VIP	363	f
5121	12	VIP	363	f
5122	13	VIP	363	f
5123	1	Regular	364	f
5124	2	Regular	364	f
5125	3	Regular	364	f
5126	4	Regular	364	f
5127	5	Regular	364	f
5128	6	Regular	364	f
5129	7	Regular	364	f
5130	8	Regular	364	f
5131	9	Regular	364	f
5132	10	Regular	364	f
5133	11	Regular	364	f
5134	12	Regular	364	f
5135	13	Regular	364	f
5136	14	Regular	364	f
5137	15	Regular	364	f
5138	16	Regular	364	f
5139	17	Regular	364	f
5140	18	Regular	364	f
5141	19	Regular	364	f
5142	1	Regular	365	f
5143	2	Regular	365	f
5144	3	Regular	365	f
5145	4	Regular	365	f
5146	5	Regular	365	f
5147	6	Regular	365	f
5148	7	Regular	365	f
5149	8	Regular	365	f
5150	9	Regular	365	f
5151	10	Regular	365	f
5152	11	Regular	365	f
5153	12	Regular	365	f
5154	13	Regular	365	f
5155	14	Regular	365	f
5156	1	Regular	366	f
5157	2	Regular	366	f
5158	3	Regular	366	f
5159	4	Regular	366	f
5160	5	Regular	366	f
5161	6	Regular	366	f
5162	7	Regular	366	f
5163	8	Regular	366	f
5164	9	Regular	366	f
5165	10	Regular	366	f
5166	11	Regular	366	f
5167	12	Regular	366	f
5168	13	Regular	366	f
5169	14	Regular	366	f
5170	15	Regular	366	f
5171	1	Regular	367	f
5172	2	Regular	367	f
5173	3	Regular	367	f
5174	4	Regular	367	f
5175	5	Regular	367	f
5176	6	Regular	367	f
5177	7	Regular	367	f
5178	8	Regular	367	f
5179	9	Regular	367	f
5180	10	Regular	367	f
5181	11	Regular	367	f
5182	12	Regular	367	f
5183	13	Regular	367	f
5184	14	Regular	367	f
5185	15	Regular	367	f
5186	16	Regular	367	f
5187	17	Regular	367	f
5188	1	Regular	368	f
5189	2	Regular	368	f
5190	3	Regular	368	f
5191	4	Regular	368	f
5192	5	Regular	368	f
5193	6	Regular	368	f
5194	7	Regular	368	f
5195	8	Regular	368	f
5196	9	Regular	368	f
5197	10	Regular	368	f
5198	11	Regular	368	f
5199	12	Regular	368	f
5200	13	Regular	368	f
5201	14	Regular	368	f
5202	15	Regular	368	f
5203	16	Regular	368	f
5204	17	Regular	368	f
5205	18	Regular	368	f
5206	19	Regular	368	f
5207	1	Regular	369	f
5208	2	Regular	369	f
5209	3	Regular	369	f
5210	4	Regular	369	f
5211	5	Regular	369	f
5212	6	Regular	369	f
5213	7	Regular	369	f
5214	8	Regular	369	f
5215	9	Regular	369	f
5216	10	Regular	369	f
5217	11	Regular	369	f
5218	12	Regular	369	f
5219	13	Regular	369	f
5220	14	Regular	369	f
5221	15	Regular	369	f
5222	16	Regular	369	f
5223	17	Regular	369	f
5224	1	Regular	370	f
5225	2	Regular	370	f
5226	3	Regular	370	f
5227	4	Regular	370	f
5228	5	Regular	370	f
5229	6	Regular	370	f
5230	7	Regular	370	f
5231	8	Regular	370	f
5232	9	Regular	370	f
5233	10	Regular	370	f
5234	11	Regular	370	f
5235	12	Regular	370	f
5236	13	Regular	370	f
5237	14	Regular	370	f
5238	15	Regular	370	f
5239	16	Regular	370	f
5240	1	Regular	371	f
5241	2	Regular	371	f
5242	3	Regular	371	f
5243	4	Regular	371	f
5244	5	Regular	371	f
5245	6	Regular	371	f
5246	7	Regular	371	f
5247	8	Regular	371	f
5248	9	Regular	371	f
5249	10	Regular	371	f
5250	11	Regular	371	f
5251	12	Regular	371	f
5252	13	Regular	371	f
5253	14	Regular	371	f
5254	15	Regular	371	f
5255	1	Regular	372	f
5256	2	Regular	372	f
5257	3	Regular	372	f
5258	4	Regular	372	f
5259	5	Regular	372	f
5260	6	Regular	372	f
5261	7	Regular	372	f
5262	8	Regular	372	f
5263	9	Regular	372	f
5264	10	Regular	372	f
5265	11	Regular	372	f
5266	12	Regular	372	f
5267	13	Regular	372	f
5268	14	Regular	372	f
5269	15	Regular	372	f
5270	1	Regular	373	f
5271	2	Regular	373	f
5272	3	Regular	373	f
5273	4	Regular	373	f
5274	5	Regular	373	f
5275	6	Regular	373	f
5276	7	Regular	373	f
5277	8	Regular	373	f
5278	9	Regular	373	f
5279	10	Regular	373	f
5280	11	Regular	373	f
5281	12	Regular	373	f
5282	13	Regular	373	f
5283	14	Regular	373	f
5284	15	Regular	373	f
5285	1	Regular	374	f
5286	2	Regular	374	f
5287	3	Regular	374	f
5288	4	Regular	374	f
5289	5	Regular	374	f
5290	6	Regular	374	f
5291	7	Regular	374	f
5292	8	Regular	374	f
5293	9	Regular	374	f
5294	10	Regular	374	f
5295	11	Regular	374	f
5296	12	Regular	374	f
5297	13	Regular	374	f
5298	14	Regular	374	f
5299	15	Regular	374	f
5300	16	Regular	374	f
5301	17	Regular	374	f
5302	18	Regular	374	f
5303	1	VIP	375	f
5304	2	VIP	375	f
5305	3	VIP	375	f
5306	4	VIP	375	f
5307	5	VIP	375	f
5308	6	VIP	375	f
5309	7	VIP	375	f
5310	8	VIP	375	f
5311	9	VIP	375	f
5312	10	VIP	375	f
5313	11	VIP	375	f
5314	1	Wheelchair	376	f
5315	2	Wheelchair	376	f
5316	3	Wheelchair	376	f
5317	4	Wheelchair	376	f
5318	5	Wheelchair	376	f
5319	1	VIP	377	f
5320	2	VIP	377	f
5321	3	VIP	377	f
5322	4	VIP	377	f
5323	5	VIP	377	f
5324	6	VIP	377	f
5325	7	VIP	377	f
5326	8	VIP	377	f
5327	9	VIP	377	f
5328	10	VIP	377	f
5329	11	VIP	377	f
5330	12	VIP	377	f
5331	13	VIP	377	f
5332	1	Regular	378	f
5333	2	Regular	378	f
5334	3	Regular	378	f
5335	4	Regular	378	f
5336	5	Regular	378	f
5337	6	Regular	378	f
5338	7	Regular	378	f
5339	8	Regular	378	f
5340	9	Regular	378	f
5341	10	Regular	378	f
5342	11	Regular	378	f
5343	12	Regular	378	f
5344	13	Regular	378	f
5345	14	Regular	378	f
5346	15	Regular	378	f
5347	16	Regular	378	f
5348	17	Regular	378	f
5349	1	Regular	379	f
5350	2	Regular	379	f
5351	3	Regular	379	f
5352	4	Regular	379	f
5353	5	Regular	379	f
5354	6	Regular	379	f
5355	7	Regular	379	f
5356	8	Regular	379	f
5357	9	Regular	379	f
5358	10	Regular	379	f
5359	11	Regular	379	f
5360	12	Regular	379	f
5361	13	Regular	379	f
5362	14	Regular	379	f
5363	15	Regular	379	f
5364	16	Regular	379	f
5365	17	Regular	379	f
5366	1	Regular	380	f
5367	2	Regular	380	f
5368	3	Regular	380	f
5369	4	Regular	380	f
5370	5	Regular	380	f
5371	6	Regular	380	f
5372	7	Regular	380	f
5373	8	Regular	380	f
5374	9	Regular	380	f
5375	10	Regular	380	f
5376	11	Regular	380	f
5377	12	Regular	380	f
5378	13	Regular	380	f
5379	14	Regular	380	f
5380	1	Regular	381	f
5381	2	Regular	381	f
5382	3	Regular	381	f
5383	4	Regular	381	f
5384	5	Regular	381	f
5385	6	Regular	381	f
5386	7	Regular	381	f
5387	8	Regular	381	f
5388	9	Regular	381	f
5389	10	Regular	381	f
5390	11	Regular	381	f
5391	12	Regular	381	f
5392	13	Regular	381	f
5393	14	Regular	381	f
5394	15	Regular	381	f
5395	16	Regular	381	f
5396	17	Regular	381	f
5397	18	Regular	381	f
5398	19	Regular	381	f
5399	20	Regular	381	f
5400	1	Regular	382	f
5401	2	Regular	382	f
5402	3	Regular	382	f
5403	4	Regular	382	f
5404	5	Regular	382	f
5405	6	Regular	382	f
5406	7	Regular	382	f
5407	8	Regular	382	f
5408	9	Regular	382	f
5409	10	Regular	382	f
5410	11	Regular	382	f
5411	12	Regular	382	f
5412	13	Regular	382	f
5413	14	Regular	382	f
5414	15	Regular	382	f
5415	16	Regular	382	f
5416	17	Regular	382	f
5417	18	Regular	382	f
5418	1	Regular	383	f
5419	2	Regular	383	f
5420	3	Regular	383	f
5421	4	Regular	383	f
5422	5	Regular	383	f
5423	6	Regular	383	f
5424	7	Regular	383	f
5425	8	Regular	383	f
5426	9	Regular	383	f
5427	10	Regular	383	f
5428	11	Regular	383	f
5429	12	Regular	383	f
5430	13	Regular	383	f
5431	14	Regular	383	f
5432	15	Regular	383	f
5433	16	Regular	383	f
5434	17	Regular	383	f
5435	18	Regular	383	f
5436	19	Regular	383	f
5437	1	Regular	384	f
5438	2	Regular	384	f
5439	3	Regular	384	f
5440	4	Regular	384	f
5441	5	Regular	384	f
5442	6	Regular	384	f
5443	7	Regular	384	f
5444	8	Regular	384	f
5445	9	Regular	384	f
5446	10	Regular	384	f
5447	11	Regular	384	f
5448	12	Regular	384	f
5449	13	Regular	384	f
5450	14	Regular	384	f
5451	15	Regular	384	f
5452	16	Regular	384	f
5453	17	Regular	384	f
5454	18	Regular	384	f
5455	19	Regular	384	f
5456	1	Regular	385	f
5457	2	Regular	385	f
5458	3	Regular	385	f
5459	4	Regular	385	f
5460	5	Regular	385	f
5461	6	Regular	385	f
5462	7	Regular	385	f
5463	8	Regular	385	f
5464	9	Regular	385	f
5465	10	Regular	385	f
5466	11	Regular	385	f
5467	12	Regular	385	f
5468	13	Regular	385	f
5469	14	Regular	385	f
5470	15	Regular	385	f
5471	16	Regular	385	f
5472	17	Regular	385	f
5473	18	Regular	385	f
5474	1	Regular	386	f
5475	2	Regular	386	f
5476	3	Regular	386	f
5477	4	Regular	386	f
5478	5	Regular	386	f
5479	6	Regular	386	f
5480	7	Regular	386	f
5481	8	Regular	386	f
5482	9	Regular	386	f
5483	10	Regular	386	f
5484	11	Regular	386	f
5485	12	Regular	386	f
5486	13	Regular	386	f
5487	14	Regular	386	f
5488	15	Regular	386	f
5489	16	Regular	386	f
5490	1	Regular	387	f
5491	2	Regular	387	f
5492	3	Regular	387	f
5493	4	Regular	387	f
5494	5	Regular	387	f
5495	6	Regular	387	f
5496	7	Regular	387	f
5497	8	Regular	387	f
5498	9	Regular	387	f
5499	10	Regular	387	f
5500	11	Regular	387	f
5501	12	Regular	387	f
5502	13	Regular	387	f
5503	14	Regular	387	f
5504	15	Regular	387	f
5505	1	VIP	388	f
5506	2	VIP	388	f
5507	3	VIP	388	f
5508	4	VIP	388	f
5509	5	VIP	388	f
5510	6	VIP	388	f
5511	7	VIP	388	f
5512	8	VIP	388	f
5513	9	VIP	388	f
5514	10	VIP	388	f
125	1	Wheelchair	36	f
126	2	Wheelchair	36	f
128	4	Wheelchair	36	f
129	5	Wheelchair	36	f
131	2	VIP	37	f
132	3	VIP	37	f
181	6	Regular	40	f
188	13	Regular	40	f
196	4	Regular	41	f
198	6	Regular	41	f
206	14	Regular	41	f
215	4	Regular	42	f
216	5	Regular	42	f
217	6	Regular	42	f
223	12	Regular	42	f
225	14	Regular	42	f
230	3	Regular	43	f
231	4	Regular	43	f
233	6	Regular	43	f
234	7	Regular	43	f
241	14	Regular	43	f
242	15	Regular	43	f
254	8	Regular	44	f
259	13	Regular	44	f
248	2	Regular	44	t
249	3	Regular	44	t
250	4	Regular	44	t
263	3	VIP	45	t
251	5	Regular	44	t
252	6	Regular	44	t
253	7	Regular	44	t
267	7	VIP	45	t
\.


--
-- Data for Name: show; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.show (show_id, show_time, price, movie_id, screen_id) FROM stdin;
1	2025-07-13 00:09:00	17.54	1	30
2	2025-07-15 20:04:00	11.30	2	27
3	2025-07-07 08:06:00	10.60	3	18
4	2025-07-10 20:10:00	11.31	4	11
5	2025-07-20 11:19:00	17.85	5	1
7	2025-07-21 19:54:00	15.03	7	4
8	2025-07-06 23:34:00	21.43	8	12
9	2025-07-08 20:02:00	22.63	9	26
10	2025-07-13 03:13:00	28.02	10	27
11	2025-07-01 08:06:00	12.83	11	13
12	2025-07-09 06:27:00	25.96	12	11
13	2025-07-19 11:19:00	27.45	13	10
14	2025-07-16 14:12:00	28.59	14	1
15	2025-06-26 21:12:00	16.68	15	20
16	2025-07-10 14:00:00	26.11	16	21
17	2025-07-24 07:56:00	14.78	17	9
18	2025-07-09 23:19:00	19.57	18	17
19	2025-07-12 17:32:00	21.36	19	28
21	2025-05-29 12:12:00	12.00	2	5
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
4	User4	user4@example.com	password123	+48123456704
5	User5	user5@example.com	password123	+48123456705
2	User1	user2@example.com	password123	+48123456702
\.


--
-- Name: admin_admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_admin_id_seq', 1, false);


--
-- Name: booking_booking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_booking_id_seq', 1, false);


--
-- Name: movie_movie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movie_movie_id_seq', 22, true);


--
-- Name: payment_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_payment_id_seq', 1, false);


--
-- Name: row_row_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.row_row_id_seq', 388, true);


--
-- Name: screen_screen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.screen_screen_id_seq', 1, false);


--
-- Name: seat_seat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seat_seat_id_seq', 5514, true);


--
-- Name: show_show_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.show_show_id_seq', 21, true);


--
-- Name: theatre_theatre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.theatre_theatre_id_seq', 6, true);


--
-- Name: user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_user_id_seq', 45, true);


--
-- Name: admin admin_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_email_key UNIQUE (email);


--
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (admin_id);


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

