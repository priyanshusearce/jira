## Accessing the Bastion Host:

`prod-searchpoc-bastion-us-et4-a-gce` is the Bastion Host in the project. Following are the steps to access the Bastion Host.</br>
**Steps**
**1. Connect through Identity-Aware Proxy (IAP):-** For accessing the Bastion Host through IAP, the user should be attached with `IAP-secured Tunnel User` permission.</br> 
- Install the Google Cloud SDK.
```
$ sudo apt-get update && sudo apt-get install google-cloud-sdk

```
- Attach the permission. Go to `IAM & Admin` section in GCP console and attach `IAP-secured Tunnel User` permission to the user. </br>

- From you local machine, run the command
```
$ gcloud beta compute ssh --zone "<ZONE>" "<BASTION_HOST>" --tunnel-through-iap --project "<PROJECT_ID>"

Example:
$ gcloud beta compute ssh --zone "us-east4-a" "prod-searchpoc-bastion-us-et4-a-gce" --tunnel-through-iap --project "searchpoc-284614"
```
