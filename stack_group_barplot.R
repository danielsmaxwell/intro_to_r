data <- read.csv("https://github.com/mydatastory/r_intro_class/raw/master/data/gapminder.csv")
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