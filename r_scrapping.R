# version 1
install.packages(rvest)
library(rvest)
csv_wiki <- read_html("https://en.wikipedia.org/wiki/Comma-separated_values")
csv_nodes <- html_nodes(csv_wiki, xpath = '//*[@id="mw-content-text"]/div[1]/pre[1]')
html_text(csv_nodes)
csv_tables <- csv_wiki %>% 
  html_nodes(xpath = '//*[@id="mw-content-text"]/div[1]/pre[1]/text()') %>%
  html_text()
write.table(csv_tables, file="car.csv", quote=FALSE, col.names=FALSE, row.names=FALSE) # to create csv file named car.csv
read.csv("car.csv") # to read the csv file 

# version 2 
install.packages(rvest)
library(rvest)
html <- read_html("https://en.wikipedia.org/wiki/Comma-separated_values")
csv_data <- html %>%
  html_elements(xpath='//*[@id="mw-content-text"]/div[1]/pre[1]/text()') %>%
  html_text()

table1a <- html %>%
  html_nodes(xpath='//*[@id="mw-content-text"]/div[1]/table[3]') %>%
  html_table()

table1b <- html %>%
  html_elements(xpath='//*[@id="mw-content-text"]/div[1]/table[3]') %>%
  html_table()

write.csv(table1a, file="car_table.csv", row.names=FALSE)
read.csv("car_table.csv")

table2 <- html %>%
  html_elements(css="table") %>%
  html_table() # parse html table to data frame
table2[[6]]

table3 <- html %>%
  html_elements(css="tbody") %>%
  html_table() #parse html table to data frame
table3[[6]]




