+++
fragment = "content"
#disabled = true
date = "2019-10-22"
weight = 100
#background = ""

title = "Example - State Modelling"
#subtitle = ""

[sidebar]
	title = "Navigation"
	align = "left"
	content = """
[Overview](/example1)<br>
[System Modelling](/example2)<br>
State Modelling<br>
[Adding failure data](/example4)<br>
[Linking models](/example5)<br>
[Synthesis](/example6)<br>
[Analysis](/example7)<br>
[Results](/example8)<br>
"""
+++

---  

Next, we need to model the dynamic behaviour as well using a state machine:

<p align="center">
	<img src="/images/state_machine.PNG" alt="State Machine for the Fuel System"/>
	<br>
	<i>State Machine for the Fuel System</i>
</p>

In this case, there are four states:

* **UseBothTanks** - This is the starting (default) state, in which the centre valve is closed, fuel from the left tank feeds the left pump, and fuel from the right tank feeds the right pump.
* **UseLeftTank** - This occurs when there is no fuel flow from the right tank, in which case the centre valve is opened and fuel from the left tank is used to feed both pumps.
* **UseRightTank** - This occurs when there is no fuel flow from the left tank, in which case the centre valve is opened and fuel from the right tank is used to feed both pumps.
* **PumpFailure** - This is a failure state and occurs when one or both pumps is starved of fuel, thereby causing at least one engine to stall.

Once this is done, we link the architecture model to the state machine, so the architecture model gains access to the states we have defined:

<p align="center">
	<img src="/images/sysmod_properties.PNG" alt="System model properties"/>
	<br>
	<i>Linking the models</i>
</p>

[Next: Adding failure data](/example4)
<br>
[Back to overview](/dymodia)
