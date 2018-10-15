# master
The master repo that sets up AWS environments etc

This repository will setup parameter store, build pipelines, etc in AWS
ready for the other repositories. This one will hold all the cloudformation
and configuration, and make it available to every other repository in this
organisation.

The goal of this whole mess is to build a completely serverless minecraft
cluster - where users can spin up and tear down servers at will.

For anyone reading this right now, the work for this is all in a single
private repo atm, I'm intending to clean it up and break it apart for
proper publication.
