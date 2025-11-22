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
rm -rf ./graphdb-preload/graphdb-home/data/repositories/metaphactory/storage


'''TODO: 

Now, first remove all generated txt files from graphdb-import-semopenalex folder (and subfolders!)

Then, run: docker-compose up -d to create graphdb instance

Insert valid graphdb license through workbench GUI and create 2 repositories:
1. semopenalex
2. yago 

run docker-compose down to stop and remove graphdb instance
=================================================================================================
Then load all RDF data dump .gzip files to graphdb using preload tool
docker-compose -f ./graphdb-preload/openalex-docker-compose.yml up -d

To see logs:
docker logs -f graphdb-preload
=================================================================================================
Finally, load yago inside graphdb
docker-compose -f ./graphdb-preload/yago-docker-compose.yml up -d

To see logs:
docker logs -f graphdb-preload-yago
=================================================================================================
finally, run docker-compose up -d and wait for graphdb to start adn index all loaded data

Done.
'''