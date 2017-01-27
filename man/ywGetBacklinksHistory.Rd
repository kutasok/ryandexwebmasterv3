\name{ywGetBacklinksHistory}
\alias{ywGetBacklinksHistory}

\title{Get backlinks history from Yandex Webmaster}
\description{ywGetBacklinksHistory downloads links quantity history from Yandex Webmaster via API v3.0.}
\usage{
ywGetBacklinksHistory(user_id = NULL, host_id = NULL, token = NULL)
}

\arguments{
 \item{user_id}{User id from function ywGetUserId.}
  \item{host_id}{Host id of your site. You can get by function ywGetSitesList.}
  \item{token}{Token for Yandex Webmaster API from function ywGetToken}
}
\details{}
\value{
Data frame with columns:
  date - date,
  value - backlinks quantity for date
}
\references{
}
\author{Ivan Kutas}
\note{}

\seealso{}
\examples{
backlinksHistory <- ywGetBacklinksHistory(host_id=hostId, 
                                          user_id=userId,
                                          token=myToken)
}

\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
