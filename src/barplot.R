
# -------------------------------------------------------------

library(dplyr)

data <- read.csv("gapminder.csv", header = TRUE)

# Remove Oceania because it only has a sample size of 2 (New Zealand and Australia)
pop_2007 <- dplyr::filter(data, year == 2007, continent != "Oceania")
pop_2007 %>% group_by(continent) %>% summarise(sum(pop))
pop_2007 %>% group_by(continent) %>% mutate(cont_pop = cumsum(pop))

for (cont in unique(pop_2007$continent)){
  x <- dplyr::filter(pop_2007, continent == cont) %>% top_n(3, pop) %>% droplevels
  
  assign(cont, x)       # Assign name of the continent as variable
}

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

Africa$country   <- factor(Africa$country)
Americas$country <- factor(Americas$country)
Asia$country     <- factor(Asia$country)
Europe$country   <- factor(Europe$country)

m2

barplot(m2, 
        legend = cbind(levels(Africa$country), 
                       levels(Americas$country), 
                       levels(Asia$country), 
                       levels(Europe$country)),
           col = rainbow(12, s = 0.5),
   args.legend = list(x = "topleft", cex = .7),
        beside = FALSE)

barplot(m1, 
        legend = cbind(levels(Africa$country), 
                       levels(Americas$country), 
                       levels(Asia$country), 
                       levels(Europe$country)),
           col = rainbow(12, s = 0.5),
   args.legend = list(x = "topleft", cex = .7),
        beside = TRUE)

# -------------------------------------------------------------

m4 <- read.csv("barplot_stack.csv")

m3 <- data.frame(m4$Africa, m4$Americas, m4$Asia, m4$Europe)
colnames(m3) <- c('Africa','Americas','Asia','Europe')

m3 <- m3/1000000
m3 <- as.matrix(m3)

barplot(m3, 
        legend = cbind(levels(Africa$country), 
                       levels(Americas$country), 
                       levels(Asia$country), 
                       levels(Europe$country)),
        col = rainbow(12, s = 0.5),
        args.legend = list(x = "topright", cex = .7),
        beside = FALSE)

m3[m3 == 0] <- NA

barplot(m3, 
        legend = cbind(levels(Africa$country), 
                       levels(Americas$country), 
                       levels(Asia$country), 
                       levels(Europe$country)),
        col = rainbow(12, s = 0.5),
        args.legend = list(x = "topright", cex = .7),
        beside = TRUE)

# Levels are arranged in alphabetical order when the graph
# displays for the code below.  The colors no longer match.

countries <- m4$Country

barplot(m3, 
        legend = cbind(levels(countries)),
        col = rainbow(12, s = 0.5),
        args.legend = list(x = "topright", cex = .7),
        beside = TRUE)

# ----------------------------------------------------------------
library(lattice)

df <- rbind(Africa, Americas, Asia, Europe)
df$pop <- df$pop / 1000000

barchart(pop ~ country, data = df, groups = continent, stack = TRUE,
         auto.key = list(space = 'right', cex = 0.6),
         scales=list(x = list(rot = 90, cex = 0.8)))

barchart(pop ~ continent, data = df, groups = country, stack = TRUE,
         auto.key = list(space = 'right', cex = 0.6),
         scales=list(x = list(rot = 45, cex = 0.8)))

