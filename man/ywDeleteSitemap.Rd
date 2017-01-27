\name{ywDeleteSitemap}
\alias{ywDeleteSitemap}
\title{Delete sitemap from Yandex Webmaster.}
\description{ywDeleteSitemap deletes sitemap of the site from Yandex Webmaster via API v3.0.}
\usage{
ywDeleteSitemap(user_id = NULL, host_id = NULL, sitemap_id = NULL, token = NULL)
}
\arguments{
  \item{user_id}{User id from function ywGetUserId.}
  \item{host_id}{Host id of your site. You can get by function ywGetSitesList.}
  \item{sitemap_id}{Id of sitemap to delete. Sitemap ids you can get by function ywGetSitemaps}
  \item{token}{Token for Yandex Webmaster API from function ywGetToken}
}
\details{}
\value{Returns TRUE if site is deleted.}
\references{}
\author{Ivan Kutas}
\note{}

\seealso{}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (user_id = NULL, host_id = NULL, sitemap_id = NULL, 
    token = NULL) 
{
    if (is.null(token)) {
        warning("Get your api token by function ywGetToken() and argument token in function ywAddSitemap!")
        break
    }
    answer <- DELETE(paste("https://api.webmaster.yandex.net/v3/user/", 
        user_id, "/hosts/", host_id, "/user-added-sitemaps/", 
        sitemap_id, sep = ""), add_headers(Authorization = paste0("OAuth ", 
        token)))
    stop_for_status(answer)
    dataRaw <- content(answer, "parsed", "application/json")
    return(TRUE)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
