--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: accesses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE accesses (
    id integer NOT NULL,
    "time" timestamp with time zone NOT NULL,
    time_response integer,
    mac_source macaddr,
    ip_source inet NOT NULL,
    ip_destination inet,
    user_name character varying(40),
    http_status_code numeric(3,0) NOT NULL,
    http_reply_size bigint NOT NULL,
    http_request_method character varying(15) NOT NULL,
    http_request_url character varying(4166) NOT NULL,
    http_content_type character varying(100),
    squid_hier_code character varying(20),
    squid_request_status character varying(50)
);


--
-- Name: accesses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE accesses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: accesses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE accesses_id_seq OWNED BY accesses.id;


--
-- Name: http_requests; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE http_requests (
    method character varying(15) NOT NULL,
    cachabil character varying(15),
    meaning character varying(50)
);


--
-- Name: http_statuses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE http_statuses (
    code numeric(3,0) NOT NULL,
    description character varying(1024),
    rfc numeric(4,0)
);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY accesses ALTER COLUMN id SET DEFAULT nextval('accesses_id_seq'::regclass);


--
-- Name: http_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY http_requests
    ADD CONSTRAINT http_requests_pkey PRIMARY KEY (method);


--
-- Name: http_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY http_statuses
    ADD CONSTRAINT http_statuses_pkey PRIMARY KEY (code);


--
-- Name: accesses_time_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX accesses_time_idx ON accesses USING btree ("time");

--
-- Name: accesses_http_request_method_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY accesses
    ADD CONSTRAINT accesses_http_request_method_fkey FOREIGN KEY (http_request_method) REFERENCES http_requests(method);


--
-- Name: accesses_http_status_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY accesses
    ADD CONSTRAINT accesses_http_status_code_fkey FOREIGN KEY (http_status_code) REFERENCES http_statuses(code);


--
-- PostgreSQL database dump complete
--

