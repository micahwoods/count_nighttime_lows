# read and prepare the sydney data

syd_high <- read.csv("data/sydney_high.csv",
                     sep = ",", header = TRUE)

syd_low <- read.csv("data/sydney_low.csv",
                     sep = ",", header = TRUE)

syd_high$date <- ymd(paste(syd_high$Year, syd_high$Month, syd_high$Day,
                           sep = "-"))

syd_low$date <- ymd(paste(syd_low$Year, syd_low$Month, syd_low$Day,
                           sep = "-"))

# choose date range to work with
start <- ymd("2010-01-01")
end <- ymd("2014-12-31")

syd_high <- filter(syd_high, date >= start &
                     date <= end)

syd_low <- filter(syd_low, date >= start &
                    date <= end)

syd <- cbind.data.frame(syd_low$Minimum.temperature..Degree.C., syd_low$Year,
                        syd_high$Maximum.temperature..Degree.C., syd_high$date)

colnames(syd) <- c("low", "year", "high", "date")
syd$mean <- (syd$low + syd$high) / 2

syd$city <- "Sydney, NSW, Australia"

syd <- syd[, c("low", "year", "city", "mean", "high", "date")]
