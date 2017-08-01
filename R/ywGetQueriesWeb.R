#ѕозвол€ет получить все запросы определенного хоста из ¬еб интерфейса.
ywGetQueriesWeb <- 
  function(headers = NULL, hostId = NULL){
    if(is.null(headers)){
      warning("ѕожалуйста, укажите заголовки дл€ запросов.");
      break
    }
    searchStatistics <- GET(paste0('https://webmaster.yandex.ru/site/',
                                   hostId,
                                   '/search/statistics/'),
                            add_headers(.headers=headers));
    
    content <- content(searchStatistics, "text");
    
    #write(content, 'test.txt')
    
    # достаем dateFrom и  dateTo из routeParams
    tmpltDateFrom <- 'name="dateFrom" value=".*?"'
    dateFrom <- gsub('name="dateFrom" value="(.*)"', "\\1", str_extract(content, tmpltDateFrom))
    
    tmpltDateTo <- 'name="dateTo" value=".*?"'
    dateTo <- gsub('name="dateTo" value="(.*)"', "\\1", str_extract(content, tmpltDateTo))
    
    tmpltCrc <- 'crc=.*?&quot;'
    crc <- gsub('crc=(.*)&quot;', "\\1", str_extract(content, tmpltCrc))
    
    tmpltBalancer <- '"balancerRequestId":".*?"'
    balancer <- gsub('"balancerRequestId":"(.*)"', "\\1", str_extract(content, tmpltBalancer))
    
    
    parentUrl <- paste0('https://webmaster.yandex.ru/site/',
                        hostId,
                        '/search/statistics/?deviceType=ALL_DEVICES',
                        '&dateFrom=',
                        dateFrom,
                        '&dateTo=',
                        dateTo,
                        '&period=DAY&orderBy=total-shows-count&orderDirection=desc');
    
    body <- list(
      'params[balancerParentRequestId]'=balancer,
      'params[parentUrl]'=parentUrl,
      'params[hostId]'=hostId,
      'params[exportFormat]'= 'csv',
      'params[filters][specialGroup]'='TOP_3000_QUERIES',
      'params[deviceType]'='ALL_DEVICES',
      'params[dateFrom]'=dateFrom,
      'params[dateTo]'=dateTo,
      'params[period]'='DAY',
      'crc'=crc
    )
    
    aggregateAnswer <- POST("https://webmaster.yandex.ru/gate/sean-queries-statistics/aggregate-download/",
                            add_headers(.headers=headers),
                            body = body,
                            encode = "form");
    aggregateContent <- content(aggregateAnswer, "text");
    
    # пауза 5 секунд чтобы сгенерировалс€ URL
    Sys.sleep(5)
    
    # еще один запрос
    aggregateAnswer <- POST("https://webmaster.yandex.ru/gate/sean-queries-statistics/aggregate-download/",
                            add_headers(.headers=headers),
                            body = body,
                            encode = "form");
    # проверка наличи€ publicUrlMds
    aggregateContent <- content(aggregateAnswer, "text");
    
    contentJson <- fromJSON(aggregateContent)
    print(contentJson)
    
    # провер€ем ответ на ошибку
    if("eror" %in% names(contentJson[[1]])){
      return('error')
    }
    
    # если есть URL, делаем запрос на него
    publicUrlMds <- contentJson[[1]]$downloadInfo$publicUrlMds;
    
    try(queries <- read.csv(url(publicUrlMds)))
    
    return(queries);
}