FROM node:8-alpine
LABEL Name="OpenID Provider" Version="1.0"

ARG ENVIRONMENT="production"
ARG CLEAR_BUILD_DEPENDENCIES=true

ENV NODE_ENV=${ENVIRONMENT}

EXPOSE 4000

WORKDIR /code

COPY package.json yarn.lock ./

RUN \
  yarn install \
  && \
  # Clean up build packages.
  if ${CLEAR_BUILD_DEPENDENCIES}; then \
  yarn cache clean; fi

CMD ["node", "src/index.js"]
