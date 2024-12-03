--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

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
-- Name: bab; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bab (
    kode_bab integer NOT NULL,
    nama_bab character varying(100),
    kode_materi integer NOT NULL
);


ALTER TABLE public.bab OWNER TO postgres;

--
-- Name: bab_kode_bab_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bab_kode_bab_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bab_kode_bab_seq OWNER TO postgres;

--
-- Name: bab_kode_bab_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bab_kode_bab_seq OWNED BY public.bab.kode_bab;


--
-- Name: beli_subtopik; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beli_subtopik (
    id_pembelian integer NOT NULL,
    id_user integer,
    kode_subtopik integer,
    selesai boolean DEFAULT false NOT NULL,
    tanggal_pembelian timestamp without time zone NOT NULL
);


ALTER TABLE public.beli_subtopik OWNER TO postgres;

--
-- Name: beli_subtopik_id_pembelian_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.beli_subtopik_id_pembelian_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.beli_subtopik_id_pembelian_seq OWNER TO postgres;

--
-- Name: beli_subtopik_id_pembelian_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.beli_subtopik_id_pembelian_seq OWNED BY public.beli_subtopik.id_pembelian;


--
-- Name: data_mentor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.data_mentor (
    id integer NOT NULL,
    id_user integer NOT NULL,
    materi text,
    jenjang text,
    online text,
    offline text,
    riwayat_studi text
);


ALTER TABLE public.data_mentor OWNER TO postgres;

--
-- Name: data_mentor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.data_mentor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.data_mentor_id_seq OWNER TO postgres;

--
-- Name: data_mentor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.data_mentor_id_seq OWNED BY public.data_mentor.id;


--
-- Name: isi_latihan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.isi_latihan (
    kode_latihan integer NOT NULL,
    soal text,
    jawaban text,
    opsi text,
    gambar_url character varying(255),
    keterangan character varying(30),
    kode_subtopik integer NOT NULL
);


ALTER TABLE public.isi_latihan OWNER TO postgres;

--
-- Name: isi_latihan_kode_latihan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.isi_latihan_kode_latihan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.isi_latihan_kode_latihan_seq OWNER TO postgres;

--
-- Name: isi_latihan_kode_latihan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.isi_latihan_kode_latihan_seq OWNED BY public.isi_latihan.kode_latihan;


--
-- Name: isi_subtopik; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.isi_subtopik (
    kode_isi_subtopik integer NOT NULL,
    nomor integer NOT NULL,
    materi text,
    gambar_url character varying(255),
    soal character varying(255),
    jawaban character varying(255),
    opsi text,
    keterangan character varying(30),
    kode_subtopik integer NOT NULL,
    petunjuk text NOT NULL
);


ALTER TABLE public.isi_subtopik OWNER TO postgres;

--
-- Name: isi_subtopik_kode_isi_subtopik_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.isi_subtopik_kode_isi_subtopik_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.isi_subtopik_kode_isi_subtopik_seq OWNER TO postgres;

--
-- Name: isi_subtopik_kode_isi_subtopik_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.isi_subtopik_kode_isi_subtopik_seq OWNED BY public.isi_subtopik.kode_isi_subtopik;


--
-- Name: materi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materi (
    kode_materi integer NOT NULL,
    nama_materi character varying(100),
    jenjang character varying(100),
    kelas character varying(30)
);


ALTER TABLE public.materi OWNER TO postgres;

--
-- Name: materi_kode_materi_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materi_kode_materi_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.materi_kode_materi_seq OWNER TO postgres;

--
-- Name: materi_kode_materi_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materi_kode_materi_seq OWNED BY public.materi.kode_materi;


