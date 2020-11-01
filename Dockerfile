FROM envoyproxy/envoy:v1.15.2

COPY envoy-config.tpl.yaml docker-entrypoint.sh /

RUN set -x \
    \
    && apt-get update \
    && apt-get install -y gettext-base \
    && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
    && apt-get clean \
    \
    && chmod +x /docker-entrypoint.sh

CMD [ "envoy", "-c", "/envoy-config.yaml" ]
