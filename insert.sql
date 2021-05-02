
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


CREATE EXTENSION IF NOT EXISTS plpgsql_check WITH SCHEMA public;



COMMENT ON EXTENSION plpgsql_check IS 'extended check for plpgsql functions';


SET default_tablespace = '';

SET default_table_access_method = heap;


CREATE TABLE public.coder (
    coder_id integer NOT NULL,
    loc_id integer NOT NULL,
    plang_id integer NOT NULL,
    coder_username character varying(45) NOT NULL,
    coder_email character varying(45) NOT NULL,
    first_name character varying(25) NOT NULL,
    last_name character varying(25) NOT NULL
);


ALTER TABLE public.coder OWNER TO ;

--
-- TOC entry 201 (class 1259 OID 884422)
-- Name: coder_coder_id_seq; Type: SEQUENCE; Schema: public; Owner: 
--

CREATE SEQUENCE public.coder_coder_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coder_coder_id_seq OWNER TO ;

--
-- TOC entry 3123 (class 0 OID 0)
-- Dependencies: 201
-- Name: coder_coder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 
--

ALTER SEQUENCE public.coder_coder_id_seq OWNED BY public.coder.coder_id;


--
-- TOC entry 217 (class 1259 OID 924074)
-- Name: coders_email; Type: VIEW; Schema: public; Owner: 
--

CREATE VIEW public.coders_email AS
 SELECT coder.coder_id,
    coder.coder_username,
    coder.coder_email
   FROM public.coder;


ALTER TABLE public.coders_email OWNER TO ;

--
-- TOC entry 204 (class 1259 OID 884436)
-- Name: customer; Type: TABLE; Schema: public; Owner: 
--

CREATE TABLE public.customer (
    cust_id integer NOT NULL,
    cust_email character varying(45) NOT NULL,
    cust_username character varying(45) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL
);


ALTER TABLE public.customer OWNER TO ;

--
-- TOC entry 203 (class 1259 OID 884434)
-- Name: customer_cust_id_seq; Type: SEQUENCE; Schema: public; Owner: 
--

CREATE SEQUENCE public.customer_cust_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_cust_id_seq OWNER TO ;

--
-- TOC entry 3124 (class 0 OID 0)
-- Dependencies: 203
-- Name: customer_cust_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 
--

ALTER SEQUENCE public.customer_cust_id_seq OWNED BY public.customer.cust_id;


--
-- TOC entry 214 (class 1259 OID 884482)
-- Name: rating; Type: TABLE; Schema: public; Owner: 
--

CREATE TABLE public.rating (
    rate_id integer NOT NULL,
    coder_id integer NOT NULL,
    cust_id integer NOT NULL,
    order_id integer NOT NULL,
    comment text NOT NULL,
    rate integer NOT NULL
);


ALTER TABLE public.rating OWNER TO ;

--
-- TOC entry 218 (class 1259 OID 984693)
-- Name: d1; Type: VIEW; Schema: public; Owner: 
--

CREATE VIEW public.d1 AS
 SELECT DISTINCT customer.cust_username,
    rating.coder_id,
    rating.rate,
    rating.comment
   FROM (public.customer
     JOIN public.rating ON ((rating.cust_id = customer.cust_id)))
  ORDER BY customer.cust_username;


ALTER TABLE public.d1 OWNER TO ;

--
-- TOC entry 206 (class 1259 OID 884448)
-- Name: document; Type: TABLE; Schema: public; Owner: 
--

CREATE TABLE public.document (
    doc_id integer NOT NULL,
    coder_id integer NOT NULL,
    document_type character varying(25) NOT NULL,
    given_by character varying(25) NOT NULL,
    is_diploma boolean
);


ALTER TABLE public.document OWNER TO ;

--
-- TOC entry 205 (class 1259 OID 884446)
-- Name: document_doc_id_seq; Type: SEQUENCE; Schema: public; Owner: 
--

CREATE SEQUENCE public.document_doc_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.document_doc_id_seq OWNER TO ;

--
-- TOC entry 3125 (class 0 OID 0)
-- Dependencies: 205
-- Name: document_doc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 
--

ALTER SEQUENCE public.document_doc_id_seq OWNED BY public.document.doc_id;


--
-- TOC entry 208 (class 1259 OID 884456)
-- Name: location; Type: TABLE; Schema: public; Owner: 
--

CREATE TABLE public.location (
    loc_id integer NOT NULL,
    city character varying(45) NOT NULL,
    country character varying(45) NOT NULL,
    timezone character varying(256) NOT NULL
);


ALTER TABLE public.location OWNER TO ;

--
-- TOC entry 207 (class 1259 OID 884454)
-- Name: location_loc_id_seq; Type: SEQUENCE; Schema: public; Owner: 
--

CREATE SEQUENCE public.location_loc_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.location_loc_id_seq OWNER TO ;

--
-- TOC entry 3126 (class 0 OID 0)
-- Dependencies: 207
-- Name: location_loc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 
--

ALTER SEQUENCE public.location_loc_id_seq OWNED BY public.location.loc_id;


--
-- TOC entry 210 (class 1259 OID 884464)
-- Name: orders; Type: TABLE; Schema: public; Owner: 
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    coder_id integer NOT NULL,
    cust_id integer NOT NULL,
    cost numeric(4,2) NOT NULL,
    description character varying(45) NOT NULL
);


ALTER TABLE public.orders OWNER TO ;

--
-- TOC entry 209 (class 1259 OID 884462)
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: 
--

CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_order_id_seq OWNER TO ;

--
-- TOC entry 3127 (class 0 OID 0)
-- Dependencies: 209
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;


--
-- TOC entry 212 (class 1259 OID 884472)
-- Name: prog_language; Type: TABLE; Schema: public; Owner: 
--

