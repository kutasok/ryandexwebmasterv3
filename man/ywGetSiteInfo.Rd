\name{ywGetSiteInfo}
\alias{ywGetSiteInfo}
\title{Get basic ifnformation about site from Yandex Webmaster}
\description{ywGetSiteInfo downloads basic ifnformation about site from Yandex Webmaster API v 3.0}
\usage{
ywGetSiteInfo(user_id = NULL, host_id = NULL, token = NULL)
}

\arguments{
  \item{user_id}{User id from function ywGetUserId.}
  \item{host_id}{Host id of your site. You can get by function ywGetSitesList.}
  \item{token}{Token for Yandex Webmaster API from function ywGetToken}
}
\details{}
\value{Returns data frame with columns:
  host_id - id of host in Yandex Webmaster, 
  verified - is it verified. Boolean,
  ascii_host_url - host url in ascii coding, 
  unicode_host_url - host url in unicode coding,
  main_mirror - main mirror host if exists, 
  host_data_status - host status. One of NOT_INDEXED / NOT_LOADED / OK, 
  host_display_name - host name for using in SERP
}
\references{}
\author{Ivan Kutas}
\note{}

\seealso{}
\examples{
siteInfo <- ywGetSiteInfo(host_id=hostId, 
                          token=token)
}

\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line       
