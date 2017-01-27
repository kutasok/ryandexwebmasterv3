#Позволяет получить сводную информацию о сайте.
ywGetSiteSummary <- 
  function(user_id=NULL, host_id=NULL, token=NULL){
    if(is.null(token)){
      warning("Get your api token by function ywGetToken() and argument token in function ywGetSiteSummary!");
      break
    }
    #Create GET request
    answer <- GET(paste("https://api.webmaster.yandex.net/v3/user/",
                        user_id,
                        "/hosts/",
                        host_id,
                        "/summary/",
                        sep = ""), 
                  add_headers(Authorization = paste0("OAuth ", token))
    )
    
    #Send GET request
    stop_for_status(answer)
    
    #В случае успеха сервер возвращает 200 и запрошенную статистику по сайту.
    
    dataRaw <- content(answer, "parsed", "application/json")
    
    resultData <- data.frame(tic = integer(),
                             downloaded_pages_count = integer(),
                             excluded_pages_count = integer(),
                             searchable_pages_count = integer(),
                             site_problems_fatal = integer(),
                             site_problems_critical = integer(),
                             site_problems_possible_problem = integer(),
                             site_problems_recommendation = integer(),
                             stringsAsFactors=FALSE)
    
    try(resultData[1,1] <- dataRaw$tic, silent = TRUE)
    try(resultData[1,2] <- dataRaw$downloaded_pages_count, silent = TRUE)
    try(resultData[1,3] <- dataRaw$excluded_pages_count, silent = TRUE)
    try(resultData[1,4] <- dataRaw$searchable_pages_count, silent = TRUE)
    try(resultData[1,5] <- dataRaw$site_problems$FATAL, silent = TRUE)
    try(resultData[1,6] <- dataRaw$site_problems$CRITICAL, silent = TRUE)
    try(resultData[1,7] <- dataRaw$site_problems$POSSIBLE_PROBLEM, silent = TRUE)
    try(resultData[1,8] <- dataRaw$site_problems$RECOMMENDATION, silent = TRUE)
    
    return(resultData)
  }