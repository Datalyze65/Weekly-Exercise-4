# WEEKLYEXERCISE4.R
# Default branch name: main

install.packages("gert")
library(gert)


git_branch_list()



#~~~~~~~~~~~~~~Q6 ANALYSIS 

#libraries 
library(readr)
library(dplyr)


#first right clicked and download and then used numbers for csv and then use the function
olympics <- read_csv("Olympics.csv")



#total medals creates new variable using mutate and add all their medals to each contestant. 6A

olympics <- olympics%>%
  mutate(total.medals = gold + silver + bronze)



#6b Gold medals per country in the olympics 
number_of_gold_per_country <- olympics %>%
  group_by(country) %>%
  summarise(total_gold_medals = sum(gold, na.rm = TRUE))

print(number_of_gold_per_country)

# 6C Total number of medals being handed out per year in the olympics. 
yearly_total_medals <- olympics %>%
group_by(year) %>%
  summarise(tota_medals_by_year = sum(total.medals, na.rm = TRUE))

print(yearly_total_medals)



#Q7 ANALYSIS ~~~~~~~~~~~~~
#q7a
ath_del_1992 <- olympics%>%
  filter(year == 1992) %>%
  select(country, athletes) %>%
  arrange(desc(athletes))

print(ath_del_1992)





#Q7B

library(ggplot2)

five_countries <- c("United States", "France", "Germany", "Russia", "China")

gold_medals_by_time <- olympics %>%
  filter(country %in% five_countries) %>%
  group_by(year, country) %>%
  summarise(total_gold_medals = sum(gold, na.rm = TRUE), .groups = "drop")

print(gold_medals_by_time)

ggplot(gold_medals_by_time, aes(x = year, y = total_gold_medals, color = country)) +
  geom_line(size = 1.2) +
  geom_point(size = 2) +
  labs(title = "Gold medals by country over time)",
       x = "Year", y = "Total Gold Medals") +
  theme_minimal()







