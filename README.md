# DevOpsConf2021
## PowerBI
### Azure Portal
#### Create a new app registration
To access Power BI service content and APIs, you need to register an application that will authenticate against your Azure Active Directory. To do so, follow these instructions:
- Sign in to the Azure portal.
- Select Azure Active Directory and then App Registration.
- Click the New Registration.
- Provide a Name that describes your application’s purpose, select a supported Account type, and click on Register.
- Once the registration is completed, you will be redirected to the app overview page. Copy the application ID’s value as you will need to specify this later in Azure DevOps.
- Select Certificate & Secrets tab, generate a new client secret, and copy its value.
- You need to give some permission to your app to conclude the configuration of your application.
### PowerBI
### Setting up the tenant
The next step is to configure your Power BI;
- Sign in to the Power BI portal.
- Click the gear icon on the top right and select Admin portal.
- Select the Tenant settings tab and allow service principals to use Power BI APIs
### Configure a workspace
Now create the workspace where your pipeline will publish the reports and grant permission to your Azure AD App to do this:
- Select Workspaces tab.
- Click the three vertical dots on the right of your new workspace.
- Click Workspace access.
- Search the app that you have previously registered in Azure AD and grant it the permission of Admin.
### Azure DevOps
#### Install the extension
These instructions will show you how to install the Power BI Action extension that we are going to use for this tutorial:
- Sign in to your Azure DevOps organization.
- Go to Organization Settings.
- Select Extensions.
- Click on Browse Marketplace at the top right.
- As the Marketplace opens, search for Power BI Actions and click on the respective result.
- Click on the Get it Free button.
- Select your target organization from the dropdown and click on Install to complete the procedure.

## GitHub Actions
...
