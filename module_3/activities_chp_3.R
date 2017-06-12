
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

par() <- opar