#!/usr/bin/env sh
set -e

export CMS_TRITON_PORT=${CMS_TRITON_PORT:-9000}
export CMS_SAO_IPADDR=${CMS_SAO_IPADDR:-127.0.0.1}
export CMS_SAO_PORT=${CMS_SAO_PORT:-8083}
export CMS_GALATEA_IPADDR=${CMS_GALATEA_IPADDR:-127.0.0.1}
export CMS_GALATEA_PORT=${CMS_GALATEA_PORT:-8082}
export CMS_USERS_IPADDR=${CMS_USERS_IPADDR:-127.0.0.1}
export CMS_USERS_PORT=${CMS_USERS_PORT:-8081}

# if the first argument look like a parameter (i.e. start with '-'), run Envoy
if [ "${1#-}" != "$1" ]; then
    set -- envoy "$@"
fi

if [ "$1" = 'envoy' ]; then
    # set the log level if the $CMS_TRITON_LOG_LEVEL variable is set
    if [ -n "$CMS_TRITON_LOG_LEVEL" ]; then
        set -- "$@" --log-level "$CMS_TRITON_LOG_LEVEL"
    fi

    sed -e '/^\s*#.*$/d' /envoy-config.tpl.yaml | envsubst > /envoy-config.yaml
fi

exec "$@"
