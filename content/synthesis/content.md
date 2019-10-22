+++
fragment = "content"
#disabled = true
date = "2019-10-22"
weight = 100
#background = ""

title = "Synthesis"
#subtitle = ""  
+++

Synthesis
=========
---  

The third step is the automatic synthesis of global failure models which describe the propagation of failures throughout the entire system. These can be generated at different levels and from different models, e.g.:

* Synthesis of fault trees for a particular deviation at a particular port
* Synthesis of dynamic fault trees representing all possible paths to a given failure state in a state machine
* Synthesis of a standalone fault tree, which in turn may link to other models
* Synthesis of multiple fault trees simultaneously, each of which may represent different system failures
* Some combination of the above

<p align="center">
	<img src="/images/analysis.PNG" alt="Synthesis & analysis options"/>
	<br>
	<i>Synthesis & analysis options</i>
</p>

The output of the synthesis step is one or more fault trees. These are added directly to the project, allowing the user to view and potentially edit them as required. These automatically-generated fault trees can be either static or dynamic, depending on the options and inputs chosen, and include input and output deviation nodes that demonstrate the propagation of failures through the system.

<p align="center">
	<img src="/images/dynamic_fault_tree.PNG" alt="Dynamic fault tree"/>
	<br>
	<i>Part of a dynamic fault tree featuring input and output deviation nodes (blue circles with arrows)</i>
</p>

It is possible to click on these nodes and be taken to the relevant port in the appropriate system architecture model.

[Next: Analysis](/analysis)
<br>
[Back to overview](/dymodia)
