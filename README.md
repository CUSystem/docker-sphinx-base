# docker-sphinx-base
A handy way to generate nginx and sphinx-doc sites.

This is a small Docker image to easily create Sphinx-doc mini docsites without volumes and automatically setup to render with NGINX.

The pattern is to create another Dockerfile in a Sphinx-docs project and that Dockerfile will take FROM this one. That's it.

## Requirements

* Docker
* A Sphinx-doc project

## Docker Hub

You can pull the image from Docker hub like this:

```bash
$ docker pull cusystem/docker-sphinx-base
```

## Usage

1. Within the root Sphinx-doc folder (usually right at the conf.py) create a new Dockerfile with the following contents:

    ```Dockerfile
    FROM cusystem/docker-sphinx-base:latest

    LABEL Maintainers="Steve.Taylor <steve.taylor@cu.edu>"

    #That's really it if your docs are at this same level
    ```

2. To build it from the same folder as the Dockerfile:

    ```bash
    $ docker build -t your-new-docsite-tag .
    ```

3. To run it:

      ```bash
      $ docker run --name your-new-docsite-container -d -p 8088:80 your-new-docsite-tag
      ```

4. To view it go to your browser at http://localhost:8088.



(c) 2017, Regents of the University of Colorado
