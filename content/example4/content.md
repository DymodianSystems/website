+++
fragment = "content"
#disabled = true
date = "2019-10-22"
weight = 10
#background = ""

title = "Example - Adding failure data"
#subtitle = ""

[sidebar]
	title = "Navigation"
	align = "left"
	content = """
[Overview](/example1)<br>
[System Modelling](/example2)<br>
[State Modelling](/example3)<br>
Adding failure data<br>
[Linking models](/example5)<br>
[Synthesis](/example6)<br>
[Analysis](/example7)<br>
[Results](/example8)<br>
"""
+++

---  

Next, we need to add failure data to the architecture model. This needs to be done for each component and, where appropriate, each state.

## Fuel Tanks
<p align="center">
	<img src="/images/fuel_tank.PNG" alt="Fuel tank"/>
</p>

The tanks are identical and have only one failure mode:

<table style="width:80%">
	<tr>
		<th>Component Failure</th>
		<th>Failure Rate</th>
		<th>Repair Rate</th>
	</tr>
	<tr>
		<td>leak</td>
		<td>1e-5</td>
		<td>5e-4</td>
	</tr>
</table>

<br>

The tanks have a single output port (out) with a single output deviation, omission (O):

<table style="width:80%">
	<tr>
		<th>Failure Class</th>
		<th>Port</th>
		<th>Cause</th>
	</tr>
	<tr>
		<td>Omission</td>
		<td>out</td>
		<td>this:leak</td>
	</tr>
</table>
<br>

Here we specify the output deviation (O@out) to be caused by the "leak" failure mode defined earlier. In this way, we have told Dymodia that an omission of output from this port will be caused by the given failure mode. More complex logic is also possible, as will be seen later.

Since the failure behaviour of the tanks is the same irrespective of which state the system is in, we define the above for the "Default" state, which means it applies in all states.

<br>

---
## Left and Right Valves
<p align="center">
	<img src="/images/normal_valve.PNG" alt="Normal valve"/>
</p>

The left and right valves are identical. Each has two possible failure modes: "jammed", where the valve is jammed in the closed position, and "blocked", where flow has been obstructed by some kind of blockage.

<table style="width:80%">
	<tr>
		<th>Component Failure</th>
		<th>Failure Rate</th>
		<th>Repair Rate</th>
	</tr>
	<tr>
		<td>jammed</td>
		<td>1e-5</td>
		<td>5e-4</td>
	</tr>
	<tr>
		<td>blocked</td>
		<td>1e-5</td>
		<td>5e-4</td>
	</tr>
</table>
<br>
We add this information as usual using the Component Failure Data dialogue:

<p align="center">
	<img src="/images/basic_events.PNG" alt="Adding basic events"/>
</p>

As with the fuel tanks, the valves have a single output port. For now, we can define a single output deviation, omission (O):

<table style="width:80%">
	<tr>
		<th>Failure Class</th>
		<th>Port</th>
		<th>Cause</th>
	</tr>
	<tr>
		<td>Omission</td>
		<td>out</td>
		<td>this:blocked OR this:jammed OR O@this[in]</td>
	</tr>
</table>
<br>

Note how the cause this time is a logical combination of three possibilities: the "jammed" failure mode, the "blocked" failure mode, or an omission of input to the valve (from the fuel tank); any one is sufficient to cause an omission of output.

Again, the failure behaviour here is the same irrespective of which state the system is in, so we only need to define it once, for all states.

<br>

---
## Centre valve
<p align="center">
	<img src="/images/centre_valve.PNG" alt="Centre valve"/>
</p>

The centre valve is similar to the other valves in its internal failure modes.

<table style="width:80%">
	<tr>
		<th>Component Failure</th>
		<th>Failure Rate</th>
		<th>Repair Rate</th>
	</tr>
	<tr>
		<td>jammed</td>
		<td>1e-5</td>
		<td>5e-4</td>
	</tr>
	<tr>
		<td>blocked</td>
		<td>1e-5</td>
		<td>5e-4</td>
	</tr>
</table>
<br>

The main difference here is in the output deviations. During normal operation -- in the "UseBothTanks" state -- this component is dormant; it neither takes input nor provides output, because the valve is closed. Its failure behaviour is only relevant in one of the two degraded modes. As such, we must specify this behaviour directly for each state by selecting it at the top:

<p align="center">
	<img src="/images/stateful-odevn.PNG" alt="Adding output deviations for a state"/>
</p>

<table style="width:80%">
	<tr>
		<th>State</th>
		<th>Failure Class</th>
		<th>Port</th>
		<th>Cause</th>
	</tr>
	<tr>
		<td>UseLeftTank</td>
		<td>Omission</td>
		<td>right_out</td>
		<td>this:blocked OR this:jammed OR O@this[left_in]</td>
	</tr>
	<tr>
		<td>UseRightTank</td>
		<td>Omission</td>
		<td>left_out</td>
		<td>this:blocked OR this:jammed OR O@this[right_in]</td>
	</tr>
</table>
<br>

Note how the failure behaviour here depends on the current state; in other words, it is **dynamic behaviour**. When using the left tank, only output deviations at right_out are possible; when using the right tank, only output deviations at left_out are possible (with appropriate causes in each case).

<br>

---
## Left and Right Pumps
<p align="center">
	<img src="/images/pump.PNG" alt="Pump"/>
</p>

The left and right pumps are identical. Each has only a single generic failure mode:

<table style="width:80%">
	<tr>
		<th>Component Failure</th>
		<th>Failure Rate</th>
		<th>Repair Rate</th>
	</tr>
	<tr>
		<td>failed</td>
		<td>5e-4</td>
		<td>5e-4</td>
	</tr>
</table>
<br>

However, the output deviations are again dependent on state:

<table style="width:80%">
	<tr>
		<th>State</th>
		<th>Failure Class</th>
		<th>Port</th>
		<th>Cause</th>
	</tr>
	<tr>
		<td>UseBothTanks</td>
		<td>Omission</td>
		<td>out</td>
		<td>this:failed OR FuelSystem:::PowerCut OR O@this[in1]</td>
	</tr>
	<tr>
		<td>UseLeftTank</td>
		<td>Omission</td>
		<td>out</td>
		<td>this:failed OR FuelSystem:::PowerCut OR O@this[in1]</td>
	</tr>
	<tr>
		<td>UseRightTanks</td>
		<td>Omission</td>
		<td>out</td>
		<td>this:failed OR FuelSystem:::PowerCut OR O@this[in2]</td>
	</tr>
</table>
<br>

One extra addition here is a common cause failure: "PowerCut". This is defined at the system architecture level and can then be referenced from any component:

<p align="center">
	<img src="/images/ccf2.PNG" alt="Adding common cause failures"/>
</p>

<br>

---
## Engines
<p align="center">
	<img src="/images/engine.PNG" alt="Engines"/>
</p>

To keep things simple, we do not consider failure of the engines directly; instead we use them only as the "outputs" of the system:

<table style="width:80%">
	<tr>
		<th>Failure Class</th>
		<th>Port</th>
		<th>Cause</th>
	</tr>
	<tr>
		<td>Omission</td>
		<td>out</td>
		<td>O@this[in]</td>
	</tr>
</table>
<br>

In other words, omission of engine power is caused only by an omission of fuel to the engine.

<br>

[Next: Linking models](/example5)
<br>
[Back to overview](/dymodia)
