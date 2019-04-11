####################################################################
#
#
#
#
#
#
#
####################################################################

FROM		ehudkaldor/alpine-s6
# FROM    alpine

MAINTAINER 	Ehud Kaldor <ehud@unfairfunction.org>

ENV     WEBSITE www.google.com
ENV     PROFILE_NAME firefox

RUN   adduser -D $PROFILE_NAME && \
      echo '@edge http://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories && \
      echo '@edgecommunity http://nl.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories && \
      echo '@testing http://nl.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
      apk update && \
      apk upgrade && \
      apk add icu-libs@edge && \
      apk add \
        firefox@testing \
        alsa-lib \
	      ca-certificates \
	      hicolor-icon-theme \
	      mesa-dri-intel \
	      mesa-gl \
        dbus \
        ttf-dejavu && \
		  rm -rf /var/cache/apk/*

COPY  /rootfs /

# USER    firefox
# RUN   for f in $(ls /installers); do sh /installers/$f; done && \
#       rm -f /installers

ENTRYPOINT	["/init"]
