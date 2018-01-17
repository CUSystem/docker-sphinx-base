FROM nginx:alpine

LABEL Maintainers="Steve.Taylor <steve.taylor@cu.edu>"

COPY run_nginx.sh /usr/local/bin

RUN apk update && apk upgrade && \
    apk add --no-cache bash && \
    apk add --no-cache python && \
    apk add --no-cache python-dev && \
    apk add --no-cache py-pip && \
    \
    \
    echo "Install Sphinx-docs" && \
    pip install pip --upgrade --no-cache-dir && \
    pip install Sphinx --no-cache-dir && \
    pip install sphinx_rtd_theme --no-cache-dir && \
    pip install alabaster --no-cache-dir && \
    pip install sphinx_bootstrap_theme --no-cache-dir && \
    pip install plantweb --no-cache-dir && \
    \
    \
    chmod u+x /usr/local/bin/run_nginx.sh    
    
WORKDIR /docs

EXPOSE 80

ONBUILD COPY . /docs

ONBUILD RUN sphinx-build /docs /usr/share/nginx/html

ENTRYPOINT /usr/local/bin/run_nginx.sh

