\name{ywGetSiteInfo}
\alias{ywGetSiteInfo}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
ywGetSiteInfo(user_id = NULL, host_id = NULL, token = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{user_id}{
%%     ~~Describe \code{user_id} here~~
}
  \item{host_id}{
%%     ~~Describe \code{host_id} here~~
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
function (user_id = NULL, host_id = NULL, token = NULL) 
{
    if (is.null(token)) {
        warning("Get your api token by function ywGetToken() and argument token in function ywGetSiteInfo!")
        break
    }
    answer <- GET(paste("https://api.webmaster.yandex.net/v3/user/", 
        user_id, "/hosts/", host_id, sep = ""), add_headers(Authorization = paste0("OAuth ", 
        token)))
    stop_for_status(answer)
    dataRaw <- content(answer, "parsed", "application/json")
    resultData <- data.frame(host_id = character(), verified = character(), 
        ascii_host_url = character(), unicode_host_url = character(), 
        main_mirror = character(), host_data_status = character(), 
        host_display_name = character(), stringsAsFactors = FALSE)
    try(resultData[1, 1] <- dataRaw$host_id, silent = TRUE)
    try(resultData[1, 2] <- dataRaw$verified, silent = TRUE)
    try(resultData[1, 3] <- dataRaw$ascii_host_url, silent = TRUE)
    try(resultData[1, 4] <- dataRaw$unicode_host_url, silent = TRUE)
    try(resultData[1, 5] <- dataRaw$main_mirror$host_id, silent = TRUE)
    try(resultData[1, 6] <- dataRaw$host_data_status, silent = TRUE)
    try(resultData[1, 7] <- dataRaw$host_display_name, silent = TRUE)
    return(resultData)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
