# get Koshigaya & Sanda data from 2010 through 2014

# make this as automatic as possible for my case of
# 2010 to 2014, Sanda and Koshigaya

# set year as XXXX
# set month as MM

sanda_base <- "http://www.data.jma.go.jp/obd/stats/etrn/view/daily_a1.php?prec_no=63&block_no=0969&year=XXXX&month=MM&day=&view="
koshigaya_base <- "http://www.data.jma.go.jp/obd/stats/etrn/view/daily_a1.php?prec_no=43&block_no=0364&year=XXXX&month=MM&day=1&view="

sanda <- vector(mode ="character", length(5))

for (i in 1:5) {
  year <- 2009 + i
  address <- gsub("XXXX", year, sanda_base)
  sanda[[i]] <- address
}

results <- data.frame()

for(j in (1:12)) {
    address <- gsub("MM", j, sanda)
    newline <- cbind(j, address)
    results <- rbind(results, newline)
  }

year <- rep(2010:2014, times = 12)

results$address <- as.character(results$address)
results$month <- as.numeric(as.character(results$j))
results$year <- year

sanda5years <- data.frame()

for (i in 1:60) {
  sandaTables <- readHTMLTable(results[[i, 2]])
  weather.data <- sandaTables[[2]]
  weather.data$month <- results[[i, 1]]
  weather.data$year <- results[[i, 4]]
  sanda5years <- rbind(sanda5years, weather.data)
}

# clean the data
full.sanda <- as.data.frame(sanda5years[, c(1, 5, 6, 7, 17, 18)])
colnames(full.sanda) <- c("day", "mean.temp", "high", "low", "month", "year")
full.sanda$day <- as.numeric(as.character(full.sanda$day), as.is = TRUE)
full.sanda$mean.temp <- as.numeric(as.character(full.sanda$mean.temp), as.is = TRUE)
full.sanda$low <- as.numeric(as.character(full.sanda$low), as.is = TRUE)
full.sanda$high <- as.numeric(as.character(full.sanda$high), as.is = TRUE)
full.sanda$month <- as.numeric(as.character(full.sanda$month))

# remove the not necessary rows
full.sanda <- subset(full.sanda, mean.temp > -279)

# paste date to 1 variable
full.sanda$date <- ymd(paste(full.sanda$year, full.sanda$month,
                             full.sanda$day, sep = "-"))

