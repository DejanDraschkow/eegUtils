% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/frequency_analysis.R
\name{compute_psd}
\alias{compute_psd}
\alias{compute_psd.eeg_data}
\alias{compute_psd.eeg_epochs}
\alias{compute_psd.eeg_evoked}
\title{Compute power spectral density}
\usage{
compute_psd(data, ...)

\method{compute_psd}{eeg_data}(data, seg_length = NULL,
  noverlap = NULL, n_fft = NULL, method = "Welch", ...)

\method{compute_psd}{eeg_epochs}(data, seg_length = NULL,
  noverlap = NULL, n_fft = 256, method = "Welch",
  keep_trials = TRUE, ...)

\method{compute_psd}{eeg_evoked}(data, seg_length = NULL,
  noverlap = NULL, n_fft = 256, method = "Welch", ...)
}
\arguments{
\item{data}{Data to be plotted. Accepts objects of class \code{eeg_data}}

\item{...}{any further parameters passed to specific methods}

\item{seg_length}{Length of rolling data segments. Defaults to \code{n_fft}.
Must be <= \code{n_fft}.}

\item{noverlap}{Number of (sampling) points of overlap between segments. Must
be <= \code{seg_length}.}

\item{n_fft}{Length of FFT to be calculated in sampling points. See details.}

\item{method}{Defaults to "Welch". No other method currently implemented.}

\item{keep_trials}{Include FFT for every trial in output, or average over them if FALSE.}
}
\value{
Currently, a data frame with the PSD for each channel separately.
}
\description{
\code{compute_psd} returns the PSD calculated using Welch's method for every
channel in the data. The output is in  microvolts ^2 / Hz. If the object has
multiple epochs, it will perform Welch's FFT separately for each epoch and
then average them afterwards.
}
\details{
Welch's FFT splits the data into multiple segments, calculates the FFT
separately for each segment, and then averages over segments. Each segment is
windowed with a Hanning window to counter spectral leakage. For epoched data,
Welch's FFT is calculated separately for each trial.

The number of sampling points used for the FFT can be specified using n_fft.
n_fft defaults to 256 sampling points for \code{eeg_epochs} data, or the
minimum of 2048 or the length of the signal for continuous \code{eeg_data}.

\code{seg_length} defaults to be \code{n_fft}, and must be less than or equal
to it.

\code{noverlap} specifies the amount of overlap between windows in sampling
points. If not specified, it defaults to 50\% overlap between segments.
}
\section{Methods (by class)}{
\itemize{
\item \code{eeg_data}: Compute PSD for an \code{eeg_data} object

\item \code{eeg_epochs}: Compute PSD for an \code{eeg_epochs} object

\item \code{eeg_evoked}: Compute PSD for an \code{eeg_evoked} object
}}

\examples{
compute_psd(demo_epochs)
compute_psd(demo_epochs, n_fft = 256, seg_length = 128)
}
\author{
Matt Craddock \email{matt@mattcraddock.com}
}
