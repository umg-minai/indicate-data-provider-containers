-- Insert custom vocabulary

INSERT INTO cds_cdm.concept
         (concept_id,    concept_name,          domain_id,  vocabulary_id, concept_class_id, concept_code,         valid_start_date, valid_end_date)
  VALUES (2_000_000_001, 'INDICATE Vocabulary', 'Metadata', 'Vocabulary',  'Vocabulary',     'INDICATE generated', '1970-01-01',     '2099-12-31');

INSERT INTO cds_cdm.vocabulary
         (vocabulary_id, vocabulary_name,       vocabulary_reference, vocabulary_concept_id)
  VALUES ('INDICATE',    'INDICATE Vocabulary', 'INDICATE Project',   2_000_000_001);

-- Insert custom concepts

INSERT INTO cds_cdm.concept
         (concept_id,    concept_code,      domain_id,     vocabulary_id, concept_class_id, concept_name,                                                             valid_start_date, valid_end_date)
  VALUES (2_000_000_101, 'person-24h-qi01', 'Observation', 'INDICATE',    'Observation',    'Person-level, 24-hour period result for QI 01 Ventilation',              '2026-01-01',     '2099-12-31'),
         (2_000_000_102, 'person-24h-qi02', 'Observation', 'INDICATE',    'Observation',    'Person-level, 24-hour period result for QI 02 Weaning',                  '2026-01-01',     '2099-12-31'),
         (2_000_000_103, 'person-24h-qi03', 'Observation', 'INDICATE',    'Observation',    'Person-level, 24-hour period result for QI 03 Feeding',                  '2026-01-01',     '2099-12-31'),
         (2_000_000_104, 'person-24h-qi04', 'Observation', 'INDICATE',    'Observation',    'Person-level, 24-hour period result for QI 04 Glucose Control',          '2026-01-01',     '2099-12-31'),
         (2_000_000_105, 'person-24h-qi05', 'Observation', 'INDICATE',    'Observation',    'Person-level, 24-hour period result for QI 05 Thrombembolic Prevention', '2026-01-01',     '2099-12-31'),
         (2_000_000_106, 'person-24h-qi06', 'Observation', 'INDICATE',    'Observation',    'Person-level, 24-hour period result for QI 06 Infection Rate',           '2026-01-01',     '2099-12-31'),
         (2_000_000_107, 'person-24h-qi07', 'Observation', 'INDICATE',    'Observation',    'Person-level, 24-hour period result for QI 07 Pain Sedation Delir',      '2026-01-01',     '2099-12-31'),
         (2_000_000_108, 'person-24h-qi08', 'Observation', 'INDICATE',    'Observation',    'Person-level, 24-hour period result for QI 08 Advanced Care Planing',    '2026-01-01',     '2099-12-31'),
         (2_000_000_109, 'person-24h-qi09', 'Observation', 'INDICATE',    'Observation',    'Person-level, 24-hour period result for QI 09 Mobilisation',             '2026-01-01',     '2099-12-31');
