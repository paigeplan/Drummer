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
2. **Main.storyboard** in the **View** folder - this is where you will be creating your UI elements (buttons, labels, etc) and AutoLayout Constraints. This file is automatically created for you each time you create an app.
3. **Assets.xcassets** in the **View** folder - contains all of the images used in the app (we have only included app icon images, but if you'd like to add your own images to customize the app, add them here). This is another file that is automatically created for you each time you create a new app.
4. **Supporting Files** - contains all the audio clips we'll be using, as well as some other files we won't be using in today's lab (Ask a lab assistant if you want to learn about them!)

** Note, we have not created any View Controllers (this will be your job later in the lab)

Once you've become familiar with the files in our app, open Interface Builder (**Main.storyboard**). 

## Part 2 - Adding UI Elements to the View ##
We have a total of 7 drum sounds per drum kit provided, so we'll need to create 7 UI Buttons in our storyboard. 

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

## Part 3 - Creating AutoLayout Constraints ##
For our app, we want to minimize the amount of whitespace by making the buttons as large as they possibly can be given the size of our screen. Instead of hard-coding in values for our buttons, we'll create constraints between each UI element. 

To refresh your memory , you can create constraints in Storyboard by first clicking on a UI element, holding down `Control` and then dragging your cursor to another UI element. 

To fine-tune your constraints, open the `Size Inspector` in the `Utilities` pane. Scroll downwards to view all constraints on your UI element.

You may add as many or as few constraints as you wish, but you must ensure the following to get credit for this lab:

1. Every button should stretch in width and height to fill the entire screen (no hardcoded values for height and width!)
2. All buttons must have the same height
3. The first 6 buttons should have the same width and height
4. The spacing (horizontal and vertical) between each button must be equal
5. The label and the segmented control should remain the same height, regardless of screen size (Constrain their heights to a certain value).

**If you're stuck at this step and want a more detailed walkthrough, scroll to the very bottom of the page.**

Once your done, your view should look similar to this:

ADD IMAGE

## Part 4 - Connecting the View to the Model via a ViewController ##



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

We could do the same process for the other top row buttons, but to make future editing easier, **add a "Center Vertically" constraint from the middle top button to the top left button, and a "Center Vertically" constraint from the right top button to the top left button** (Shown below).
![alt text](/README-images/autolayout3.png)

Now all of our top row buttons will remain at the top of the view!

### 2. Pinning the first column of buttons to the left side of the screen ###
We can do this using the same process as done in the previous segment. 

First, control-drag from button 1 to the left (leading) edge of the view. Then create a **Leading Space to Container Margin** Constraint.

![alt text](/README-images/autolayout4.png)

Now, align the leading edges of buttons 4 and 7 to button 1.

![alt text](/README-images/autolayout5.png)

### 3. Pinning the third column of buttons to the right side of the screen ###
In the same way as done in the previous part, create a **Trailing Space to Container Margin** Constraint from button 3 to the right (trailing) edge of the view. Make sure the value of this constraint is the same value as the one made in part 2 (we want even borders).

Then align the trailing edges of buttons 6 and and 7 to button 3 (create a **Trailing** Constraint between buttons 3 and 6 and buttons 3 and 7.

### 4. Adding Constraints between buttons ###
Adding these constraints are simple, so here is a list of the necessary constraints to create.

1. Add a `Horizontal Spacing` Constraint between Button 1 and Button 3. Click on Button 1 to view the constraint in the Size Inspector (it will show up as `Leading Space`) and set it's constant value to **Standard Value**.
2. Repeat Step 1 for Buttons 2 and 3
3. Add a `Vertical Spacing` Constraint between Button 1 and Button 4. Click on Button 1 to view the constraint in the Size Inspector (it will show up as `Bottom Space`) and set it's constant value to **Standard Value**.
4. Add a `Center Vertically` Constraint between Buttons 4 and 5 and Buttons 4 and 6 
5. Add a `Center Horizontally` Constraint between Buttons 2 and 5 and Buttons 3 and 6 (we could add `Vertical Spacing` constraints instead, but this way we don't have to deal with setting constant values)
6. Add a `Vertical Spacing` Constraint between Button 6 and Button 4 and set it's constant value to **Standard Value**.

Once you are at this point, the constraints for each button should look as follows:

![alt text](/README-images/autolayout6.png)

### 5. Making all the buttons the same height ###
One way we could do this is by Control-dragging from one button to every other button, one by one, adding the constraint "Equal Width". A faster way to do this is by selecting all buttons, then clicking the "Add New Constraints" tool found right above the debugger.

![alt text](/README-images/autolayout7.png)

Now each button's height will be the same as Button 1's height.

### 6. Making the first 6 Buttons the same width ###
(Similar to Part 5) Highlight the first 6 buttons, then add an `Equal Height` Constraint between them using the "Add New Constraints" tool.

![alt text](/README-images/autolayout8.png)

If you want to check that you're on the right track at this point, add a temporary constraint from Button 7 to the bottom of the view (`Vertical Spacing`). Run your simulator. All of the buttons should resize to fit the screen, and remain properly centered and resize when the simulator is rotated. (Make sure to delete that constraint once you're done). **With this added constraint, here should be no AutoLayout warnings**.

Here's what you should see in your simulator if you added this temporary constraint from button 7 to the bottom of the screen. 

![alt text](/README-images/autolayout9.png)

### 7. Setting Constraints for the bottom UI Elements ###
First, delete the temporary constraint from part 6 if you haven't done so already.

Now we'll want to add the following constraints (again, there are many different ways to do this):

1. `Vertical Spacing to Bottom Layout Guide` constraint between the Label and the bottom of the View (pins the label to the bottom of the view)
2. `Leading Space to Container Margin` constraint between the Label and the left side of the View OR add a `Leading` constraint from the label to Button 1 (both pin the label to the left side of the view)
3. `Horizontal Spacing` constraint and a `Center Vertically` constraint between the Label and the Segmented Control
4. `Trailing Space to Container Margin` constraint between the Segmented Control and the right side of the View OR add a `Trailing` constraint from the label to Button 3 (both pin the segmented control to the right side of the view)

Now, to satisfy the requirement that the label and segmented control **should not** change in height or width, we need to create a constraints for their height and width.

To set the label's height constant, control drag from the label to itself, and set a reasonable value for the label's height constant in the Size Inspector. 

![alt text](/README-images/autolayout10.png)

Do the same process for the segmented control's width and height. 

Once your done with this part, your constraints should look similar to those pictured below.

![alt text](/README-images/autolayout11.png)

Now all we need to do is add a vertical spacing constraint from Button 7 to the bottom UI elements! One way to do this is by simply creating a `Vertical Spacing` constraint from Button 7 to the Label: 

![alt text](/README-images/autolayout12.png)

You may still have some warnings at this point, which we can resolve by "Updating Frames", which you can easily do by clicking this button:

![alt text](/README-images/autolayout13.png)

If you've followed this guide completely, you should have no AutoLayout warnings, and your app's UI should responsively change for any device size or orientation. Congrats!




