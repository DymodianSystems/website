+++
fragment = "content"
#disabled = true
date = "2019-10-22"
weight = 100
#background = ""

title = "Example - Synthesis"
#subtitle = ""

[sidebar]
	title = "Navigation"
	align = "left"
	content = """
[Overview](/example1)<br>
[System Modelling](/example2)<br>
[State Modelling](/example3)<br>
[Adding failure data](/example4)<br>
[Linking models](/example5)<br>
Synthesis<br>
[Analysis](/example7)<br>
[Results](/example8)<br>
"""
+++

---  

There are many ways to synthesise fault trees in Dymodia. They can be synthesised directly from any output deviation in a system architecture model, from a failure state in a state machine, or more generally as part of an analysis. Here for example is the fault tree for the output deviation "O@FuelSystem::ValveLeft[out]":

<p align="center">
	<img src="/images/omission_valve_left.PNG" alt="Omission of fuel from left valve"/>
	<br>
	<i>Omission of fuel from left valve</i>
</p>

And here is part of the dynamic fault tree generated from the state machine:

<p align="center">
	<img src="/images/longer_dft.PNG" alt="Dynamic fault tree for the Pump Left Fail State"/>
	<br>
	<i>Dynamic fault tree for the Pump Left Fail State</i>
</p>

Note the Priority-AND (PAND) gates at the top, above the state names: these indicate the change in state. For example, the left-most branch is identical to the fault tree above: it is the fault tree for an omission from ValveLeft. This occurs in the default UseBothTanks state, but once it occurs, it triggers the UseRightTank state, as seen in the transition triggers defined previously. Thus above this is a special node marking the change to the UseRightTank state. The priority-AND above it then indicates that the next branch takes place in this state, and its occurrence will trigger the Fail state and thus proceed up past the PAND gate via the OR gate to the top event.

[Next: Analysis](/example7)
<br>
[Back to overview](/dymodia)
