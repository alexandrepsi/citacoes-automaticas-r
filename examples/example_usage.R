# ============================================================================
# CITAÇÕES AUTOMÁTICAS - USAGE EXAMPLES
# Practical examples of how to use the citation generation functions
# ============================================================================

# Step 1: Load the functions
# First, make sure you're in the project directory and run:
source("R/generate_citations.R")

# ============================================================================
# EXAMPLE 1: Format Author Names
# ============================================================================

cat("\n=== EXAMPLE 1: Formatting Author Names ===\n\n")

# Single author
author1 <- "Hadley Wickham"
formatted1 <- format_author_names(author1)
cat("Input:  ", author1, "\n")
cat("Output: ", formatted1, "\n\n")

# Multiple authors (2)
author2 <- "Yihui Xie and Hadley Wickham"
formatted2 <- format_author_names(author2)
cat("Input:  ", author2, "\n")
cat("Output: ", formatted2, "\n\n")

# Multiple authors (3+)
author3 <- "Yihui Xie and J.J. Allaire and Garrett Grolemund"
formatted3 <- format_author_names(author3)
cat("Input:  ", author3, "\n")
cat("Output: ", formatted3, "\n\n")


# ============================================================================
# EXAMPLE 2: Generate Single Citation
# ============================================================================

cat("\n=== EXAMPLE 2: Generating Single Citations ===\n\n")

# Create a single reference (book)
book_ref <- data.frame(
  author = "Hadley Wickham",
  year = 2019,
  title = "Advanced R",
  source = "Chapman and Hall/CRC",
  type = "book",
  url = NA
)

# Generate citation
book_citation <- generate_apa_citation(book_ref)
cat("Book Citation:\n")
cat(book_citation, "\n\n")


# Create a single reference (website)
website_ref <- data.frame(
  author = "RStudio Team",
  year = 2021,
  title = "RStudio: Integrated Development Environment for R",
  source = "RStudio Inc",
  type = "website",
  url = "https://www.rstudio.com"
)

# Generate citation
website_citation <- generate_apa_citation(website_ref)
cat("Website Citation:\n")
cat(website_citation, "\n\n")


# ============================================================================
# EXAMPLE 3: Load References from CSV
# ============================================================================

cat("\n=== EXAMPLE 3: Loading References from CSV ===\n\n")

# Load the example data
references <- read.csv("data/references.csv", stringsAsFactors = FALSE)

# Display structure
cat("Number of references loaded:", nrow(references), "\n")
cat("Columns:", paste(colnames(references), collapse = ", "), "\n\n")

# Show first few rows
cat("First 3 references:\n")
print(head(references, 3))


# ============================================================================
# EXAMPLE 4: Validate Reference Data
# ============================================================================

cat("\n=== EXAMPLE 4: Validating References ===\n\n")

# Validate the loaded references
is_valid <- validate_references(references)
cat("References are valid:", is_valid, "\n\n")


# ============================================================================
# EXAMPLE 5: Generate Bibliography from Multiple References
# ============================================================================

cat("\n=== EXAMPLE 5: Generating Complete Bibliography ===\n\n")

# Generate bibliography (sorted alphabetically)
bibliography <- generate_bibliography(references)

# Display first 3 citations
cat("First 3 citations from bibliography:\n\n")
for (i in 1:3) {
  cat(i, ".", bibliography[i], "\n\n")
}


# ============================================================================
# EXAMPLE 6: Format and Display Complete Bibliography
# ============================================================================

cat("\n=== EXAMPLE 6: Complete Formatted Bibliography ===\n\n")

# Format as a complete text
formatted_bib <- format_bibliography(references, sort = TRUE)

# Display
cat(formatted_bib)


# ============================================================================
# EXAMPLE 7: Export Bibliography to File
# ============================================================================

cat("\n=== EXAMPLE 7: Exporting Bibliography to File ===\n\n")

# Export to text file
export_bibliography(references, filename = "my_bibliography.txt")

cat("You can now open 'my_bibliography.txt' to see the results!\n\n")


# ============================================================================
# EXAMPLE 8: Working with Subsets
# ============================================================================

cat("\n=== EXAMPLE 8: Working with Subsets ===\n\n")

# Get only book references
books_only <- references[references$type == "book", ]
cat("Number of books:", nrow(books_only), "\n\n")

# Generate bibliography for books only
books_bibliography <- generate_bibliography(books_only)
cat("Bibliography of books:\n\n")
for (i in seq_along(books_bibliography)) {
  cat(i, ".", books_bibliography[i], "\n\n")
}


# ============================================================================
# EXAMPLE 9: Adding Custom References
# ============================================================================

cat("\n=== EXAMPLE 9: Adding Custom References ===\n\n")

# Create new reference
new_ref <- data.frame(
  author = "John Smith and Jane Doe",
  year = 2023,
  title = "Data Science Best Practices",
  source = "Academic Press",
  type = "book",
  url = NA
)

# Combine with existing references
all_references <- rbind(references, new_ref)

# Generate citation for new reference
new_citation <- generate_apa_citation(new_ref)
cat("New citation added:\n")
cat(new_citation, "\n\n")

cat("Total references now:", nrow(all_references), "\n\n")


# ============================================================================
# EXAMPLE 10: Practical Use Case - Academic Paper
# ============================================================================

cat("\n=== EXAMPLE 10: Practical Use Case - Academic Paper ===\n\n")

# Suppose you're writing an academic paper about R
# and need to cite only the relevant works

academic_papers <- references[
  references$type %in% c("article", "journal"),
]

cat("Academic papers/articles found:", nrow(academic_papers), "\n\n")

if (nrow(academic_papers) > 0) {
  academic_bib <- format_bibliography(academic_papers)
  cat("References section for academic paper:\n\n")
  cat(academic_bib)
} else {
  cat("No academic papers found in the dataset.\n")
}


# ============================================================================
# END OF EXAMPLES
# ============================================================================

cat("\n\n=== All examples completed! ===\n")
cat("Try modifying this script to:\n")
cat("1. Load your own CSV file\n")
cat("2. Filter references by year or type\n")
cat("3. Generate citations for your project\n")
cat("4. Export to different formats\n\n")
