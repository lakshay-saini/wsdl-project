-- Sequence: workflow.ad_client_seq

-- DROP SEQUENCE workflow.ad_client_seq;

CREATE SEQUENCE workflow.ad_client_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE workflow.ad_client_seq
  OWNER TO administrator;
