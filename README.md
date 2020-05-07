> _**Heads-up:** this revision is meant for illustrating how you template well with ytt._
> 
> _To get started quickly, switch to the master branch:_
> 
> ```console
> $ git checkout master
> $ git clean -df
> ```
> _... and start from there._
>
> _If you are keen to learn how to use the k14s toolchain skillfully, good on ya. Let's carry on..._

# Overview

## In this revision ...

We start with hard-coded configuration. There are no templates. 

In subsequent revisions, we can better illustrate how we've refactored configuration.

It is useful to deploy from this revision to ensure you have a cluster up and running and working well.
 
# Instructions

1. Obtain and target a Kubernetes Cluster.
   - absent another option, see [Creating a KIND Cluster](#creating-a-kind-cluster), below.
2. Deploy the application to the cluster:
   ```console
   $ kubectl apply -f config/application-name
   deployment.apps/application-name-server created
   ingress.extensions/application-name created
   service/application-service-name created
   ```
3. Verify the deployment
   ```console
   $ curl localhost/app/
   ``` 

## Creating a KIND Cluster

1. [install KIND](https://kind.sigs.k8s.io/docs/user/quick-start/#installation).
2. create the cluster:
    ```console
    $ kind create cluster --config=config/kind-cluster/cluster.yaml
    ```
3. install the Ingress Controller
    ```console
    $ kubectl apply -f config/kind-cluster/ingress-nginx.yaml
    ```

# What Next?

In the next revision, we'll extract values that _must_ match across resources.

```console
$ git checkout rev1 && git clean -df
```

