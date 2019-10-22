+++
fragment = "content"
#disabled = true
date = "2019-10-22"
weight = 100
#background = ""

title = "Example - Analysis"
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
Analysis<br>
[Results](/example8)<br>
"""
+++

---  

Although an FTA can be launched directly from a fault tree, more commonly a full system analysis is launched from the analysis dialogue:

<p align="center">
	<img src="/images/analysis2.PNG" alt="Analysis dialogue"/>
	<br>
	<i>Analysis dialogue</i>
</p>

Here, the user can select which states, output deviations, or fault trees to include in the analysis. Each one included will be treated as a separate system failure and a new fault tree will be synthesised for them. Selecting multiple system failures in this way makes it possible to perform a meaningful FMEA in which failure modes may contribute to multiple or different system failures. It is also possible to set the risk time, i.e., the lifetime of the system being analysed.

Both static and dynamic FTA algorithms are available; the former is faster, but obviously cannot handle priority-AND gates or state-based logic in the fault trees. The latter is slightly slower but more powerful.

[Next: Results](/example8)
<br>
[Back to overview](/dymodia)
