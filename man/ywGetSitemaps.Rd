\name{ywGetSitemaps}
\alias{ywGetSitemaps}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
ywGetSitemaps(user_id = NULL, host_id = NULL, parent_id = NULL, limit = NULL, from = NULL, token = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{user_id}{
%%     ~~Describe \code{user_id} here~~
}
  \item{host_id}{
%%     ~~Describe \code{host_id} here~~
}
  \item{parent_id}{
%%     ~~Describe \code{parent_id} here~~
}
  \item{limit}{
%%     ~~Describe \code{limit} here~~
}
  \item{from}{
%%     ~~Describe \code{from} here~~
}
  \item{token}{
%%     ~~Describe \code{token} here~~
}
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
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (user_id = NULL, host_id = NULL, parent_id = NULL, limit = NULL, 
    from = NULL, token = NULL) 
{
    if (is.null(token)) {
        warning("Get your api token by function ywGetToken() and argument token in function ywGetSitemaps!")
        break
    }
    answer <- GET(paste("https://api.webmaster.yandex.net/v3/user/", 
        user_id, "/hosts/", host_id, "/sitemaps/?parent_id=", 
        parent_id, "&limit=", limit, "&from=", from, sep = ""), 
        add_headers(Authorization = paste0("OAuth ", token)))
    stop_for_status(answer)
    dataRaw <- content(answer, "parsed", "application/json")
    resultData <- data.frame(sitemap_id = character(), sitemap_url = character(), 
        last_access_date = as.Date(character()), errors_count = integer(), 
        urls_count = integer(), children_count = integer(), sources = character(), 
        sitemap_type = character(), stringsAsFactors = FALSE)
    for (i in 1:length(dataRaw$sitemaps)) {
        try(resultData[i, 1] <- dataRaw$sitemaps[[i]]$sitemap_id, 
            silent = TRUE)
        try(resultData[i, 2] <- dataRaw$sitemaps[[i]]$sitemap_url, 
            silent = TRUE)
        try(resultData[i, 3] <- dataRaw$sitemaps[[i]]$last_access_date, 
            silent = TRUE)
        try(resultData[i, 4] <- dataRaw$sitemaps[[i]]$errors_count, 
            silent = TRUE)
        try(resultData[i, 5] <- dataRaw$sitemaps[[i]]$urls_count, 
            silent = TRUE)
        try(resultData[i, 6] <- dataRaw$sitemaps[[i]]$children_count, 
            silent = TRUE)
        try(resultData[i, 7] <- toString(dataRaw$sitemaps[[i]]$sources), 
            silent = TRUE)
        try(resultData[i, 8] <- dataRaw$sitemaps[[i]]$sitemap_type, 
            silent = TRUE)
    }
    return(resultData)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
