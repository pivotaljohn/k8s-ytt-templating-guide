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

We locate and extract values that are repeated and mean the same thing.

This is done by:
1. creating a new "module"; _(in ytt, a single file is referred to as a "module".)_
2. declaring a `struct` within that module that contains the shared values;
3. loading that module in each template and using the values from the `struct`.

We see a key tenet at play:

> Extract what _**must**_ be the same...
>
> ...not what is _**coincidentally**_ the same.

Examine the changes to the configuration to see how this is true:

```console
$ git show -- config
```

Also note the [Instructions](#instructions), below now include invoking `ytt` and piping the output to `kubectl`:

```console
$ git show -- README.md
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

In the next revision, we'll externalize pieces of configuration, strategically.

```console
$ git checkout rev2 && git clean -df
```
