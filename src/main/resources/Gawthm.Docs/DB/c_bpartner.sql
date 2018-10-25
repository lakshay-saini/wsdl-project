-- Table: workflow.c_bpartner

-- DROP TABLE workflow.c_bpartner;

CREATE TABLE workflow.c_bpartner
(
  c_bpartner_id numeric(10,0) NOT NULL,
  ad_client_id numeric(10,0) NOT NULL,
  ad_org_id numeric(10,0) NOT NULL,
  isactive character(1) NOT NULL DEFAULT 'Y'::bpchar,
  created timestamp without time zone NOT NULL DEFAULT now(),
  createdby numeric(10,0) NOT NULL,
  updated timestamp without time zone NOT NULL DEFAULT now(),
  updatedby numeric(10,0) NOT NULL,
  value character varying(40) NOT NULL,
  name character varying(60) NOT NULL,
  iscontractor character(1) NOT NULL DEFAULT 'N'::bpchar,
  url character varying(120),
  supervisor_id numeric(10,0),
  phone character varying(40),
  phone2 character varying(40),
  email character varying(40),
  fax character varying(60),
  logo_id numeric(10,0),
  description character varying(255),
  CONSTRAINT c_bpartner_pkey PRIMARY KEY (c_bpartner_id),
  CONSTRAINT adclient_cbpartner FOREIGN KEY (ad_client_id)
      REFERENCES workflow.ad_client (ad_client_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT adorg_cbpartner FOREIGN KEY (ad_org_id)
      REFERENCES workflow.ad_org (ad_org_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT adusersupervisor_cbpartner FOREIGN KEY (supervisor_id)
      REFERENCES workflow.ad_user (ad_user_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT logo_cbpartner FOREIGN KEY (logo_id)
      REFERENCES workflow.ad_attachment (ad_attachment_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT c_bpartner_isactive_check CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])),
  CONSTRAINT c_bpartner_iscontractor_check CHECK (iscontractor = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
)
WITH (
  OIDS=FALSE
);
ALTER TABLE workflow.c_bpartner
  OWNER TO administrator;
