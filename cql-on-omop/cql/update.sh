#!/bin/sh

# Copy CQL libraries from repository for inclusion in the container.
for f in ~/code/cql/cql-indicate-qi/cql/*.cql ; do
    cp -v $f $(basename $f)
done
