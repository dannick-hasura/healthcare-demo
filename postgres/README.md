# Healthcare Demo (PostgreSQL)
This healthcare federation demo uses data stored in PostgreSQL.

The healthcare federation demo provides a basic frontend for a clinic
and is comprised of the following services:
- hge-doctors: providing a GrapQL API for the `doctors` table, in the clinic_data database
- hge-patients: providing a GrapQL API for the `patients` table, in the clinic_data database
- hge-appts: providing a GrapQL API for the `appts` table, in the clinic_data database
- hge-records: providing a GrapQL API for the `records` table, in the clinic_data database
- hge-main: providing a federated GrapQL API for:
    - the `hge-doctors` GraphQL sub-graph (via Remote Schemas)
    - the `hge-patients` GraphQL sub-graph (via Remote Schemas)
    - the `hge-appts` GraphQL sub-graph (via Remote Schemas)
    - the `hge-records` GraphQL sub-graph (via Remote Schemas)
    - Remote Schemas-to-Remote Schema joins (via relationships)

## Dependencies
### Container Runtime 
An OCI-complian container runtime is required to run the Hasura GraphQL engines.
A docker compose file is supplied to run the demo locally.
### PostgreSQL
One database is required per distinct metadata instance. The `hdb_catalog` schema is created within each database.
The `HASURA_GRAPHQL_METADATA_DATABASE_URL` environment variable points to the database instance to be used to store the Hasura GraphQL Engine (HGE) metadata.
### Front End
This app includes a React frontend with multiple library dependencies

## How to Use
1. Run `docker compose up -d` to start the necessary containers
2. Open [this HGE instance](http://localhost:8021/console/data/sql) and paste then execute the `data-init`/`clinic_data.sql` script to seed the data
3. Import the `hge-metadata-<app_name>.json` files into each HGE app
4. Run `npm install` to install frontend dependencies from `package.json` file
5. Run `npm start` to run the React frontend
6. Access the [main HGE app ](http://localhost:8020/console`) -- this Hasura app federates over all the separate services