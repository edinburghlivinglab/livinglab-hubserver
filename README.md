# Living Lab JupyterHub Server

This is a prototype JupyterHub server configuration using [docker][]
intending to provide Jupyter environments to a class, with authentication
handled by an Apache server using CoSign. When a valid user signs in, the
JupyterHub server creates a new user for them, and populates their home
directory with the repository for the [Data, Design and Society
course][dds], along with some other miscellaneous Jupyter notebooks for
demonstration purposes.

The Living Lab Stack
--------------------

Each user must have access to a [all the requirements for Data, Design and
Society][ddsreq]. The `livinglabstack` container inherits from Jupyter's
[Data Science Notebook][datascinb] and installs the remaining requirements
using a mixture of conda and pip.

All of the remaining notebooks inherit from this one, and it could be used
locally by students who know how to use docker, with the same instructions
as those [from the Jupyter container][datascinb].

Living Lab JupyterHub
---------------------

This installs JupyterHub with the Living Lab Stack, from the [forked version
of JupyterHub][llabfork] used for Data, Design and Society. This contains some small
modifications for the interface at the landing page.

Authentication Containers
-------------------------

There are two authentication containers that can be used. Firstly, we can
authenticate using GitHub's OAuth by installing the [OAuthenticator
plugin][oauth]. Second, we can install our own [remote user
authenticator][remote], which will look for a user name to be passed by the
Apache server handling authentication. After authentication, it will run a
script to populate the user's home directory.

How to start this server, and the required storage containers, is described
in its [own README][llabremote].

cron
----

Finally, we have a utility container that is authenticated to run
maintenance jobs in the container. At the moment, it is only configured to
update the `dds-notebooks` repositories of all users periodically.

[example]: https://github.com/jupyter/oauthenticator/tree/master/example
[dds]: https://github.com/edinburghlivinglab/dds-notebooks
[docker]: https://www.docker.com/
[ddsreq]: https://github.com/edinburghlivinglab/dds-notebooks/blob/master/requirements.txt
[datascinb]: https://github.com/jupyter/docker-stacks/tree/master/datascience-notebook
[llabfork]: https://github.com/edinburghlivinglab/jupyterhub
[oauth]: https://github.com/jupyterhub/oauthenticator
[remote]: https://github.com/gngdb/jhub_remote_user_authenticator
[llabremote]: https://github.com/edinburghlivinglab/livinglab-hubserver/tree/master/llabjupyterhub-remote
