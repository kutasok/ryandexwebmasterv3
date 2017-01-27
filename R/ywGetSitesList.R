#Позволяет получить список сайтов, добавленных пользователем, и сводную информацию о каждом из них.
ywGetSitesList <- 
  function(user_id=NULL, token=NULL){
    if(is.null(token)){
      warning("Get your api token by function ywGetToken() and argument token in function ywGetSitesList!");
      break
    }
    #Create GET request
    answer <- GET(paste("https://api.webmaster.yandex.net/v3/user/",
                        user_id,
                        "/hosts/",sep = ""), 
                  add_headers(Authorization = paste0("OAuth ", token)))
    
    #Send GET request
    stop_for_status(answer)
    dataRaw <- content(answer, "parsed", "application/json")
    
    resultData <- data.frame(host_id = character(),
                             ascii_host_url = character(),
                             unicode_host_url = character(),
                             verified = character(),
                             main_mirror = character(),
                             stringsAsFactors=FALSE)
    
    for (i in 1:length(dataRaw$hosts)){
      try(resultData[i,1] <- dataRaw$hosts[[i]]$host_id, silent = TRUE)
      try(resultData[i,2] <- dataRaw$hosts[[i]]$ascii_host_url, silent = TRUE)
      try(resultData[i,3] <- dataRaw$hosts[[i]]$unicode_host_url, silent = TRUE)
      try(resultData[i,4] <- dataRaw$hosts[[i]]$verified, silent = TRUE)
      try(resultData[i,5] <- dataRaw$hosts[[i]]$main_mirror$host_id, silent = TRUE)
    }

    return(resultData)
  }