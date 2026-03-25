# YAML Files Required for Damper Control

These files use entity, device, and automation names that are unique for my home.  You will need to replace them with your corresponding values.
They are:

damper.yaml - the ESPHome configuration file for the VAL3000
get-tstep.yaml - a test ESPHOME configuration file that will provide you with an accurate TSTEP value
handleClimate.yaml - sets the damper to the ideal position given difference presence scenarios (see below)
input_number.yaml - a helper to persistently store the damper position
template.yaml - the delta temperature between the 2 zones.

There are 8 different presence scenarios across the 3 rooms:

| Bedroom        | Office   | Guest Room | Damper Position |
|----------------|----------|------------|-----------------|
| Vacant         | Vacant   | Vacant     | Open            |
| Vacant         | Vacant   | Occupied   | Closed          |
| Vacant         | Occupied | Vacant     | Closed          |
| Vacant         | Occupied | Occupied   | Closed          |
| Occupied       | Vacant   | Vacant     | Open            |
| Occupied       | Vacant   | Occupied   | PID             |
| Occupied       | Occupied | Vacant     | PID             |
| Occupied       | Occupied | Occupied   | PID             |
