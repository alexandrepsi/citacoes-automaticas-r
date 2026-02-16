# format_tables.R

# Functions to format tables and cite them in APA style in R

# Load necessary packages
library(knitr)
library(kableExtra)

# Function to format a table in APA style
format_table_apa <- function(data, caption = "", label = "") {
  kable(data, format = 'html', caption = caption) %>%
    kable_styling(full_width = F) %>%
    add_header_above(c(" ", "Column1" = 1, "Column2" = 1)) %>%
    row_spec(0, bold = TRUE)
}

# Function to generate citation for tables in APA style
cite_table_apa <- function(table_number) {
  return(paste('Table', table_number, 'shows the results of the analysis.'))
}
