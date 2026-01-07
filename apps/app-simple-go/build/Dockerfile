FROM centos:7.9.2009

LABEL maintainer="-veldrane"

COPY ./openapi3.json ./simpleapi swagger-ui.tgz /

RUN useradd -u 999 -r -c "simpleapi user" -U simpleapi && \
    tar xvfz swagger-ui.tgz && \
    mv openapi3.json public/swagger && \
    chown simpleapi.root /simpleapi && \
    chown -R simpleapi.root public

USER simpleapi

ENTRYPOINT [ "/simpleapi","-http-port","8080" ]

EXPOSE 8080
