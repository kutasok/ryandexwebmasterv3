\name{ywGetSitesList}
\alias{ywGetSitesList}
\title{Get all sites from Yandex Webmaster}
\description{ywGetSitesList downloads info about all sites from Yandex Webmaster API v 3.0}
\usage{
ywGetSitesList(user_id = NULL, token = NULL)
}

\arguments{
  \item{user_id}{User id from function ywGetUserId.}
  \item{token}{Token for Yandex Webmaster API from function ywGetToken}
}
\details{}
\value{Returns data frame with columns:
  host_id - id of host in Yandex Webmaster, 
  ascii_host_url - host url in ascii coding, 
  unicode_host_url - host url in unicode coding,
  verified - is it verified. Boolean,
  main_mirror - main mirror host if exists
}
\references{}
\author{Ivan Kutas}
\note{}

\seealso{}
\examples{
sites_list <- ywGetSitesList(user_id=userId, 
                             token=myToken)
}

\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line  
