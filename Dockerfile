FROM alpine:3.4
MAINTAINER pkulakovsky@gmail.com

RUN \
  runtime_pkgs="curl jq-dev" \
  && apk --no-cache add ${runtime_pkgs} \
  && apk add --update bash && rm -rf /var/cache/apk/* \
  && mkdir -p /opt/stress/input

ADD stress-generate.sh /opt/stress
RUN chmod 700 /opt/stress/stress-generate.sh

ADD sampletext /opt/stress/input

CMD cat /opt/stress/input/sampletext | /opt/stress/stress-generate.sh
