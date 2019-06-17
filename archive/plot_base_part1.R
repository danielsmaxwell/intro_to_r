# -----------------------------------------------------------------------------
# The data files for this archived learning experience are on my u drive, in the
# /r_intro_class/data folder. After using these as challenges in my original
# offering of this class, I discovered that these examples were too advanced for
# the students and therefore simplified and reworked this learning experience.
# -----------------------------------------------------------------------------

# Create dataframe from the data file
poverty <- read.delim("family_poverty.txt", sep = "\t", stringsAsFactors = FALSE)

opar <- par(no.readonly = TRUE)
ten  <- subset(poverty, year > 2005)

# Plot poverty % by year.
plot(ten$year, ten$family_poverty_pct,
     xlab = "Year",
     ylab = "Families in Poverty %",
     ylim = c(9, 13), 
     type = "b", 
     cex  = .75,
     lty  = 3,
     col  = "blue",
     pch  = 1)

# Reset the parameters.
par(opar)

# Multi-Line Plot Code -------------------------------------------------------

tmp <- read.delim("race_poverty.txt", sep = "\t", stringsAsFactors = FALSE)

tot_num_poverty <- as.numeric(gsub(",", "", tmp$tot_num_poverty))

poverty <- data.frame(year = tmp$year, 
                      tot_num_poverty, 
                      pct_total_poverty = tmp$pct_total_poverty, 
                      race = tmp$race)

white    <- subset(poverty, race == "white")
hispanic <- subset(poverty, race == "hispanic")
black    <- subset(poverty, race == "black")
asian    <- subset(poverty, race == "asian")

x <- white$year
y <- white$tot_num_poverty

plot(x, y,
     xlab = "Year",
     ylab = "Total Number in Poverty (1000's)",
     ylim = c(7000, 20000),
     type = "b", 
     cex  = .75,
     lty  = 3,
     col  = "blue",
     pch  = 1,
     las  = 1,
     cex.axis = .60)

x <- hispanic$year
y <- hispanic$tot_num_poverty

lines(x, y, type = "b", lty = 2, col = "red", pch = 0, cex = .75)

legend("bottomright",
       title = "Race",
       c("White","Hispanic"),
       lty   = c(3, 2), 
       pch   = c(1, 0),
       col   = c("blue","red"))

# Histogram, Boxplot, Stripchart Code ----------------------------------------

# Create dataframe from data file.
energy <- read.csv("energy_expend.csv", stringsAsFactors = FALSE)

# Two ways to create separate vectors for each stature factor.
lst <- split(energy$expend, energy$stature)

lean  <- energy$expend[energy$stature == "lean"]
obese <- energy$expend[energy$stature == "obese"]

# Set graphic device parameters to 2 rows and 1 column.
par(mfrow = c(2, 1))    
 
# Graph the two vectors.
hist(lean, breaks = 10, xlim = c(5, 13), ylim = c(0, 4), col = "lightblue")
hist(obese, breaks = 10, xlim = c(5, 13), ylim = c(0, 4), col = "lemonchiffon")

# Restore graphic device to 1 row, 1 column.
par(mfrow = c(1, 1))    

# Two ways to create the boxplot.
boxplot(lean, obese, names = c("Lean","Obese"))
boxplot(energy$expend ~ energy$stature, names = c("Lean","Obese"))

# Create four stripcharts.
opar <- par(no.readonly = TRUE)
par(mfrow = c(2,2), mex = 0.8, mar = c(3, 3, 2, 1) + .1)

stripchart(energy$expend ~ energy$stature)
stripchart(energy$expend ~ energy$stature, method = "stack")
stripchart(energy$expend ~ energy$stature, method = "jitter")
stripchart(energy$expend ~ energy$stature, method = "jitter", jitter = .03)

par(opar)




