-- Table: workflow.aa_wo

-- DROP TABLE workflow.aa_wo;

CREATE TABLE workflow.aa_wo
(
  aa_wo_id numeric(60,0) NOT NULL,
  ad_client_id numeric(60,0) NOT NULL,
  ad_org_id numeric(60,0) NOT NULL,
  isactive character(1) NOT NULL DEFAULT 'Y'::bpchar,
  created timestamp without time zone NOT NULL DEFAULT now(),
  createdby numeric(10,0) NOT NULL,
  updated timestamp without time zone NOT NULL DEFAULT now(),
  updatedby numeric(10,0) NOT NULL,
  value character varying(40) NOT NULL,
  name character varying(60) NOT NULL,
  enduserfirstname character varying(60) NOT NULL,
  enduserlastname character varying(60) NOT NULL,
  requestlicenses character varying(60) NOT NULL,
  requestlicenseswo character varying(60) NOT NULL,
  requestlicensesnote character varying(255) NOT NULL,
  dateordered timestamp without time zone,
  endusertype character varying(40) NOT NULL,
  endusergsm character varying(40) NOT NULL,
  endusergsm2 character varying(40),
  endusertagid character varying(40) NOT NULL,
  buildingno character varying(40),
  goverenate character varying(40),
  area character varying(40),
  waynumber character varying(40),
  propertytype character varying(40) NOT NULL,
  capid character varying(40) NOT NULL,
  fdhd character varying(40) NOT NULL,
  fdhe character varying(40) NOT NULL,
  splitterport character varying(40) NOT NULL,
  dropcablelength character varying(40) NOT NULL,
  workpackb numeric(10,0) NOT NULL,
  aa_group_id numeric(10,0) NOT NULL,
  c_bpartner_id numeric(10,0) NOT NULL,
  supervisor_id numeric(10,0),
  dateplanned timestamp without time zone,
  previousgroup_id numeric(10,0),
  problem_category numeric(10,0),
  datescheduled date,
  aa_timeband_id numeric(10,0),
  timescheduled date,
  consent numeric(10,0),
  evidence numeric(10,0),
  qshe numeric(10,0),
  ont_make character varying(40),
  ont_serialno character varying(40),
  handset_make character varying(40),
  handset_serialno character varying(40),
  fdn character varying(40),
  completion numeric(10,0),
  CONSTRAINT aa_wo_pkey PRIMARY KEY (aa_wo_id),
  CONSTRAINT adclient_wo FOREIGN KEY (ad_client_id)
      REFERENCES workflow.ad_client (ad_client_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT adorg_wo FOREIGN KEY (ad_org_id)
      REFERENCES workflow.ad_org (ad_org_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT adusersupervisor_wo FOREIGN KEY (supervisor_id)
      REFERENCES workflow.ad_user (ad_user_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT cbpartner_wo FOREIGN KEY (c_bpartner_id)
      REFERENCES workflow.c_bpartner (c_bpartner_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE SET NULL DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT completion_wo FOREIGN KEY (completion)
      REFERENCES workflow.ad_attachment (ad_attachment_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT consent_wo FOREIGN KEY (consent)
      REFERENCES workflow.ad_attachment (ad_attachment_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT evidence_wo FOREIGN KEY (evidence)
      REFERENCES workflow.ad_attachment (ad_attachment_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT qshe_wo FOREIGN KEY (qshe)
      REFERENCES workflow.ad_attachment (ad_attachment_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT workpackb_wo FOREIGN KEY (workpackb)
      REFERENCES workflow.ad_attachment (ad_attachment_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT aa_wo_isactive_check CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
)
WITH (
  OIDS=FALSE
);
ALTER TABLE workflow.aa_wo
  OWNER TO administrator;
