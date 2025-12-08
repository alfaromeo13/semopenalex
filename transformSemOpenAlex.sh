#!/bin/bash

# this script collects and run the following python scripts in sequentially

echo "SemOpenAlex transformation script started at: " $(date -u)

# Data transformation from OpenAlex to RDF data dump
# Running a series of python scripts one after another
python3 ./transformation-scripts/semopenalex-topics.py;
python3 ./transformation-scripts/semopenalex-subfields.py;
python3 ./transformation-scripts/semopenalex-fields.py;
python3 ./transformation-scripts/semopenalex-domains.py;
python3 ./transformation-scripts/semopenalex-keywords.py;
python3 ./transformation-scripts/semopenalex-concepts.py;
python3 ./transformation-scripts/semopenalex-funders.py; 
python3 ./transformation-scripts/semopenalex-institutions.py; 
python3 ./transformation-scripts/semopenalex-publishers.py; 
python3 ./transformation-scripts/semopenalex-sources.py; 
python3 ./transformation-scripts/semopenalex-authors.py;
python3 ./transformation-scripts/semopenalex-works.py;
python3 ./transformation-scripts/semopenalex-dataset.py;

# make sure to clean graphdb storage folder before ingesting data
# rm -rf /data/graphdb-home/data/repositories/metaphactory/storage

# clean up intermediate txt files
find /data/graphdb-import -type f -name "*.txt" -delete

# To preload semopenalex data into graphdb:
# docker-compose -f ./graphdb-preload/semopenalex-docker-compose.yml up -d
# docker logs -f graphdb-preload
#
# Then preload yago data:
# docker-compose -f ./graphdb-preload/yago-docker-compose.yml up -d
# docker logs -f graphdb-preload-yago
#
# Finally start everything:
# docker-compose up -d
#
# Insert enterprise graphdb license through the workbench GUI.
# Wait until all repositories show "READY" status. 