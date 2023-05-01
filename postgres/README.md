# Healthcare Demo (PostgreSQL)
This healthcare demo uses data stored in PostgreSQL.

## Dependencies
### Container Runtime 
An OCI-complian container runtime is required to run the Hasura GraphQL engines.
A docker compose file is supplied to run the demo locally.
### PostgreSQL
One database is required per distinct metadata instance. The `hdb_catalog` schema is created within each database.
The `HASURA_GRAPHQL_METADATA_DATABASE_URL` environment variable points to the database instance to be used to store the Hasura GraphQL Engine (HGE) metadata.