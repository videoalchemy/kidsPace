##Executable Feature Specs
> testable specs defined by example written from the user's perspective
______________
 
##v1.0.0

####Feature:  Control RGB using iPhone controls


#####Scenario:  A child changes the room color to red  
A child can change a room's color by selecting one of the 3 RGB colored buttons on the handheld interface.    
- **Given** I am a child that has the kidspace iPhone controller and wants to change the room's color to RED
- **When** I touch the RED button  
- **Then** the room should turn RED  
- **And** the room should remain RED until I either turn off the RED light by touching the RED button again, 
- **OR** I change the light to a different color by selecting one of the two other buttons.
