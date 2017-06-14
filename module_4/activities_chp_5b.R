library(reshape2)
library(tidyr)
library(dplyr)

home_own_wide <- read.delim("home_ownership.txt", sep = "\t", stringsAsFactors = FALSE)
home_own_wide

gather(data = home_own_wide, key = state)     # Use spread() to go the other way...    

home_own_long <- home_own_wide %>% gather(state)

home_own_long <- melt(home_own_wide, id = "state")
home_own_long

