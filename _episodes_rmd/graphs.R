
### Graphs



## Mathematical Symbols in Plots

# Create a blank plot.
plot(1:4, 1:4, type = "n")

# Add text inside the plot to demonstrate how to embed math symbols and/or equations.
text(1.5, 3, expression(mu))
text(2.5, 3, expression(sigma))
text(3.5, 3, expression(pi))
text(1.5, 2, expression(sqrt(x, y)))
text(2.5, 2, expression(frac(sum(x), n)))
text(3.5, 2, expression(x^2))




## Histogram from generated numbers

# Generate random numbers from a normal distribution.
x <- rnorm(mean = 5, sd = 1, n = 50)

# Create a histogram with a title, indicating the mean and standard deviation.
hist(x, main = expression(paste("Sampled values, ", mu, " = 5, ", sigma, " = 1")),
     col = "lightblue")




## Basic Plot

# Create dataframe from the data file
data <- read.csv("https://github.com/mydatastory/r_intro_class/raw/master/data/gapminder.csv")

us  <- data[data$country=="United States",]#subset(data, country == "United States")

# Plot GDP per Capital by year.
plot(us$year, us$gdpPercap,
     xlab = "Year",
     ylab = "GDP per Capital",
     type = "b", 
     cex  = .75,
     lty  = 3,
     col  = "red",
     pch  = 1)




## Multi Line Plot

# Create vectors, one for each country represented.
uk         <- data[data$country=="United Kingdom",]#subset(data, country == "United Kingdom")

x <- us$year
y <- us$gdpPercap

plot(x, y,
     xlab = "Year",
     ylab = "GDP per Capital",
     type = "b", 
     cex  = .75,
     lty  = 3,
     col  = "blue",
     pch  = 1,
     las  = 1,
     cex.axis = .60)

x <- uk$year
y <- uk$gdpPercap

# Now plot the UK line, using a different color and line type.
lines(x, y, type = "b", lty = 2, col = "red", pch = 0, cex = .75)

# Add legend to distinguish between the two lines.
legend("bottomright",
       title = "Race",
       c("United States","United Kingdom"),
       lty   = c(3, 2), 
       pch   = c(1, 0),
       col   = c("blue","red"))




## Histogram

# Create dataframe from data file.
life_exp_1987 <- data[data$year==1987,]
life_exp_2007 <- data[data$year==2007,]

# Create two vectors, one for each stature factor.


# Set graphic device parameters to 2 rows and 1 column.
par(mfrow = c(2, 1))    

# Graph the two vectors.
hist(life_exp_1987$lifeExp, main = "Life Expectancy in 1987", 
     xlab = "Life Expectancy", xlim = range(30:90), col = "lightblue")
hist(life_exp_2007$lifeExp, main = "Life Expectancy in 2007", 
     xlab = "Life Expectancy", xlim = range(30:90), col = "lemonchiffon")

# Restore graphic device to 1 row, 1 column.
par(mfrow = c(1, 1))  




## Boxplot

# Two ways to create the boxplot.
# Create with filter data
boxplot(life_exp_1987$lifeExp, life_exp_2007$lifeExp, 
        names = c("1987","2007"), col = "rosybrown1")

boxplot(data$lifeExp ~ data$year, 
        data[data$year==1987|2007,], col = "rosybrown1")
        
# Create with formula (all years)
boxplot(data$lifeExp ~ data$year, col = "rosybrown1")




## Make a Table

continents <- data[,c("country","continent")]
continents <- unique(continents)
cont_table <- table(continents$continent)
cont_table




## Basic barplot

seed(1)
rows_for_barplot <- data[sample(nrow(data), 6), ]

barplot(rows_for_barplot$lifeExp, 
        names.arg = paste0(rows_for_barplot$country, "\n", rows_for_barplot$year),
        col = rainbow(6, s = 0.3),
        ylab = "Life Exp (Years)",
        ylim = c(0,80))




## Stacked and grouped barplots

library(dplyr)
# Remove Oceania because it only has a sample size of 2 (New Zealand and Australia)
pop_2007 <- dplyr::filter(data, year == 2007, continent != "Oceania")
pop_2007 %>% group_by(continent) %>% summarise(sum(pop))
pop_2007 %>% group_by(continent) %>% mutate(cont_pop = cumsum(pop))

for (cont in unique(pop_2007$continent)){
  x <- dplyr::filter(pop_2007, continent == cont) %>% top_n(3, pop) %>% droplevels
  
  # Assign the name of the cont as the variable name
  assign(cont, x)
}


# Data must be presented as a matrix or vector for stacked or grouped barplots.

m1 <- cbind(Africa = Africa$pop, Americas = Americas$pop, 
            Asia = Asia$pop, Europe = Europe$pop)
m1
xx <- rep(0,3)
aa <- Africa$pop
bb <- Americas$pop
cc <- Asia$pop
dd <- Europe$pop
m2 <- matrix(c(aa,xx,xx,xx,
               xx,bb,xx,xx,
               xx,xx,cc,xx,
               xx,xx,xx,dd), ncol = 4)
colnames(m2) <- c("Africa", "Americas", "Asia", "Europe")

m2

barplot(m2, 
        legend = cbind(levels(Africa$country), levels(Americas$country), 
                       levels(Asia$country), levels(Europe$country)),
        col = rainbow(12, s = 0.5),
        beside = F)

barplot(m1, 
        legend = cbind(levels(Africa$country), levels(Americas$country), 
                       levels(Asia$country), levels(Europe$country)),
        col = rainbow(12, s = 0.5),
        beside = T)




## Pie Chart

cont_table
lbls <- paste0(names(cont_table), "\n ", cont_table)
pie(cont_table, labels = lbls, main = "Pie Chart of Continents\n (number of countries)")




## Scatter Plot

data_2007 <- data[data$year==2007,]
plot(data_2007$gdpPercap, data_2007$lifeExp, xlab = "GDP Per Capital ($)", ylab = "Life Expectancy (Years)")




## Stem and Leaf Plot

# The scale argument must equal 2 or the function only prints even numbers.  This
# is not stated in the help documentation.  The answer was found on Stack Overflow.

stem(data_2007$lifeExp, scale = 2) 





