#Позволяет получить идентификатор пользователя. 
#Этот идентификатор затем потребуется для вызова любых ресурсов API.
ywGetUserId <- 
  function(token=NULL){
    if(is.null(token)){
      warning("Get your api token by function ywGetToken() and argument token in function ywGetId!");
      break
    }
    #Create GET request
    answer <- GET("https://api.webmaster.yandex.net/v3/user/", add_headers(Authorization = paste0("OAuth ", token)))

    #Send GET request
    stop_for_status(answer)
    dataRaw <- content(answer, "parsed", "application/json")
    ywId <- dataRaw$user_id
    return(ywId)
  }