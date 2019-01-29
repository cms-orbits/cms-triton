# cms-triton
[![Build Status](https://travis-ci.org/joelgtsantos/cms-triton.svg?branch=master)](https://travis-ci.org/joelgtsantos/cms-triton)

# Based on Zuul proxy from Netflix

Gateway service based on Zuul proxy server from Netflix handles all the HTTP requests between the CMS Frontend and the hole backend architecture.

### How to use 

To run

```bash
$ mvn spring-boot:run
    
```

### Docker Image

```bash
$ docker run -t -i joelgtsantos/cms-triton:latest

```