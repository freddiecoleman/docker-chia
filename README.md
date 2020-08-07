This docker image is provided by [Chia Blockchain Explorer](https://www.chiaexplorer.com).

# What is Chia?

Chia is a new blockchain and smart transaction platform that is more efficient, decentralized, and secure.

Chia Network develops a blockchain and smart transaction platform created by the inventor of BitTorrent, [Bram Cohen](https://consent.yahoo.com/collectConsent?sessionId=3_cc-session_51f38948-4182-4aaa-819b-acc8787d9490&lang=en-GB&inline=false). It implements the first new Nakamoto consensus algorithm since Bitcoin in 2008. Proofs of Space and Time replace energy intensive “proofs of work.”

## Ports

- 8444 - Chia protocol
- 8555 - Chia RPC interface


### Healthcheck

A script called `healthcheck.sh` is copied into `/usr/local/bin`. It's a bit of a hack but this can be used to check the health of the service. Here is an example of how it can be used with Hashicorp Nomad + Consul;

```
# Registers service with consul for service discovery
service {
  name = "chia-node"
  port = "rpc"

  tags = [
    "private"
  ]

  check {
    name     = "alive"
    type     = "tcp"
    interval = "10s"
    timeout  = "2s"
  }

  # Need to use a script check because the HTTP request to chia node must contain a body which cannot be done specified in the check stanza
  check {
    name     = "get_blockchain_state"
    type     = "script"
    command  = "/bin/bash"
    args     = ["/usr/local/bin/healthcheck.sh"]
    interval = "10s"
    timeout  = "5s"

    check_restart {
      # Restart after 2 consecutive failures
      limit = 2
      # After restarting do not check health for 90s
      grace = "90s"
      ignore_warnings = false
    }
  }
}
```

When it fails the Chia node is restarted by Nomad;

```
Recent Events:
Time                       Type              Description
2020-06-29T19:50:22+01:00  Started           Task started by client
2020-06-29T19:50:05+01:00  Restarting        Task restarting in 16.161437852s
2020-06-29T19:50:05+01:00  Terminated        Exit Code: 137, Exit Message: "Docker container exited with non-zero exit code: 137"
2020-06-29T19:50:00+01:00  Restart Signaled  healthcheck: check "get_blockchain_state" unhealthy
2020-06-29T19:45:49+01:00  Started           Task started by client
2020-06-29T19:45:47+01:00  Task Setup        Building Task Directory
2020-06-29T19:45:42+01:00  Received          Task received by client
```
