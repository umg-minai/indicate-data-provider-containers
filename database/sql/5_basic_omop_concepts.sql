-- Insert domains

ALTER TABLE cds_cdm.domain DROP CONSTRAINT fpk_domain_domain_concept_id;

INSERT INTO cds_cdm.domain
  (domain_id, domain_name, domain_concept_id)
  VALUES ('Metadata',    'Metadata',    7),
         ('Observation', 'Observation', 27);

-- Insert vocabularies

ALTER TABLE cds_cdm.vocabulary DROP CONSTRAINT fpk_vocabulary_vocabulary_concept_id;

INSERT INTO cds_cdm.vocabulary
         (vocabulary_id,   vocabulary_name,                  vocabulary_reference, vocabulary_version, vocabulary_concept_id)
  VALUES ('None',          'OMOP Standardized Vocabularies', 'OMOP generated',     'v5.0 29-FEB-24',   44819096),
         ('Domain',        'OMOP Domain',                    'OMOP generated',     null,               44819147),
         ('Vocabulary',    'OMOP Vocabulary',                'OMOP generated',     null,               44819232),
         ('Concept Class', 'OMOP Concept Class',             'OMOP generated',     null,               44819233);

-- Insert concept classes

ALTER TABLE cds_cdm.concept_class DROP CONSTRAINT fpk_concept_class_concept_class_concept_id;

INSERT INTO cds_cdm.concept_class
         (concept_class_id, concept_class_name,   concept_class_concept_id)
  VALUES ('Domain',         'Domain',             44819025),
         ('Undefined',      'Undefined',          44819044),
         ('Observation',    'Observation',        44819093),
         ('Concept Class',  'OMOP Concept Class', 44819247),
         ('Vocabulary',     'OMOP Vocabulary',    44819279);

-- Insert basic concepts

INSERT INTO cds_cdm.concept
         (concept_id, concept_name,                     domain_id,  vocabulary_id,   concept_class_id, concept_code,          valid_start_date, valid_end_date)
  VALUES (       0,   'No matching concept',            'Metadata', 'None',          'Undefined',      'No matching concept', '1970-01-01',     '2099-12-31'),
         (       7,   'Metadata',                       'Metadata', 'Domain',        'Domain',         'OMOP generated',      '1970-01-01',     '2099-12-31'),
         (      27,   'Observation',                    'Metadata', 'Domain',        'Domain',         'OMOP generated',      '1970-01-01',     '2099-12-31'),
         (44819025,   'Domain',                         'Metadata', 'Concept Class', 'Concept Class',  'OMOP generated',      '1970-01-01',     '2099-12-31'),
         (44819044,   'Undefined',                      'Metadata', 'Concept Class', 'Concept Class',  'OMOP generated',      '1970-01-01',     '2099-12-31'),
         (44819093,   'Observation',                    'Metadata', 'Concept Class', 'Concept Class',  'OMOP generated',      '1970-01-01',     '2099-12-31'),
         (44819096,   'OMOP Standardized Vocabularies', 'Metadata', 'Vocabulary',    'Vocabulary',     'OMOP generated',      '1970-01-01',     '2099-12-31'),
         (44819147,   'OMOP Domain',                    'Metadata', 'Vocabulary',    'Vocabulary',     'OMOP generated',      '1970-01-01',     '2099-12-31'),
         (44819232,   'OMOP Vocabulary',                'Metadata', 'Vocabulary',    'Vocabulary',     'OMOP generated',      '1970-01-01',     '2099-12-31'),
         (44819233,   'OMOP Concept Class',             'Metadata', 'Vocabulary',    'Vocabulary',     'OMOP generated',      '1970-01-01',     '2099-12-31'),
         (44819247,   'OMOP Concept Class',             'Metadata', 'Concept Class', 'Concept Class',  'OMOP generated',      '1970-01-01',     '2099-12-31'),
         (44819279,   'OMOP Vocabulary',                'Metadata', 'Concept Class', 'Concept Class',  'OMOP generated',      '1970-01-01',     '2099-12-31');

-- Restore constraints

ALTER TABLE cds_cdm.domain
  ADD CONSTRAINT fpk_domain_domain_concept_id
                 FOREIGN KEY (domain_concept_id)
                 REFERENCES cds_cdm.concept (concept_id);

ALTER TABLE cds_cdm.vocabulary
  ADD CONSTRAINT fpk_vocabulary_vocabulary_concept_id
                 FOREIGN KEY (vocabulary_concept_id)
                 REFERENCES cds_cdm.concept (concept_id);

ALTER TABLE cds_cdm.concept_class
  ADD CONSTRAINT fpk_concept_class_concept_class_concept_id
                 FOREIGN KEY (concept_class_concept_id)
                 REFERENCES cds_cdm.concept (concept_id);
