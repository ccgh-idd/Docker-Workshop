FROM rocker/r-ver:4.3.1
WORKDIR /project
COPY process.R /project/
RUN R -q -e "install.packages(c('dplyr','readr'), repos='https://cloud.r-project.org')"
CMD ["Rscript", "process.R"]
