library(DBI)
library(connections)
library(RPostgres)

nycflights <- connection_open(RPostgres::Postgres(),
                       dbname   = "nycflights",
                       host     = "dat153db.ada.davidson.edu",
                       port     = PORTNUM,
                       user     = "USERNAME",
                       password = Sys.getenv("pg_password_dat153"))