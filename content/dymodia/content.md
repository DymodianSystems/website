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

Overview
========
---

Dymodia is a software application that allows engineers and safety analysts to model safety-critical systems and perform analyses on those models to help determine the possible impacts of component failures on the rest of the system, whether individually or in combination. Three types of models are possible:

* Hierarchical block diagrams to model static system architecture
* State machines to model dynamic system behaviour
* Static or dynamic fault trees to model additional failure behaviour

These system models can be linked together and annotated with failure data to describe how individual components may fail or propagate failures. Both qualitative and quantitative annotations are possible. From this information, Dymodia can **automatically synthesise system-wide models** in the form of interconnected fault trees that describe the overall failure behaviour of the system. This process allows a **global view of system dependability** to be produced from smaller, local views at the component level.

High-performance algorithms can then be used to analyse these global failure models. Dymodia supports **Fault Tree Analysis (FTA)** as well as **Failure Mode & Effects (and Criticality) Analysis (FME(C)A)** and crucially also offers support for the analysis of dynamic systems, i.e., systems which can operate in multiple states or in which behaviour changes over time. 

Intended primarily as a design-time tool, the results of these analyses can then be used to inform future design decisions, e.g. by altering the design to avoid or mitigate potential faults, and can help to ensure the resulting product complies with international safety standards. Dymodia is unique in combining these different tasks into a single application, directly linking the dependability information to the system models and thereby avoiding the need to manually create or update analysis artefacts in response to design changes. Dymodia should prove useful to engineers in any safety-critical industry.

<br><br>

How it works
============
---  


## 1. System modelling
The first step is the creation of one or more system models. For smaller systems, this may involve a single system architecture model; for larger, more complex systems, this could include multiple interconnected system architectures -- e.g. representing different views of the system, such as separate hardware and software layers -- and a state machine to model the dynamic behaviour.

![System architecture model](/images/system_architecture.PNG "System architecture model")

_A simple system architecture model_

System architecture models represent the topology of the system and may be hierarchical, with subsystems nested within components. Individual components are joined together via ports (which may be input, output, or both) and connections, each of which may contain their own connection logic. Size, colour, and position of components can be customised.

![State machine](/images/state_machine.PNG "State machine")

_A simple state machine_

The dynamic behaviour of a system is represented using one or more state machines. The transitions between states can be triggered by different events in other models, e.g. the top event of a fault tree, a component failure, or a deviation at a component port.

## 2. Failure modelling
The second step is the addition of failure annotations. These typically take one of two forms. 

![Fault Tree](/images/fault_tree.PNG "Fault tree")

_A fault tree_

The first form is a standalone fault tree, created manually by adding logic gates or events to the tree. The layout is controlled automatically to simplify things for the user. A range of different gate types are supported, including the Priority-AND gate to support dynamic behaviour. Quantitative failure data can be added to basic events according to a variety of models, including constant failure & repair, MTTF/MTTR, dormant failures, and Weibull variable failure rates.

The top event of this fault tree can then be referenced in other models as a trigger, e.g. to cause a transition in a state machine or to represent some external event causing a deviation at a component port. Alternatively, fault trees may themselves reference other models, and cross-reference nodes may be added to represent events triggered elsewehere.

![Component failures](/images/component_failures.PNG "Component failures")

_Component failures_

The other form is component-level failure data that describes how a given component may fail. Each component is essentially treated as a system of its own, and failures at its outputs are related to either failures propagated to its inputs or internal failures of the component itself. 

Internal failures commonly represent random hardware failures and as such may be modelled with different quantitative formula, e.g. constant failure & repair, MTTF/MTTR etc, as with basic events of fault trees. 

![Component failure logic](/images/component_failure_logic.PNG "Component failure logic")

_Component failure logic_

Additionally, each component port may have one or more _deviations_, which represent some kind of failure propagation. Typically these fall into one of three categories: omission, unexpected commission, or some kind of value deviation (e.g. a parameter being too high or too low, such as pressure or flow, or corrupted in the case of a data flow). However, the user is free to create custom failure classes.

Having defined a deviation, the cause must be specified. This is done using Dymodia's custom failure logic language, with autocomplete and syntax highlighting support. Logical expressions relate internal component failures and deviations at input ports to describe the causes of each output deviation.

## 3. Synthesis
The third step is the synthesis of global failure models, which describe the propagation of failures throughout the entire system. These can be generated on an individual basis -- for example, to show the causes of a particular deviation at a particular port -- or encompassing multiple potential system failures, which can be done by synthesising all paths to fail states in a state machine or all causes of a particular global fault tree.

![Dynamic fault tree](/images/dynamic_fault_tree.PNG "Dynamic fault tree")

_Dynamic fault tree generated from a state machine_

If synthesised from a state machine, the resulting fault tree will automatically be dynamic, representing the order in which the transitions must occur to reach the fail state.

## 4. Analysis
Having produced one or more fault trees representing the propagation of failure through the system, the fourth step is analysis. As with synthesis, this can be done on an individual basis -- for a particular fault tree -- or for a collection of fault trees. The result is an FMEA and one or more FTA results, which include both qualitative results (in the form of minimal cut sets) and quantitative results (in the form of an estimation of unavailability).

![Results summary](/images/results_summary.PNG "Results summary")

_Results summary_

Using multiple fault trees representing different system failure makes it possible to generate an FMEA that describes the effects of the various failure modes, with hyperlinks to the fault trees representing each effect as well as links back to the components in the system models where the failure modes originate.

![FMEA](/images/fmea_results.PNG "FMEA results")

_FMEA results_

FMEA results can be filtered and sorted, as well as customised in other ways. Furthermore, the FMEAs generated by Dymodia are multiple failure mode FMEAs; whereas a standard FMEA only shows the direct effects of an individual failure mode, multiple failure mode FMEAs also show the possible effects of multiple failure modes occurring in conjunction (known as _further effects_ in Dymodia). It is possible to click on these to be taken to the cut set showing all other failure modes that contribute to the given system effect.

![Fault tree](/images/fta_results.PNG "FTA results")

_FTA results_

Like the FMEA, FTA results can be filtered and sorted. If the source fault tree was a dynamic fault tree, they can also include sequential information. In these cases, the minimal cut sets are in fact _minimal cut sequences_. These show not only the combination of basic events necessary to cause the system failure, but also which sequence these events must occur in (representing using the < symbol).

Each set of analysis results -- combining both FMEA and FTA results -- is time-stamped and preserved, enabling users to make modifications to the system design, perform a new analysis, and compare the differences in the results. All results can also be exported to a variety of formats, e.g. XLSX spreadsheet files, with custom headers and data included.

