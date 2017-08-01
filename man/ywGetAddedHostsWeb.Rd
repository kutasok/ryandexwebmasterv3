\name{ywGetAddedHostsWeb}
\alias{ywGetAddedHostsWeb}
\title{Get hosts added to accounr from Yandex Webmaster Web version}
\description{ywGetAddedHostsWeb hosts added to accounr from Yandex Webmaster Web version}
\usage{
ywGetAddedHostsWeb(headers = NULL)
}

\arguments{
  \item{headers}{Headers for requests to Yandex Webmaster Web version. It's a named array containing User-Agent and Cookie form browser.}
}
\details{}
\value{Returns data frame with all added hosts.}
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
}

\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line