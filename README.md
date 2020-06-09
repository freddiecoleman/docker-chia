This docker image is provided by [Chia Blockchain Explorer](https://www.chiaexplorer.com).

# What is Chia?

Chia is a new blockchain and smart transaction platform that is more efficient, decentralized, and secure.

Chia Network develops a blockchain and smart transaction platform created by the inventor of BitTorrent, [Bram Cohen](https://consent.yahoo.com/collectConsent?sessionId=3_cc-session_51f38948-4182-4aaa-819b-acc8787d9490&lang=en-GB&inline=false). It implements the first new Nakamoto consensus algorithm since Bitcoin in 2008. Proofs of Space and Time replace energy intensive “proofs of work.”

### Notes

Currently chia is hardcoded to run an rpc server on localhost which fails in docker containers that do not have network mode of `host`. To work around this issue this image replaces the hardcoded `localhost` with `chia` before compiling.

If you want to use the rpc server (enabled by default) and not use network mode of `host` you will need to give your container a hostname of `chia`.

## Supported tags and respective `Dockerfile` links

- [latest](https://github.com/freddiecoleman/docker-chia/blob/master/Dockerfile)
- [1.0-beta5](https://github.com/freddiecoleman/docker-chia/blob/1.0-beta5/Dockerfile)
- [1.0-beta6](https://github.com/freddiecoleman/docker-chia/blob/1.0-beta6/Dockerfile)
- [1.0-beta7](https://github.com/freddiecoleman/docker-chia/blob/1.0-beta7/Dockerfile)

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
```

