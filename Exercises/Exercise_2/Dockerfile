FROM rocker/r-ver:4.3.1
WORKDIR /project
COPY . /project
RUN R -q -e "install.packages('renv', repos='https://cloud.r-project.org'); renv::init(bare = TRUE); install.packages(c('dplyr','readr','ggplot2','stringr','tidyr','purrr')); renv::snapshot()"
CMD ["Rscript", "scripts/main.R"]
