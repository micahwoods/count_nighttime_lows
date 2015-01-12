# read and prepare the sydney data
# data from observatory hill station
# http://www.bom.gov.au/climate/data/stations/

syd_high <- read.csv("data/sydney_high.csv",
                     sep = ",", header = TRUE)

syd_low <- read.csv("data/sydney_low.csv",
                     sep = ",", header = TRUE)

syd_high$date <- ymd(paste(syd_high$Year, syd_high$Month, syd_high$Day,
                           sep = "-"))

syd_low$date <- ymd(paste(syd_low$Year, syd_low$Month, syd_low$Day,
                           sep = "-"))

# choose date range to work with
start <- ymd("1859-07-01")
end <- ymd("2014-12-31")
summerEnd <- ymd("2014-06-30")

syd_high <- filter(syd_high, date <= end)

syd_low <- filter(syd_low, date <= end)

syd <- cbind.data.frame(syd_low$Minimum.temperature..Degree.C., syd_low$Year,
                        syd_high$Maximum.temperature..Degree.C., syd_high$date)

colnames(syd) <- c("low", "year", "high", "date")
syd$mean <- (syd$low + syd$high) / 2

syd$city <- "Sydney, NSW, Australia"

syd <- syd[, c("low", "year", "city", "mean", "high", "date")]

# annual means
sydHigh <- syd %>%
  group_by(year) %>%
  summarise(mean(high, na.rm = TRUE),
            mean(mean, na.rm = TRUE),
            mean(low, na.rm = TRUE))

colnames(sydHigh) <- c("year", "high", "mean", "low")

sydHigh$highF <- "High"
sydHigh$meanF <- "Mean"
sydHigh$lowF <- "Low"

  # plot sydney means since 1859
  p <- ggplot(data = sydHigh, aes(x = year, y = high))
  p + geom_point(aes(colour = highF)) +
  geom_line(size = 0.2, aes(colour = highF)) +
  geom_point(data = sydHigh, aes(x = year, y = mean,
                                    colour = meanF)) +
  geom_line(data = sydHigh, size = 0.2, aes(x = year, y = mean,
                                               colour = meanF)) +
  geom_point(data = sydHigh, aes(x = year, y = low,
                                    colour = lowF)) +
  geom_line(data = sydHigh, size = 0.2, aes(x = year, y = low,
                                               colour = lowF)) +
  scale_y_continuous(limits = c(0, max(sydHigh$high))) +
  scale_x_continuous(limits = c(1859, 2014),
                     breaks = seq(1850, 2020, 10)) +
  labs(x = "Year",
       y = "Temperature (°C)",
       title = "Sydney Mean Annual Temperatures\n1859 to 2014") +
  scale_colour_brewer(palette = "Set1", name = "") +
  theme_minimal(base_size = 18)


# re-arrange summer-year to be July 1 to 30 June

sydSummer <- filter(syd, date >= start &
                      date <= summerEnd)
sydSummer$month <- month(sydSummer$date)

sydSummer$season <- (ifelse(sydSummer$month <= 6, 
                      paste(sydSummer$year - 1, sydSummer$year, sep = "-"),
                      paste(sydSummer$year, sydSummer$year + 1, sep = "-")))

sydSummer$season1 <- ifelse(sydSummer$month <= 6, 
                            sydSummer$year,
                            sydSummer$year)


low21 <- filter(sydSummer, low > 21)

count21 <- low21 %>%
  group_by(season1) %>%
  summarise(length(low))

colnames(count21) <- c("season", "count")

p <- ggplot(data = count21, aes(x = season, y = count))
p + geom_point() + 
   geom_smooth(se = FALSE) +
  labs(x = "Year",
       y = "Number of days in the summer with low > 21°C (70°F)",
       title = "Sydney, Duration of Summer Heat Stress, 1860 to 2014") +
  theme_minimal(base_size = 18)

# what is the hottest month on average since 1859?

syd$month <- month(syd$date)

months <- syd %>%
  group_by(month) %>%
  summarise(mean(mean, na.rm = TRUE))

# jan is hottest, barely

january <- filter(syd, month == 1)

janMeans <- january %>%
  group_by(year) %>%
  summarise(mean(low, na.rm = TRUE),
            mean(mean, na.rm = TRUE),
            mean(high, na.rm = TRUE))

colnames(janMeans) <- c("year", "low", "mean", "high")

janMeans$highF <- "High"
janMeans$meanF <- "Mean"
janMeans$lowF <- "Low"

# plot sydney means since 1859
p <- ggplot(data = janMeans, aes(x = year, y = high))
p + geom_point(aes(colour = highF)) +
  geom_line(size = 0.2, aes(colour = highF)) +
  geom_point(data = janMeans, aes(x = year, y = mean,
                                 colour = meanF)) +
  geom_line(data = janMeans, size = 0.2, aes(x = year, y = mean,
                                            colour = meanF)) +
  geom_point(data = janMeans, aes(x = year, y = low,
                                 colour = lowF)) +
  geom_line(data = janMeans, size = 0.2, aes(x = year, y = low,
                                            colour = lowF)) +
  scale_y_continuous(limits = c(0, max(janMeans$high))) +
  scale_x_continuous(limits = c(1859, 2014),
                     breaks = seq(1850, 2020, 10)) +
  labs(x = "Year",
       y = "Temperature (°C)",
       title = "Sydney Mean January Temperatures\n1859 to 2014") +
  scale_colour_brewer(palette = "Set1", name = "") +
  theme_minimal(base_size = 18)
