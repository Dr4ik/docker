#!/bin/bash

# Early fail

# PostgreSQL should be either linked by name "postgres" or specified explicitly through DB_* parameters
[[ -z ${POSTGRES_PORT_5432_TCP_ADDR} && (-z ${DB_HOST} || -z ${DB_PASS} || -z ${DB_USER} || -z ${DB_NAME}) ]]\
 && echo "A PostgreSQL image named \"postgres\" must be linked or you should specify DB_HOST, DB_PASS, DB_USER and DB_NAME"\
 && exit 1

# Like PostgreSQL, Redis could also be linked or specified explicitly through REDIS_HOST and REDIS_PORT
[[ -z ${REDIS_PORT_6379_TCP_ADDR} && (-z ${REDIS_HOST} || -z ${REDIS_PORT}) ]]\
 && echo "A Redis image named \"redis\" must be linked" && exit 1

[ -z ${GITLAB_HOST} ] && echo "GITLAB_HOST must be specified!" && exit 1
[ -z ${GITLAB_EMAIL_FROM} ] && echo "GITLAB_EMAIL_FROM must be specified!" && exit 1
[ -z ${GITLAB_EMAIL_REPLY_TO} ] && echo "GITLAB_EMAIL_DISPLAY_NAME must be specified!" && exit 1
