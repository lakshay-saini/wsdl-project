-- Table: workflow.ad_attachment

-- DROP TABLE workflow.ad_attachment;

CREATE TABLE workflow.ad_attachment
(
  ad_attachment_id numeric(10,0) NOT NULL,
  ad_client_id numeric(10,0) NOT NULL,
  ad_org_id numeric(10,0) NOT NULL,
  isactive character(1) NOT NULL DEFAULT 'Y'::bpchar,
  created timestamp without time zone NOT NULL DEFAULT now(),
  createdby numeric(10,0) NOT NULL,
  updated timestamp without time zone NOT NULL DEFAULT now(),
  updatedby numeric(10,0) NOT NULL,
  doctype character varying(60) NOT NULL,
  name character varying(60) NOT NULL,
  binarydata bytea,
  textmsg character varying(2000),
  CONSTRAINT ad_attachment_pkey PRIMARY KEY (ad_attachment_id),
  CONSTRAINT ad_attachment_isactive_check CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
)
WITH (
  OIDS=FALSE
);
ALTER TABLE workflow.ad_attachment
  OWNER TO administrator;
