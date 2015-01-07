# read data for Carefree, Arizona, downloaded from
# http://www.ncdc.noaa.gov/cdo-web/datasets/GHCND/locations/ZIP:85377/detail

carefree <- read.csv("data/20140105_carefree.csv",
                     sep = ",", header = TRUE)

carefree$date <- ymd(carefree$DATE)
carefree$high <- carefree$TMAX / 10
carefree$low <- carefree$TMIN / 10
carefree$mean <- (carefree$high + carefree$low) / 2
carefree$city <- "Carefree, AZ, USA"
carefree$year <- year(carefree$date)

carefree <- filter(carefree, TMAX > -9999)
carefree <- filter(carefree, TMIN > -9999)

carefree <- carefree[, c("low", "year", "city", "mean", "high", "date")]

more <- read.csv("data/AGS_JAX_TYS_Farmingdale.csv",
                 sep = ",", header = TRUE)

more$date <- ymd(more$DATE)
more$year <- year(more$date)
more$high <- more$TMAX / 10
more$low <- more$TMIN / 10
more$mean <- (more$high + more$low) / 2

tys <- filter(more, STATION_NAME == "KNOXVILLE MCGHEE TYSON AIRPORT TN US" &
                 TMIN > -9999)

tys$city <- "Knoxville, TN, USA"
tys <- tys[, c("low", "year", "city", "mean", "high", "date")]

jb <- filter(more, STATION_NAME == "JACKSONVILLE BEACH FL US" &
                TMIN > -9999)

jb$city <- "Jacksonville Beach, FL, USA"
jb <- jb[, c("low", "year", "city", "mean", "high", "date")]

aug <- filter(more, STATION_NAME == "AUGUSTA DANIEL FIELD AIRPORT GA US" &
                TMIN > -9999)

aug$city <- "Augusta, GA, USA"
aug <- aug[, c("low", "year", "city", "mean", "high", "date")]

ny <- filter(more, STATION_NAME == "FARMINGDALE REPUBLIC AIRPORT NY US" &
               TMIN > -9999)

ny$city <- "Farmingdale, NY, USA"
ny <- ny[, c("low", "year", "city", "mean", "high", "date")]




