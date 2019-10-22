+++
fragment = "content"
#disabled = true
date = "2019-10-22"
weight = 100
#background = ""

title = "Example - Results"
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
[Synthesis](/example6)<br>
[Analysis](/example7)<br>
Results<br>
"""
+++

---  

Performing an analysis creates a new results object in the project, using the name provided and the current timestamp to distinguish it from other results. At the top level is the results summary:

<p align="center">
	<img src="/images/example_results_summary.PNG" alt="Results summary"/>
	<br>
	<i>Results summary</i>
</p>

This shows the summary of the FMEA and a breakdown of the qualitative and quantitative results for each fault tree. In this case, the dynamic fault tree for the failure of the left engine is shown, including its unavailability estimate and the number of minimal cut sets of each order.

The results can be viewed in more detail by clicking on the appropriate links. For example, the FMEA:

<p align="center">
	<img src="/images/example_fmea.PNG" alt="FMEA for the Left Engine failure"/>
	<br>
	<i>FMEA for the Left Engine failure</i>
</p>

In this case, only one effect is considered (the failure of the left engine due to lack of fuel), but the various failure modes are visible, each listed under the appropriate component. The final column indicates whether or not the failure mode is a "direct effect" -- i.e., it directly causes the system failure on its own -- or whether it is a "further effect", i.e. it causes system failure only in conjunction with other events. Clicking on the effect in each case will take you to the relevant cut sets in the fault tree results. These can also be viewed by clicking on the fault tree in the results summary.

<p align="center">
	<img src="/images/example_fta.PNG" alt="FTA for the Left Engine failure"/>
	<br>
	<i>FTA for the Left Engine failure</i>
</p>

Here the minimal cut sets are displayed for the fault tree. These can be sorted and filtered as required, but show the order (size) of each cut set, the unavailability, the constituent failure modes/basic events, and -- in the rightmost column -- any sequences that apply. These sequences are only generated for dynamic fault trees and act as constraints on the events. 

The results of the analysis here are as follows:

1. **Failure of the left pump** -- This is a single point of failure. If the pump fails, no fuel will reach the engine.
2. **Blockage of the left valve** BEFORE **Blockage of the central valve** -- In this case, blockage of the left valve sends the system into "UseRightTank" mode. Once in this state, blockage of the central valve will starve the pump of fuel.
3. **Jamming of the left valve** BEFORE **Blockage of the central valve** -- If the left valve is jammed, the system moves into "UseRightTank" mode. Once in this state, blockage of the central valve will starve the pump of fuel.
4. **Leak in the left tank** BEFORE **Blockage of the central valve** -- If the left tank leaks, the system moves into "UseRightTank" mode. Once in this state, blockage of the central valve will starve the pump of fuel.
5. **Blockage of the left valve** BEFORE **Jamming of the central valve** -- In this case, blockage of the left valve sends the system into "UseRightTank" mode. Once in this state, jamming of the central valve will starve the pump of fuel.
6. **Jamming of the left valve** BEFORE **Jamming of the central valve** -- If the left valve is jammed, the system moves into "UseRightTank" mode. Once in this state, jamming of the central valve will starve the pump of fuel.
7. **Leak in the left tank** BEFORE **Jamming of the central valve** -- If the left tank leaks, the system moves into "UseRightTank" mode. Once in this state, jamming of the central valve will starve the pump of fuel.
8. **Blockage of the right valve** AND **Blockage of the left valve** -- If both left and right valves fail, no fuel will leave either tank.
9. **Jamming of the right valve** AND **Blockage of the left valve** -- If both left and right valves fail, no fuel will leave either tank.
10. **Leak in the right tank** AND **Blockage of the left valve** -- If the right tank is empty due to a leak and the left valve is blocked, no fuel will reach the pumps.
11. **Blockage of the right valve** AND **Jamming of the left valve** -- If both left and right valves fail, no fuel will leave either tank.
12. **Jamming of the right valve** AND **Jamming of the left valve** -- If both left and right valves fail, no fuel will leave either tank.
13. **Leak in the right tank** AND **Jamming of the left valve** -- If the right tank is empty due to a leak and the left valve is jammed, no fuel will reach the pumps.
14. **Blockage of the right valve** AND **Leak in the left tank** -- If the right valve is blocked and the left tank is empty, no fuel will reach the pump.
15. **Jamming of the right valve** AND **Leak in the left tank** -- If the right valve is jammed and the left tank is empty, no fuel will reach the pump.
16. **Leak in the right tank** AND **Leak in the left tank** -- If both tanks spring a leak, all the fuel will leak away and none will reach the pump.

The results are preserved as part of the project, allowing you to change the models and update values, re-run the analysis, and compare the new results against the old results. In this way it is possible to make speculative changes to the design and judge the impact those changes have in a rapid, iterative manner.

[Back to overview](/dymodia)
