## Introduction

This repository contains scripts and data for creating containers that
INDICATE data providers can deploy in order to implement the
evaluation of quality indicators for the INDICATE quality benchmarking
dashboard.

## Containers

This project creates two container images:

1. The `database` container contains a PostgreSQL database initialized with OMOP CDM tables and a collection of terminology.
   At runtime, the database is used to store the results of evaluating quality indicators.
   The stored results can be used for two purposes:
   1. The data provider can inspect conformance to the INDICATE quality indicators on a person-patient level
   2. The stored results are aggregated via views or stored procedures into a ward-level representation.
      This aggregated data is sent (without identifiable information) to the central benchmarking service for distribution to all data providers.

2. The `cql-on-omop` container contains an evaluation engine for CQL libraries.
   This engine applies CQL libraries which implement the INDICATE quality indicators to a database containing clinical data (which is distinct from the database in the `database` container).
   The results computed by the CQL libraries are stored in the `database` container for local inspection, aggregation and distribution as explained above.

## Usage

TODO
