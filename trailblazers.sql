--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE account (
    account_id integer NOT NULL,
    account_name character varying(255) NOT NULL,
    email_address character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    phone_number character varying(32) NOT NULL,
    enabled boolean NOT NULL,
    country character varying(255)
);


ALTER TABLE account OWNER TO postgres;

--
-- Name: account_account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE account_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_account_id_seq OWNER TO postgres;

--
-- Name: account_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE account_account_id_seq OWNED BY account.account_id;


--
-- Name: account_role; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE account_role (
    role_id integer NOT NULL,
    account_name character varying(255) NOT NULL,
    role character varying(255) NOT NULL
);


ALTER TABLE account_role OWNER TO postgres;

--
-- Name: account_role_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE account_role_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_role_role_id_seq OWNER TO postgres;

--
-- Name: account_role_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE account_role_role_id_seq OWNED BY account_role.role_id;


--
-- Name: changelog; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE changelog (
    id numeric(20,0) NOT NULL,
    applied_at character varying(25) NOT NULL,
    description character varying(255) NOT NULL
);


ALTER TABLE changelog OWNER TO postgres;

--
-- Name: item; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE item (
    item_id integer NOT NULL,
    description character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    price numeric(19,2) NOT NULL,
    type character varying(255) NOT NULL,
    quantity bigint NOT NULL,
    image bytea
);


ALTER TABLE item OWNER TO postgres;

--
-- Name: item_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE item_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE item_item_id_seq OWNER TO postgres;

--
-- Name: item_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE item_item_id_seq OWNED BY item.item_id;


--
-- Name: item_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE item_type (
    item_type_id integer NOT NULL,
    name character varying(64) NOT NULL
);


ALTER TABLE item_type OWNER TO postgres;

--
-- Name: item_type_item_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE item_type_item_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE item_type_item_type_id_seq OWNER TO postgres;

--
-- Name: item_type_item_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE item_type_item_type_id_seq OWNED BY item_type.item_type_id;


--
-- Name: reserve_order; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reserve_order (
    order_id integer NOT NULL,
    account_id bigint NOT NULL,
    status character varying(255) NOT NULL,
    note character varying(255) NOT NULL,
    reservation_timestamp timestamp without time zone NOT NULL
);


ALTER TABLE reserve_order OWNER TO postgres;

--
-- Name: reserve_order_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reserve_order_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reserve_order_order_id_seq OWNER TO postgres;

--
-- Name: reserve_order_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reserve_order_order_id_seq OWNED BY reserve_order.order_id;


--
-- Name: reserved_item; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reserved_item (
    item_id integer NOT NULL,
    order_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    price numeric(19,2) NOT NULL,
    quantity bigint NOT NULL,
    description character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    image bytea
);


ALTER TABLE reserved_item OWNER TO postgres;

--
-- Name: reserved_item_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reserved_item_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reserved_item_item_id_seq OWNER TO postgres;

--
-- Name: reserved_item_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reserved_item_item_id_seq OWNED BY reserved_item.item_id;


--
-- Name: survey_entry; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE survey_entry (
    survey_entry_id integer NOT NULL,
    account_id bigint NOT NULL,
    rating integer NOT NULL,
    comment character varying(255)
);


ALTER TABLE survey_entry OWNER TO postgres;

--
-- Name: survey_entry_survey_entry_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE survey_entry_survey_entry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE survey_entry_survey_entry_id_seq OWNER TO postgres;

--
-- Name: survey_entry_survey_entry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE survey_entry_survey_entry_id_seq OWNED BY survey_entry.survey_entry_id;


--
-- Name: account_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account ALTER COLUMN account_id SET DEFAULT nextval('account_account_id_seq'::regclass);


--
-- Name: role_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account_role ALTER COLUMN role_id SET DEFAULT nextval('account_role_role_id_seq'::regclass);


--
-- Name: item_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY item ALTER COLUMN item_id SET DEFAULT nextval('item_item_id_seq'::regclass);


--
-- Name: item_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY item_type ALTER COLUMN item_type_id SET DEFAULT nextval('item_type_item_type_id_seq'::regclass);


--
-- Name: order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reserve_order ALTER COLUMN order_id SET DEFAULT nextval('reserve_order_order_id_seq'::regclass);


--
-- Name: item_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reserved_item ALTER COLUMN item_id SET DEFAULT nextval('reserved_item_item_id_seq'::regclass);


--
-- Name: survey_entry_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY survey_entry ALTER COLUMN survey_entry_id SET DEFAULT nextval('survey_entry_survey_entry_id_seq'::regclass);


--
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY account (account_id, account_name, email_address, password, phone_number, enabled, country) FROM stdin;
1	AdminCat	admin@example.com	Yellow bikes are just amazingly awesome, right? Says Robert, my good friend!		t	\N
2	UserCat	user@example.com	Part 3: Tall zebra mobile responsive communication patterns!		t	\N
12	Hugo Huser	Hugo-Huser@random-email.com	qwe123@Rdd	555-123456	t	UK
23	Arno Admin	Arno-Admin@random-email.com	qwe123@Rdd	555-123456	t	UK
27	Bob Buyer	Bob-Buyer@random-email.com	qwe123@Rdd	555-123456	t	UK
\.


--
-- Name: account_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('account_account_id_seq', 27, true);


