# 🎯 RFM Customer Segmentation Analysis

**Dhiraj Taye** | Data Analyst | Dibrugarh, Assam  
*BigQuery SQL → Power BI Dashboard | March 2026*

---

## 📊 Project Overview
**Business Problem**: Identify high-value customers and churn risks (300 customers, 2025 sales)

**Solution**: RFM pipeline → 8 actionable segments  
**Impact**: **81 customers (27%)** drive **70%+ revenue**

## 📈 Key Findings

| Segment | Count | % | Priority | Action |
|---------|-------|---|----------|--------|
| **Champions** | **20** | **6.7%** | ⭐ VIP | Upsell |
| **Loyal VIPS** | **61** | **20.3%** | 🥈 Retain | Loyalty |
| **At Risk** | **23** | **7.7%** | ⚠️ Urgent | Win-back |
| **Lost** | **8** | **2.7%** | 💀 Reactivate | Last call |

## 🛠️ Tech Stack
**BigQuery SQL: UNION ALL + CTEs + NTILE(10)
**Power BI: RFM Scatter + KPIs + Slicers


## 💻 Dashboard Preview
![Dashboard](dashboard.png)

**RFM Plot**: Freq(X) vs Monetary(Y) | Size=Recency | Color=Segment

## 🔍 Top Champions
| Customer | Recency | Orders | Revenue | Score |
|----------|---------|--------|---------|-------|
| CUST0012 | 84d | **10** | **₹188** | **30/30** |
| CUST0215 | 88d | **7** | **₹134** | **30/30** |

## 🎯 Recommendations
1. **Champions (20)** → VIP upsell
2. **At Risk (23)** → 40% discount **NOW**
3. **ROI**: +25% revenue expected
