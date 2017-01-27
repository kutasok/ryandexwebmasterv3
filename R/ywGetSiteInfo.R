#Позволяет получить информацию о текущем состоянии индексирования сайта.
ywGetSiteInfo <- 
  function(user_id=NULL, host_id=NULL, token=NULL){
    if(is.null(token)){
      warning("Get your api token by function ywGetToken() and argument token in function ywGetSiteInfo!");
      break
    }
    #Create GET request
    answer <- GET(paste("https://api.webmaster.yandex.net/v3/user/",
                         user_id,
                         "/hosts/",
                        host_id,
                        sep = ""), 
                   add_headers(Authorization = paste0("OAuth ", token))
                   )
    
    #Send GET request
    stop_for_status(answer)
    
    #В случае успеха сервер вернет 200 OK и данные о сайте (если сайт подтвержден).
    
    dataRaw <- content(answer, "parsed", "application/json")
    
    resultData <- data.frame(host_id = character(),
                             verified = character(),
                             ascii_host_url = character(),
                             unicode_host_url = character(),
                             main_mirror = character(),
                             host_data_status = character(),
                             host_display_name = character(),
                             stringsAsFactors=FALSE)
    
    try(resultData[1,1] <- dataRaw$host_id, silent = TRUE)
    try(resultData[1,2] <- dataRaw$verified, silent = TRUE)
    try(resultData[1,3] <- dataRaw$ascii_host_url, silent = TRUE)
    try(resultData[1,4] <- dataRaw$unicode_host_url, silent = TRUE)
    try(resultData[1,5] <- dataRaw$main_mirror$host_id, silent = TRUE)
    try(resultData[1,6] <- dataRaw$host_data_status, silent = TRUE)
    try(resultData[1,7] <- dataRaw$host_display_name, silent = TRUE)

    return(resultData)
  }