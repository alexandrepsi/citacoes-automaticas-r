# Complete Professional Document Example

This R script demonstrates how to create a complete professional document using R Markdown. The document includes text, tables, citations, and a bibliography in APA format.

## Setup
Make sure to have the following libraries installed:

```r
install.packages(c('rmarkdown', 'knitr', 'kableExtra', 'papaja'))
```

## Document Header
You can define the document header with YAML metadata:

```yaml
---
title: "Your Title Here"
author: "Your Name Here"
date: "`r Sys.Date()`"
output: papaja::apa6_pdf_document
bibliography: references.bib
---
```

## Example Text
You can write your introduction here:

```r
## Introduction
This is the introduction of your document. You can cite a source like this: @author2020.
```

## Creating Tables
Here's how you can create tables:

```r
data <- data.frame(
  Column1 = c(1, 2, 3),
  Column2 = c("A", "B", "C")
)
knitr::kable(data, caption = "Example Table")
```

## Citations
To cite sources in your text, you can use the `@key` notation, referring to your bibliography:

```r
In APA style, citations include the author's last name and the year of publication (Author, 2020).
```

## Bibliography
Create a `references.bib` file where you can add your references in BibTeX format:

```bibtex
@article{author2020,
  title={Title of the Article},
  author={Author, A.},
  journal={Journal Name},
  volume={1},
  number={1},
  pages={1-10},
  year={2020}
}
```

## Rendering the Document
To render the document, run:

```r
rmarkdown::render("your_document.Rmd")
```

This will create your PDF document adhering to APA formatting guidelines.