# does user setup and gives 'install-packages' script, see https://github.com/gitpod-io/workspace-images
FROM gitpod/workspace-base:commit-f2d623ca9d270c2ce8560d2ca0f9ce71b105aff2

USER gitpod

ENV ASDF_VERSION=v0.10.0

# setup asdf-vm: https://asdf-vm.com/guide/getting-started.html
RUN git clone --depth 1 https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch ${ASDF_VERSION} \
    && echo '. $HOME/.asdf/asdf.sh' >> $HOME/.bashrc

# install asdf plugins
COPY .tool-versions $HOME/
COPY .devcontainer/install-asdf-plugins.sh $HOME/
RUN $HOME/install-asdf-plugins.sh \
    && rm $HOME/install-asdf-plugins.sh

# install ruby tooling
RUN bash -i -c 'gem install bundler'

# install hex and rebar
COPY .devcontainer/install-mix-tooling.sh $HOME/
RUN $HOME/install-mix-tooling.sh \
    && rm $HOME/install-mix-tooling.sh

USER root

RUN install-packages curl

USER gitpod

# install mob.sh, see: https://mob.sh
RUN curl -sL install.mob.sh | sh -s - --user
