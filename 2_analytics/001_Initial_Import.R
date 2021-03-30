

# packages being used today
library(tidyverse)
library(readr)
library(tidyr)

#clean_names
library(janitor)
# describe
library(psych)
# rename
library(dplyr)


#Data Initialisation
#dth_France0 <- read.csv("1_data/Deaths_France.txt")
dth_France0 <- read.delim("1_data/Deaths_France.txt"   ,header = TRUE, sep="") %>% mutate(Age = as.numeric(Age))
exp_France0 <- read.delim("1_data/Exposures_France.txt",header = TRUE, sep="",skip = 2)%>% mutate(Age = as.numeric(Age))

dth_Swiss0 <- read.delim("1_data/Deaths_Swiss.txt"   ,header = TRUE, sep="") %>% mutate(Age = as.numeric(Age))
exp_Swiss0 <- read.delim("1_data/Exposures_Swiss.txt",header = TRUE, sep="",skip = 0) %>% mutate(Age = as.numeric(Age))

library(psych)
str(dth_France0)
describe(dth_France0)

str(exp_France0)
describe(exp_France0)

dth_France1 <- dth_France0 %>%  gather(Sex,Tally,-Year,-Age)
exp_France1 <- exp_France0 %>%  gather(Sex,Tally,-Year,-Age)
dth_Swiss1 <- dth_Swiss0 %>%  gather(Sex,Tally,-Year,-Age)
exp_Swiss1 <- exp_Swiss0 %>%  gather(Sex,Tally,-Year,-Age)


library(ggplot2)
library(gridExtra)
library(ggthemes)
library(ggrepel)


exp_France1 %>% filter(Sex == "Total") %>% 
  ggplot(aes(Age, Tally, col=Year))  +   geom_point()
