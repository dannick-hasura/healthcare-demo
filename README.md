# Healthcare demo
Healthcare database data model with federation used for SE demos

The healthcare federation demo is comprised of the following services:
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

## Screenshot of Dashboard
![screenshot](frontend/healthcare-dashboard/public/dashboard_screenshot.png)