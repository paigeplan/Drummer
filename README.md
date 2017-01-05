# iOS DeCal - Lab 2 (AutoLayout) #

In today's lab, we'll be creating a responsive UI for a simple drum pad app using AutoLayout. 

To get started, first clone this repository onto your own computer
    `git clone https://github.com/iosdecal/ios-decal-lab2`

Open the file `ios-decal-lab2.xcodeproj` to start the lab.

## Part 1 - Getting Started ##
Once you have opened the project in Xcode, notice the files present in the Navigator.

### Files we have provided ###
We have provided the following files for you to use. 
1. **Drummer.swift** in the **Model** folder - this file contains the "brains" of our app, including the filenames for the audio files that we'll be using, as well as a method for playing these audio files.
2. **Main.storyboard** in the **View** folder - this is where you will be creating your UI elements (buttons, labels, etc) and AutoLayout Constraints. This file is automattically created for you each time you create an app.
3. **Assets.xcassets** in the **View** folder - contains all of the images used in the app (we have only included app icon images, but if you'd like to add your own images to customize the app, add them here). This is another file that is automatically created for you each time you create a new app.
4. **Supporting Files** - contains all the audio clips we'll be using, as well as some other files we won't be using in today's lab (Ask a lab assistant if you want to learn about them!)

** Note, we have not created any View Controllers (this will be your job later in the lab)

Once you've become familiar with the files in our app, open Interface Builder (**Main.storyboard**). 

## Part 2 - Creating the View ##

### Adding the UI elements
We have a total of 7 drum sounds per drum kit provided, so we'll need 7 UIButtons in our app. 

Once you open your storyboard file, drag one **Button** out from the **Object library** onto your empty View. 

![alt text](/README-images/part2-1.png)

You can edit how the button looks by open the **Attributes Inspector**, which can be found in the Utilities sidebar to the left side of the screen. Feel free to customize it as much as you want, but at minimum, change out the background color so the buttons are easy to see. 

Once you complete one button, create 6 others, and add them to your view in the following arrangement.

![alt text](/README-images/part2-2.png)
Before we start adding constraints, let's add two more UI elements.
**Add one Label and one Segmented Control to the bottom of your view**. These can both be found in the Object Library. We'll use these to switch between drum kits (different drum kits will have different sound files associated with them).

Your view should now look something like this: 
![alt text](/README-images/part2-3.png)

Try building your project now by pressing `Command + B` or the "Run" button at the top left corner of Xcode. You'll see that the UI looks different than it does in the Interface builder, and that there is a lot of extra white space. You can rotate the simulator by pressing `Hardware >  Rotate`. To fix these problems, we will use AutoLayout!

### Creating AutoLayout Constraints
For our app, we want to minimize the amount of whitespace by making the buttons as large as they possibly can be given the size of our screen. Instead of hard-coding in values for our buttons, we'll create constraints between each UI element. 

To refresh your memory from what we went over in lecture, you can create constraints in Storyboard by first clicking on a UI element, holding down `Control` and then dragging your cursor to another UI element. 

To fine-tune your constraints, open the `Size Inspector` in the `Utilities` pane. Scroll downwards to view all constraints on your UI element.

You may add as many or as few constraints as you wish, but you must ensure the following to get credit for this lab

1. Every button should stretch in width and height to fill the entire screen (no hardcoded values for height and width!)
2. All buttons must have the same height
3. The spacing (horizontal and vertical) between each button must be equal
4. The label and the segmented control should remain the same height, regardless of screen size (Constrain their heights to a certain value).

**If you're stuck at this step and want a more detailed walkthrough, scroll to the very bottom of the page.**



### Creating AutoLayout Constraints (Detailed walkthrough)
If you got stuck creating constraints, here's one way you can go about adding constraints. Note that there are many different (and possibly better) ways to do this same job.

Remember, we need enough constraints so that their width, height, horizontal position, and vertical position of every UI element will be unambiguous (our set of linear constraints will have a single solution).

In this walkthrough, I'll first pin the bordering UI elements to the view, then create constraints between each of the buttons. If you'd like to start from scratch with your constraints (delete them all), click the `Resolve Auto Layout Issues` at the bottom of the screen, then click `Clear Constraints`.

![alt text](/README-images/clear-constraints.png)


### 1. Pinning the top buttons to the top of the view ###
To make sure our top row buttons stay at the top of the screen, we'll add constraints for their vertical position.

First, add a **Vertical Position Constraint** between the top left button and the **Top Layout Guide**
![alt text](/README-images/autolayout1.png)

You can then edit this constraint in the **Size Inspector**. I set this constraint's constant value to 20 (this button will always be 20 pixels below the top of the view now).
![alt text](/README-images/autolayout2.png)

We could do the same process for the other top row buttons, but to make future editing easier, **add a "Center Vertically" constraint from the middle top button to the top left button, and a "Center Vertically" constraint from the right top button to the top left button (Shown below).
![alt text](/README-images/autolayout3.png)

Now all of our top row buttons will remain at the top of the view!

### 2. Pinning the first column of buttons to the left side of the screen ###
We can do this using the same process as done in the previous segment. 

First, pin the top left button to the left (leading) edge of the view. Then create a **Leading Space to Container Margin** Constraint.


### 1. Making all the buttons the same height
One way we could do this is by Control-dragging from one button to every other button, one by one, adding the constraint "Equal Width". A faster way to do this is by selecting all buttons, then clicking the `Add New Constraints` tool found right above the debugger.
![alt text](/README-images/autolayout-1.png)

This will add one unwanted constraint that sets a value to 


### 1. Every button should stretch in width and height to fill the entire screen (no hardcoded values for height and width!)
In order to satisfy this requirement, we need to do the following six things.

1. Pin the top row buttons to the top of the view
2. Pin the left column buttons to the left of the screen (leading side)
3. Pin the right column buttons to the right of the screen (trailing side)
4. Pin the bottom label to the Label or segmented control
5. Pin the bottom label and segmented control to the bottom of the screen
6. Add horizontal / vertical spacing between each UI element

Once we've done that, each UI element will have enough constraint rules so that their width, height, horizontal position, and vertical position will all be unambiguous (our set of linear constraints will have a single solution).












