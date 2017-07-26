Videos
	Class Welcome
	Assignment Completion
	Software Installation
	RStudio Final Check
	Anatomy of a Function

-------------------------------------------------------------------------------------------------
Assignment Completion

Hi Everyone,

In this short video, I want to walk you through the steps of creating a .pdf from within RStudio document.  Your assignments in this class are to complete the Activity Worksheets.  That involves two things:  retype example code found in the worksheet and complete the challenges.  And I am asking that you submit your assignments as .pdf files.  Thus you will need to know how to generate a .pdf from within RStudio.

So let's get started... first click the dropdown to create a new document and select RMarkdown...

Immediately, the new document window displays.  Now in this video, I'm going to create an assignment file for the activity_chp_1a worksheet.  Remember: you'll need to create a separate assignment .pdf for each activity worksheet that you complete.  So let's start by creating an appropriate title for this document. 

Activity Worksheet A  (Chapter 1)

And don't forget to click the .pdf radio button.

With our new document displayed on the screen, let's first remove all of the default text and code that we do not need.  Remember to keep that first section of code as it serves a role in the knit process. 

With that done, there's one more thing we need to do.  And that's to add a special line of code to the header.  Let me cut and paste that line:  
				header-includes: \usepackage{color}

For some reason, I've found that the knit process frequently throws errors when this line is missing, specifically in cases where I want to set some text to a particular color.   

Now that we have a clean document, let's add a section for the example code -- this is the code you retype from the activity worksheet.  Let me show you a section of the Activity Chapter A Worksheet right now...

Okay --- here's part of Activity Worksheet A (Chapter 1)
The code in blue is what I want you to retype into the Example Code section of the RMarkdown Document.  When you retype code, you inevitably make mistakes.  And in making those mistakes and working through the errors, you'll begin to internalize R syntax.  That's why I ask you to do this!

So we have example code...  and we also have Challenges...  Let me scroll to the bottom of this document to show you a Challenge.  Let's take a look at Challenge 2.  So in response to this Challenge -- you'll create a section in your RMarkdown document and write some code to answer the question being asked.  Now let's return to that document...

As I said when we were looking at the activity worksheet just now, you need to create a section for the example code and one for each challenge.  Since I've already created an example code section, let's add ones for Challenge 1, and Challenge 2. 

...now let me add some example code from the Activity Worksheet.  Let me type in the two lines that I highlighted.
	log10(10)  
	exp(1)

Of course, I'm not going to add any code to the two Challenge sections.  That's for you to do!  Instead, let me show you what you'll need to do to knit the document.  Click knit and then select .pdf... and that will launch the process!  This will produce a .pdf that you can then save to your hard drive and upload to Canvas.

And with that, I've covered what you need to know to create a .pdf of your assignments in response to the activity worksheets.  

Thank-you for your time!

-------------------------------------------------------------------------------------------------
RStudio Final Check

Hi Everyone
 
In this short video, I will introduce you to a couple of RStudio's setup or global options.  To check global options, click Tools, and then select Global Options.

One of the first things you'll need to do is verify that RStudio is using the correct version of R.  To see what versions are available, click the Change button.  Now on my computer, I've got multiple installs of R.  I'm presently running RStudio with R 3.3.2. And I'm doing this because the sqldf package stopped working when I upgraded to 3.4.0.  This happens sometimes.  When a new release of R comes out, some of your packages may stop working.  That was the case here and so I had to go back to an earlier version of R.

At this point, I'm going to click Cancel because I don't want to use the latest version of R.  Maybe the folks who wrote the sqldf package will update it soon!

Okay -- let's click Packages and verify the location of our CRAN mirror.  BTW, a CRAN mirror is simply a place where R packages are stored, and there are multiple mirrors around the world.  I've had good luck with the default option.  But if your packages begin to install slowly, you might want to change this option.  

I believe the National Institute for Computational Sciences in Oak Ridge, TN is the closest.

Alright, I have two other options to show you.  The first allows you to set your coding preferences.  Click Code to do so.  Now I'm not going to spend much time on this screen -- I just want to show you the tabs and options available.  As you gain proficiency in R, you may want to change some of these defaults.

