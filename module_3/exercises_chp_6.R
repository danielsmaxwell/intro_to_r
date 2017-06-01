library(sqldf)
library(dplyr)

survey <- read.csv("informatics_survey.csv", stringsAsFactors = FALSE)

# What happens if we don't set the stringsAsFactors argument?
q5_1 <- data.frame(survey$Q5_1, stringsAsFactors = FALSE)

colnames(q5_1) <- c("response")

q5_1 <- subset(q5_1, response != "")
q5_1 <- q5_1[q5_1$response != "",]

cnts <- table(q5_1)

barplot(cnts, 
        horiz = TRUE, 
        col   = 'lightblue',
        las   = 2,
        cex.names = 0.5)

opar <- par()

par(mai = c(.5, 1.5, .5, .5))

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
temp   <- data.frame(tmp$acad_grp, tmp$dept_cnt, stringsAsFactors = FALSE)

colnames(temp) <- c("acad_grp","dept_cnt")

grp_by <- group_by(temp, acad_grp)                    # Group rows by academic group.

slices <- summarize(grp_by, grp_tot = sum(dept_cnt))  # Sum dept_cnt for each academic group.

pie(slices$grp_tot, labels = slices$acad_grp, main = "Pie Chart") 

# We can accomplish the same thing with the pipe operator.
slices <- group_by(temp, acad_grp) %>% summarize(grp_tot = sum(dept_cnt))

pie(slices$grp_tot, labels = slices$acad_grp, main = "Pie Chart (Pipe)") 

  



