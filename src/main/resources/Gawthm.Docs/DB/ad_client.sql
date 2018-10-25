-- Table: workflow.ad_client

-- DROP TABLE workflow.ad_client;

CREATE TABLE workflow.ad_client
(
  ad_client_id numeric(10,0) NOT NULL,
  ad_org_id numeric(10,0) NOT NULL,
  isactive character(1) NOT NULL DEFAULT 'Y'::bpchar,
  created timestamp without time zone NOT NULL DEFAULT now(),
  createdby numeric(10,0) NOT NULL,
  updated timestamp without time zone NOT NULL DEFAULT now(),
  updatedby numeric(10,0) NOT NULL,
  value character varying(40) NOT NULL,
  name character varying(60) NOT NULL,
  description character varying(255),
  smtphost character varying(60),
  requestemail character varying(60),
  requestuser character varying(60),
  requestuserpw character varying(20),
  CONSTRAINT ad_client_pkey PRIMARY KEY (ad_client_id),
  CONSTRAINT ad_client_isactive_check CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
)
WITH (
  OIDS=FALSE
);
ALTER TABLE workflow.ad_client
  OWNER TO administrator;
