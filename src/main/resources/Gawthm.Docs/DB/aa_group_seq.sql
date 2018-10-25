-- Sequence: workflow.aa_group_seq

-- DROP SEQUENCE workflow.aa_group_seq;

CREATE SEQUENCE workflow.aa_group_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE workflow.aa_group_seq
  OWNER TO administrator;
