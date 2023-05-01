import React, {useState, useEffect} from 'react';
import {useQuery, gql} from '@apollo/client';
import {
   Container,
   Grid,
   Typography,
   TextField,
   Paper,
   Table,
   TableBody,
   TableCell,
   TableContainer,
   TableHead,
   TableRow,
} from '@mui/material';

// Define GraphQL query
const GET_APPOINTMENTS = gql`
   query {
      appts {
         id
         appointment_date
         appointment_status
         doctor {
            id
            first_name
            last_name
         }
         patient {
            id
            first_name
            last_name
         }
      }
   }
`;

const Dashboard = () => {
   const {loading, error, data} = useQuery(GET_APPOINTMENTS);
   const [search, setSearch] = useState('');
   const [filteredData, setFilteredData] = useState([]);

   useEffect(() => {
      if (data) {
         console.log(data);
         setFilteredData(data.appts);
      }
   }, [data]);

   useEffect(() => {
      const filterData = (query) => {
         if (!query || !data) {
            setFilteredData(data?.appts || []);
            return;
         }

         const filtered = data.appts.filter((appt) => {
            const doctorName = `${appt.doctor[0]?.first_name} ${appt.doctor[0]?.last_name}`;
            const patientName = `${appt.patient[0]?.first_name} ${appt.patient[0]?.last_name}`;
            return (
               doctorName.toLowerCase().includes(query.toLowerCase()) ||
               patientName.toLowerCase().includes(query.toLowerCase())
            );
         });

         setFilteredData(filtered);
      };

      filterData(search);
   }, [search, data]);

   if (loading) return <p>Loading...</p>;
   if (error) return <p>Error :(</p>;

   return (
      <Container>
         <Grid container spacing={3}>
            <Grid item xs={12}>
               <Typography variant='h4'>Clinic Records Dashboard</Typography>
            </Grid>
            <Grid item xs={12}>
               <TextField
                  label='Search'
                  value={search}
                  onChange={(e) => setSearch(e.target.value)}
                  fullWidth
               />
            </Grid>
            <Grid item xs={12}>
               <TableContainer component={Paper}>
                  <Table>
                     <TableHead>
                        <TableRow>
                           <TableCell>Doctor Name</TableCell>
                           <TableCell>Patient Name</TableCell>
                           <TableCell>Appointment Date</TableCell>
                           <TableCell>Status</TableCell>
                        </TableRow>
                     </TableHead>
                     <TableBody>
                        {filteredData.map((appt) => (
                           <TableRow key={appt.id}>
                              <TableCell>
                                 {appt.doctor[0]?.first_name}{' '}
                                 {appt.doctor[0]?.last_name}
                              </TableCell>
                              <TableCell>
                                 {appt.patient[0]?.first_name}{' '}
                                 {appt.patient[0]?.last_name}
                              </TableCell>
                              <TableCell>{appt.appointment_date}</TableCell>
                              <TableCell>{appt.appointment_status}</TableCell>
                           </TableRow>
                        ))}
                     </TableBody>
                  </Table>
               </TableContainer>
            </Grid>
         </Grid>
      </Container>
   );
};

export default Dashboard;
