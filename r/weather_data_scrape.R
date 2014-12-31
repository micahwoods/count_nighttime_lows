# this scrapes the data for various cities 

athens_2010 <- read.csv('http://www.wunderground.com/history/airport/KAHN/2010/1/1/CustomHistory.html?dayend=31&monthend=12&yearend=2010&req_city=NA&req_state=NA&req_statename=NA%22&format=1',
                        header = TRUE)

athens_2011 <- read.csv('http://www.wunderground.com/history/airport/KAHN/2011/1/1/CustomHistory.html?dayend=31&monthend=12&yearend=2011&req_city=NA&req_state=NA&req_statename=NA%22&format=1',
                        header = TRUE)

athens_2012 <- read.csv('http://www.wunderground.com/history/airport/KAHN/2012/1/1/CustomHistory.html?dayend=31&monthend=12&yearend=2012&req_city=NA&req_state=NA&req_statename=NA%22&format=1',
                        header = TRUE)

athens_2013 <- read.csv('http://www.wunderground.com/history/airport/KAHN/2013/1/1/CustomHistory.html?dayend=31&monthend=12&yearend=2013&req_city=NA&req_state=NA&req_statename=NA%22&format=1',
                        header = TRUE)

athens_2014 <- read.csv('http://www.wunderground.com/history/airport/KAHN/2014/1/1/CustomHistory.html?dayend=31&monthend=12&yearend=2014&req_city=NA&req_state=NA&req_statename=NA%22&format=1',
                        header = TRUE)

NRT_2010 <- read.csv('http://www.wunderground.com/history/airport/RJAA/2010/1/1/CustomHistory.html?dayend=31&monthend=12&yearend=2010&req_city=NA&req_state=NA&req_statename=NA%22&format=1',
                     header = TRUE)

NRT_2011 <- read.csv('http://www.wunderground.com/history/airport/RJAA/2011/1/1/CustomHistory.html?dayend=31&monthend=12&yearend=2011&req_city=NA&req_state=NA&req_statename=NA%22&format=1',
                     header = TRUE)

NRT_2012 <- read.csv('http://www.wunderground.com/history/airport/RJAA/2012/1/1/CustomHistory.html?dayend=31&monthend=12&yearend=2012&req_city=NA&req_state=NA&req_statename=NA%22&format=1',
                     header = TRUE)

NRT_2013 <- read.csv('http://www.wunderground.com/history/airport/RJAA/2013/1/1/CustomHistory.html?dayend=31&monthend=12&yearend=2013&req_city=NA&req_state=NA&req_statename=NA%22&format=1',
                     header = TRUE)

NRT_2014 <- read.csv('http://www.wunderground.com/history/airport/RJAA/2014/1/1/CustomHistory.html?dayend=31&monthend=12&yearend=2014&req_city=NA&req_state=NA&req_statename=NA%22&format=1',
                     header = TRUE)

pdx_2010 <- read.csv('http://www.wunderground.com/history/airport/KPDX/2010/1/1/CustomHistory.html?dayend=31&monthend=12&yearend=2010&req_city=NA&req_state=NA&req_statename=NA%22&format=1',
                     header = TRUE)

pdx_2011 <- read.csv('http://www.wunderground.com/history/airport/KPDX/2011/1/1/CustomHistory.html?dayend=31&monthend=12&yearend=2011&req_city=NA&req_state=NA&req_statename=NA%22&format=1',
                     header = TRUE)

pdx_2012 <- read.csv('http://www.wunderground.com/history/airport/KPDX/2012/1/1/CustomHistory.html?dayend=31&monthend=12&yearend=2012&req_city=NA&req_state=NA&req_statename=NA%22&format=1',
                     header = TRUE)

pdx_2013 <- read.csv('http://www.wunderground.com/history/airport/KPDX/2013/1/1/CustomHistory.html?dayend=31&monthend=12&yearend=2013&req_city=NA&req_state=NA&req_statename=NA%22&format=1',
                     header = TRUE)

pdx_2014 <- read.csv('http://www.wunderground.com/history/airport/KPDX/2014/1/1/CustomHistory.html?dayend=31&monthend=12&yearend=2014&req_city=NA&req_state=NA&req_statename=NA%22&format=1',
                     header = TRUE)

tys_2010 <- read.csv('http://www.wunderground.com/history/airport/KTYS/2010/1/1/CustomHistory.html?dayend=31&monthend=12&yearend=2010&req_city=NA&req_state=NA&req_statename=NA%22&format=1',
                     header = TRUE)

tys_2011 <- read.csv('http://www.wunderground.com/history/airport/KTYS/2011/1/1/CustomHistory.html?dayend=31&monthend=12&yearend=2011&req_city=NA&req_state=NA&req_statename=NA%22&format=1',
                     header = TRUE)

tys_2012 <- read.csv('http://www.wunderground.com/history/airport/KTYS/2012/1/1/CustomHistory.html?dayend=31&monthend=12&yearend=2012&req_city=NA&req_state=NA&req_statename=NA%22&format=1',
                     header = TRUE)

tys_2013 <- read.csv('http://www.wunderground.com/history/airport/KTYS/2013/1/1/CustomHistory.html?dayend=31&monthend=12&yearend=2013&req_city=NA&req_state=NA&req_statename=NA%22&format=1',
                     header = TRUE)

tys_2014 <- read.csv('http://www.wunderground.com/history/airport/KTYS/2014/1/1/CustomHistory.html?dayend=31&monthend=12&yearend=2014&req_city=NA&req_state=NA&req_statename=NA%22&format=1',
                     header = TRUE)