--
-- Name: poin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.poin (
    id_user integer NOT NULL,
    matematika integer DEFAULT 0,
    bahasa_inggris integer DEFAULT 0,
    daspro integer DEFAULT 0,
    utbk integer DEFAULT 0,
    total_poin integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.poin OWNER TO postgres;

--
-- Name: statistik; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.statistik (
    kode_statistik integer NOT NULL,
    minggu_lalu integer,
    minggu_ini integer,
    topik_selesai integer,
    id_user integer NOT NULL
);


ALTER TABLE public.statistik OWNER TO postgres;

--
-- Name: statistik_kode_statistik_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.statistik_kode_statistik_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.statistik_kode_statistik_seq OWNER TO postgres;

--
-- Name: statistik_kode_statistik_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.statistik_kode_statistik_seq OWNED BY public.statistik.kode_statistik;


--
-- Name: subbab; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subbab (
    kode_subbab integer NOT NULL,
    nama_subbab character varying(100),
    kode_bab integer NOT NULL
);


ALTER TABLE public.subbab OWNER TO postgres;

--
-- Name: subbab_kode_subbab_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subbab_kode_subbab_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.subbab_kode_subbab_seq OWNER TO postgres;

--
-- Name: subbab_kode_subbab_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subbab_kode_subbab_seq OWNED BY public.subbab.kode_subbab;


--
-- Name: subtopik; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subtopik (
    kode_subtopik integer NOT NULL,
    nama_subtopik character varying(100),
    harga integer DEFAULT 0,
    status_bayar boolean DEFAULT false,
    kode_topik integer NOT NULL,
    keterangan character varying(30)
);


ALTER TABLE public.subtopik OWNER TO postgres;

--
-- Name: subtopik_kode_subtopik_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subtopik_kode_subtopik_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.subtopik_kode_subtopik_seq OWNER TO postgres;

--
-- Name: subtopik_kode_subtopik_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subtopik_kode_subtopik_seq OWNED BY public.subtopik.kode_subtopik;


--
-- Name: target; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.target (
    kode_target integer NOT NULL,
    nama_target character varying(50),
    selesai integer,
    dipelajari integer,
    dikuasai integer
);


ALTER TABLE public.target OWNER TO postgres;

--
-- Name: target_kode_target_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.target_kode_target_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.target_kode_target_seq OWNER TO postgres;

--
-- Name: target_kode_target_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.target_kode_target_seq OWNED BY public.target.kode_target;


--
-- Name: topik; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.topik (
    kode_topik integer NOT NULL,
    nama_topik character varying(100),
    rangkuman text,
    video_url character varying(255),
    kode_subbab integer NOT NULL
);


ALTER TABLE public.topik OWNER TO postgres;

--
-- Name: topik_kode_topik_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.topik_kode_topik_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.topik_kode_topik_seq OWNER TO postgres;

--
-- Name: topik_kode_topik_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.topik_kode_topik_seq OWNED BY public.topik.kode_topik;


--
-- Name: transaksi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaksi (
    id_transaksi integer NOT NULL,
    id_user integer,
    jumlah integer,
    biaya integer,
    keterangan text NOT NULL,
    waktu timestamp without time zone NOT NULL
);


ALTER TABLE public.transaksi OWNER TO postgres;

--
-- Name: transaksi_id_transaksi_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaksi_id_transaksi_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transaksi_id_transaksi_seq OWNER TO postgres;

--
-- Name: transaksi_id_transaksi_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaksi_id_transaksi_seq OWNED BY public.transaksi.id_transaksi;


--
-- Name: user_materi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_materi (
    id_user integer NOT NULL,
    jenjang character varying(100),
    minat character varying(100),
    kode_target integer
);


ALTER TABLE public.user_materi OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    nama character varying(100) NOT NULL,
    nomor character varying(20),
    latitude numeric(11,8),
    longitude numeric(11,8),
    password character varying(255) NOT NULL,
    role character varying(30),
    koin integer DEFAULT 0 NOT NULL,
    materi_terakhir character varying(100)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: bab kode_bab; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bab ALTER COLUMN kode_bab SET DEFAULT nextval('public.bab_kode_bab_seq'::regclass);


--
-- Name: beli_subtopik id_pembelian; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beli_subtopik ALTER COLUMN id_pembelian SET DEFAULT nextval('public.beli_subtopik_id_pembelian_seq'::regclass);


--
-- Name: data_mentor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_mentor ALTER COLUMN id SET DEFAULT nextval('public.data_mentor_id_seq'::regclass);


--
-- Name: isi_latihan kode_latihan; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.isi_latihan ALTER COLUMN kode_latihan SET DEFAULT nextval('public.isi_latihan_kode_latihan_seq'::regclass);


--
-- Name: isi_subtopik kode_isi_subtopik; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.isi_subtopik ALTER COLUMN kode_isi_subtopik SET DEFAULT nextval('public.isi_subtopik_kode_isi_subtopik_seq'::regclass);


--
-- Name: materi kode_materi; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materi ALTER COLUMN kode_materi SET DEFAULT nextval('public.materi_kode_materi_seq'::regclass);


--
-- Name: statistik kode_statistik; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statistik ALTER COLUMN kode_statistik SET DEFAULT nextval('public.statistik_kode_statistik_seq'::regclass);


--
-- Name: subbab kode_subbab; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subbab ALTER COLUMN kode_subbab SET DEFAULT nextval('public.subbab_kode_subbab_seq'::regclass);


--
-- Name: subtopik kode_subtopik; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subtopik ALTER COLUMN kode_subtopik SET DEFAULT nextval('public.subtopik_kode_subtopik_seq'::regclass);


--
-- Name: target kode_target; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.target ALTER COLUMN kode_target SET DEFAULT nextval('public.target_kode_target_seq'::regclass);


--
-- Name: topik kode_topik; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topik ALTER COLUMN kode_topik SET DEFAULT nextval('public.topik_kode_topik_seq'::regclass);


--
-- Name: transaksi id_transaksi; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksi ALTER COLUMN id_transaksi SET DEFAULT nextval('public.transaksi_id_transaksi_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: bab bab_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bab
    ADD CONSTRAINT bab_pkey PRIMARY KEY (kode_bab);


--
-- Name: beli_subtopik beli_subtopik_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beli_subtopik
    ADD CONSTRAINT beli_subtopik_pkey PRIMARY KEY (id_pembelian);


--
-- Name: data_mentor data_mentor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_mentor
    ADD CONSTRAINT data_mentor_pkey PRIMARY KEY (id);


--
-- Name: isi_latihan isi_latihan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.isi_latihan
    ADD CONSTRAINT isi_latihan_pkey PRIMARY KEY (kode_latihan);


--
-- Name: isi_subtopik isi_subtopik_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.isi_subtopik
    ADD CONSTRAINT isi_subtopik_pkey PRIMARY KEY (kode_isi_subtopik);


--
-- Name: materi materi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materi
    ADD CONSTRAINT materi_pkey PRIMARY KEY (kode_materi);


--
-- Name: statistik statistik_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statistik
    ADD CONSTRAINT statistik_pkey PRIMARY KEY (kode_statistik);


--
-- Name: subbab subbab_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subbab
    ADD CONSTRAINT subbab_pkey PRIMARY KEY (kode_subbab);


--
-- Name: subtopik subtopik_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subtopik
    ADD CONSTRAINT subtopik_pkey PRIMARY KEY (kode_subtopik);


--
-- Name: target target_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.target
    ADD CONSTRAINT target_pkey PRIMARY KEY (kode_target);


--
-- Name: topik topik_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topik
    ADD CONSTRAINT topik_pkey PRIMARY KEY (kode_topik);


--
-- Name: transaksi transaksi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksi
    ADD CONSTRAINT transaksi_pkey PRIMARY KEY (id_transaksi);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: bab_kode_materi; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bab_kode_materi ON public.bab USING btree (kode_materi);


--
-- Name: beli_subtopik_id_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX beli_subtopik_id_user ON public.beli_subtopik USING btree (id_user);


--
-- Name: beli_subtopik_kode_subtopik; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX beli_subtopik_kode_subtopik ON public.beli_subtopik USING btree (kode_subtopik);


--
-- Name: isi_latihan_kode_subtopik; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX isi_latihan_kode_subtopik ON public.isi_latihan USING btree (kode_subtopik);


--
-- Name: isi_subtopik_kode_subtopik; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX isi_subtopik_kode_subtopik ON public.isi_subtopik USING btree (kode_subtopik);


--
-- Name: poin_id_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX poin_id_user ON public.poin USING btree (id_user);


--
-- Name: statistik_id_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX statistik_id_user ON public.statistik USING btree (id_user);


--
-- Name: subbab_kode_bab; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX subbab_kode_bab ON public.subbab USING btree (kode_bab);


--
-- Name: subtopik_kode_topik; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX subtopik_kode_topik ON public.subtopik USING btree (kode_topik);


--
-- Name: topik_kode_subbab; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX topik_kode_subbab ON public.topik USING btree (kode_subbab);


--
-- Name: transaksi_fk_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transaksi_fk_user ON public.transaksi USING btree (id_user);


--
-- Name: user_materi_id_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_materi_id_user ON public.user_materi USING btree (id_user);


--
-- Name: user_materi_kode_target; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_materi_kode_target ON public.user_materi USING btree (kode_target);


--
-- Name: bab bab_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bab
    ADD CONSTRAINT bab_ibfk_1 FOREIGN KEY (kode_materi) REFERENCES public.materi(kode_materi) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: beli_subtopik beli_subtopik_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beli_subtopik
    ADD CONSTRAINT beli_subtopik_ibfk_1 FOREIGN KEY (id_user) REFERENCES public.users(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: beli_subtopik beli_subtopik_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beli_subtopik
    ADD CONSTRAINT beli_subtopik_ibfk_2 FOREIGN KEY (kode_subtopik) REFERENCES public.subtopik(kode_subtopik) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: isi_latihan isi_latihan_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.isi_latihan
    ADD CONSTRAINT isi_latihan_ibfk_1 FOREIGN KEY (kode_subtopik) REFERENCES public.subtopik(kode_subtopik) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: isi_subtopik isi_subtopik_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.isi_subtopik
    ADD CONSTRAINT isi_subtopik_ibfk_1 FOREIGN KEY (kode_subtopik) REFERENCES public.subtopik(kode_subtopik) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: poin poin_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poin
    ADD CONSTRAINT poin_ibfk_1 FOREIGN KEY (id_user) REFERENCES public.users(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: statistik statistik_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statistik
    ADD CONSTRAINT statistik_ibfk_1 FOREIGN KEY (id_user) REFERENCES public.users(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: subbab subbab_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subbab
    ADD CONSTRAINT subbab_ibfk_1 FOREIGN KEY (kode_bab) REFERENCES public.bab(kode_bab) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: subtopik subtopik_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subtopik
    ADD CONSTRAINT subtopik_ibfk_1 FOREIGN KEY (kode_topik) REFERENCES public.topik(kode_topik) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: topik topik_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topik
    ADD CONSTRAINT topik_ibfk_1 FOREIGN KEY (kode_subbab) REFERENCES public.subbab(kode_subbab) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: user_materi user_materi_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_materi
    ADD CONSTRAINT user_materi_ibfk_1 FOREIGN KEY (id_user) REFERENCES public.users(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: user_materi user_materi_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_materi
    ADD CONSTRAINT user_materi_ibfk_2 FOREIGN KEY (kode_target) REFERENCES public.target(kode_target) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

