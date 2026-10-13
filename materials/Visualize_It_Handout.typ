// Guide for "Visualize It: Designing Impactful and Accessible Data Visualizations"
// Peter Lawson, DLF 2026 Forum
//
// Compile:  typst compile Visualize_It_Handout.typ
// Tagged/accessible PDF:  typst compile --pdf-standard ua-1 Visualize_It_Handout.typ

#let accent = rgb("#7E2504")
#let dark-grey = rgb("#333333")

#set document(
  title: "Data Visualization Recommended Practices",
  author: "Peter Lawson",
  description: "Guide for the DLF 2026 Forum presentation \"Visualize It: Designing Impactful and Accessible Data Visualizations\"",
)
#set page(
  paper: "us-letter",
  margin: (x: 0.9in, y: 0.8in),
  footer: context align(center, text(size: 8pt, fill: luma(90))[
    Visualize It · DLF 2026 Forum · CC BY-SA 4.0 · #counter(page).display()
  ]),
)
#set text(font: ("Inter", "Helvetica Neue", "Arial"), size: 10.5pt, lang: "en")
#set par(leading: 0.6em, spacing: 0.9em)
#set list(indent: 0.4em, body-indent: 0.6em, spacing: 1em, marker: ([•], [–]))

#show heading.where(level: 1): it => block(above: 1.6em, below: 0.8em, sticky: true)[
  #set text(size: 13pt, weight: "bold", fill: accent)
  #it.body
]
#show strong: set text(fill: dark-grey)
#show link: set text(fill: accent)
#show link: underline

// ---------------------------------------------------------------- title
#block(below: 1.2em)[
  #text(size: 20pt, weight: "bold", fill: accent)[Data Visualization Recommended Practices]
  #v(0.2em)
  #text(size: 10.5pt)[
    Companion guide for _Visualize It: Designing Impactful and Accessible Data Visualizations_ \
    Peter Lawson · DLF 2026 Forum
  ]
  #v(0.4em)
  #line(length: 100%, stroke: 1pt + accent)
]

= 1. Know your message

- *Find your story.* Decide what you want the reader to learn before you choose a chart.
- *Match the chart to the story.* Visit the #link("https://datavizcatalogue.com/search.html")[Data Viz Catalogue] for help choosing the right visualization for what you want to show. Some examples:
  - Comparison: bar chart
  - Trend over time: line chart
  - Part-to-whole: stacked bar chart, donut chart or pie chart (best with five or fewer categories)

= 2. Keep it simple and clear

- *Remove "chart-junk."* Delete unnecessary borders, backgrounds, gridlines, and 3D effects. If an element can be removed without losing information, remove it.
- *Label everything, or explain it in the caption.* This includes axis labels (with units), legends, and the data source.
- *Make text readable.* Use fonts large enough to read when printed or displayed.
- *Order categories meaningfully.* Sort bars by value rather than alphabetically, unless there is a natural order such as time or age group.
- *Use direct labeling when possible.* Label lines and bars directly instead of making readers look back and forth to a legend. If you must use a legend, order it to match the order of the data.
- *Split complex charts into several smaller charts, one for each value of a variable.* For example, instead of using color to show five regions in one chart, make one panel per region (also called facets or trellis plots). Use the same axes in every panel so they’re easy to compare.

= 3. Use color with purpose

- *Every use of color needs a reason.* Color should highlight data, or represent values, not decorate.
- *Limit categorical colors to six.* If you need more, collapse categories into groups or simplify to a single muted color plus one highlight accent.
- *Keep colors consistent across charts.* If "Region: Midwest" is blue on one chart, it should be blue on all other charts.
- *Avoid rainbow palettes for quantitative information.* They create false boundaries and are hard to put in order.
- *Tip:* View your chart in grayscale. Is it still understandable?

= 4. Make it accessible

- *Check contrast (WCAG 2.1 AA).* Chart elements need at least 3:1 and text needs at least 4.5:1. Verify at #link("https://webaim.org/resources/contrastchecker/")[webaim.org/resources/contrastchecker].
- *Choose colorblind-friendly palettes.* Examples (not exhaustive):
  - Categorical: Okabe-Ito
  - Continuous: Viridis
  - Diverging: blue–red or blue–orange
- *Test your chart.* Use the Coblis color blindness simulator to see how your image looks with different types of color vision deficiency: #link("https://www.color-blindness.com/coblis-color-blindness-simulator/")[color-blindness.com/coblis-color-blindness-simulator].
- *Write alt-text.*
  - Simple plots: a short summary plus a data table.
  - Complex plots: a short summary plus a long description.
- *Never rely on color alone* to convey meaning.
  - Use redundant codings, e.g., color and marker shape in a scatterplot.

= 5. Be honest

- *Be careful with axis ranges.* Bar charts should start at zero because bar length encodes the value. Line and scatter charts can use a non-zero baseline when it is clearly labeled.
- *Don't use axis breaks.* If outliers compress your data, use a clearly labeled logarithmic scale or add a separate zoomed-in panel.
- *Show uncertainty* (error bars, confidence intervals) when it matters.
- *Cite your data source* and note any exclusions or transformations.

= 6. A quick checklist

#block(
  width: 100%,
  inset: (x: 1em, y: 0.9em),
  stroke: 0.8pt + accent,
  radius: 4pt,
  breakable: false,
)[
  #set list(marker: text(fill: accent)[☐], spacing: 0.9em)
  - Can someone state the main takeaway in 5 seconds?
  - Is everything labeled that will not be explained in a caption?
  - Is anything on the chart removable without losing information?
  - Does it work in grayscale and for colorblind readers?
  - Does it pass contrast checks?
  - Does it have alt-text?
  - Did someone unfamiliar with the data review it?
]
