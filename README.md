# CMS Triton

CMS Orbits API Gateway based on envoy proxy and delivered as Docker image.

## How to make it run

All the Triton's default configurations were done assuming that it is going to
run without network isolation (running on the same host or pod as the other
Orbits components) and mapping the default port for each of the Orbits
applications.

Running Triton's Docker container with its defaults is as simple as performing

```bash
$ docker container run --rm --network=host sorbits/cms-triton:1
//... Other envoy log events
[__timestamp__][1][info][main] [source/server/server.cc:631] all clusters initialized. initializing init manager
[__timestamp__][1][info][config] [source/server/listener_manager_impl.cc:844] all dependencies initialized. starting workers
[__timestamp__][1][info][main] [source/server/server.cc:652] starting main dispatch loop
```

**Note**: Removing the Triton container's network isolation (`--network=host`)
is not required but is suggested to simplify its bootstrap configurations.

In case the other Orbits applications are running on a different host or pod is
required to override the route mapping configurations associated with them
through env variables accordingly. All the overridable configurations are:

Configuration | Description | Default value | Env. variable
--------------|-------------|:-------------:| :------------:
Triton Port   | The port number this application is going to receive traffic | 9000 | `CMS_TRITON_PORT`
Triton Log Level | Verbosity of the logs written by envoy |  | `CMS_TRITON_LOG_LEVEL`
Sao IP Address| Orbits application Sao IP address | 127.0.0.1 | `CMS_SAO_IPADDR`
Galatea IP Address| Orbits application Galatea IP address | 127.0.0.1 | `CMS_GALATEA_IPADDR`
Orbits Users IP Address| Orbits application Users IP address  | 127.0.0.1 | `CMS_USERS_IPADDR`
Sao Port      |  Orbits application Sao IP address | 8083 | `CMS_SAO_PORT`
Galatea Port  |  Orbits application Galatea IP address | 8082 | `CMS_GALATEA_PORT`
Orbits Users Port|  Orbits application Users IP address | 8081 | `CMS_USERS_PORT`

## How to build and test new configurations

Building the Triton's docker image from this repository will simply need

```bash
# You could use a placeholder image tag if you like
docker imabe build -t cmsorbits/cms-triton:1 .
```

To test any new envoy's configuration it will require to build this image and
then run it with the `--mode=validate` flag on the container's arguments

```bash
# Reminder: If you changed the image tag in the last step you'll need to change it here as well
$ docker container run --rm cmsorbits/cms-triton:1 --mode validate -c /envoy-config.yaml
// ... skipping envoy logs
configuration '/envoy-config.yaml' OK
```

**Note**: Since the default Triton's container argumentes are being overriden
you'll need to pass again the envoy's configuration file path which is
`/envoy-config.yaml`.
