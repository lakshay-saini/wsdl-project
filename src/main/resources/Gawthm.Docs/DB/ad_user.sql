-- Table: workflow.ad_user

-- DROP TABLE workflow.ad_user;

CREATE TABLE workflow.ad_user
(
  ad_user_id numeric(10,0) NOT NULL,
  ad_client_id numeric(10,0) NOT NULL,
  ad_org_id numeric(10,0) NOT NULL,
  isactive character(1) NOT NULL DEFAULT 'Y'::bpchar,
  created timestamp without time zone NOT NULL DEFAULT now(),
  createdby numeric(10,0) NOT NULL,
  updated timestamp without time zone NOT NULL DEFAULT now(),
  updatedby numeric(10,0) NOT NULL,
  name character varying(60) NOT NULL,
  description character varying(255),
  password character varying(40),
  email character varying(60),
  supervisor_id numeric(10,0),
  c_bpartner_id numeric(10,0),
  title character varying(40),
  comments character varying(2000),
  phone character varying(40),
  phone2 character varying(40),
  fax character varying(40),
  value character varying(40),
  ismobile character(1) NOT NULL DEFAULT 'N'::bpchar,
  aa_group_id numeric(10,0),
  mac character varying(20),
  appversion character varying(20),
  avatar character varying(20),
  aa_user_location_id numeric(10,0),
  CONSTRAINT ad_user_pkey PRIMARY KEY (ad_user_id),
  CONSTRAINT ad_user_client FOREIGN KEY (ad_client_id)
      REFERENCES workflow.ad_client (ad_client_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT ad_user_org FOREIGN KEY (ad_org_id)
      REFERENCES workflow.ad_org (ad_org_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT aduser_supervisor FOREIGN KEY (supervisor_id)
      REFERENCES workflow.ad_user (ad_user_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT cbpartner_aduser FOREIGN KEY (c_bpartner_id)
      REFERENCES workflow.c_bpartner (c_bpartner_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT ad_user_isactive_check CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
)
WITH (
  OIDS=FALSE
);
ALTER TABLE workflow.ad_user
  OWNER TO administrator;
