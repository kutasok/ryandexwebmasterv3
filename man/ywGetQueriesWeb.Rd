\name{ywGetQueriesWeb}
\alias{ywGetQueriesWeb}
\title{Get queries for specific host from Yandex Webmaster Web version}
\description{ywGetQueriesWeb downloades queries for specific host from Yandex Webmaster Web version}
\usage{
queries <- ywGetQueriesWeb(headers = NULL, hostId = NULL)
}

\arguments{
  \item{headers}{Headers for requests to Yandex Webmaster Web version. It's a named array containing User-Agent and Cookie form browser.}
  \item{hostId}{Host ID from function ywGetAddedHostsWeb in form: protocol:domain:port. Example: http:prom.ua:80}
}
\details{}
\value{Returns data frame with all search queries of host.}
\references{}
\author{Ivan Kutas}
\note{}

\seealso{}
\examples{
# Take User-Agent and Cookie from browser. I use postman app for google chrome for this.
User_Agent <-  'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36'
Cookie <- 'yandexuid=1458919211469463782; _ym_isad=2'

headers <- c('User-Agent' = User_Agent, 'Cookie' = Cookie);

hosts <- ywGetAddedHostsWeb(headers)

hostId <- hosts$hostId[2];
 
queries <- ywGetQueriesWeb(headers, hostId)
}

\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line