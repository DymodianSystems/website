+++
fragment = "content"
#disabled = true
date = "2019-09-04"
weight = 100
#background = ""

title = "Dymodia"
#subtitle = ""


  
+++

![Dymodia](/images/dymodia_interface.png "Dymodia")

## 1. System modelling
The first step is the creation of one or more system models. For smaller systems, this may involve a single system architecture model; for larger, more complex systems, this could include multiple interconnected system architectures -- e.g. representing different views of the system, such as separate hardware and software layers -- and a state machine to model the dynamic behaviour.

![System architecture model](/images/system_architecture.PNG "System architecture model")

_A simple system architecture model_

System architecture models represent the topology of the system and may be hierarchical, with subsystems nested within components. Individual components are joined together via ports (which may be input, output, or both) and connections, each of which may contain their own connection logic. Size, colour, and position of components can be customised.

![State machine](/images/state_machine.PNG "State machine")

_A simple state machine_

The dynamic behaviour of a system is represented using one or more state machines. The transitions between states can be triggered by different events in other models, e.g. the top event of a fault tree, a component failure, or a deviation at a component port.
