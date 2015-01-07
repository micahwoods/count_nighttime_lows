# get Koshigaya & Sanda data from 2010 through 2014

# make this as automatic as possible for my case of
# 2010 to 2014, Sanda and Koshigaya

# set year as XXXX
# set month as MM

sanda_base <- "http://www.data.jma.go.jp/obd/stats/etrn/view/daily_a1.php?prec_no=63&block_no=0969&year=XXXX&month=MM&day=&view="

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

results$address <- as.character(results$address)
results$j <- as.numeric(as.character(results$j))

sanda5years <- data.frame()

for (i in 1:4) {
  sandaTables <- readHTMLTable(results[[i, 2]])
  month <- sandaTables[[2]]
  month$count <- i
  month$ticker.month <- results[[i, 1]]
  sanda5years <- rbind(sanda5years, month)
}

# clean the data
full.sanda <- as.data.frame(sanda5years[, c(1, 5, 6, 7, 17)])
colnames(full.sanda) <- c("date", "mean.temp", "high", "low", "count")
full.sanda$date <- as.numeric(as.character(full.sanda$date), as.is = TRUE)
full.sanda$mean.temp <- as.numeric(as.character(full.sanda$mean.temp), as.is = TRUE)
full.sanda$low <- as.numeric(as.character(full.sanda$low), as.is = TRUE)
full.sanda$high <- as.numeric(as.character(full.sanda$high), as.is = TRUE)

# make vector to figure out what is missing
original <- full.sanda$date

# remove the not necessary rows
full.sanda <- subset(full.sanda, mean.temp > -279)

after <- full.sanda$date

original[!(original %in% after)]

# make a date vector of 2010-1-1 to 2014-12-31
days <- as.numeric(length(full.sanda$mean.temp))
add.vector <- c(1:(days))
start <- ymd("2010-01-01")
daily.vector <- start + (days(add.vector) - 1)

# can figure this out by days, pasted, then check for match
# for now quick plot and count

full.sanda <- as.data.frame(cbind(full.sanda, daily.vector))

p <- ggplot(data = full.sanda, aes(x = daily.vector, y = low))
p + geom_point()

# to clean the data, just merge 2 columns and then sort by them
