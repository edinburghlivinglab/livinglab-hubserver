# Living Lab JupyterHub Server

A dockerized JupyterHub using Github OAuthentication with configuration 
directly adapted from the GitHub OAuthenticator [example][]. Automatically
clones the [notebook repository][dds] for each new user, giving each user
storage in the container.

[example]: https://github.com/jupyter/oauthenticator/tree/master/example
[dds]: https://github.com/edinburghlivinglab/dds-notebooks

## run

The following is assuming you've tagged the build as `livinglab-hubserver`.
To run this for the first time, you should mount the home directory as a
volume:

```
docker run -it -p 8000:8000 --env-file=env --name=hubserver-dev -v /home livinglab-hubserver 
```

After updates, that container can be stopped and a new one started, using
the volume from the first:

```
docker run -it -p 8000:8000 --env-file=env --name=hubserver-dev2 --volumes-from hubserver-dev livinglab-hubserver 
```
