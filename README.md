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

## Dependencies

* PostgreSQL

* https://github.com/umg-minai/cql-on-omop

* https://github.com/aptible/supercronic

* INDICATE CQL Libraries

## Build

### Obtain Dependencies

1. cql-on-omop

   TODO

2. INDICATE Quality Indicator CQL Libraries

   TODO

### Set up Database Access

1. Add connection data for the OMOP database which provides the
   clinical data to `databases.env` in the root directory of this
   repository.

2. Enter the database password for that database into the file
   `source-database-password` in the root directory of this
   repository.

3. Choose an arbitrary password for the internal database in the
   "database" container and enter that password into the file
   `target-database-password` in the root directory of this
   repository. One way to do this is

   ```sh
   echo INDICATE | mkpasswd -m descrypt -s > target-database-password
   ```

### Build the Images

Execute

```sh
docker-compose build
```

in the root directory of this repository.

## Usage

### Create and Start

To create and start the containers, run

```sh
docker-compose run -d
```

in the root directory of this repository.

### Stop

To stop the containers, run

```sh
docker-compose stop
```

in the root directory of this repository.

### Start again after stopping

To start the containers again after stopping, run

```sh
docker-compose start
```

in the root directory of this repository.
