# master
The master repo that sets up AWS environments etc

[![Total alerts](https://img.shields.io/lgtm/alerts/g/serverless-minecraft/website.svg?logo=lgtm&logoWidth=18)](https://lgtm.com/projects/g/serverless-minecraft/website/alerts/)

This repository will setup parameter store, build pipelines, etc in AWS
ready for the other repositories. This one will hold all the cloudformation
and configuration, and make it available to every other repository in this
organisation.

The goal of this whole mess is to build a completely serverless minecraft
cluster - where users can spin up and tear down servers at will.

For anyone reading this right now, the work for this is all in a single
private repo atm, I'm intending to clean it up and break it apart for
proper publication.

# Usage

Take a copy of this repo, edit `config.sh` and replace the domain name and
region, then run the `./createCluster.sh` script to create the cluster.

More instructions to come - not functional yet.
