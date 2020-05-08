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

We externalize commonly specified configuration into "data values."

This is done by:
1. creating a new file named `_defaults.yaml`
   - the `@data/values` annotation marks this as a "data values" file
   - `ytt` loads configuration values from such files, first, before rendering any templates
2. declaring variables in the data values file (in YAML format)
3. loading the `data` ytt library in each template and using those data values.

Remember this:

> Externalize what the user _must_ own.

In other templating systems, the author must externalize _all_ variables that the user _might_ want to change.
This can result in an explosion of input values, making it harder to understand.

With `ytt`, when the user _wants_ to own a piece of configuration, they can use an overlay to make the change.

Examine the changes to the configuration to see how this is true:

```console
$ git show -- config
```


# Instructions

1. Obtain and target a Kubernetes Cluster.
   - absent another option, see [Creating a KIND Cluster](#creating-a-kind-cluster), below.
2. Deploy the application to the cluster:
   ```console
   $ ytt -f config/application-name | kubectl apply -f-
   deployment.apps/application-name-server created
   ingress.extensions/application-name created
   service/application-service-name created
   ```
3. Verify the deployment
   ```console
   $ curl localhost/app/
   ``` 
4. Re-deploy the application, specifying the environment name
   ```console
   $ ytt -f config/application-name -v "environmentName=pink-poodle" | kubectl apply -f-
   ```
5. Verify that the deployment was updated
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

In the next revision, 

```console
$ git checkout rev3 && git clean -df
```