CREATE TABLE public.prog_language (
    plang_id integer NOT NULL,
    plang character varying(256) NOT NULL
);


ALTER TABLE public.prog_language OWNER TO ;

--
-- TOC entry 211 (class 1259 OID 884470)
-- Name: prog_language_plang_id_seq; Type: SEQUENCE; Schema: public; Owner: 
--

CREATE SEQUENCE public.prog_language_plang_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prog_language_plang_id_seq OWNER TO ;

--
-- TOC entry 3128 (class 0 OID 0)
-- Dependencies: 211
-- Name: prog_language_plang_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 
--

ALTER SEQUENCE public.prog_language_plang_id_seq OWNED BY public.prog_language.plang_id;


--
-- TOC entry 213 (class 1259 OID 884480)
-- Name: rating_rate_id_seq; Type: SEQUENCE; Schema: public; Owner: 
--

CREATE SEQUENCE public.rating_rate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rating_rate_id_seq OWNER TO ;

--
-- TOC entry 3129 (class 0 OID 0)
-- Dependencies: 213
-- Name: rating_rate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 
--

ALTER SEQUENCE public.rating_rate_id_seq OWNED BY public.rating.rate_id;


--
-- TOC entry 216 (class 1259 OID 884493)
-- Name: working; Type: TABLE; Schema: public; Owner: 
--

CREATE TABLE public.working (
    work_id integer NOT NULL,
    coder_id integer NOT NULL,
    work_place character varying(30) NOT NULL
);


ALTER TABLE public.working OWNER TO ;

--
-- TOC entry 215 (class 1259 OID 884491)
-- Name: working_work_id_seq; Type: SEQUENCE; Schema: public; Owner: 
--

CREATE SEQUENCE public.working_work_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.working_work_id_seq OWNER TO ;

--
-- TOC entry 3130 (class 0 OID 0)
-- Dependencies: 215
-- Name: working_work_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 
--

ALTER SEQUENCE public.working_work_id_seq OWNED BY public.working.work_id;


--
-- TOC entry 2925 (class 2604 OID 884427)
-- Name: coder coder_id; Type: DEFAULT; Schema: public; Owner: 
--

ALTER TABLE ONLY public.coder ALTER COLUMN coder_id SET DEFAULT nextval('public.coder_coder_id_seq'::regclass);


--
-- TOC entry 2926 (class 2604 OID 884439)
-- Name: customer cust_id; Type: DEFAULT; Schema: public; Owner: 
--

ALTER TABLE ONLY public.customer ALTER COLUMN cust_id SET DEFAULT nextval('public.customer_cust_id_seq'::regclass);


--
-- TOC entry 2927 (class 2604 OID 884451)
-- Name: document doc_id; Type: DEFAULT; Schema: public; Owner: 
--

ALTER TABLE ONLY public.document ALTER COLUMN doc_id SET DEFAULT nextval('public.document_doc_id_seq'::regclass);


--
-- TOC entry 2928 (class 2604 OID 884459)
-- Name: location loc_id; Type: DEFAULT; Schema: public; Owner: 
--

ALTER TABLE ONLY public.location ALTER COLUMN loc_id SET DEFAULT nextval('public.location_loc_id_seq'::regclass);


--
-- TOC entry 2929 (class 2604 OID 884467)
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: 
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- TOC entry 2930 (class 2604 OID 884475)
-- Name: prog_language plang_id; Type: DEFAULT; Schema: public; Owner: 
--

ALTER TABLE ONLY public.prog_language ALTER COLUMN plang_id SET DEFAULT nextval('public.prog_language_plang_id_seq'::regclass);


--
-- TOC entry 2931 (class 2604 OID 884485)
-- Name: rating rate_id; Type: DEFAULT; Schema: public; Owner: 
--

ALTER TABLE ONLY public.rating ALTER COLUMN rate_id SET DEFAULT nextval('public.rating_rate_id_seq'::regclass);


--
-- TOC entry 2932 (class 2604 OID 884496)
-- Name: working work_id; Type: DEFAULT; Schema: public; Owner: 
--

ALTER TABLE ONLY public.working ALTER COLUMN work_id SET DEFAULT nextval('public.working_work_id_seq'::regclass);


--
-- TOC entry 3101 (class 0 OID 884424)
-- Dependencies: 202
-- Data for Name: coder; Type: TABLE DATA; Schema: public; Owner: 
--

