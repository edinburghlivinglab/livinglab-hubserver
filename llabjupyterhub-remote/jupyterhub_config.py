# Config for REMOTE_USER plugin
c.JupyterHub.authenticator_class = 'remote_user.RemoteUserAuthenticator'
c.RemoteUserAuthenticator.header_name = 'X-Proxy-Remote-User'
