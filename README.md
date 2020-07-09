# cloudbuilder

Welcome to afrank's fat cloud builder. We have lots of different cloud builders floating around, some are likely more efficient than this one. The purpose of this one is to be the one-stop shop. This has got everything you need for running cloud builds and deploys in Google Cloudbuild. 

This images provides:
- python3 + pip
- node 12 + npm
- gcloud
- wget, curl, rsync

To use this image, you can provide your deployment script as an argument, or this builder will guess a couple predefined files in the root of your repo, including `cloudbuild` and `clouddeploy`.

## Example Usage:

```
steps:
  < my other build steps >
  - name: afrank/cloudbuilder
    id: 'Provisional Deployment'
    env:
    - 'BRANCH_NAME=$BRANCH_NAME'
    - 'GOOGLE_APPLICATION_CREDENTIALS=/path/to/keyfile.json'
```

`GOOGLE_APPLICATION_CREDENTIALS` is not required by default, and there are various gcloud operations you can perform with service-default credentials, but there are some tools (like cloud-secrets and bq) which are available in this image and require thise to be set. 
