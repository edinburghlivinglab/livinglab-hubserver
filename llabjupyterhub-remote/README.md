Living Lab JupyterHub with Remote Authentication
================================================

This version of the JupyterHub server works with [a plugin for remote
authentication][remoteauth] to allow users to authenticate with their EASE
credentials and connect through an Apache server securely with an Edinburgh
University signed SSL certificate.

Running the Server
------------------

Assuming the Apache server is looking JupyterHub on port 8002, the
following commands are used to launch a _new_ instance of the container.
First, we need to create data volume containers for the persistent data:

```
docker create -v /home --name llabhomedata gngdb/llabjupyterhub-remote /bin/true
docker create -v /usr/share/nltk_data --name llabnltkdata gngdb/llabjupyterhub-remote /bin/true
docker create -v /usr/share/datasets:/usr/share/datasets:ro --name llabdatasets gngdb/llabjupyterhub-remote /bin/true
```

Then we can just start the server, using the volumes from these containers:

```
docker run -d --volumes-from llabhomedata --volumes-from llabnltkdata --volumes-from llabdatasets --name llabjhub -p 8002:8000 gngdb/llabjupyterhub-remote
```

This adds the home directory and the location of the NLTK dataset
`/usr/share/nltk_data` as [docker volumes][volumes]. It also mounts the
host's `/usr/share/datasets` into the container at the same location, but
ensures it is read only. This means we can add extra datasets to the
container relatively easily.

Upgrading or Migrating with Volumes
-----------------------------------

Thanks to the data volume containers instanced above the container running
the JupyterHub instance is quite [ephemeral][]. If we stop the current
container and start an upgraded version, as long as we connect the same
volumes from above, the transition is smooth.

All of the volumes can be [backed up][backup] and moved around. Then,
again, the data volumes just need to be reconnected through the data volume
containers and everything will be running as we left it.

[remoteauth]: https://github.com/edina/jhub_remote_user_authenticator
[volumes]: https://docs.docker.com/engine/userguide/dockervolumes/
[ephemeral]: https://docs.docker.com/engine/articles/dockerfile_best-practices/
[backup]: https://docs.docker.com/engine/userguide/dockervolumes/
