---
title: "April Talk: Deploying an OpenStack control plane with MAAS, Ansible, and Ceph by Gregory Orange"
date: 2019-04-09T18:00:00+08:00
---

The Pawsey Super computing Centre in Technology Park offers an
OpenStack cloud service(think AWS) to Australian researchers for a
wide array of projects (radio astronomy, genomics,
bioinformatics. OpenStack's control plane requires regular upgrades,
which presents an ongoing operational challenge.
<!--more-->

Over the past two years we have used two different deployment methods,
one of which also helps support ongoing upgrades. Neither has proven
an effective long term solution, so we have begun using the best of
those two to build a new one. At its core, it is a KVM cluster with
shared Ceph storage, deployed with Ansible and Linux containers, and
managed with Canonical's MAAS. All of the core OpenStack services are
then layered on top of this, such that upgrades use provisioning &
automation tooling to replace services as required.

This talk will describe the early architecture and some highlights and
lessons learned, then go on through the components of the new system.
https://pawsey.org.au/systems/nimbus-cloud-service/
