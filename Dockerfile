ARG BUILD_FROM=balena:raspbian

FROM $BUILD_FROM

RUN apt-get update \
 && apt-get install -y wget \
                       gnupg2 \
 && wget -q -O - https://apt.mopidy.com/mopidy.gpg | apt-key add - \
 && wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/buster.list

RUN apt-get update \
 && apt-get install -y libffi-dev \
                       libxml2-dev \
                       libxslt1-dev \
                       zlib1g-dev \
                       build-essential \
                       gstreamer1.0-alsa \
                       gstreamer1.0-plugins-bad \
                       gstreamer1.0-plugins-good \
                       gstreamer1.0-plugins-ugly \
                       python3-dev \
                       python3-gst-1.0 \
                       python3-lxml \
                       python3-pip \
                       python3-setuptools \
                       python3-wheel \
                       libasound2-dev \
                       libspotify-dev \
 && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install \
			Mopidy \
			Mopidy-Iris \
			Mopidy-Spotify \
			Mopidy-Mobile \
			Mopidy-MPD \
			Mopidy-YouTube \
 && rm -rf ~/.cache/pip

RUN update-ca-certificates --fresh

# https://discourse.mopidy.com/t/spotify-login-error-errortype-unable-to-contact-server-8/4$
RUN echo "104.154.126.229 ap.spotify.com" >> /etc/hosts

ENV TZ=Europe/Berlin

EXPOSE 6680

ENTRYPOINT ["mopidy"]
