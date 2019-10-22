+++
fragment = "content"
#disabled = true
date = "2019-10-22"
weight = 100
#background = ""

title = "Example Overview"
#subtitle = ""

[sidebar]
	title = "Navigation"
	align = "left"
	content = """
Overview<br>
[System Modelling](/example2)<br>
[State Modelling](/example3)<br>
[Adding failure data](/example4)<br>
[Linking models](/example5)<br>
[Synthesis](/example6)<br>
[Analysis](/example7)<br>
[Results](/example8)<br>
"""
+++

---  

The example system is a fuel system with two redundant fuel tanks providing fuel to two engines, simplified for illustrative purposes:

<p align="center">
	<img src="/images/example_system.PNG" alt="Example System"/>
	<br>
	<i>Example System</i>
</p>

The system is dynamic. In ordinary operation, the centre valve (VC) remains closed, so that fuel from the left tank is sent to the left engine, while fuel from the right tank is sent to the right engine. However, in the case of certain failures -- such as a leak in one tank, or a faulty valve -- the centre valve can be opened to allow one fuel tank to provide fuel to both engines. System failure occurs when either engine is deprived of fuel.

[Next: System modelling](/example2)
<br>
[Back to overview](/dymodia)
