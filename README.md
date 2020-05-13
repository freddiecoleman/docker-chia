# What is Chia?

Chia is a new blockchain and smart transaction platform that is more efficient, decentralized, and secure.

Chia Network develops a blockchain and smart transaction platform created by the inventor of BitTorrent, [Bram Cohen](https://consent.yahoo.com/collectConsent?sessionId=3_cc-session_51f38948-4182-4aaa-819b-acc8787d9490&lang=en-GB&inline=false). It implements the first new Nakamoto consensus algorithm since Bitcoin in 2008. Proofs of Space and Time replace energy intensive “proofs of work.”

## Supported tags and respective `Dockerfile` links

- [latest](https://github.com/freddiecoleman/docker-chia/blob/master/Dockerfile)
- [1.0-beta5](https://github.com/freddiecoleman/docker-chia/blob/1.0-beta5/Dockerfile)

## Ports

- 8444 - Chia protocol
- 8555 - Chia RPC interface

### Docker run example
```
docker run --network=host fcoleman/chia
```

### Docker compose example

```
version: '3'
services:
  chia:
    image: 'fcoleman/chia:latest'
    container_name: chia
    hostname: chia
    ports:
     - "8444:8444"
     - "8555:8555"
    working_dir: /chia-blockchain
    network_mode: "host"
```

### Notes

We currently have to run with network mode host as the chia node tries to bind to localhost which is not possible from within the container.
