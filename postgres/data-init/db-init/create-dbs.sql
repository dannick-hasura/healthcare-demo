CREATE DATABASE hge_metadata_main;
ALTER DATABASE hge_metadata_main OWNER TO postgres;

CREATE DATABASE hge_metadata_doctors;
ALTER DATABASE hge_metadata_doctors OWNER TO postgres;

CREATE DATABASE hge_metadata_patients;
ALTER DATABASE hge_metadata_patients OWNER TO postgres;

CREATE DATABASE hge_metadata_records;
ALTER DATABASE hge_metadata_records OWNER TO postgres;

CREATE DATABASE hge_metadata_appts;
ALTER DATABASE hge_metadata_appts OWNER TO postgres;

CREATE USER clinic;

CREATE DATABASE clinic_data;
ALTER DATABASE clinic_data OWNER TO postgres;
GRANT ALL PRIVILEGES ON DATABASE clinic_data TO clinic;