INSERT INTO public.coder (coder_id, loc_id, plang_id, coder_username, coder_email, first_name, last_name) VALUES (1, 9, 1, 'karchdeckne0', 'karchdeckne0@statcounter.com', 'Kora', 'Archdeckne');
INSERT INTO public.coder (coder_id, loc_id, plang_id, coder_username, coder_email, first_name, last_name) VALUES (2, 33, 5, 'dtidcombe1', 'dtidcombe1@washington.edu', 'Danny', 'Tidcombe');
INSERT INTO public.coder (coder_id, loc_id, plang_id, coder_username, coder_email, first_name, last_name) VALUES (3, 32, 4, 'gchetwynd2', 'gchetwynd2@chronoengine.com', 'Gaylord', 'Chetwynd');
INSERT INTO public.coder (coder_id, loc_id, plang_id, coder_username, coder_email, first_name, last_name) VALUES (4, 15, 2, 'aricson3', 'aricson3@reference.com', 'Armando', 'Ricson');
INSERT INTO public.coder (coder_id, loc_id, plang_id, coder_username, coder_email, first_name, last_name) VALUES (5, 6, 4, 'dcarillo4', 'dcarillo4@nytimes.com', 'Daisey', 'Carillo');
INSERT INTO public.coder (coder_id, loc_id, plang_id, coder_username, coder_email, first_name, last_name) VALUES (6, 28, 2, 'ntolliday5', 'ntolliday5@quantcast.com', 'Neel', 'Tolliday');
INSERT INTO public.coder (coder_id, loc_id, plang_id, coder_username, coder_email, first_name, last_name) VALUES (7, 25, 4, 'nbaswall6', 'nbaswall6@mapquest.com', 'Nils', 'Baswall');
INSERT INTO public.coder (coder_id, loc_id, plang_id, coder_username, coder_email, first_name, last_name) VALUES (8, 14, 3, 'ctriplet7', 'ctriplet7@deliciousdays.com', 'Ches', 'Triplet');
INSERT INTO public.coder (coder_id, loc_id, plang_id, coder_username, coder_email, first_name, last_name) VALUES (9, 10, 2, 'jwarrener8', 'jwarrener8@huffingtonpost.com', 'Jeffie', 'Warrener');
INSERT INTO public.coder (coder_id, loc_id, plang_id, coder_username, coder_email, first_name, last_name) VALUES (10, 30, 1, 'cgraine9', 'cgraine9@sfgate.com', 'Carlyn', 'Graine');
INSERT INTO public.coder (coder_id, loc_id, plang_id, coder_username, coder_email, first_name, last_name) VALUES (11, 9, 2, 'pcastelluzzia', 'pcastelluzzia@nymag.com', 'Patricio', 'Castelluzzi');
INSERT INTO public.coder (coder_id, loc_id, plang_id, coder_username, coder_email, first_name, last_name) VALUES (12, 29, 2, 'fsullyb', 'fsullyb@netscape.com', 'Fionna', 'Sully');
INSERT INTO public.coder (coder_id, loc_id, plang_id, coder_username, coder_email, first_name, last_name) VALUES (13, 31, 5, 'rhamelc', 'rhamelc@hostgator.com', 'Richmound', 'Hamel');
INSERT INTO public.coder (coder_id, loc_id, plang_id, coder_username, coder_email, first_name, last_name) VALUES (14, 25, 5, 'mnorreyd', 'mnorreyd@bloglovin.com', 'Morly', 'Norrey');
INSERT INTO public.coder (coder_id, loc_id, plang_id, coder_username, coder_email, first_name, last_name) VALUES (15, 15, 4, 'rsabbinse', 'rsabbinse@mlb.com', 'Rance', 'Sabbins');
INSERT INTO public.coder (coder_id, loc_id, plang_id, coder_username, coder_email, first_name, last_name) VALUES (16, 24, 4, 'bmicallef0', 'bmicallef0@scribd.com', 'Barri', 'Micallef');
INSERT INTO public.coder (coder_id, loc_id, plang_id, coder_username, coder_email, first_name, last_name) VALUES (17, 1, 3, 'dcraggs1', 'dcraggs1@dailymotion.com', 'Devin', 'Craggs');
INSERT INTO public.coder (coder_id, loc_id, plang_id, coder_username, coder_email, first_name, last_name) VALUES (18, 25, 5, 'bpickvance0', 'bpickvance0@symantec.com', 'Brand', 'Pickvance');
INSERT INTO public.coder (coder_id, loc_id, plang_id, coder_username, coder_email, first_name, last_name) VALUES (19, 19, 5, 'ngoning1', 'ngoning1@sakura.ne.jp', 'Nadya', 'Goning');
INSERT INTO public.coder (coder_id, loc_id, plang_id, coder_username, coder_email, first_name, last_name) VALUES (20, 12, 1, 'akrollman2', 'akrollman2@yolasite.com', 'Ashil', 'Krollman');
INSERT INTO public.coder (coder_id, loc_id, plang_id, coder_username, coder_email, first_name, last_name) VALUES (21, 10, 5, 'gfoulger3', 'gfoulger3@bizjournals.com', 'Gunner', 'Foulger');
INSERT INTO public.coder (coder_id, loc_id, plang_id, coder_username, coder_email, first_name, last_name) VALUES (22, 11, 4, 'medowes4', 'medowes4@elpais.com', 'Moises', 'Edowes');
INSERT INTO public.coder (coder_id, loc_id, plang_id, coder_username, coder_email, first_name, last_name) VALUES (23, 12, 1, 'cbaldwin5', 'cbaldwin5@illinois.edu', 'Carce', 'Baldwin');
INSERT INTO public.coder (coder_id, loc_id, plang_id, coder_username, coder_email, first_name, last_name) VALUES (24, 23, 3, 'melbourn6', 'melbourn6@blogspot.com', 'Melisande', 'Elbourn');
INSERT INTO public.coder (coder_id, loc_id, plang_id, coder_username, coder_email, first_name, last_name) VALUES (25, 2, 5, 'lmckeaveney7', 'lmckeaveney7@nature.com', 'Leeann', 'McKeaveney');
INSERT INTO public.coder (coder_id, loc_id, plang_id, coder_username, coder_email, first_name, last_name) VALUES (26, 2, 5, 'hbeincken8', 'hbeincken8@parallels.com', 'Hoebart', 'Beincken');
INSERT INTO public.coder (coder_id, loc_id, plang_id, coder_username, coder_email, first_name, last_name) VALUES (27, 3, 3, 'mbanker9', 'mbanker9@de.vu', 'Mozes', 'Banker');
INSERT INTO public.coder (coder_id, loc_id, plang_id, coder_username, coder_email, first_name, last_name) VALUES (28, 17, 5, 'khardistry0', 'khardistry0@microsoft.com', 'Kyrstin', 'Hardistry');
INSERT INTO public.coder (coder_id, loc_id, plang_id, coder_username, coder_email, first_name, last_name) VALUES (29, 20, 5, 'ssharram1', 'ssharram1@gnu.org', 'Sephira', 'Sharram');
INSERT INTO public.coder (coder_id, loc_id, plang_id, coder_username, coder_email, first_name, last_name) VALUES (30, 9, 2, 'cpiper2', 'cpiper2@nba.com', 'Chad', 'Piper');
INSERT INTO public.coder (coder_id, loc_id, plang_id, coder_username, coder_email, first_name, last_name) VALUES (31, 30, 4, 'relby3', 'relby3@google.com.hk', 'Reiko', 'Elby');
INSERT INTO public.coder (coder_id, loc_id, plang_id, coder_username, coder_email, first_name, last_name) VALUES (32, 25, 4, 'aheindl4', 'aheindl4@constantcontact.com', 'Avigdor', 'Heindl');
INSERT INTO public.coder (coder_id, loc_id, plang_id, coder_username, coder_email, first_name, last_name) VALUES (33, 9, 2, 'ibartolomeotti0', 'ibartolomeotti0@sakura.ne.jp', 'Ingrid', 'Bartolomeotti');
INSERT INTO public.coder (coder_id, loc_id, plang_id, coder_username, coder_email, first_name, last_name) VALUES (34, 11, 1, 'nroddick1', 'nroddick1@nba.com', 'Neils', 'Roddick');
INSERT INTO public.coder (coder_id, loc_id, plang_id, coder_username, coder_email, first_name, last_name) VALUES (35, 19, 3, 'troder2', 'troder2@imageshack.us', 'Timothy', 'Roder');


