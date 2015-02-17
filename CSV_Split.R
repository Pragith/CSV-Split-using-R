###########################################
##  Title:    Split CSV using R
##  Packages: none
##  Author:   @PragithP
##  License:  WTFPL (http://wtfpl.net/)
##  Todo:     Implement merge to one Excel workbook after split
###########################################



####  User Configuration  ####

filename = "sample"
row_limit = 10000

##############################

##  Read source CSV
data = read.csv(paste(filename,".csv",sep=""))
#library(data.table)
#data = fread(paste(filename,".csv",sep=""), header = T, sep = ',')


##  Count Total rows and decide how many splits to be done based on row limit specified
total_rows = nrow(data)
splits = length(floor(seq(1, total_rows, length.out=total_rows/row_limit+1)))-1

##  Split the source CSV and write splitted CSVs as output
split_num = floor(seq(1, total_rows, length.out=splits+1))
for (i in 1:splits){
  write.csv(data[split_num[i]:split_num[i+1],], paste(filename," -- ",i,".csv"), row.names=FALSE)
}
