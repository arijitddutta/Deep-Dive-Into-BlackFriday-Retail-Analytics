# Black Friday Sales Analysis

> Career247 "Data Analytics with GenAI" — Capstone Project
> Retail Analytics Center of Excellence | Data Analytics Consultant: [Arijit](https://github.com/arijitddutta)

## Overview

Black Friday drives peak transaction volume across a retailer's physical and online
channels — and with that scale comes fragmented customer behavior, uneven product
demand, and marketing spend that's hard to justify without data. This project turns a
550K-row Black Friday transaction extract into a data-driven view of customer
segments, product performance, and campaign strategy for future mega-events.

## Problem Statement

The leadership team needs answers to four questions:

- Which customer segments contribute the most to sales, and which are underpenetrated?
- How do demographics and lifestyle attributes (age, occupation, city tenure) influence purchase size and category mix?
- Which product categories dominate sales, and where are the cross-sell / upsell opportunities?
- How do we design targeted campaigns and loyalty strategies to retain high-value customers beyond Black Friday?

Full context: [`docs/BRD_Black_Friday_Sales_Analysis.pptx`](docs/BRD_Black_Friday_Sales_Analysis.pptx)

## Dataset

| | |
|---|---|
| Source | `Black_Friday_Data.csv` |
| Rows | 550,068 transactions |
| Unique customers | 5,891 |
| Unique products | 3,631 |
| Fields | 12 — customer demographics, product category (1–3), purchase amount |

Full field dictionary is in the BRD. Raw file lives untouched in `data/raw/`; anything
cleaned or feature-engineered is written to `data/processed/`, never back into `raw/`.

## Tools & Stack

`Excel` · `MySQL` (SQL DDL, staging → constrained table) · `Python` (pandas, matplotlib,
seaborn, scipy.stats, statsmodels) · `SQLAlchemy` + `PyMySQL` · `Power BI` / `Tableau`

## Deliverables

- [x] **1. Business Understanding & KPI Framework** — BRD & planning deck
- [x] **2. Data Acquisition & Validation** — Excel validation, MySQL staging table → constrained `black_friday_data` table with PK/NOT NULL/CHECK constraints
- [ ] **3. Exploratory Data Analysis & Descriptive Statistics** — *in progress:* outlier validation on `Purchase` complete
- [ ] **4. Customer & Product Segmentation Analysis**
- [ ] **5. Performance Dashboarding** (Power BI / Tableau)
- [ ] **6. Strategic Insights & Recommendations**

### Core KPIs

Total Sales · Average Purchase per Customer · Repeat Purchase Rate · Category
Penetration · City-Level Contribution · High-Value Segment Share

### Hypotheses Under Test

| Hypothesis | Method |
|---|---|
| Gender vs. Purchase Value | Independent Samples T-Test |
| Age Group vs. Purchase Value | One-Way ANOVA |
| City Category vs. Purchase Value | One-Way ANOVA |
| Marital Status vs. Purchase Value | Independent Samples T-Test |

## Key Findings

- **Outlier validation (Purchase):** 0.49% of transactions (2,677 rows) exceed the IQR
  upper bound of ₹21,400. A z-score cross-check (`|z| > 3`) flags zero rows — this is a
  right-skewed distribution, not an erratic one. 85% of the flagged rows belong to
  Product Category 10, where they represent 44% of that category's own volume.
  **Conclusion:** category-driven pricing, not data-entry error — flagged as
  `is_high_value` rather than removed.
- *(more findings land here as later deliverables complete)*

## Repository Structure

```
black-friday-sales-analysis/
├── README.md
├── requirements.txt
├── .gitignore
├── .env.example
│
├── docs/                     # BRD deck, ER diagram, data quality log
├── data/
│   ├── raw/                  # original CSV — never edited in place
│   └── processed/            # cleaned / feature-engineered exports
├── sql/
│   ├── ddl/                  # CREATE TABLE scripts
│   ├── migration/            # staging → final table
│   └── queries/              # exploratory SQL
├── notebooks/                # numbered, run in order
├── dashboards/                # .pbix / .twbx files
└── outputs/                  # exported charts, executive summary
```

## Setup

```bash
git clone <repo-url>
cd black-friday-sales-analysis
python -m venv venv
venv\Scripts\activate          # Windows
pip install -r requirements.txt
copy .env.example .env         # then fill in your DB credentials
```

Run the notebooks under `notebooks/` in numbered order — each one assumes the previous
step's output exists.

## Author

**Arijit** — [github.com/arijitddutta](https://github.com/arijitddutta)