And finally, the last option I want to talk about is Appearance.  With this global option, you can apply a color theme to your workspace.  For example, some programmers prefer to work against a black background.  I'm going to click on a couple options just to give you a feel for the possibilities.

And with that, we've completed this short video tour of RStudio's global options.

--------------------------------------------------------------------------------------------------

Four Panel layout.  Scripts - Console - Environment (In CS, this is known as the stack) - General Panel

Okay, go write some code!

--------------------------------------------------------------------------------------------------
Anatomy of a function

Hi Everyone,

In this short video, I want to show you the anatomy of a function call.  As you've probably heard, most of the code you write in R is nothing more than calls to various functions.  And what is a function?  Well, I'm glad you asked.  According to Webopedia, a function is a named section of code that performs a specific task.

So let's create a script to illustrate this...

In this case, I'm going to write a call to rnorm(), a function that generates a set of random numbers from a normal distribution.  First let's look at the documentation for this function to see what arguments it accepts.  You can do this two ways.

? or help()

From the help documentation, we see that rnorm is one of a family of 4 functions.  It's the last one listed here.  As well, we see that rnorm() takes 3 arguments, sometimes called parameters.  Keep in mind that the term 'argument' and 'parameter' are used interchangeably in the technical literature. 

Okay, let's write some code to call rnorm()...

Because rnorm returns a set of values, we first need to create a variable to hold the results.  Let's call that 'x'.  Then type the assignment operator, and finally the function name with parenthesis.  Within the parenthesis, we then type each argument with a corresponding value.

tst <- rnorm(n = 100, mean = 0, sd = 1)

Now in this piece of code, I'm passing arguments to rnorm by NAME.  That is, I specify the name of the argument, an equal sign, and then a value.  But this code can be written a different way.  Here's another way to call this function...

tst <- rnorm(100, 10, 200)

Here I pass the arguments by position.  When doing this, you must ensure that your arguments align with what the function expects at that position.  

And finally, you can call rnorm by NAME and POSITION.  Here's an example of how to do that:

tst <- rnorm(n = 100, 10, 200)

In this case, I'm passing the first argument by NAME, and the 2nd and 3rd by POSITION.

Although you can call a function in any one of these three ways, my personal preference is to pass arguments to functions by NAME.  When you do that, you know exactly what's being passed to the function.  And your code becomes self-documenting.  This is important when you come back to a piece of code after a period of time.

And with that, we've completed this short video tour of function call anatomy.  Thank-you for your time.

--------------------------------------------------------------------------------------------------
Class Welcome

Hello Everyone -- I'm Dr. Dan Maxwell -- and welcome to Introduction to R.  In this course, you'll gain a basic working knowledge of the R programming language.  Once you complete this course, my hope is that you'll feel comfortable writing short programs in R to explore your data.  If nothing else, I hope you gain a level of comfort writing code in a programming language.


To succeed, there are a couple things you need to keep in mind:

1. Read the assigned readings.  This is critical because our textbook (R in Action) and the activity worksheets that accompany it
   will frame your learning experience.  This is how you'll gain conceptual understanding.  And -- I might add -- pass the quizzes.

2. Stay focused.  So often, students think they can learn a new programming language while multi-tasking on Facebook or texting 
   friends on their cell phone.  After programming for 30 years, I've learned one thing.  You'll learn R -- or any language -- much
   faster if you can devote focused, uninterrupted time to practice.  

3. Write code.  This may sound self-evident, considering this is a class on learning to program in R!  But this can't be said too
   often because deeper mastery happens as you code and fix bugs.  In fact, this is why I ask you to retype example code in the
   in the activity worksheets and hand that in as part of your assignments.  In doing so, you'll inevitably make 
   mistakes -- and you know what -- that's a REALLY good thing because you'll then have to fix them!  And of course, you'll also 
   write custom code in response to the challenges.

Keep these principles in mind as you begin your R learning journey.

Okay, let's get started!


