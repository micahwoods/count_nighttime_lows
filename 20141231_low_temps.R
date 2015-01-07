# get low temperature data for various cities for 2010 to 2014
# and plot them

# load required packages
source("r/utilities.R")

# this scrapes airport data from Weather Underground
# the data folder contains the results of "r/weather_data_scrape.R"
# source("r/weather_data_scrape.R")

# read Carefree Arizona data
# and also this contains Jacksonville, Augusta, TYS, & Farmingdale
source("r/carefree.R")

# read Sydney data
source("r/sydney.R")

# read Japan data
# sourcing r/sanda_koshigaya.R would download all the data again from JMA
# this just reads in what has already been downloaded by r/sanda_koshigaya.R
source("r/japan.R")

# now one can bind all these data from various cities into one data fram


all <- as.data.frame(rbind(carefree, tys, jb, aug,
                           ny, syd, koshigaya, sanda))

# give simple column names and format data
colnames(all) <- c("low", "year", "city", "meanTemp", "high", "date")
                       
# select the cutoff temperature
# 65F is 18.3C, 70F is 21.1C, 75F is 23.9C
low18 <- filter(all, low > 18)
low21 <- filter(all, low > 21)
low23 <- filter(all, low > 23)
low24 <- filter(all, low > 24)

# generate a dataframe that has counts of days per year 
# per city above the cutoff temperature
count18 <- low18 %>%
  group_by(city, year) %>%
  summarise(length(low))

count21 <- low21 %>%
  group_by(city, year) %>%
  summarise(length(low))

count23 <- low23 %>%
  group_by(city, year) %>%
  summarise(length(low))

count24 <- low24 %>%
  group_by(city, year) %>%
  summarise(length(low))

colnames(count18) <- c("city", "year", "count")
colnames(count21) <- c("city", "year", "count")
colnames(count23) <- c("city", "year", "count")
colnames(count24) <- c("city", "year", "count")

# plot this as city & year for low temps > 18C
p <- ggplot(data = count18, aes(x = year, y = count))
p + geom_point(aes(colour = city), size = 4) +
  geom_line(aes(colour = city), size = 0.2) +
  scale_colour_brewer(palette = "Set1",
                      drop = TRUE, limits = levels(count18$city)) +
  scale_y_continuous(limits = c(0, max(count18$count))) +
  labs(x = "Year",
       y = "Number of days with low temperature > 18°C (65°F)") +
  guides(colour = guide_legend(title=NULL)) +
  theme_minimal(base_size = 18)

# plot this as city & year for low temps > 21C
p <- ggplot(data = count21, aes(x = year, y = count))
p + geom_point(aes(colour = city), size = 4) +
  geom_line(aes(colour = city), size = 0.2) +
  scale_colour_brewer(palette = "Set1",
                      drop = TRUE, limits = levels(count21$city)) +
  scale_y_continuous(limits = c(0, max(count21$count))) +
  labs(x = "Year",
       y = "Number of days with low temperature > 21°C (70°F)") +
  guides(colour = guide_legend(title=NULL)) +
  theme_minimal(base_size = 18)

# plot this as city & year for low temps > 23C
p <- ggplot(data = count23, aes(x = year, y = count))
p + geom_point(aes(colour = city), size = 4) +
  geom_line(aes(colour = city), size = 0.2) +
  scale_colour_brewer(palette = "Set1",
                      drop = TRUE, limits = levels(count23$city)) +
  scale_y_continuous(limits = c(0, max(count23$count))) +
  labs(x = "Year",
       y = "Number of days with low temperature > 23°C (73°F)") +
  guides(colour = guide_legend(title=NULL)) +
  theme_minimal(base_size = 18)

# make a dataframe of mean annual temperature
# by city and by year, and see if summer length
# identified as min temp > x is related to that

annualMean <- all %>%
  group_by(city, year) %>%
  summarise(mean(meanTemp))

low_and_mean <- merge(count18, annualMean)
colnames(low_and_mean) <- c("city", "year", "count", "meanTemp")

# plot summer length as count of days with low > X vs annual meanTemp
p <- ggplot(data = low_and_mean, aes(x = meanTemp, y = count, label = year))
p + geom_point(aes(colour = city), size = 4) +
  scale_x_continuous(limits = c(min(low_and_mean$meanTemp),
                                max(low_and_mean$meanTemp) + 1)) +
  scale_colour_brewer(palette = "Set1") +
  labs(x = "Mean annual temperature (°C)",
       y = "Number of days with low temperature > 18°C (65°F)") +
  geom_text(hjust= -0.2, vjust=0, size = 3.5, aes(colour = city)) +
  guides(colour = guide_legend(title=NULL)) +
  theme_minimal(base_size = 18)

# get mean annual lows > 23 over 5 years (2010 to 2014)
# as an index of bentgrass damaging summer length

meanLow23 <- low23 %>%
  group_by(city) %>%
  summarise((length(low) / 5))

colnames(meanLow23) <- c("city", "average")

# plot this as a dot plot

meanLow23$order.city <- reorder(meanLow23$city, meanLow23$average)

# working here with lows of 23 at moment
p <- ggplot(data = meanLow23, aes(x = order.city, y = average, label = average))
p + geom_point(size = 4) +
  scale_y_continuous(limits = c(0, (max(meanLow23$average) + 10))) +
  coord_flip() + 
  geom_text(hjust= -0.5, vjust=0) +
  labs(y = "Mean # of days with low temperature > 23°C (73°F), 2010 to 2014",
       x = "City") +
  theme_minimal(base_size = 18)

combined <- filter(all, low > 23 & high > 30)

combo <- combined %>%
  group_by(city, year) %>%
  summarise(length(low))