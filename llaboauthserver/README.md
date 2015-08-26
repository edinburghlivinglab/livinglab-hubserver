# Living Lab JupyterHub Server

A dockerized JupyterHub using Github OAuthentication with configuration 
directly adapted from the GitHub OAuthenticator [example][]. Automatically
clones the [notebook repository][dds] for each new user, giving each user
storage in the container.

[example]: https://github.com/jupyter/oauthenticator/tree/master/example
[dds]: https://github.com/edinburghlivinglab/dds-notebooks
