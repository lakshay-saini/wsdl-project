-- Sequence: workflow.aa_wo_seq

-- DROP SEQUENCE workflow.aa_wo_seq;

CREATE SEQUENCE workflow.aa_wo_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE workflow.aa_wo_seq
  OWNER TO administrator;
