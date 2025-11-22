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
rm -rf /data/graphdb-home/data/repositories/metaphactory/storage

# clean up intermediate txt files
find /data/graphdb-import-semopenalex -type f -name "*.txt" -delete

'''
Now, follow the steps below to load data into graphdb: 
=================================================================================================
load semopenalex data inside graphdb
docker-compose -f ./graphdb-preload/openalex-docker-compose.yml up -d

To see logs:
docker logs -f graphdb-preload
=================================================================================================
Then, load yago data inside graphdb
docker-compose -f ./graphdb-preload/yago-docker-compose.yml up -d

To see logs:
docker logs -f graphdb-preload-yago
=================================================================================================
Finally, run: docker-compose up -d  

Insert valid enterprise graphdb license through workbench GUI

Wait until all loaded data is indexed (this will take a while) and that repositories say "READY" status
'''