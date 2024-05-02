# Code for `pittpalette` R package.
# Code is adopted from Cianna Bedford-Peterson's `inauguration` R package.
# Source code: https://github.com/ciannabp/inauguration
# Please find the copyright description from Cianna Bedford-Peterson's R package at the end of this file.


#' List of color palettes.
#'
#' Use \code{\link{render_pitt_palette}} to construct palettes of desired length.
#'
#' @export
pitt_palettes <- list(
  primary_contemporary = c("#003594", "#FFB81C"),
  primary_legacy = c("#141B4D", "#00205B", "#B58500"),
  primary = c("#003594", "#FFB81C", "#141B4D", "#00205B", "#B58500"),
  secondary = c("black", "white", "#75787B", "#97999B", "#C8C9C7"),
  accent_rich = c("#7C6992", "#7E5475", "#008264", "#DC582A", "#0081A6"),
  accent_vibrant = c("#EDE939", "#71C5E8", "#E87722", "#A4D65E", "#DBC8B6"),
  accent = c("#7C6992", "#7E5475", "#008264", "#DC582A", "#0081A6",
             "#EDE939", "#71C5E8", "#E87722", "#A4D65E", "#DBC8B6")
)

#' Pitt palette rendering
#'
#' @param n Number of colors desired. Most palettes have 3-6 colors. Most color
#'   schemes are derived from \href{https://www.brand.pitt.edu/visual-identity/color-palettes-0}.
#'   If omitted, uses all colors.
#' @param name Name of color palette. Choices are:
#'   \code{"primary_contemporary"}, \code{"primary_legacy"}, \code{"primary"},
#'   \code{"secondary"},
#'   \code{"accent_rich"}, \code{"accent_vibrant"}, and \code{"accent"}.
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
#' @return A vector of colors.
#' @export
#' @keywords colors
#' @examples
#' render_pitt_colors("primary_contemporary")
#' render_carnegie_colors("accent_vibrant", 3)
render_pitt_palette <- function(name, n) {

  pal <- pitt_palettes[[name]]
  if (is.null(pal))
    stop("Palette not found.")

  if (missing(n)) {
    n <- length(pal)
  }

  if (n > length(pal)) {
    stop("Number of colors requested is larger than the chosen palette can provide.")
  }

  out <- pal[1:n]

  structure(out, class = "palette", name = name)
}


#' @export
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, col = "#32373D")
}


# MIT License

# Copyright (c) 2021 Cianna Bedford-Petersen

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
