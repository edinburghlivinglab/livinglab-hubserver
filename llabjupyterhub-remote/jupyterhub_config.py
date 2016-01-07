# Config for REMOTE_USER plugin
import os

c = get_config()
c.JupyterHub.authenticator_class = 'remote_user.RemoteUserAuthenticator'
c.RemoteUserAuthenticator.header_name = 'X-Proxy-Remote-User'
c.RemoteUserAuthenticator.postadduser_script = os.path.abspath('user_init.sh')
