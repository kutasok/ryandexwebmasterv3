\name{ywAddSite}
\alias{ywAddSite}
\title{Add site to Yandex Webmaster.}
\description{ywAddSite adds site to Yandex Webmaster via API v3.0.}
\usage{
ywAddSite(user_id = NULL, host = NULL, token = NULL)
}
\arguments{
  \item{user_id}{User id from function ywGetUserId.}
  \item{host}{Host with protocol. Ex: http://netpeak.net}
  \item{token}{Token for Yandex Webmaster API from function ywGetToken}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{}
\author{Ivan Kutas}
\note{}


\seealso{}
\examples{
ywAddSite(user_id=userId, host="http://netpeak.net", token=myToken)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
