# get low temperature data for Tokyo & Athens, GA for 2010 to 2014

source("r/utilities.R")
source("r/weather_data_scrape.R")

# the data folder contains the results of "r/weather_data_scrape.R"

# combine the data from multiple cities
all <- as.data.frame(rbind(athens, tokyo, portland, knoxville, 
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
low24 <- filter(all, low > 24)

# generate a dataframe that has counts of days per year 
# per city above the cutoff temperature
count18 <- low18 %>%
  group_by(city, year) %>%
  summarise(length(low))

count21 <- low21 %>%
  group_by(city, year) %>%
  summarise(length(low))

count24 <- low24 %>%
  group_by(city, year) %>%
  summarise(length(low))

colnames(count18) <- c("city", "year", "count")
colnames(count21) <- c("city", "year", "count")
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
p + geom_point(aes(colour = city, drop = TRUE), size = 4) +
  geom_line(aes(colour = city), size = 0.2) +
  scale_colour_brewer(palette = "Set1",
                      limits = levels(count21$city),
                      drop = TRUE) +
  scale_y_continuous(limits = c(0, max(count21$count))) +
  labs(x = "Year",
       y = "Number of days with low temperature > 21°C (70°F)") +
  guides(colour = guide_legend(title=NULL)) +
  theme_minimal(base_size = 18)

# plot this as city & year for low temps > 24C
p <- ggplot(data = count24, aes(x = year, y = count))
p + geom_point(aes(colour = city), size = 4) +
  geom_line(aes(colour = city), size = 0.2) +
  scale_colour_brewer(palette = "Set1",
                      drop = TRUE, limits = levels(count24$city)) +
  scale_y_continuous(limits = c(0, max(count24$count))) +
  labs(x = "Year",
       y = "Number of days with low temperature > 24°C (75°F)") +
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
p <- ggplot(data = low_and_mean, aes(x = meanTemp, y = count))
p + geom_point(aes(colour = city), size = 4) +
  scale_colour_brewer(palette = "Set1") +
  labs(x = "Mean annual temperature (°C)",
       y = "Number of days with low temperature > 18°C (65°F)") +
  guides(colour = guide_legend(title=NULL)) +
  theme_minimal(base_size = 18)

