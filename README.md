# Pizza Sales Dashboard

An interactive pizza sales analysis project built with **Microsoft SQL Server** and **Tableau**. SQL is used to calculate and validate key business metrics, while Tableau presents the results in a dashboard for exploring sales performance and trends.

## Project goals

- Turn transactional pizza order data into clear sales and operational insights.
- Measure revenue, order volume, pizza quantity, and average order performance.
- Explore trends by hour, week, pizza category, and pizza size.
- Compare top-performing pizzas using multiple measures.
- Cross-check dashboard KPIs against SQL query results.

## Dashboard

The Tableau dashboard includes KPI cards for total revenue, average order value, pizzas sold, total orders, and average pizzas per order. Its visualizations include hourly pizza sales, weekly order trends, category performance, sales by pizza size, and category comparisons. The pizza category and order date controls let viewers filter the dashboard and explore different slices of the data.

The dashboard also highlights busy ordering hours and weeks, making it easier to identify when demand is strongest. See [`dashboard.png`](./dashboard.png) for a preview.

## SQL analysis and concepts

The queries in [`pizza_sales.sql`](./pizza_sales.sql) demonstrate several practical SQL Server techniques:

- **Aggregations:** `SUM`, `COUNT`, and `ROUND` calculate totals and present revenue to two decimal places.
- **Distinct counting:** `COUNT(DISTINCT order_id)` counts orders rather than individual pizza rows, which is essential when an order contains multiple pizzas.
- **Derived KPIs:** Revenue per order and pizzas per order are calculated from the underlying totals.
- **Date analysis:** `DATEPART(week, order_date)` and `YEAR(order_date)` group orders into week/year periods for trend analysis.
- **Grouped comparisons:** `GROUP BY` calculates results per pizza category, size, or name.
- **Subqueries:** A scalar subquery supplies a sales total used as the denominator for percentage calculations.
- **Ranking and sorting:** `TOP 5` with `ORDER BY ... DESC` returns the leading pizzas by revenue, quantity sold, or order count.
- **Type conversion:** `CAST` converts values to decimal types before division and rounds the pizzas-per-order result to two decimal places.

### KPI definitions

| Metric | Calculation |
|---|---|
| Total revenue | Sum of `total_price` |
| Average order value | Total revenue divided by the number of distinct orders |
| Total pizzas sold | Sum of `quantity` |
| Total orders | Number of distinct `order_id` values |
| Average pizzas per order | Total quantity divided by distinct order count |

These definitions help keep the SQL calculations and Tableau KPI cards consistent. When validating a KPI, use the same date range and filters in both SQL Server and Tableau.

### Percentage and ranking analyses

The SQL script also compares sales by pizza size and calculates category sales percentages for **February**. The top-five queries rank pizzas separately by revenue, quantity sold, and distinct orders, so each ranking answers a different business question.

## Tableau skills demonstrated

- Connecting a dashboard to sales data and working with dimensions and measures.
- Creating KPI views and aggregate calculations.
- Building time-based views for hourly and weekly trends.
- Comparing categorical data with charts for pizza category and size.
- Using filters for pizza category and order date.
- Combining worksheets into a dashboard and arranging the layout for readability.
- Designing visual cues, labels, legends, and summaries to make key findings easy to scan.
- Using dashboard selections to explore how performance changes across categories and dates.

## Data assumptions and validation notes

The SQL expects a table named `pizza_sales` with fields including `order_id`, `order_date`, `quantity`, `total_price`, `pizza_category`, `pizza_size`, and `pizza_name`. The script starts with a `SELECT *` statement for inspecting the source rows; the remaining queries calculate the metrics and comparisons described above.

For reliable comparisons, use consistent date filters, category filters, and aggregation levels in both tools. In particular:

- Count distinct orders rather than rows when calculating order-level metrics.
- Keep the February filter in the category-percentage query in mind; its results are specific to that month.
- Ensure percentage denominators use the same filtered population as the numerator when changing the analysis period.
- Confirm that date grouping and week definitions match between SQL Server and Tableau.
- Check that decimal precision and rounding are applied consistently when comparing displayed values.

## Files

- [`pizza_sales.sql`](./pizza_sales.sql) — SQL Server queries for KPIs, trends, percentages, and top-five rankings.
- [`dashboard.png`](./dashboard.png) — Tableau dashboard preview.
