library(sqldf)
library(dplyr)

# Barplot Code --------------------------------------------
  
survey <- read.csv("informatics_survey.csv", stringsAsFactors = FALSE)

# What happens if we don't set the stringsAsFactors argument?
q <- data.frame(survey$Q5_1, stringsAsFactors = FALSE)

colnames(q) <- c("response")

q <- subset(q, response != "")
q <- q[q$response != "",]

cnts <- table(q)

opar <- par(no.readonly = TRUE)
par(mai = c(.5, 1.5, .5, .5))
 
barplot(cnts, 
        horiz = TRUE, 
        col   = 'lightblue',
        las   = 2,
        main  = "Knowledge of Statistics - Question 5.1",
        cex.names = 0.5)

par(opar)
 
# Grouped & Stacked Barplot code -----------------------------

crime <- read.csv("drink_crime.csv", stringsAsFactors = FALSE)

# Data must be presented as a matrix or vector for stacked or grouped barplots.

barplot(as.matrix(crime[, c(2:4)]), 
        legend = crime[, 1],
           col = c("lightcoral","lightblue","khaki","beige"))

barplot(as.matrix(crime[, c(2:4)]), 
        legend = crime[, 1],
           col = c("lightcoral","lightblue","khaki","beige"),
   args.legend = list(x = "topleft"),
        beside = TRUE)

# INSTRUCTOR NOTE
# In programming, there is often more than one way to accomplish a task.  Rather
# than reference observations and variables with indexes -- the approach taken 
# above -- the code below creates a new dataframe.

lgnd        <- crime$Crime
binge       <- crime$Binge
occassional <- crime$Occasional
never       <- crime$Never
cnts        <- data.frame(binge, occassional, never)

barplot(as.matrix(cnts),
        legend = lgnd,
        col = c("lightcoral","lightblue","khaki","beige"))

barplot(as.matrix(cnts),
        legend = lgnd,
           col = c("lightcoral","lightblue","khaki","beige"),
   args.legend = list(x = "topleft"),
        beside = TRUE )

# Pie Chart code --------------------------------------------

survey <- read.csv("informatics_survey.csv", stringsAsFactors = FALSE)

# You can write a select statement with new column names.
tmp <- sqldf("select q3 as department, count(q3) as total from survey where q3 != ' ' group by q3")

# Or, you can execute a simple select and rename the variables afterwards.
tmp <- sqldf("select q3, count(q3) from survey where q3 != ' ' group by q3")

# Rename the columns -- department & department count.
colnames(tmp)  <- c("dept","dept_cnt")

# Add new column for academic group (HUM Humanities, SCI Sciences, SOC, Social Sciences, MED Medical)
tmp$acad_grp <- ""                       

# Set the new acad_grp column, using fix().  What happens if you use edit()?
fix(tmp)                                   

# Save a backup copy of the modified dataframe.
write.csv(tmp, file = "tmp.csv")          

# Create a new dataframe of the two columns needed for the pie chart. 
temp <- data.frame(tmp$acad_grp, tmp$dept_cnt, stringsAsFactors = FALSE)
colnames(temp) <- c("acad_grp","dept_cnt")

# Group rows by academic group and then sum dept_cnt for each academic group.
grp_by <- group_by(temp, acad_grp)            
slices <- summarize(grp_by, grp_tot = sum(dept_cnt))     

# Code to make the slice labels more descriptive.
slices$acad_grp[1] <- "Humanities"
slices$acad_grp[2] <- "Health Sciences"
slices$acad_grp[3] <- "Sciences"
slices$acad_grp[4] <- "Social Sciences"
slices$acad_grp[5] <- "Unknown"

# Calculate percentages, round to two digits, and then create labels.
slices$grp_pct <- (slices$grp_tot / sum(slices$grp_tot))
slices$grp_pct <- round(slices$grp_pct, 2) * 100
slices$lbl     <- paste(slices$acad_grp, " ", slices$grp_pct, "%", sep = "")
 
# And finally, generate the pie chart.
pie(slices$grp_pct, labels = slices$lbl, main = "Participation by Academic Area") 

# We can accomplish the same thing with the pipe operator.
slices <- group_by(temp, acad_grp) %>% summarize(grp_tot = sum(dept_cnt))

pie(slices$grp_tot, labels = slices$acad_grp, main = "Pie Chart (Pipe)") 

# Histogram code ---------------------------------------------

opar <- par(no.readonly = TRUE)

par(mfrow = c(3, 1))

own <- read.delim("home_ownership.txt", sep = "\t", stringsAsFactors = FALSE)

hist(own$pct_1985, 
     main = "1985", 
     col  = "lightblue",
     ylim = c(0, 27),
     xlab = "Home Ownership %")

hist(own$pct_1996, 
     main = "1996", 
     col  = "lightblue",
     ylim = c(0, 27),
     xlab = "Home Ownership %")

hist(own$pct_2002, 
     main = "2002", 
     col  = "lightblue",
     ylim = c(0, 27),
     xlab = "Home Ownership %")

par(opar)

# Boxplot code -----------------------------------------------

own <- read.delim("home_ownership.txt", sep = "\t", stringsAsFactors = FALSE)

boxplot(own$pct_1985, 
        own$pct_1996, 
        own$pct_2002, 
        notch = TRUE,
        ylab  = "Home Ownership %",
        main  = "Home Ownership in the United States",
        names = c("1985","1996","2002"))

# Stem & Leaf plot ------------------------------------------

ozone <- read.csv("ozone.csv", stringsAsFactors = FALSE)

x <- ozone[c(0:79),]

# The scale argument must equal 2 or the function only prints even numbers.
stem(x, scale = 2) 


# Scatter plot ------------------------------------------
money <- read.delim("money_supply.txt", sep = "\t", stringsAsFactors = FALSE)

plot(money$m2, money$m3, xlab = "M2 (Trillions)", ylab = "M3 (Trillions)")

# Now, fit a regression model and plot the line.
fit <- lm(money$m3 ~ money$m2, data = money)

abline(fit, col = "blue")