--
-- TOC entry 3103 (class 0 OID 884436)
-- Dependencies: 204
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: 
--

INSERT INTO public.customer (cust_id, cust_email, cust_username, first_name, last_name) VALUES (1, 'dyurevich0@hao123.com', 'dyurevich0', 'Dallas', 'Yurevich');
INSERT INTO public.customer (cust_id, cust_email, cust_username, first_name, last_name) VALUES (2, 'ckeyson1@odnoklassniki.ru', 'ckeyson1', 'Colin', 'Keyson');
INSERT INTO public.customer (cust_id, cust_email, cust_username, first_name, last_name) VALUES (3, 'jscotfurth2@cbc.ca', 'jscotfurth2', 'Joela', 'Scotfurth');
INSERT INTO public.customer (cust_id, cust_email, cust_username, first_name, last_name) VALUES (4, 'kadams3@cocolog-nifty.com', 'kadams3', 'Kayne', 'Adams');
INSERT INTO public.customer (cust_id, cust_email, cust_username, first_name, last_name) VALUES (5, 'gcourtois4@mozilla.com', 'gcourtois4', 'Geralda', 'Courtois');
INSERT INTO public.customer (cust_id, cust_email, cust_username, first_name, last_name) VALUES (6, 'lmanach5@google.com.hk', 'lmanach5', 'Laure', 'Manach');
INSERT INTO public.customer (cust_id, cust_email, cust_username, first_name, last_name) VALUES (7, 'fmclise6@dailymail.co.uk', 'fmclise6', 'Flossy', 'McLise');
INSERT INTO public.customer (cust_id, cust_email, cust_username, first_name, last_name) VALUES (8, 'haysik7@netscape.com', 'haysik7', 'Hortensia', 'Aysik');
INSERT INTO public.customer (cust_id, cust_email, cust_username, first_name, last_name) VALUES (9, 'bbertolin8@blinklist.com', 'bbertolin8', 'Barbabra', 'Bertolin');
INSERT INTO public.customer (cust_id, cust_email, cust_username, first_name, last_name) VALUES (10, 'lcosterd9@discuz.net', 'lcosterd9', 'Leslie', 'Costerd');
INSERT INTO public.customer (cust_id, cust_email, cust_username, first_name, last_name) VALUES (11, 'tgentreaua@cargocollective.com', 'tgentreaua', 'Tarrah', 'Gentreau');
INSERT INTO public.customer (cust_id, cust_email, cust_username, first_name, last_name) VALUES (12, 'lcarsonb@slideshare.net', 'lcarsonb', 'Lewie', 'Carson');
INSERT INTO public.customer (cust_id, cust_email, cust_username, first_name, last_name) VALUES (13, 'wbrandenburgc@apache.org', 'wbrandenburgc', 'Waldon', 'Brandenburg');
INSERT INTO public.customer (cust_id, cust_email, cust_username, first_name, last_name) VALUES (14, 'cwrigleyd@wix.com', 'cwrigleyd', 'Claire', 'Wrigley');
INSERT INTO public.customer (cust_id, cust_email, cust_username, first_name, last_name) VALUES (15, 'aguildforde@ucla.edu', 'aguildforde', 'Agneta', 'Guildford');
INSERT INTO public.customer (cust_id, cust_email, cust_username, first_name, last_name) VALUES (16, 'tfaughnanf@umn.edu', 'tfaughnanf', 'Tiertza', 'Faughnan');
INSERT INTO public.customer (cust_id, cust_email, cust_username, first_name, last_name) VALUES (17, 'tcoitg@bloglines.com', 'tcoitg', 'Trev', 'Coit');
INSERT INTO public.customer (cust_id, cust_email, cust_username, first_name, last_name) VALUES (18, 'mlaguerreh@exblog.jp', 'mlaguerreh', 'Mavis', 'Laguerre');
INSERT INTO public.customer (cust_id, cust_email, cust_username, first_name, last_name) VALUES (19, 'lsimonetoni@pagesperso-orange.fr', 'lsimonetoni', 'Leeland', 'Simoneton');
INSERT INTO public.customer (cust_id, cust_email, cust_username, first_name, last_name) VALUES (20, 'msparshattj@dot.gov', 'msparshattj', 'Marielle', 'Sparshatt');
INSERT INTO public.customer (cust_id, cust_email, cust_username, first_name, last_name) VALUES (21, 'llabramk@wikispaces.com', 'llabramk', 'Lindsy', 'Labram');
INSERT INTO public.customer (cust_id, cust_email, cust_username, first_name, last_name) VALUES (22, 'wmarranl@dyndns.org', 'wmarranl', 'Winnie', 'Marran');
INSERT INTO public.customer (cust_id, cust_email, cust_username, first_name, last_name) VALUES (23, 'mewersm@themeforest.net', 'mewersm', 'Madalena', 'Ewers');
INSERT INTO public.customer (cust_id, cust_email, cust_username, first_name, last_name) VALUES (24, 'dligoen@flickr.com', 'dligoen', 'Delinda', 'Ligoe');
INSERT INTO public.customer (cust_id, cust_email, cust_username, first_name, last_name) VALUES (25, 'aaleavyo@elegantthemes.com', 'aaleavyo', 'Agathe', 'Aleavy');
INSERT INTO public.customer (cust_id, cust_email, cust_username, first_name, last_name) VALUES (26, 'hfargherp@shop-pro.jp', 'hfargherp', 'Haze', 'Fargher');
INSERT INTO public.customer (cust_id, cust_email, cust_username, first_name, last_name) VALUES (27, 'jsummerellq@illinois.edu', 'jsummerellq', 'Jenda', 'Summerell');
INSERT INTO public.customer (cust_id, cust_email, cust_username, first_name, last_name) VALUES (28, 'prangeleyr@sakura.ne.jp', 'prangeleyr', 'Pepillo', 'Rangeley');
INSERT INTO public.customer (cust_id, cust_email, cust_username, first_name, last_name) VALUES (29, 'ssimmonites@theatlantic.com', 'ssimmonites', 'Sissy', 'Simmonite');
INSERT INTO public.customer (cust_id, cust_email, cust_username, first_name, last_name) VALUES (30, 'efelderert@wsj.com', 'efelderert', 'Elie', 'Felderer');
INSERT INTO public.customer (cust_id, cust_email, cust_username, first_name, last_name) VALUES (31, 'jgherarducciu@netlog.com', 'jgherarducciu', 'Jonas', 'Gherarducci');
INSERT INTO public.customer (cust_id, cust_email, cust_username, first_name, last_name) VALUES (32, 'mtremblev@joomla.org', 'mtremblev', 'Marlane', 'Tremble');
INSERT INTO public.customer (cust_id, cust_email, cust_username, first_name, last_name) VALUES (33, 'mseillerw@dropbox.com', 'mseillerw', 'Maryellen', 'Seiller');
INSERT INTO public.customer (cust_id, cust_email, cust_username, first_name, last_name) VALUES (34, 'wmulhallx@google.co.uk', 'wmulhallx', 'Worden', 'Mulhall');
INSERT INTO public.customer (cust_id, cust_email, cust_username, first_name, last_name) VALUES (35, 'ngaitskelly@shinystat.com', 'ngaitskelly', 'Nikita', 'Gaitskell');


