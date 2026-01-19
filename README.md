# financial-sql-analysis
Financial Performance Analysis – SQL Project


• Project Overview: 
    This project analyzes the financial performance of companies using SQL.
    The goal is to extract business insights from revenue and expense data across multiple years and quarters.
    The focus is not just writing queries, but answering real business questions like:
           Which company is most profitable?
           Which quarter performs best?
           Who controls costs better?


• Database Structure:
    Tables used:
          companies – company details,
          financials – quarterly revenue & expenses,
          departments – department names and
          department_expenses – department-wise costs.
    Relationships are enforced using foreign keys to maintain data integrity.


• Business Questions & Insights:
    
	 1. Company-wise yearly profit
            Logic:
                Profit = Revenue – Expenses
                Aggregated year-wise per company.
            Insight:
                Helps understand which companies are consistently profitable.
   
    2. Top 3 companies by total profit
            Ranks companies based on total profit across all years.
            Business use:
                Identifies market leaders financially.
   
    3. Best performing quarter per company
      		Uses window functions to find the quarter with maximum revenue.
      		Business use: Helps in:
          		budget planning
          		identifying seasonal trends
   
	4. Year-over-Year (YOY) growth
      		Uses LAG() to compare current year profit with previous year.
      		Business use: Tracks:
          		growth
         		decline
          		financial stability
   
	5. Highest expense department per company
      		Finds which department consumes the most budget in each company.
      		Business use:
          		cost control
          		audit focus areas
   
	6. Cost efficiency of companies (Best Insight)
     		Metric:
         		Efficiency = Total Expenses / Total Revenue
          		Lower ratio = better company.
      		Business meaning:
          		Which company earns more by spending less.


• Skills Demonstrated:
    	Advanced SQL,
    	Joins,
    	Aggregations,
    	Window functions,
    	Business logic thinking and
    	Data validation using constraints.


• Final Conclusion:
    	This project shows how raw financial data can be transformed into:
	        strategic insights and
        	decision-support metrics.
    	It demonstrates both:
        	technical SQL skill and
        	financial analysis mindset.


• Future Improvements:
    	Add rolling averages,
    	Industry benchmarking and
    	Visualization using Power BI / Excel.


• Why this project matters:
    	This is not a toy project.
    	It directly relates to:
       		 finance,
        	 audit and
        	 analytics roles.
