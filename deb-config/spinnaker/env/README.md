# ENV files.
Our installations have a way to switch between different "environment profiles".
You'll need a file like /opt/spinnaker/env/ha.env (the name prod comes from the "stack" in a servergroup i.e. armoryspinnaker-ha-v999), so you can set any vars you need per each environment.

These env files are sourced during startup of the Spinnaker instance to each service.

### `resolved.env`
This file is generated automatically by Armory. Its a cat of `/opt/spinnaker/env/default.env` (comes from user-data) and files found here (e.g. `ha.env`).
