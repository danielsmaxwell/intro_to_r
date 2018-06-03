library(reshape2)
library(MESS)
library(tidyr)
library(dplyr)

# A small dataset to convert to long format and then back again.

wide <- read.csv("wide.csv", stringsAsFactors = FALSE)
wide

long <- melt(wide, id.vars = c("person", "age", "gender"))
long

wide <- dcast(long, person ~ variable)
wide

# Converting the home ownership dataset to long format, using dplyr's
# gather() function.

home_own_wide <- read.delim("home_ownership.txt", sep = "\t", stringsAsFactors = FALSE)
home_own_wide

gather(data = home_own_wide, key = state)     # Use spread() to go the other way...    

home_own_long <- home_own_wide %>% gather(state)

home_own_long <- melt(home_own_wide, id = "state")
home_own_long
