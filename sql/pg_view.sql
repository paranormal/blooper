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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: get_domain(character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION get_domain(character varying) RETURNS character varying
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$

DECLARE DOMAIN VARCHAR;
BEGIN
DOMAIN := '----';
        IF $1 ~ 'https?://' THEN
                DOMAIN := regexp_replace(($1), 'https?://([a-zA-Z0-9\-\.]+)/.*', '\1');
ELSEIF $1 ~ '([a-zA-Z0-9\-\.]+):443' THEN
                DOMAIN := regexp_replace(($1), '([a-zA-Z0-9\-\.]+):443', '\1');
        END IF;
RETURN DOMAIN;

END;

$_$;


--
-- Name: view_load_average_05; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW view_load_average_05 AS
 SELECT accesses.ip_source AS "Ip", 
    pg_size_pretty(sum(accesses.http_reply_size)) AS "Data"
   FROM accesses
  WHERE (accesses."time" > (now() - '00:05:00'::interval))
  GROUP BY accesses.ip_source;


--
-- Name: view_load_average_30; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW view_load_average_30 AS
 SELECT accesses.ip_source AS "Ip", 
    pg_size_pretty(sum(accesses.http_reply_size)) AS "Data"
   FROM accesses
  WHERE (accesses."time" > (now() - '00:30:00'::interval))
  GROUP BY accesses.ip_source;


--
-- Name: view_load_average_60; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW view_load_average_60 AS
 SELECT accesses.ip_source AS "Ip", 
    pg_size_pretty(sum(accesses.http_reply_size)) AS "Data"
   FROM accesses
  WHERE (accesses."time" > (now() - '01:00:00'::interval))
  GROUP BY accesses.ip_source;


--
-- Name: view_load_domains_05; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW view_load_domains_05 AS
 SELECT accesses.ip_source AS ip, 
    get_domain(accesses.http_request_url) AS domain
   FROM accesses
  WHERE (accesses."time" > (now() - '00:05:00'::interval))
  GROUP BY get_domain(accesses.http_request_url), accesses.ip_source
  ORDER BY accesses.ip_source;


--
-- Name: view_load_domains_30; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW view_load_domains_30 AS
 SELECT accesses.ip_source AS ip, 
    get_domain(accesses.http_request_url) AS domain
   FROM accesses
  WHERE (accesses."time" > (now() - '00:30:00'::interval))
  GROUP BY get_domain(accesses.http_request_url), accesses.ip_source
  ORDER BY accesses.ip_source;


--
-- Name: view_load_domains_60; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW view_load_domains_60 AS
 SELECT accesses.ip_source AS ip, 
    get_domain(accesses.http_request_url) AS domain
   FROM accesses
  WHERE (accesses."time" > (now() - '01:00:00'::interval))
  GROUP BY get_domain(accesses.http_request_url), accesses.ip_source
  ORDER BY accesses.ip_source;


--
-- Name: view_stat_days; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW view_stat_days AS
 SELECT date(accesses."time") AS "Date", 
    accesses.ip_source AS "IP", 
    count(accesses.id) AS "Queries", 
    pg_size_pretty(sum(accesses.http_reply_size)) AS "Data"
   FROM accesses
  GROUP BY date(accesses."time"), accesses.ip_source
  ORDER BY date(accesses."time");


--
-- Name: view_stat_months; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW view_stat_months AS
 SELECT date(accesses."time") AS "Date", 
    count(accesses.id) AS "Queries", 
    count(DISTINCT accesses.ip_source) AS "Clients", 
    pg_size_pretty(sum(accesses.http_reply_size)) AS "Size"
   FROM accesses
  GROUP BY date(accesses."time")
  ORDER BY date(accesses."time");


--
-- PostgreSQL database dump complete
--

