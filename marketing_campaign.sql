--- Summary
SELECT 
    COUNT(*) AS count,
    ROUND(AVG(Income),2) AS avg_income,
	ROUND(STDDEV(Income),2) AS stddev_income,
    ROUND(AVG(Recency),0) AS avg_recency,
    ROUND(AVG(MntWines),2) AS avg_wines,
    ROUND(AVG(MntMeatProducts),2) AS avg_meats
FROM marketing_campaign;

--- Insights by marital status
SELECT 
    Marital_Status,
    ROUND(AVG(Income),2) AS avg_income,
    ROUND(AVG(MntWines),2) AS avg_wines,
    ROUND(AVG(MntMeatProducts),2) AS avg_meats
FROM marketing_campaign
WHERE Marital_status IN ('Single', 'Together', 'Married', 'Divorced', 'Widow')
GROUP BY Marital_Status;

--- Insights by education level
SELECT 
    Education,
    ROUND(AVG(Income),2) AS avg_income,
    ROUND(AVG(MntWines),2) AS avg_wines,
    ROUND(AVG(MntMeatProducts),2) AS avg_meats
FROM marketing_campaign
GROUP BY Education;

--- Campaign acceptance rates
SELECT 
    ROUND(100*(AVG(AcceptedCmp1)),2) AS acceptance_rate_cmp1,
    ROUND(100*(AVG(AcceptedCmp2)),2) AS acceptance_rate_cmp2,
    ROUND(100*(AVG(AcceptedCmp3)),2) AS acceptance_rate_cmp3,
    ROUND(100*(AVG(AcceptedCmp4)),2) AS acceptance_rate_cmp4,
    ROUND(100*(AVG(AcceptedCmp5)),2) AS acceptance_rate_cmp5,
    ROUND(100*(AVG(Response)),2) AS overall_acceptance_rate
FROM marketing_campaign;

--- Campaign acceptance by Marital Status
SELECT
	Marital_Status,
    ROUND(100*(AVG(AcceptedCmp1)),2) AS acceptance_rate_cmp1,
    ROUND(100*(AVG(AcceptedCmp2)),2) AS acceptance_rate_cmp2,
    ROUND(100*(AVG(AcceptedCmp3)),2) AS acceptance_rate_cmp3,
    ROUND(100*(AVG(AcceptedCmp4)),2) AS acceptance_rate_cmp4,
    ROUND(100*(AVG(AcceptedCmp5)),2) AS acceptance_rate_cmp5,
    ROUND(100*(AVG(Response)),2) AS overall_acceptance_rate
FROM marketing_campaign
WHERE Marital_status IN ('Single', 'Together', 'Married', 'Divorced', 'Widow')
GROUP BY Marital_Status;

--- Campaign acceptance by Education level
SELECT
	Education,
    ROUND(100*(AVG(AcceptedCmp1)),2) AS acceptance_rate_cmp1,
    ROUND(100*(AVG(AcceptedCmp2)),2) AS acceptance_rate_cmp2,
    ROUND(100*(AVG(AcceptedCmp3)),2) AS acceptance_rate_cmp3,
    ROUND(100*(AVG(AcceptedCmp4)),2) AS acceptance_rate_cmp4,
    ROUND(100*(AVG(AcceptedCmp5)),2) AS acceptance_rate_cmp5,
    ROUND(100*(AVG(Response)),2) AS overall_acceptance_rate
FROM marketing_campaign
GROUP BY Education;

--- Complain and response analysis
SELECT 
    Complain,
	CASE WHEN Response = 0 THEN 'false' WHEN Response = 1 THEN 'true' END AS Responsetext,
    ROUND(AVG(Income),2) AS avg_income,
    ROUND(AVG(MntWines),2) AS avg_wines,
    ROUND(AVG(MntFruits),2) AS avg_fruits,
    ROUND(AVG(MntMeatProducts),2) AS avg_meats,
    ROUND(AVG(MntFishProducts),2) AS avg_fish,
    ROUND(AVG(MntSweetProducts),2) AS avg_sweets,
    ROUND(AVG(MntGoldProds),2) AS avg_gold
FROM marketing_campaign
GROUP BY Complain, Response;

--- Correlation analysis
SELECT 
    CORR(Income, MntWines) AS corr_income_wines,
    CORR(Income, MntMeatProducts) AS corr_income_meats,
    CORR(Income, NumCatalogPurchases) AS corr_income_catalog,
    CORR(Income, NumStorePurchases) AS corr_income_store,
    CORR(Income, NumWebVisitsMonth) AS corr_income_web_visits
FROM marketing_campaign;

--- Correlation Matrix
SELECT 
    CORR(NumDealsPurchases, NumWebPurchases) AS corr_deals_web,
    CORR(NumDealsPurchases, NumCatalogPurchases) AS corr_deals_catalog,
    CORR(NumDealsPurchases, NumStorePurchases) AS corr_deals_store,
    CORR(NumDealsPurchases, NumWebVisitsMonth) AS corr_deals_web_visits,
    CORR(NumWebPurchases, NumCatalogPurchases) AS corr_web_catalog,
    CORR(NumWebPurchases, NumStorePurchases) AS corr_web_store,
    CORR(NumWebPurchases, NumWebVisitsMonth) AS corr_web_web_visits,
    CORR(NumCatalogPurchases, NumStorePurchases) AS corr_catalog_store,
    CORR(NumCatalogPurchases, NumWebVisitsMonth) AS corr_catalog_web_visits,
    CORR(NumStorePurchases, NumWebVisitsMonth) AS corr_store_web_visits,
    CORR(CAST(Complain as INT), Response) AS corr_complain_response
FROM marketing_campaign;
