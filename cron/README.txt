
A container to run cron jobs, with access to the system docker daemon, so it
can run periodic jobs in any of the other containers active on the system.
Must be run with access to the docker socket, and with an environment variable
set for the name of the container running the server.

```
docker run -d -e LLABSERVER=<server container name> -v /var/run/docker.sock:/docker.sock gngdb/cron 
```

The scripts must follow the conventions for [cron on Alpine Linux][alpinefaq].

[alpinefaq]: http://wiki.alpinelinux.org/wiki/Alpine_Linux:FAQ#My_cron_jobs_don.27t_run.3F