--
-- TOC entry 3105 (class 0 OID 884448)
-- Dependencies: 206
-- Data for Name: document; Type: TABLE DATA; Schema: public; Owner: 
--

INSERT INTO public.document (doc_id, coder_id, document_type, given_by, is_diploma) VALUES (1, 6, 'DIPLOMA', 'NU', true);
INSERT INTO public.document (doc_id, coder_id, document_type, given_by, is_diploma) VALUES (2, 4, 'DIPLOMA', 'CVUT', true);
INSERT INTO public.document (doc_id, coder_id, document_type, given_by, is_diploma) VALUES (3, 18, 'CERTIFICATE', 'CISCO', false);
INSERT INTO public.document (doc_id, coder_id, document_type, given_by, is_diploma) VALUES (4, 8, 'DIPLOMA', 'MIT', true);
INSERT INTO public.document (doc_id, coder_id, document_type, given_by, is_diploma) VALUES (5, 15, 'CERTIFICATE', 'GIB', false);
INSERT INTO public.document (doc_id, coder_id, document_type, given_by, is_diploma) VALUES (6, 17, 'CERTIFICATE', 'GIB', false);
INSERT INTO public.document (doc_id, coder_id, document_type, given_by, is_diploma) VALUES (7, 22, 'DIPLOMA', 'NU', true);
INSERT INTO public.document (doc_id, coder_id, document_type, given_by, is_diploma) VALUES (8, 23, 'DIPLOMA', 'CVUT', true);
INSERT INTO public.document (doc_id, coder_id, document_type, given_by, is_diploma) VALUES (9, 31, 'CERTIFICATE', 'CISCO', false);
INSERT INTO public.document (doc_id, coder_id, document_type, given_by, is_diploma) VALUES (10, 29, 'CERTIFICATE', 'GIB', false);


--
-- TOC entry 3107 (class 0 OID 884456)
-- Dependencies: 208
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: 
--

