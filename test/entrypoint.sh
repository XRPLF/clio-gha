#!/usr/bin/env bash
ls -lah

chmod +x ./clio_tests

pg_ctlcluster 12 main start
su postgres -c"psql -c\"alter user postgres with password 'postgres'\""
su cassandra -c "/opt/cassandra/bin/cassandra -R"

./clio_tests
