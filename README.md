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
На данный момент в пакет входит 9 функций:

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

###`ywAddSite(host, user_id=NULL, token=NULL)`

###`ywDeleteSite(host_id, user_id=NULL, token=NULL)`

###`ywGetSiteInfo(host_id, user_id=NULL, token=NULL)`

###`ywGetSiteSummary(host_id, user_id=NULL, token=NULL)`

###`ywGetSiteBacklinks(host_id, offset=0, limit=100, user_id=NULL, token=NULL)`

###`ywGetSitePopQueries(host_id, order_by="TOTAL_CLICKS", user_id=NULL, token=NULL)`


##Пример работы с пакетом r-yandex-webmaster-v3

`token <- yadirGetToken()`

`user_id <- ywGetUserId(token=token)`

`sites_list <- ywGetSitesList(user_id=user_id, token=token)`

`siteInfo <- ywGetSiteInfo(host_id=sites_list$host_id[1], user_id=user_id, token=token)`

`siteSummary <- ywGetSiteSummary(host_id=sites_list$host_id[1], user_id=user_id, token=token)`

`siteBacklinks <- ywGetSiteBacklinks(host_id=sites_list$host_id[1], offset=50, limit=100, user_id=user_id, token=token)`

`sitePopQueries <- ywGetSitePopQueries(host_id=sites_list$host_id[1], user_id=user_id, token=token)`





