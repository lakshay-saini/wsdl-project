-- Table: workflow.ad_org

-- DROP TABLE workflow.ad_org;

CREATE TABLE workflow.ad_org
(
  ad_org_id numeric(10,0) NOT NULL,
  ad_client_id numeric(10,0) NOT NULL,
  isactive character(1) NOT NULL DEFAULT 'Y'::bpchar,
  created timestamp without time zone NOT NULL DEFAULT now(),
  createdby numeric(10,0) NOT NULL,
  updated timestamp without time zone NOT NULL DEFAULT now(),
  updatedby numeric(10,0) NOT NULL,
  value character varying(40) NOT NULL,
  name character varying(60) NOT NULL,
  description character varying(255),
  CONSTRAINT ad_org_pkey PRIMARY KEY (ad_org_id),
  CONSTRAINT adclient_adorg FOREIGN KEY (ad_client_id)
      REFERENCES workflow.ad_client (ad_client_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT ad_org_isactive_check CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
)
WITH (
  OIDS=FALSE
);
ALTER TABLE workflow.ad_org
  OWNER TO administrator;
