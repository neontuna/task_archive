### task_archive
Historical access for auto task tickets

# Environment setup
Use figaro to set AAD_TENANT and AAD_CLIENT_ID for Omniauth Azure AD strategy.
App also checks for AZURE_GROUP_ID in Omniauth id_token_claims.  Check session controller to tweak/remove this functionality.

# Omniauth setup
Users table handles storing Omniauth users, uses authentication configuration from [Rails Casts 241][http://railscasts.com/episodes/241-simple-omniauth?autoplay=true]

# Database
The database for the app has been modified from a direct export of the Autotask DB.  Table names were changed for a little better readability.

| Autotask DB Table   | Rails Archive DB Table |
|---------------------|------------------------|
| dbo.tblCustContacts | contacts               |
| dbo.tblCustomers    | customers              |
| dbo.tblEmployees    | technicians            |
| dbo.tblWorkEntries  | workentries            |
| dbo.tblWorkRecord   | workrecords            |
