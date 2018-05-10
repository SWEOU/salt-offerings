# Purpose

This repo demonstrates how to create a Salt master via an ARM template, and then use
that Salt master to automate the provisioning of TBD in Azure


# Install

* Create an application account in Azure
* Run ARM template
    * `az group create --name saltDemoGroup --location westus`
    * `az group deployment create --resource-group saltDemoGroup --template-file azuredeploy.json --parameters azuredeploy.parameters.json`
* Profit
