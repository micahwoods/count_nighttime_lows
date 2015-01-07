# read and prepare the data downloaded by sanda_koshigaya.R
# from the JMA historical weather data page

koshigaya <- read.csv("data/koshigaya.csv",
                      sep = ",", header = TRUE)

koshigaya$date <- ymd(as.character(koshigaya$date))
colnames(koshigaya) <- c("day", "mean", "high",
                         "low", "month", "year", "date")
koshigaya$city <- "Koshigaya, Saitama, Japan"
koshigaya <- koshigaya[, c("low", "year", "city", "mean", "high", "date")]

# now read in and prepare Sanda
sanda <- read.csv("data/sanda.csv",
                      sep = ",", header = TRUE)

sanda$date <- ymd(as.character(sanda$date))
colnames(sanda) <- c("day", "mean", "high",
                         "low", "month", "year", "date")
sanda$city <- "Sanda, Hyogo, Japan"
sanda <- sanda[, c("low", "year", "city", "mean", "high", "date")]