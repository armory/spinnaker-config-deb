# ENV files.
Environment files are sourced during startup of the Spinnaker instance by the `stack` name for spinnaker's Autoscaling group. 
Thus its possible to have different settings per environment stacks for spinnaker.

### `resolved.env`
This file is generated automatically by Armory. Its a combination of the files found here (e.g. `HA.env`) and `/opt/spinnaker/env/default.env` (which comes from the user-data.
