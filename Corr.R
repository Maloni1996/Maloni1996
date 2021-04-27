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
        NULL
      }
      else
      {num<-num+1
      }
    }
    data.spec<-rbind(data.spec,c(i,num))
  }
  names(data.spec)<-c("id","nobs")
  data.spec
}
corr<-function(directory, threshold = 0)
{
  p = complete(directory,1:332)
  data.spec<-c()
  df<-data.frame()
  for (i in (1:nrow(p)))
  {
    if (p[i,"nobs"] > threshold)
      
    {
      if(p[i,"id"]<10)
        il<-paste(directory,"/","00",p[i,"id"],".csv",sep= "")
      else if(p[i,"id"]<100)
      {
        il<-paste(directory,"/","0",p[i,"id"],".csv",sep= "")
        
      }
      else{
        il<-paste(directory,"/",p[i,"id"],".csv",sep= "")
        
      }
      
      specdata <-read.csv(file=il)
      for (j in 1:nrow(specdata)){
        if (is.na(specdata[j,"sulfate"])||is.na(specdata[j,"nitrate"]))
        {
          NULL
        }
        else
        {
          df=rbind(df,c(specdata[j,"sulfate"] ,specdata[j,"nitrate"]))
          
        }
        
        #print(specdata["sulfate"])
        #print(df)
        
        
        
      }
      names(df)<-c("sulfate","nitrate")
      
      # save the number to the vector
      a= cor(df["sulfate"],df["nitrate"])
      
      data.spec<-c(data.spec,a)
      # delete the existing df (data.frame) in order to create  new one for the next df.
      rm(df)
      df<-data.frame()
      
      
      
    }
    
  }
  #return of the result
  data.spec}


#corr("specdata",900)