itm_2010 <- read.csv('http://www.wunderground.com/history/airport/RJOO/2010/1/1/CustomHistory.html?dayend=31&monthend=12&yearend=2010&req_city=NA&req_state=NA&req_statename=NA%22&format=1',
                     header = TRUE)

itm_2011 <- read.csv('http://www.wunderground.com/history/airport/RJOO/2011/1/1/CustomHistory.html?dayend=31&monthend=12&yearend=2011&req_city=NA&req_state=NA&req_statename=NA%22&format=1',
                     header = TRUE)

itm_2012 <- read.csv('http://www.wunderground.com/history/airport/RJOO/2012/1/1/CustomHistory.html?dayend=31&monthend=12&yearend=2012&req_city=NA&req_state=NA&req_statename=NA%22&format=1',
                     header = TRUE)

itm_2013 <- read.csv('http://www.wunderground.com/history/airport/RJOO/2013/1/1/CustomHistory.html?dayend=31&monthend=12&yearend=2013&req_city=NA&req_state=NA&req_statename=NA%22&format=1',
                     header = TRUE)

itm_2014 <- read.csv('http://www.wunderground.com/history/airport/RJOO/2014/1/1/CustomHistory.html?dayend=31&monthend=12&yearend=2014&req_city=NA&req_state=NA&req_statename=NA%22&format=1',
                     header = TRUE)

jfk_2010 <- read.csv('http://www.wunderground.com/history/airport/KJFK/2010/1/1/CustomHistory.html?dayend=31&monthend=12&yearend=2010&req_city=NA&req_state=NA&req_statename=NA%22&format=1',
                     header = TRUE)

jfk_2011 <- read.csv('http://www.wunderground.com/history/airport/KJFK/2011/1/1/CustomHistory.html?dayend=31&monthend=12&yearend=2011&req_city=NA&req_state=NA&req_statename=NA%22&format=1',
                     header = TRUE)

jfk_2012 <- read.csv('http://www.wunderground.com/history/airport/KJFK/2012/1/1/CustomHistory.html?dayend=31&monthend=12&yearend=2012&req_city=NA&req_state=NA&req_statename=NA%22&format=1',
                     header = TRUE)

jfk_2013 <- read.csv('http://www.wunderground.com/history/airport/KJFK/2013/1/1/CustomHistory.html?dayend=31&monthend=12&yearend=2013&req_city=NA&req_state=NA&req_statename=NA%22&format=1',
                     header = TRUE)

jfk_2014 <- read.csv('http://www.wunderground.com/history/airport/KJFK/2014/1/1/CustomHistory.html?dayend=31&monthend=12&yearend=2014&req_city=NA&req_state=NA&req_statename=NA%22&format=1',
                     header = TRUE)

athens <- as.data.frame(rbind(athens_2010, athens_2011, 
                              athens_2012, athens_2013,
                              athens_2014))

tokyo <- as.data.frame(rbind(NRT_2010, NRT_2011,
                             NRT_2012, NRT_2013,
                             NRT_2014))

portland <- as.data.frame(rbind(pdx_2010, pdx_2011,
                                pdx_2012, pdx_2013,
                                pdx_2014))

knoxville <- as.data.frame(rbind(tys_2010, tys_2011,
                                 tys_2012, tys_2013,
                                 tys_2014))

osaka <- as.data.frame(rbind(itm_2010, itm_2011,
                             itm_2012, itm_2013,
                             itm_2014))

ny <- as.data.frame(rbind(jfk_2010, jfk_2011,
                          jfk_2012, jfk_2013,
                          jfk_2014))

athens$year <- year(as.character(athens$EST))
tokyo$year <- year(as.character(tokyo$JST))
portland$year <- year(as.character(portland$PST))
knoxville$year <- year(as.character(knoxville$EST))
osaka$year <- year(as.character(osaka$JST))
ny$year <- year(as.character(ny$EST))

athens$city <- "Athens, GA, USA"
tokyo$city <- "Tokyo, Japan"
portland$city <- "Portland, OR, USA"
knoxville$city <- "Knoxville, TN, USA"
osaka$city <- "Osaka, Japan"
ny$city <- "New York, NY, USA"

athens <- cbind(athens$Min.TemperatureC, athens$year, athens$city, 
                athens$Mean.TemperatureC)
tokyo <- cbind(tokyo$Min.TemperatureC, tokyo$year, tokyo$city, 
               tokyo$Mean.TemperatureC)
portland <- cbind(portland$Min.TemperatureC, portland$year, portland$city,
                  portland$Mean.TemperatureC)
knoxville <- cbind(knoxville$Min.TemperatureC, knoxville$year, 
                   knoxville$city, knoxville$Mean.TemperatureC)
osaka <- cbind(osaka$Min.TemperatureC, osaka$year, osaka$city,
               osaka$Mean.TemperatureC)
ny <- cbind(ny$Min.TemperatureC, ny$year, ny$city, ny$Mean.TemperatureC)

# write the output to the data folder so that these analyses
# can be completed and charts generated without internet access

# write.table(athens, "data/athens.csv", sep = ",", row.names = FALSE)
# write.table(tokyo, "data/tokyo.csv", sep = ",", row.names = FALSE)
# write.table(portland, "data/portland.csv", sep = ",", row.names = FALSE)
# write.table(knoxville, "data/knoxville.csv", sep = ",", row.names = FALSE)
# write.table(osaka, "data/osaka.csv", sep = ",", row.names = FALSE)
# write.table(ny, "data/ny.csv", sep = ",", row.names = FALSE)

