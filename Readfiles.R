polllutantmean <-function(directory, pollutant, id= 1:332)

# create a an for loop to read the .csv files

for (i in id)
{
  if (1<10)
    il <-paste(directory,"/", "00",i, ".csv", sep= "")
  else if (i<100)
  {
    il <-paste(directory,"/","0",i,".csv", sep= "")
  }
  else{
    il<-paste(directory, "/",i,".csv", sep= "")
  }
}

  specdata <-read.csv(file=il)
