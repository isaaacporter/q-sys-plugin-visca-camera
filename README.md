# PTZOptics Camera (IP Control)
QSC Q-Sys plugin for PTZ Optics Cameras using their IP protocol.

PTZ Optics cameras do not use the "VISCA over IP" command set when controlling their cameras over IP. They use regular "VISCA" commands over IP instead. This plugin takes Richard Hill's "VISCA over IP" module and removes the header bytes to make it a "VISCA" over IP plugin instead of a "VISCA over IP" plugin.

## Contributions
The original repo was forked from [Richard Hills (Extrasolve)](https://bitbucket.org/Extrasolve/visca_ip).