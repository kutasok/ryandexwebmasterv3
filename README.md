# r-yandex-webmaster-v3 - пакет для работы с API Яндекс Вебмастера версии 3.0 на языке R.

##Содержание
* [Краткое описание](https://github.com/kutasok/r-yandex-webmaster-v3/blob/master/README.md#Краткое-описание)
* [Установка пакета r-yandex-webmaster-v3](https://github.com/kutasok/r-yandex-webmaster-v3/blob/master/README.md#Установка-пакета-r-yandex-webmaster-v3)
* [Функции входящие в пакет r-yandex-webmaster-v3](https://github.com/kutasok/r-yandex-webmaster-v3/blob/master/README.md#Функции-входящие-в-пакет-r-yandex-webmaster-v3)
* [ywGetToken](https://github.com/kutasok/r-yandex-webmaster-v3/blob/master/README.md#ywgettoken)
* [ywGetUserId](https://github.com/kutasok/r-yandex-webmaster-v3/blob/master/README.md#ywgetuseridtokennull)
* [ywGetSitesList](https://github.com/kutasok/r-yandex-webmaster-v3/blob/master/README.md#ywgetsiteslistuser_idnull-tokennull)
* [ywAddSite](https://github.com/kutasok/r-yandex-webmaster-v3/blob/master/README.md#ywaddsitehost-user_idnull-tokennull)
* [ywDeleteSite](https://github.com/kutasok/r-yandex-webmaster-v3/blob/master/README.md#ywdeletesitehost_id-user_idnull-tokennull)
* [ywGetSiteInfo](https://github.com/kutasok/r-yandex-webmaster-v3/blob/master/README.md#ywgetsiteinfohost_id-user_idnull-tokennull)
* [ywGetSiteSummary](https://github.com/kutasok/r-yandex-webmaster-v3/blob/master/README.md#ywgetsitesummaryhost_id-user_idnull-tokennull)
* [ywGetSiteBacklinks](https://github.com/kutasok/r-yandex-webmaster-v3/blob/master/README.md#ywgetsitebacklinkshost_id-offset0-limit100-user_idnull-tokennull)
* [ywGetSitePopQueries](https://github.com/kutasok/r-yandex-webmaster-v3/blob/master/README.md#ywgetsitepopquerieshost_id-order_bytotal_clicks-user_idnull-tokennull)
* [Пример работы с пакетом r-yandex-webmaster-v3](https://github.com/kutasok/r-yandex-webmaster-v3/blob/master/README.md#Пример-работы-с-пакетом-r-yandex-webmaster-v3)

##Краткое описание
Пакет r-yandex-webmaster-v3 помогает выгружать основные данные о сайтах пользователя Яндес Вебмастера.
Используется авторизация OAuth 2.0 для защиты данных.

##Установка пакета r-yandex-webmaster-v3
Установка пакета осуществляется из репозитория GitHub, для этого сначала требуется установить и подключить пакет devtools.

```
install.packages("devtools")
library(devtools)
```

После чего можно устанавливать пакет r-yandex-webmaster-v3.

`install_github('kutasok/r-yandex-webmaster-v3')`

##Функции входящие в пакет r-yandex-webmaster-v3
На данный момент в пакет входит 18 функций:

###`ywGetToken()`
Функция для получения токена для доступа к API Вебмастера, полученый токен используется во всех остальных функциях.

###`ywGetUserId(token=NULL)`
Функция возвращает Id пользователя. Этот ID нужно будет использовать для всех остальных функций.

###`ywGetSitesList(user_id=NULL, token=NULL)`
Функция возвращает датафрейм со списком сайтов, добавленных пользователем, и сводную информацию о каждом из них.

####Структура возвращаемого функцией `yadirGetClientList` дата фрейма:
| Поле | Обязательный | Тип данных | Описание |
| --- | --- | --- | --- |
| host_id | Да | chr | ID сайта. |
| ascii_host_url | Да | chr | ASCII URL сайта |
| unicode_host_url | Нет | chr | UTF-8 URL сайта. |
| verified | Да | chr | Подтвержден ли сайт. |
| main_mirror | Да | chr | Главное зеркало сайта, если есть. |

###`ywAddSite(user_id=NULL, host=NULL, token=NULL)`

###`ywDeleteSite(user_id=NULL, host_id=NULL, token=NULL)`

###`ywGetSiteInfo(user_id=NULL, host_id=NULL, token=NULL)`

###`ywGetSiteSummary(user_id=NULL, host_id=NULL, token=NULL)`

###`ywGetBacklinks(user_id=NULL, host_id=NULL, offset=0, limit=100, token=NULL)`

###`ywGetPopQueries(user_id=NULL, host_id=NULL, order_by="TOTAL_CLICKS", token=NULL)`

###`ywGetSitemaps(user_id=NULL, host_id=NULL, parent_id=NULL, limit=NULL, from=NULL, token=NULL)`

###`ywGetSitemapInfo(user_id=NULL, host_id=NULL, sitemap_id=NULL, token=NULL)`

###`ywGetUserAddedSitemaps(user_id=NULL, host_id=NULL, offset=NULL, limit=NULL, token=NULL)`

###`ywGetUserAddedSitemapInfo(user_id=NULL, host_id=NULL, sitemap_id=NULL, token=NULL)`

###`ywAddSitemap(user_id=NULL, host_id=NULL, sitemap_url=NULL, token=NULL)`

###`ywDeleteSitemap(user_id=NULL, host_id=NULL, sitemap_id=NULL, token=NULL)`

###`ywGetIndexingHistory(user_id=NULL, host_id=NULL, date_from=NULL, date_to=NULL, token=NULL)`

###`ywGetTicHistory(user_id=NULL, host_id=NULL, date_from=NULL, date_to=NULL, token=NULL)`

###`ywGetBacklinksHistory(user_id=NULL, host_id=NULL, token=NULL)`


##Пример работы с пакетом r-yandex-webmaster-v3

`token <- yadirGetToken()`

`user_id <- ywGetUserId(token=token)`

`sites_list <- ywGetSitesList(user_id=user_id, token=token)`

```siteInfo <- ywGetSiteInfo(host_id=sites_list$host_id[1], 
                          token=token)
```
```siteSummary <- ywGetSiteSummary(host_id=sites_list$host_id[1], 
                                token=token)
```
```siteBacklinks <- ywGetBacklinks(host_id=sites_list$host_id[1], 
                                offset=50, 
                                limit=100, 
                                token=token)
```
```sitePopQueries <- ywGetPopQueries(host_id=sites_list$host_id[1], 
                                  token=token)
```
```siteSitemaps <- ywGetSitemaps(host_id=sites_list$host_id[5], 
                              user_id=user_id, 
                              token=token)
```
```sitemapInfo <- ywGetSitemapInfo(host_id=sites_list$host_id[5], 
                                sitemap_id=siteSitemaps$sitemap_id[1], 
                                user_id=user_id, 
                                token=token)
```
```addedSitemaps <- ywGetUserAddedSitemaps(host_id=sites_list$host_id[2], 
                                        user_id=user_id, 
                                        token=token)
```
```addedSitemapsInfo<- ywGetUserAddedSitemapInfo(host_id=sites_list$host_id[2], 
                                              sitemap_id=addedSitemaps$sitemap_id[1], 
                                              user_id=user_id, 
                                              token=token)
```
```indexingHistory <- ywGetIndexingHistory(host_id=sites_list$host_id[1], 
                                        user_id=user_id, 
                                        date_from = "2017-01-01", 
                                        date_to = "2017-01-20",
                                        token=token)
```
```TICHistory <- ywGetTicHistory(host_id=sites_list$host_id[1], 
                              user_id=user_id, 
                              date_from = "2016-11-01", 
                              date_to = "2017-01-20",
                              token=token)
```
```backlinksHistory <- ywGetBacklinksHistory(host_id=sites_list$host_id[1], 
                                          user_id=user_id,
                                          token=token)
```




