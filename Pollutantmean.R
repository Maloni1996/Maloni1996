pollutantmean <-function(directory,pollutant, id = 1:332)
{
  
  #This part of coding is store data into a data frame.
  data.spec<-data.frame()
  for (i in id)
  {
    if(i<10)
      il<-paste(directory,"/","00",i,".csv",sep= "")
    else if(i<100)
    {
      il<-paste(directory,"/","0",i,".csv",sep= "")
      
    }
    else{
      il<-paste(directory,"/",i,".csv",sep= "")
      
    }
    
    specdata <-read.csv(file=il)
    #rbind (r stands for row) add rows together toa single data frame. 
    data.spec <- rbind(data.spec,specdata)
  }
  # put the one element which is sulfate from pollutant into vector aa.
  aa=data.spec[[pollutant]]
  bad <-is.na(aa)
  
  #delete the NA and save the output back to vector "aa"
  aa<-aa[!bad]
  
  # calculate the mean
  mean(aa)
  
}
#call the function to test the programme
#pollutantmean("specdata", "sulfate", 1:332)