INSERT INTO public.location (loc_id, city, country, timezone) VALUES (1, 'Al Khirāb', 'Yemen', 'Asia/Riyadh');
INSERT INTO public.location (loc_id, city, country, timezone) VALUES (2, 'Tabinay', 'Philippines', 'Asia/Manila');
INSERT INTO public.location (loc_id, city, country, timezone) VALUES (3, 'Gračec', 'Croatia', 'Europe/Zagreb');
INSERT INTO public.location (loc_id, city, country, timezone) VALUES (4, 'Jiuzihe', 'China', 'Asia/Shanghai');
INSERT INTO public.location (loc_id, city, country, timezone) VALUES (5, 'Itaporanga', 'Brazil', 'America/Fortaleza');
INSERT INTO public.location (loc_id, city, country, timezone) VALUES (6, 'Fagersta', 'Sweden', 'Europe/Stockholm');
INSERT INTO public.location (loc_id, city, country, timezone) VALUES (7, 'Dongchengyuan', 'China', 'Asia/Shanghai');
INSERT INTO public.location (loc_id, city, country, timezone) VALUES (8, 'Sammatti', 'Finland', 'Europe/Helsinki');
INSERT INTO public.location (loc_id, city, country, timezone) VALUES (9, 'Margos', 'Philippines', 'Asia/Manila');
INSERT INTO public.location (loc_id, city, country, timezone) VALUES (10, 'Annecy', 'France', 'Europe/Paris');
INSERT INTO public.location (loc_id, city, country, timezone) VALUES (11, 'Pyatigorsk', 'Russia', 'Europe/Moscow');
INSERT INTO public.location (loc_id, city, country, timezone) VALUES (12, 'Bil‘īn', 'Palestinian Territory', 'Asia/Hebron');
INSERT INTO public.location (loc_id, city, country, timezone) VALUES (13, 'Široki Brijeg', 'Bosnia and Herzegovina', 'Europe/Sarajevo');
INSERT INTO public.location (loc_id, city, country, timezone) VALUES (14, 'Peraía', 'Greece', 'Europe/Athens');
INSERT INTO public.location (loc_id, city, country, timezone) VALUES (15, 'Meziměstí', 'Czech Republic', 'Europe/Warsaw');
INSERT INTO public.location (loc_id, city, country, timezone) VALUES (16, 'Kozhanka', 'Ukraine', 'Europe/Kiev');
INSERT INTO public.location (loc_id, city, country, timezone) VALUES (17, 'Santa Praxedes', 'Philippines', 'Asia/Manila');
INSERT INTO public.location (loc_id, city, country, timezone) VALUES (18, 'Massy', 'France', 'Europe/Paris');
INSERT INTO public.location (loc_id, city, country, timezone) VALUES (19, 'Mistřice', 'Czech Republic', 'Europe/Prague');
INSERT INTO public.location (loc_id, city, country, timezone) VALUES (20, 'Gengqing', 'China', 'Asia/Chongqing');
INSERT INTO public.location (loc_id, city, country, timezone) VALUES (21, 'Yesan', 'South Korea', 'Asia/Seoul');
INSERT INTO public.location (loc_id, city, country, timezone) VALUES (22, 'Xiangcheng', 'China', 'Asia/Shanghai');
INSERT INTO public.location (loc_id, city, country, timezone) VALUES (23, 'Wulipu', 'China', 'Asia/Chongqing');
INSERT INTO public.location (loc_id, city, country, timezone) VALUES (24, 'Abū Tīj', 'Egypt', 'Africa/Cairo');
INSERT INTO public.location (loc_id, city, country, timezone) VALUES (25, 'Villa Carlos Paz', 'Argentina', 'America/Argentina/Cordoba');
INSERT INTO public.location (loc_id, city, country, timezone) VALUES (26, 'Jinping', 'China', 'Asia/Chongqing');
INSERT INTO public.location (loc_id, city, country, timezone) VALUES (27, 'Tatsunochō-tominaga', 'Japan', 'Asia/Tokyo');
INSERT INTO public.location (loc_id, city, country, timezone) VALUES (28, 'Tsagaanders', 'Mongolia', 'Asia/Ulaanbaatar');
INSERT INTO public.location (loc_id, city, country, timezone) VALUES (29, 'Malhão', 'Portugal', 'Europe/Lisbon');
INSERT INTO public.location (loc_id, city, country, timezone) VALUES (30, 'Yonghe', 'China', 'Asia/Shanghai');
INSERT INTO public.location (loc_id, city, country, timezone) VALUES (31, 'Sveg', 'Sweden', 'Europe/Stockholm');
INSERT INTO public.location (loc_id, city, country, timezone) VALUES (32, 'Sanjiazi', 'China', 'Asia/Harbin');
INSERT INTO public.location (loc_id, city, country, timezone) VALUES (33, 'Tolú', 'Colombia', 'America/Bogota');
INSERT INTO public.location (loc_id, city, country, timezone) VALUES (34, 'Foumban', 'Cameroon', 'Africa/Douala');
INSERT INTO public.location (loc_id, city, country, timezone) VALUES (35, 'Chishmy', 'Russia', 'Asia/Yekaterinburg');
INSERT INTO public.location (loc_id, city, country, timezone) VALUES (36, 'TEst', 'TEst', 'Test/Test');


--
-- TOC entry 3109 (class 0 OID 884464)
-- Dependencies: 210
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: 
--

INSERT INTO public.orders (order_id, coder_id, cust_id, cost, description) VALUES (1, 6, 21, 22.30, 'Simple program in C++');
INSERT INTO public.orders (order_id, coder_id, cust_id, cost, description) VALUES (2, 14, 15, 5.30, 'Cool program');
INSERT INTO public.orders (order_id, coder_id, cust_id, cost, description) VALUES (3, 7, 8, 55.00, 'Complex Program');
INSERT INTO public.orders (order_id, coder_id, cust_id, cost, description) VALUES (4, 24, 11, 15.00, 'Medium complex program');
INSERT INTO public.orders (order_id, coder_id, cust_id, cost, description) VALUES (5, 31, 22, 10.00, 'Simple program');
INSERT INTO public.orders (order_id, coder_id, cust_id, cost, description) VALUES (6, 24, 13, 14.00, 'cool');
INSERT INTO public.orders (order_id, coder_id, cust_id, cost, description) VALUES (7, 24, 13, 14.00, 'cool');
INSERT INTO public.orders (order_id, coder_id, cust_id, cost, description) VALUES (8, 24, 13, 14.00, 'cool');
INSERT INTO public.orders (order_id, coder_id, cust_id, cost, description) VALUES (9, 24, 13, 14.00, 'cool');
INSERT INTO public.orders (order_id, coder_id, cust_id, cost, description) VALUES (10, 24, 13, 14.00, 'cool');
INSERT INTO public.orders (order_id, coder_id, cust_id, cost, description) VALUES (11, 24, 13, 14.00, 'cool');
INSERT INTO public.orders (order_id, coder_id, cust_id, cost, description) VALUES (12, 24, 13, 14.00, 'cool');
INSERT INTO public.orders (order_id, coder_id, cust_id, cost, description) VALUES (13, 24, 13, 14.00, 'cool');
INSERT INTO public.orders (order_id, coder_id, cust_id, cost, description) VALUES (14, 24, 13, 14.00, 'cool');
INSERT INTO public.orders (order_id, coder_id, cust_id, cost, description) VALUES (15, 24, 13, 14.00, 'cool');
INSERT INTO public.orders (order_id, coder_id, cust_id, cost, description) VALUES (16, 24, 13, 14.00, 'cool');
INSERT INTO public.orders (order_id, coder_id, cust_id, cost, description) VALUES (17, 24, 13, 14.00, 'cool');