--
-- Data for Name: account_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY account_role (role_id, account_name, role) FROM stdin;
1	AdminCat	ROLE_ADMIN
2	UserCat	ROLE_USER
4	Jan Plewka	ROLE_USER
5	Hugo Huser	ROLE_USER
6	Arno Admin	ROLE_ADMIN
7	Arno Admin	ROLE_ADMIN
8	Arno Admin	ROLE_ADMIN
9	Arno Admin	ROLE_ADMIN
10	NPSAdmin	ROLE_ADMIN
11	Promoter	ROLE_USER
12	NPSAdmin	ROLE_ADMIN
13	Promoter	ROLE_USER
14	Arno Admin	ROLE_ADMIN
15	Bob Buyer	ROLE_USER
16	Arno Admin	ROLE_ADMIN
17	Bob Buyer	ROLE_USER
18	Bob Buyer	ROLE_USER
19	Bob Buyer	ROLE_USER
20	Bob Buyer	ROLE_USER
\.


--
-- Name: account_role_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('account_role_role_id_seq', 20, true);


--
-- Data for Name: changelog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY changelog (id, applied_at, description) FROM stdin;
20140425082801	2016-04-07 19:25:52	create changelog
20140428101139	2016-04-07 19:25:52	create item
20140428105002	2016-04-07 19:25:52	create item type
20140428105329	2016-04-07 19:25:52	create account
20140428105545	2016-04-07 19:25:52	create account role
20140428105730	2016-04-07 19:25:52	reserve order
20140428110040	2016-04-07 19:25:52	survey entry
20140623115402	2016-04-07 19:25:52	create default accounts and item types
20160318115959	2016-04-07 19:25:52	update account table
20160402060236	2016-04-07 19:25:52	update item image
20160402113210	2016-04-07 19:25:52	create reserved item
20160402113703	2016-04-07 19:25:52	add forign key to reserve order
20160402114743	2016-04-07 19:25:52	update reserved item for previous items
20160402120733	2016-04-07 19:25:52	remove item column from reserve order
\.


--
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY item (item_id, description, name, price, type, quantity, image) FROM stdin;
12	4 x red, curved Arrow shape, screw fastening	Simplon Pavo 3 Ultra 1460037384385	2899.00	FRAME	1000	\N
14	4 x red, curved Arrow shape, screw fastening	NEW - Spoke - Reflectors Arrow red	2899.00	ACCESSORIES	1000	\N
17	A very nice item.	Simplon Pavo 3 Ultra 1460037409721	49.99	FRAME	5	\N
18	A very nice item.	Simplon Pavo 3 Ultra 1460037410699	49.99	FRAME	0	\N
19	A very nice item.	Simplon Pavo 3 Ultra 1460037414678	49.99	FRAME	3	\N
20	A very nice item.	Simplon Pavo 3 Ultra 1460037416825	49.99	FRAME	1	\N
21	A very nice item.	Simplon Pavo 3 Ultra 1460037418262	49.99	FRAME	1	\N
\.


--
-- Name: item_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('item_item_id_seq', 21, true);


--
-- Data for Name: item_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY item_type (item_type_id, name) FROM stdin;
1	Frames
2	Accessories
\.


--
-- Name: item_type_item_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('item_type_item_type_id_seq', 2, true);


--
-- Data for Name: reserve_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reserve_order (order_id, account_id, status, note, reservation_timestamp) FROM stdin;
14	22	NEW		2016-04-07 19:26:51.612
13	18	IN_PROGRESS		2016-04-07 19:26:43.036
\.


--
-- Name: reserve_order_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reserve_order_order_id_seq', 14, true);


--
-- Data for Name: reserved_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reserved_item (item_id, order_id, name, price, quantity, description, type, image) FROM stdin;
6	13	Bike Frame	49.99	1	A very nice item.	FRAME	\N
7	14	Simplon Pavo 3 Ultra 1460037410699	49.99	1	A very nice item.	FRAME	\N
\.


--
-- Name: reserved_item_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reserved_item_item_id_seq', 7, true);


--
-- Data for Name: survey_entry; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY survey_entry (survey_entry_id, account_id, rating, comment) FROM stdin;
\.


--
-- Name: survey_entry_survey_entry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('survey_entry_survey_entry_id_seq', 32, true);


--
-- Name: account_email_address_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY account
    ADD CONSTRAINT account_email_address_key UNIQUE (email_address);


--
-- Name: account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY account
    ADD CONSTRAINT account_pkey PRIMARY KEY (account_id);


--
-- Name: account_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY account_role
    ADD CONSTRAINT account_role_pkey PRIMARY KEY (role_id);


--
-- Name: item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY item
    ADD CONSTRAINT item_pkey PRIMARY KEY (item_id);


--
-- Name: item_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY item_type
    ADD CONSTRAINT item_type_pkey PRIMARY KEY (item_type_id);


--
-- Name: pk_changelog; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY changelog
    ADD CONSTRAINT pk_changelog PRIMARY KEY (id);


--
-- Name: reserve_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reserve_order
    ADD CONSTRAINT reserve_order_pkey PRIMARY KEY (order_id);


--
-- Name: reserved_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reserved_item
    ADD CONSTRAINT reserved_item_pkey PRIMARY KEY (item_id);


--
-- Name: survey_entry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY survey_entry
    ADD CONSTRAINT survey_entry_pkey PRIMARY KEY (survey_entry_id);


--
-- Name: reserved_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reserved_item
    ADD CONSTRAINT reserved_item FOREIGN KEY (order_id) REFERENCES reserve_order(order_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: SanCoder
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM "SanCoder";
GRANT ALL ON SCHEMA public TO "SanCoder";
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

