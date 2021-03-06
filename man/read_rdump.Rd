\name{read_rdump}
\alias{read_rdump}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Read data in an \R dump file to a list}
\description{Create an \R list from an \R dump file}
\usage{
read_rdump(f, keep.source = FALSE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{f}{A character string providing the dump file name.}
  \item{keep.source}{logical: should the source formatting be retained when
                     echoing expressions, if possible?}
  \item{...}{passed to \code{source}}
}
\details{
The \R dump file can be read directly by \R function \code{source}, which
by default would read the data into the user's workspace (the global environment). 
This function instead read the data to a list, making it convenient to 
prepare data for the \code{stan} model-fitting function.
}
\value{
A list containing all the data defined in the dump file with
keys corresponding to variable names.
}
\seealso{
\code{\link{stan_rdump}}; \code{\link{dump}} 
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
x <- 1; y <- 1:10; z <- array(1:10, dim = c(2,5)) 
stan_rdump(ls(pattern = '^[xyz]'), file.path(tempdir(), "xyz.Rdump"))
l <- read_rdump(file.path(tempdir(), 'xyz.Rdump'))
print(l)
unlink(file.path(tempdir(), "xyz.Rdump"))
}
\keyword{rstan} 