--
-- TOC entry 3111 (class 0 OID 884472)
-- Dependencies: 212
-- Data for Name: prog_language; Type: TABLE DATA; Schema: public; Owner: 
--

INSERT INTO public.prog_language (plang_id, plang) VALUES (1, 'C++');
INSERT INTO public.prog_language (plang_id, plang) VALUES (2, 'Python');
INSERT INTO public.prog_language (plang_id, plang) VALUES (3, 'JavaScript');
INSERT INTO public.prog_language (plang_id, plang) VALUES (4, 'Kotlin');
INSERT INTO public.prog_language (plang_id, plang) VALUES (5, 'SQL');
INSERT INTO public.prog_language (plang_id, plang) VALUES (6, 'C#');
INSERT INTO public.prog_language (plang_id, plang) VALUES (7, 'Java');
INSERT INTO public.prog_language (plang_id, plang) VALUES (8, 'PHP');
INSERT INTO public.prog_language (plang_id, plang) VALUES (9, 'Assembler');


--
-- TOC entry 3113 (class 0 OID 884482)
-- Dependencies: 214
-- Data for Name: rating; Type: TABLE DATA; Schema: public; Owner: 
--

INSERT INTO public.rating (rate_id, coder_id, cust_id, order_id, comment, rate) VALUES (1, 6, 21, 1, 'Excellent', 5);
INSERT INTO public.rating (rate_id, coder_id, cust_id, order_id, comment, rate) VALUES (2, 14, 15, 2, 'BAD!', 1);


--
-- TOC entry 3115 (class 0 OID 884493)
-- Dependencies: 216
-- Data for Name: working; Type: TABLE DATA; Schema: public; Owner: 
--

INSERT INTO public.working (work_id, coder_id, work_place) VALUES (1, 5, 'Senior Developer');
INSERT INTO public.working (work_id, coder_id, work_place) VALUES (3, 18, 'DevOps');
INSERT INTO public.working (work_id, coder_id, work_place) VALUES (4, 31, 'Network Administrator');
INSERT INTO public.working (work_id, coder_id, work_place) VALUES (5, 22, 'Junior Developer');
INSERT INTO public.working (work_id, coder_id, work_place) VALUES (2, 4, 'Senior Developer');


--
-- TOC entry 3131 (class 0 OID 0)
-- Dependencies: 201
-- Name: coder_coder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 
--

SELECT pg_catalog.setval('public.coder_coder_id_seq', 35, true);


--
-- TOC entry 3132 (class 0 OID 0)
-- Dependencies: 203
-- Name: customer_cust_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 
--

SELECT pg_catalog.setval('public.customer_cust_id_seq', 35, true);


--
-- TOC entry 3133 (class 0 OID 0)
-- Dependencies: 205
-- Name: document_doc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 
--

SELECT pg_catalog.setval('public.document_doc_id_seq', 1, false);


--
-- TOC entry 3134 (class 0 OID 0)
-- Dependencies: 207
-- Name: location_loc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 
--

SELECT pg_catalog.setval('public.location_loc_id_seq', 46, true);


--
-- TOC entry 3135 (class 0 OID 0)
-- Dependencies: 209
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 17, true);


--
-- TOC entry 3136 (class 0 OID 0)
-- Dependencies: 211
-- Name: prog_language_plang_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 
--

SELECT pg_catalog.setval('public.prog_language_plang_id_seq', 1, false);


--
-- TOC entry 3137 (class 0 OID 0)
-- Dependencies: 213
-- Name: rating_rate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 
--

SELECT pg_catalog.setval('public.rating_rate_id_seq', 1, false);


--
-- TOC entry 3138 (class 0 OID 0)
-- Dependencies: 215
-- Name: working_work_id_seq; Type: SEQUENCE SET; Schema: public; Owner: 
--

SELECT pg_catalog.setval('public.working_work_id_seq', 1, false);


--
-- TOC entry 2934 (class 2606 OID 884429)
-- Name: coder pk_coder; Type: CONSTRAINT; Schema: public; Owner: 
--

ALTER TABLE ONLY public.coder
    ADD CONSTRAINT pk_coder PRIMARY KEY (coder_id);


--
-- TOC entry 2940 (class 2606 OID 884441)
-- Name: customer pk_customer; Type: CONSTRAINT; Schema: public; Owner: 
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT pk_customer PRIMARY KEY (cust_id);


--
-- TOC entry 2946 (class 2606 OID 884453)
-- Name: document pk_document; Type: CONSTRAINT; Schema: public; Owner: 
--

ALTER TABLE ONLY public.document
    ADD CONSTRAINT pk_document PRIMARY KEY (doc_id);


