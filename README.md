# argocd

Testing argocd

## Manual set up

### Configure AWS for Scaleway

https://www.scaleway.com/en/docs/storage/object/api-cli/object-storage-aws-cli/

TODO: Add more details

### Create terraform state bucket

Add "aws" access key/secret:

```shell
export AWS_ACCESS_KEY_ID=$accesskey
export AWS_SECRET_ACCESS_KEY=$secret
```

Create bucket:

```shell
aws --endpoint-url https://s3.fr-par.scw.cloud s3 mb s3://argocdtests-tfstate
```

### Create cluster

Add scw env vars

```shell
export SCW_ACCESS_KEY=<secret> \
export SCW_SECRET_KEY=<secret> \
export SCW_DEFAULT_ORGANIZATION_ID=<secret> \
export SCW_DEFAULT_PROJECT_ID=<secret>
```

```shell
terraform apply -auto-approve
```