# task_archive
Historical access for Autotask.net tickets.  Uses Azure AD for authentication, only static home page shown without sign in.

## Environment setup
Use figaro to set **AAD_TENANT** and **AAD_CLIENT_ID** env for Omniauth Azure AD strategy.
App also checks for **AZURE_GROUP_ID** in Omniauth id_token_claims returned from Azure.  Check session controller to tweak/remove this functionality.  Read more about this functionality and how to setup your app in Azure [here](http://www.dushyantgill.com/blog/2014/12/10/authorization-cloud-applications-using-ad-groups/).

## Omniauth setup
Users table handles storing Omniauth users, uses authentication configuration from [Rails Casts 241](http://railscasts.com/episodes/241-simple-omniauth?autoplay=true)

## Database
The database for the app has been modified from a direct export of the Autotask DB.  Primary keys and column names were changed to match the model_id naming scheme that Rails expects for associations.  Table names were changed for a little better readability.

| Autotask DB Table   | Rails Archive DB Table |
|---------------------|------------------------|
| dbo.tblCustContacts | contacts               |
| dbo.tblCustomers    | customers              |
| dbo.tblEmployees    | technicians            |
| dbo.tblWorkEntries  | workentries            |
| dbo.tblWorkRecord   | workrecords            |

This [blog post](https://www.neontuna.com/blog/2016/08/16/archiving-autotask/) goes into the specifics of working with the Autotask export and preparing Rails to use that database.
