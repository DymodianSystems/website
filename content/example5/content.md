+++
fragment = "content"
#disabled = true
date = "2019-10-22"
weight = 100
#background = ""

title = "Example - Linking Models"
#subtitle = ""

[sidebar]
	title = "Navigation"
	align = "left"
	content = """
[Overview](/example1)<br>
[System Modelling](/example2)<br>
[State Modelling](/example3)<br>
[Adding failure data](/example4)<br>
Linking models<br>
[Synthesis](/example6)<br>
[Analysis](/example7)<br>
[Results](/example8)<br>
"""
+++

---  

At present, we have defined both a state machine and the system architecture. If we wish, we can also define fault trees. Any of these models can also reference the others. For example, we may wish to define a top-level fault tree that combines the omission of output from both engines. We can do this using "link nodes", and selecting the appropriate output deviations:

<p align="center">
	<img src="/images/crosslinks.PNG" alt="Linking a fault tree to an output deviation"/>
	<br>
	<i>Linking a fault tree to an output deviation</i>
</p>

This enables us to create a fault tree that combines the output of two components defined in a system architecture model:

<p align="center">
	<img src="/images/crosslinked_fault_tree.PNG" alt="The resulting fault tree"/>
	<br>
	<i>The resulting fault tree</i>
</p>

We can also reference state machine transitions or even other fault trees if we wish. Causes of output deviations can also reference other models in a similar way, as can the triggers of state machine transitions. In this case, we will want our state machine to be triggered by the appropriate output deviations in the system architecture. Below are the triggers for failure of the left pump/engine:

<table style="width:80%">
	<tr>
		<th>Source state</th>
		<th>Destination state</th>
		<th>Trigger</th>
	</tr>
	<tr>
		<td>UseBothTanks</td>
		<td>UseLeftTank</td>
		<td>O@FuelSystem::ValveRight[out]</td>
	</tr>
	<tr>
		<td>UseBothTanks</td>
		<td>UseRightTank</td>
		<td>O@FuelSystem::ValveLeft[out]</td>
	</tr>
	<tr>	
		<td>UseBothTanks</td>
		<td>Fail</td>
		<td>O@FuelSystem::PumpLeft[out]</td>
	</tr>
	<tr>
		<td>UseLeftTank</td>
		<td>Fail</td>
		<td>O@FuelSystem::PumpLeft[out]</td>
	</tr>
	<tr>	
		<td>UseRightTank</td>
		<td>Fail</td>
		<td>O@FuelSystem::PumpLeft[out]</td>
	</tr>
</table>
<br>

Note the format of the trigger here; this syntax is hierarchical and allows any entity in any model to be uniquely referenced.

[Next: Synthesis](/example6)
<br>
[Back to overview](/dymodia)
