# ryandexwebmasterv3 - пакет для работы с API Яндекс Вебмастера версии 3.0 на языке R.

##Содержание
* [Краткое описание](https://github.com/kutasok/r-yandex-webmaster-v3/blob/master/README.md#Краткое-описание)
* [Установка пакета ryandexwebmasterv3](https://github.com/kutasok/r-yandex-webmaster-v3/blob/master/README.md#Установка-пакета-r-yandex-webmaster-v3)
* [Функции входящие в пакет ryandexwebmasterv3](https://github.com/kutasok/r-yandex-webmaster-v3/blob/master/README.md#Функции-входящие-в-пакет-r-yandex-webmaster-v3)
* [Пример работы с пакетом ryandexwebmasterv3](https://github.com/kutasok/r-yandex-webmaster-v3/blob/master/README.md#Пример-работы-с-пакетом-r-yandex-webmaster-v3)

##Краткое описание
Пакет ryandexwebmasterv3 помогает выгружать основные данные о сайтах пользователя Яндес Вебмастера.
Используется авторизация OAuth 2.0 для защиты данных.

##Установка пакета ryandexwebmasterv3
Установка пакета осуществляется из репозитория GitHub, для этого сначала требуется установить и подключить пакет devtools.

```
install.packages("devtools")
library(devtools)
```

После чего можно устанавливать пакет ryandexwebmasterv3.

`install_github('kutasok/ryandexwebmasterv3')`

Пример использования смотрите [ниже](https://github.com/kutasok/r-yandex-webmaster-v3/blob/master/README.md#Пример-работы-с-пакетом-r-yandex-webmaster-v3).

##Функции входящие в пакет ryandexwebmasterv3
На данный момент в пакет входит 18 функций:

###`ywGetToken()`
Функция для получения токена для доступа к API Вебмастера, полученый токен используется во всех остальных функциях.

###`ywGetUserId(token=NULL)`
Функция возвращает Id пользователя. Этот ID нужно будет использовать для всех остальных функций.

###`ywGetSitesList(user_id=NULL, token=NULL)`
Функция возвращает датафрейм со списком сайтов, добавленных пользователем, и сводную информацию о каждом из них.

####Структура возвращаемого функцией `ywGetSitesList` дата фрейма:
| Поле | Тип данных | Описание |
| --- | --- | --- |
| host_id | chr | ID сайта. |
| ascii_host_url | chr | ASCII URL сайта |
| unicode_host_url | chr | UTF-8 URL сайта. |
| verified | chr | Подтвержден ли сайт. |
| main_mirror | chr | Главное зеркало сайта, если есть. |

###`ywAddSite(user_id=NULL, host=NULL, token=NULL)`
Позволяет добавить сайт в список сайтов пользователя.

###`ywDeleteSite(user_id=NULL, host_id=NULL, token=NULL)`
Позволяет удалить сайт из списка сайтов пользователя.

###`ywGetSiteInfo(user_id=NULL, host_id=NULL, token=NULL)`
Позволяет получить информацию о текущем состоянии индексирования сайта.

###`ywGetSiteSummary(user_id=NULL, host_id=NULL, token=NULL)`
Позволяет получить сводную информацию о сайте.

###`ywGetBacklinks(user_id=NULL, host_id=NULL, offset=0, limit=100, token=NULL)`
Позволяет получить примеры внешних ссылок на страницы сайта.

###`ywGetPopQueries(user_id=NULL, host_id=NULL, order_by="TOTAL_CLICKS", token=NULL)`
Позволяет получить список топ-500 поисковых запросов, по которым сайт показывался на поиске за последнюю неделю. 
Можно выбрать 500 запросов с наибольшим числом показов или 500 запросов с наибольшим числом переходов.
Задается параметром order_by.

###`ywGetSitemaps(user_id=NULL, host_id=NULL, parent_id=NULL, limit=NULL, from=NULL, token=NULL)`
Позволяет получить список файлов sitemap, обнаруженных роботами Яндекса.

###`ywGetSitemapInfo(user_id=NULL, host_id=NULL, sitemap_id=NULL, token=NULL)`
Позволяет получить подробную информацию о файле sitemap, включая тип файла, дату и способ загрузки файла в Яндекс.Вебмастер, дату обработки файла сервисом, 
количество содержащихся в файле URL, а также количество и тип обнаруженных ошибок.

!!! Пока что API дает такой же результат как и для метода ywGetSitemaps(). 
Лучше пока использовать метод ywGetSitemaps() с указанием parent_id.

###`ywGetUserAddedSitemaps(user_id=NULL, host_id=NULL, offset=NULL, limit=NULL, token=NULL)`
Позволяет получить список файлов sitemap, добавленных пользователем.

###`ywGetUserAddedSitemapInfo(user_id=NULL, host_id=NULL, sitemap_id=NULL, token=NULL)`
Позволяет получить подробную информацию о файле sitemap, добавленном пользователем, включая тип файла, дату и способ загрузки файла в Яндекс.Вебмастер, дату обработки файла сервисом, количество содержащихся в файле URL, а также количество и тип обнаруженных ошибок.

###`ywAddSitemap(user_id=NULL, host_id=NULL, sitemap_url=NULL, token=NULL)`
Позволяет добавить файл sitemap в Яндекс.Вебмастер.

###`ywDeleteSitemap(user_id=NULL, host_id=NULL, sitemap_id=NULL, token=NULL)`
Позволяет удалить добавленный пользователем файл sitemap.

###`ywGetIndexingHistory(user_id=NULL, host_id=NULL, date_from=NULL, date_to=NULL, token=NULL)`
Позволяет получить историю индексирования сайта роботами Яндекса.

###`ywGetTicHistory(user_id=NULL, host_id=NULL, date_from=NULL, date_to=NULL, token=NULL)`
Позволяет получить историю изменения значений тИЦ сайта за последние 6 месяцев, включая текущий. Для каждого месяца список содержит даты, когда тИЦ менял свое значение. 
Если в какой-то из месяцев тИЦ не изменялся, то в списке будет одна запись для этого месяца с актуальным значением тИЦ на тот момент.

###`ywGetBacklinksHistory(user_id=NULL, host_id=NULL, token=NULL)`
Позволяет получить историю изменения количества внешних ссылок на сайт.


##Пример работы с пакетом ryandexwebmasterv3

* Подключаем библиотеку.

`library(ryandexwebmasterv3)`

* Получаем токен.

`token <- ywGetToken()`

Откроется браузер. Копируем токен и вставляем в RStudio.

* Получаем ID пользователя. Он используется во всех функциях ниже.

`user_id <- ywGetUserId(token=token)`

* Получаем список сайтов пользователя.

`sites_list <- ywGetSitesList(user_id=user_id, token=token)`

* Получаем данные о сайте.
```
siteInfo <- ywGetSiteInfo(user_id=user_id,
                          host_id=sites_list$host_id[1], 
                          token=token)
```
Тут и дальше в примере используется первый host_id из выгруженных функцией ywGetSitesList.

* Получаем сводную информацию о сайте.
```
siteSummary <- ywGetSiteSummary(user_id=user_id,
                                host_id=sites_list$host_id[1], 
                                token=token)
```

* Получаем список обратных ссылок сайта.
```
siteBacklinks <- ywGetBacklinks(user_id=user_id,
                                host_id=sites_list$host_id[1], 
                                offset=50, 
                                limit=100, 
                                token=token)
```
 В примере выгружаем 100 ссылок начиная с 51-й.

* Получаем список популярных запросов сайта отсортированных по количеству кликов.
```
sitePopQueries <- ywGetPopQueries(user_id=user_id,
                                  host_id=sites_list$host_id[1], 
                                  order_by="TOTAL_CLICKS",
                                  token=token)
```

* Получаем список файлов sitemap, обнаруженных роботами Яндекса.
```
siteSitemaps <- ywGetSitemaps(host_id=sites_list$host_id[1], 
                              user_id=user_id, 
                              token=token)
```

* Получаем подробную информацию о файле sitemap. 
```
sitemapInfo <- ywGetSitemapInfo(host_id=sites_list$host_id[1], 
                                sitemap_id=siteSitemaps$sitemap_id[1], 
                                user_id=user_id, 
                                token=token)
```
Пока что API работает некорректно и отдает такой же результат как и в предыдущем методе.

* Получаем список файлов sitemap, добавленных пользователем.
```
addedSitemaps <- ywGetUserAddedSitemaps(host_id=sites_list$host_id[1], 
                                        user_id=user_id, 
                                        token=token)
```

* Получаем подробную информацию о файле sitemap, добавленном пользователем.
```
addedSitemapsInfo<- ywGetUserAddedSitemapInfo(host_id=sites_list$host_id[1], 
                                              sitemap_id=addedSitemaps$sitemap_id[1], 
                                              user_id=user_id, 
                                              token=token)
```

* Получаем историю индексирования сайта роботами Яндекса за определенные даты.
```
indexingHistory <- ywGetIndexingHistory(host_id=sites_list$host_id[1], 
                                        user_id=user_id, 
                                        date_from = "2017-01-01", 
                                        date_to = "2017-01-20",
                                        token=token)
```

* Получаем историю изменения значений тИЦ сайта.
```
TICHistory <- ywGetTicHistory(host_id=sites_list$host_id[1], 
                              user_id=user_id, 
                              date_from = "2016-11-01", 
                              date_to = "2017-01-20",
                              token=token)
```

* Получаем историю изменения количества внешних ссылок на сайт.
```
backlinksHistory <- ywGetBacklinksHistory(host_id=sites_list$host_id[1], 
                                          user_id=user_id,
                                          token=token)
```
