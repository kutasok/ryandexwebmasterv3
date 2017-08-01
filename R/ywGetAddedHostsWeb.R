#Позволяет получить все хосты, которые добавлены в Веб интерфейсе.
ywGetAddedHostsWeb <- 
  function(headers=NULL){
    if(is.null(headers)){
      warning("Пожалуйста, укажите заголовки для запросов.");
      break
    }
    
    # идем на https://webmaster.yandex.ru/sites/ чтобы достать все сайты аккаунта
    sitesHtml <- GET('https://webmaster.yandex.ru/sites/',
                     add_headers(.headers=headers));
    
    content <- content(sitesHtml, "text");
    
    
    # берем все hostId из sitesList
    # https://stackoverflow.com/questions/19757001/r-extract-json-variable-info
    tmplt <- 'sitesList.*sitesListPager'
    json <- str_extract(content, tmplt)
    sitesList <- fromJSON(gsub('sitesList":(.*),"sitesListPager', "\\1", json), 
                          simplifyVector = FALSE)
    
    addedHosts <- data.frame(stringsAsFactors = F);
    
    for(i in 1:length(sitesList)){
      if(sitesList[[i]]$addedToList == T){
        host <- data.frame(schema = sitesList[[i]]$hostname$schema,
                           hostId = sitesList[[i]]$hostname$webmasterHostId,
                           stringsAsFactors = F)
      }
      if("mirrors" %in% names(sitesList[[i]])){
        for(j in 1:length(sitesList[[i]]$mirrors)){
          if(sitesList[[i]]$mirrors[[j]]$addedToList == T){
            host <- data.frame(schema = sitesList[[i]]$mirrors[[j]]$hostname$schema,
                               hostId = sitesList[[i]]$mirrors[[j]]$hostname$webmasterHostId,
                               stringsAsFactors = F)
          }
        }
      }
      addedHosts <- rbind(addedHosts, host)
    }
    # удаляем лишние объекты
    rm(host)
    
    return(addedHosts)
}