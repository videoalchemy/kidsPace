##KidsPace
> You know, for kids!  Responsive visuals for a child's play space
__________________________

###Overview
A KidsPace is a play-space with Kid controlled illuminatation.  With touchscreen in hand, Kids change the color of their surroundings by affecting the output of a ceiling mounted projector.     

###Specification By Example:
####Feature: Control play-space color
- **Scenario:** Kid changes the room color to red  
> A child can change a room's color to either R, G, or B by selecting from the 3 buttons colored  R, G, B on the first and only screen of the handheld interface.  
> **Given** the kids has the controller and wants to change the room's color  
**When** the child touches the RED button  
**Then** the room should turn red  
**And** the room should remain red until another color is chosen   


###Release Notes:

________________________________________

###Process Prototypes:
This project is also an investigation into the software development process.  What are the 'best practices'?  Best way to document?  To track features?  To track releases?  To track bugs?  To log changes? To evolve software?  I've worked with two dev teams on two enterprise level software projects and in both cases, we were forced by breakdown and failure to invent and deploy reliable processes and procedures. Doing so was challenge. Retrofitting processes to full blown projects is just as difficult as changing the dev team culture:  so much inertial.  A small solo-project, however, is ideal for test-driving process prototypyes.      

####Process Tools:
#####git tags

#####specification by example (aka Executable Specs)

#####Behavior Driven Development
Start with a failing customer acceptance test that describes the behavior of the system from the customer's point of view.  Write this acceptance test in the form of an example of the way we want the system to behave in particular scenearios.  This will enable me to visualize the system before building it. (source: Cucumber - BDD for Testers and Developers by by Wayne and Hellesoy)

#####Docs


