# DevOpsConf2021
## PowerBI with DevOps
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

## PowerBI with GitHub Actions
### Set up your GitHub Actions workflow
#### Set up a custom workflow
These instructions will show you how to create a new custom workflow leveraging the Power BI Action workflow in use for this tutorial, which is based on the extension from the DevOps tutorial:
- Open up your own GitHub project of choosing
- Go to the Actions tab
- Click on "new workflow"
- Click on the "set up a new workflow yourself -->" link
- While the "edit new file" tab (from the previous section) is still open, edit the contents according to your needs. You can take inspiration by following the steps described in the next section
#### Make a reference to the "PowerBIactions" workflow
In order to reference the workflow from this tutorial, we need to create a new Yaml file. You can take inspiration by observing the contents from the "/.github/workflows/main.yml" file, which is being showcased in the tutorial.
To better understand the Yaml file contents, you can refer to the following keynotes:
- the "on" field specifies when the workflow should be run, with any trigger you may seem fit. This tutorial will make use of "push" trigger on the main branch, which will run every time a commit occurs in the project
- the "jobs" subfield should include just one job, which would refer to the "ci.yml" file and trigger the GitHub Action workflow associated to the "PowerBIactions" extension from the DevOps tutorial. In order to refer to the other workflow, the "uses" field is used (referring to "<repository_name>/DevOpsConf2021/.github/workflows/ci.yml@main")
- the "with" subfield, under the "jobs" subfield, should include the "workspacename" input value, which in turn refers to the Power BI workspace
- the "secrets" subfield, under the "jobs" subfield, should include the following secrets: "clientid", "secret", "tenantid". These three fields represent, respectively, the ID of the Power BI client on Azure, its secret, and the ID of the Azure Tenant hosting the Power BI workspace
#### Create the workflow and commit
- Click on the "Start commit" button, then (optionally) edit the "title" and "description" fields as you like
- Click on "Commit new file" to create the Yaml file and make the Action operational
### Test the solution
In order to trigger the GitHub Action, all you need to do is satisfy the trigger rules you specified when creating the Yaml file from the previous section.
If you followed the tutorial step by step, the workflow will trigger whenever a new commit occurs. You can test the solution by changing the name of one of the Power BI documents under the "reports" subfolder. 
