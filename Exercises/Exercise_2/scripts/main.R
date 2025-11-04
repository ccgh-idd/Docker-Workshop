# --- bootstrap renv ---
if (!requireNamespace("renv", quietly = TRUE)) install.packages("renv")
renv::activate()
# -----------------------

suppressPackageStartupMessages({
  library(dplyr)
  library(readr)
  library(ggplot2)
  library(stringr)
  library(tidyr)
  library(purrr)
})

# read included data
inc <- read_csv("data/include/sample.csv")

message("Included dataset has ", nrow(inc), " rows")

# optionally read mounted data
ext_path <- "data/mount/external.csv"
if (file.exists(ext_path)) {
  ext <- read_csv(ext_path)
  message("External dataset loaded with ", nrow(ext), " rows")
  data <- bind_rows(inc, ext)
} else {
  message("No external dataset found (mount one with -v)")
  data <- inc
}

# summarize and plot
summary_tbl <- data %>%
  group_by(category) %>%
  summarise(mean_value = mean(value))

write_csv(summary_tbl, "output/summary.csv")

p <- ggplot(summary_tbl, aes(category, mean_value)) +
  geom_col(fill = "steelblue") +
  theme_minimal()

ggsave("output/plot.png", p, width = 4, height = 3)
message("Outputs written to output/")
