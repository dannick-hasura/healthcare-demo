import {ApolloClient, InMemoryCache, HttpLink} from '@apollo/client';

const client = new ApolloClient({
   link: new HttpLink({
      uri: 'http://localhost:8020/v1/graphql',
      headers: {
         'x-hasura-admin-secret': 'myadminsecretkey',
      },
   }),
   cache: new InMemoryCache(),
});

export default client;
