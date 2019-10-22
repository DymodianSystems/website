+++
fragment = "content"
#disabled = true
date = "2019-10-22"
weight = 100
#background = ""

title = "Failure Modelling"
#subtitle = ""


  
+++

Failure Modelling
============
---  

Once the system has been modelled, the next step is to annotate it with information to describe the local failure behaviour of each system component. Dymodia then builds up an internal fault propagation model of the entire system by processing and combining information about how each individual component can fail. 

This local failure data typically consists of two parts: internal component failures and output deviations at the component's ports.

<br>

## 1. Component failures
Internal component failures are those that are caused by the component itself. Typically these are random hardware failures and as such may be modelled with different quantitative formula, e.g. constant failure & repair, MTTF/MTTR etc, as with basic events of fault trees.

<p align="center">
	<img src="/images/basic_events.PNG" alt="Component failures"/>
	<br>
	<i>Component failures</i>
</p>

<br>

## 2. Output Deviations
Internal failures of a component may cause that component to fail, but say nothing about the effects such failures may have on other parts of the component. This information is instead provided by output deviations: the deviation in correct behaviour at a given output port. This enables failures from one component to be propagated to other components connected to it.

<p align="center">
	<img src="/images/odevns.PNG" alt="Output Deviations"/>
	<br>
	<i>Output Deviations</i>
</p>

Typically these fall into one of three categories: omission of output, unexpected commission of output, or some kind of value deviation (e.g. a parameter being too high or too low, such as pressure or flow, or corrupted in the case of a data flow). However, the user is free to create custom failure classes.

Having defined a deviation, the cause must be specified. This is done using Dymodia’s custom failure logic language, with autocomplete and syntax highlighting support. Logical expressions relate internal component failures and deviations at input ports to describe the causes of each output deviation. Both Boolean (AND, OR) and temporal (Priority-AND) logic is possible, and in future we plan to include negation as well (NOT, XOR, MAJORITY etc).

Links to other models (e.g. fault trees) may also be included in expressions. Alternatively, common cause failures for the entire model can be included. 

<p align="center">
	<img src="/images/ccfs.PNG" alt="Common Cause Failures"/>
	<br>
	<i>Common Cause Failures</i>
</p>

These are like internal component failures except defined at a system-wide level, allowing them to be referenced in any output deviation in the system. Typically these represent failures out of immediate scope, e.g. environmental influences or failures of different subsystems entirely (e.g. electrical power).

[Next: Synthesis](/synthesis)
<br>
[Back to overview](/dymodia)
