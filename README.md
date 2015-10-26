# Docker Ceph Dash
This repository contains a Dockerfile to create a container for the [Ceph Dashboard](https://github.com/Crapworks/ceph-dash).

It is a simple container running the dashboard behind Apache HTTPd with mod_wsgi.

# Building
You can build the container using this command:

```docker build -t docker-cephdash .```

# Running
By default there is no configuration in the container, but you can override these files:

* /opt/ceph-dash/config.json
* /etc/ceph/ceph.conf

For example:

```docker run -v /my/ceph.conf:/etc/ceph/ceph.conf -v config.json:/opt/ceph-dash/config.json -d docker-cephdash```

Now you should be able to open the dashboard.
