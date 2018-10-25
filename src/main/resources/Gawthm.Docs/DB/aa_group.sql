-- Table: workflow.aa_group

-- DROP TABLE workflow.aa_group;

CREATE TABLE workflow.aa_group
(
  aa_group_id numeric(10,0) NOT NULL,
  ad_client_id numeric(60,0) NOT NULL,
  ad_org_id numeric(60,0) NOT NULL,
  isactive character(1) NOT NULL DEFAULT 'Y'::bpchar,
  created timestamp without time zone NOT NULL DEFAULT now(),
  createdby numeric(10,0) NOT NULL,
  updated timestamp without time zone NOT NULL DEFAULT now(),
  updatedby numeric(10,0) NOT NULL,
  value character varying(40) NOT NULL,
  name character varying(60) NOT NULL,
  sequence numeric(10,0),
  sla numeric(10,0),
  inclusive numeric(10,0),
  iscomplete character(1) NOT NULL DEFAULT 'N'::bpchar,
  is_customer_appointment character(1) NOT NULL DEFAULT 'N'::bpchar,
  aa_parent_group_id numeric(10,0),
  isauto character(1) NOT NULL DEFAULT 'N'::bpchar,
  aa_group_header_id numeric(10,0),
  ad_role_id numeric(10,0),
  is_success character(1) NOT NULL DEFAULT 'N'::bpchar,
  parent_id numeric(10,0),
  initial_group_id numeric(10,0),
  CONSTRAINT aa_group_pkey PRIMARY KEY (aa_group_id),
  CONSTRAINT adclient_group FOREIGN KEY (ad_client_id)
      REFERENCES workflow.ad_client (ad_client_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT adorg_group FOREIGN KEY (ad_org_id)
      REFERENCES workflow.ad_org (ad_org_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED
)
WITH (
  OIDS=FALSE
);
ALTER TABLE workflow.aa_group
  OWNER TO administrator;
