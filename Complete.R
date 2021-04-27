complete <-function(directory,id = 1:332)
{
  
  #This part of coding is for reading the file(s).csv
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
    #create a list to save the files into it in order to be able to operate.
    #list.spec <- rbind(list.spec,specdata)
    num <- 0
    for (j in 1:nrow(specdata)){
      if (is.na(specdata[j,"sulfate"])||is.na(specdata[j,"nitrate"]))
      {
        #if one of them in the above arguments is true then do nothing
        NULL
      }
      else
        # count it 
      {num<-num+1
      }
    }
    # data frame
    data.spec<-rbind(data.spec,c(i,num))
  }
  names(data.spec)<-c("id","nobs")
  print(data.spec)
}

# call the function
#complete("specdata",1:10)