--
-- TOC entry 2948 (class 2606 OID 884461)
-- Name: location pk_location; Type: CONSTRAINT; Schema: public; Owner: 
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT pk_location PRIMARY KEY (loc_id);


--
-- TOC entry 2950 (class 2606 OID 884469)
-- Name: orders pk_orders; Type: CONSTRAINT; Schema: public; Owner: 
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT pk_orders PRIMARY KEY (order_id);


--
-- TOC entry 2952 (class 2606 OID 884477)
-- Name: prog_language pk_prog_language; Type: CONSTRAINT; Schema: public; Owner: 
--

ALTER TABLE ONLY public.prog_language
    ADD CONSTRAINT pk_prog_language PRIMARY KEY (plang_id);


--
-- TOC entry 2956 (class 2606 OID 884490)
-- Name: rating pk_rating; Type: CONSTRAINT; Schema: public; Owner: 
--

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT pk_rating PRIMARY KEY (rate_id);


--
-- TOC entry 2958 (class 2606 OID 884498)
-- Name: working pk_working; Type: CONSTRAINT; Schema: public; Owner: 
--

ALTER TABLE ONLY public.working
    ADD CONSTRAINT pk_working PRIMARY KEY (work_id);


--
-- TOC entry 2936 (class 2606 OID 885798)
-- Name: coder uc_coder_coder_email; Type: CONSTRAINT; Schema: public; Owner: 
--

ALTER TABLE ONLY public.coder
    ADD CONSTRAINT uc_coder_coder_email UNIQUE (coder_email);


--
-- TOC entry 2938 (class 2606 OID 885796)
-- Name: coder uc_coder_coder_username; Type: CONSTRAINT; Schema: public; Owner: 
--

ALTER TABLE ONLY public.coder
    ADD CONSTRAINT uc_coder_coder_username UNIQUE (coder_username);


--
-- TOC entry 2942 (class 2606 OID 886512)
-- Name: customer uc_customer_cust_email; Type: CONSTRAINT; Schema: public; Owner: 
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT uc_customer_cust_email UNIQUE (cust_email);


--
-- TOC entry 2944 (class 2606 OID 886514)
-- Name: customer uc_customer_cust_username; Type: CONSTRAINT; Schema: public; Owner: 
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT uc_customer_cust_username UNIQUE (cust_username);


--
-- TOC entry 2954 (class 2606 OID 884479)
-- Name: prog_language uc_prog_language_plang; Type: CONSTRAINT; Schema: public; Owner: 
--

ALTER TABLE ONLY public.prog_language
    ADD CONSTRAINT uc_prog_language_plang UNIQUE (plang);


--
-- TOC entry 2959 (class 2606 OID 884499)
-- Name: coder fk_coder_location; Type: FK CONSTRAINT; Schema: public; Owner: 
--

ALTER TABLE ONLY public.coder
    ADD CONSTRAINT fk_coder_location FOREIGN KEY (loc_id) REFERENCES public.location(loc_id) ON DELETE CASCADE;


--
-- TOC entry 2960 (class 2606 OID 884504)
-- Name: coder fk_coder_prog_language; Type: FK CONSTRAINT; Schema: public; Owner: 
--

ALTER TABLE ONLY public.coder
    ADD CONSTRAINT fk_coder_prog_language FOREIGN KEY (plang_id) REFERENCES public.prog_language(plang_id) ON DELETE CASCADE;


--
-- TOC entry 2961 (class 2606 OID 884509)
-- Name: document fk_document_coder; Type: FK CONSTRAINT; Schema: public; Owner: 
--

ALTER TABLE ONLY public.document
    ADD CONSTRAINT fk_document_coder FOREIGN KEY (coder_id) REFERENCES public.coder(coder_id) ON DELETE CASCADE;


--
-- TOC entry 2962 (class 2606 OID 884514)
-- Name: orders fk_orders_coder; Type: FK CONSTRAINT; Schema: public; Owner: 
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_orders_coder FOREIGN KEY (coder_id) REFERENCES public.coder(coder_id) ON DELETE CASCADE;


--
-- TOC entry 2963 (class 2606 OID 884519)
-- Name: orders fk_orders_customer; Type: FK CONSTRAINT; Schema: public; Owner: 
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_orders_customer FOREIGN KEY (cust_id) REFERENCES public.customer(cust_id) ON DELETE CASCADE;


--
-- TOC entry 2964 (class 2606 OID 884524)
-- Name: rating fk_rating_coder; Type: FK CONSTRAINT; Schema: public; Owner: 
--

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT fk_rating_coder FOREIGN KEY (coder_id) REFERENCES public.coder(coder_id) ON DELETE CASCADE;


--
-- TOC entry 2965 (class 2606 OID 884529)
-- Name: rating fk_rating_customer; Type: FK CONSTRAINT; Schema: public; Owner: 
--

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT fk_rating_customer FOREIGN KEY (cust_id) REFERENCES public.customer(cust_id) ON DELETE CASCADE;


--
-- TOC entry 2966 (class 2606 OID 884534)
-- Name: rating fk_rating_orders; Type: FK CONSTRAINT; Schema: public; Owner: 
--

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT fk_rating_orders FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE CASCADE;


--
-- TOC entry 2967 (class 2606 OID 884539)
-- Name: working fk_working_coder; Type: FK CONSTRAINT; Schema: public; Owner: 
--

ALTER TABLE ONLY public.working
    ADD CONSTRAINT fk_working_coder FOREIGN KEY (coder_id) REFERENCES public.coder(coder_id) ON DELETE CASCADE;


--
-- TOC entry 3121 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT USAGE ON SCHEMA public TO PUBLIC;
GRANT ALL ON SCHEMA public TO ;
