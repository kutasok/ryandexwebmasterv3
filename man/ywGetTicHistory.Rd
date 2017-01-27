\name{ywGetTicHistory}
\alias{ywGetTicHistory}
\title{Get site TIC history from Yandex Webmaster}
\description{ywGetTicHistory downloads site TIC history from Yandex Webmaster API v 3.0}
\usage{
ywGetTicHistory(user_id = NULL, host_id = NULL, date_from = NULL, date_to = NULL, token = NULL)
}

\arguments{
  \item{user_id}{User id from function ywGetUserId.}
  \item{host_id}{Host id of your site. You can get by function ywGetSitesList.}
  \item{date_from}{Start date for query.}
  \item{date_to}{End date for query.}
  \item{token}{Token for Yandex Webmaster API from function ywGetToken}
}
\details{}
\value{Returns data frame with columns:
  date - date, 
  value - TIC value for date
}
\references{}
\author{Ivan Kutas}
\note{}

\seealso{}
\examples{
TICHistory <- ywGetTicHistory(host_id=hostId, 
                              user_id=userId, 
                              date_from = "2016-11-01", 
                              date_to = "2017-01-20",
                              token=myToken)
}

\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
