# get low temperature data for various cities for 2010 to 2014
# and plot them

source("r/utilities.R")
source("r/weather_data_scrape.R")

# the data folder contains the results of "r/weather_data_scrape.R"

# combine the data from multiple cities
# Portland data downloaded but not included here
all <- as.data.frame(rbind(athens, tokyo, knoxville, 
                           osaka, ny, jax))

# give simple column names and format data
colnames(all) <- c("low", "year", "city", "meanTemp")
all$low <- as.numeric(as.character(all$low))
all$year <- as.numeric(as.character(all$year))
all$meanTemp <- as.numeric(as.character(all$meanTemp))
                       
# select the cutoff temperature
# 65F is 18.3C, 70F is 21.1C, 75F is 23.9C
low18 <- filter(all, low > 18)
low21 <- filter(all, low > 21)
low23 <- filter(all, low > 23)

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

colnames(count18) <- c("city", "year", "count")
colnames(count21) <- c("city", "year", "count")
colnames(count23) <- c("city", "year", "count")

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

p <- ggplot(data = meanLow23, aes(x = order.city, y = average, label = average))
p + geom_point(size = 4, aes(colour = city)) +
  scale_y_continuous(limits = c(0, (max(meanLow23$average) + 10))) +
  coord_flip() + 
  geom_text(hjust= -0.5, vjust=0, aes(colour = city)) +
  labs(y = "Mean # of days with low temperature > 23°C (73°F), 2010 to 2014",
       x = "City") +
  scale_colour_brewer(palette = "Set1",
                      drop = TRUE, limits = levels(count23$city)) +
  guides(colour = guide_legend(title=NULL, drop = TRUE)) +
  theme_minimal(base_size = 18)

