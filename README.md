# Display Wizard

This is a proof of concept that aims to address the scaling issue found in LOVE2D games running on Windows. As of LOVE2D v11, DPI scaling settings do not work on Windows. This means that games will not render correctly for users whose OS scaling setting is anything other than 100%. This is especially frustrating for users trying to run apps in fullscreen, as the corner of the window will be cut off. 

Currently, this POC can calculate the scaling value for users with a scale of 100% or higher.