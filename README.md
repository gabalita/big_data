# Amazon Big Data Project

## Overview of the analysis: 
The purpose of this analysis was to  analyze Amazon reviews written by members of the paid Amazon Vine program and determine if there was any bias.

## Tools:
- AWS 
- PySpark
- PostgreSQL/pgAdmin
- Sample Book Review Dataset

## Context: 
The Amazon Vine program was a service that allowed manufacturers and publishers to receive reviews for their products. Companies paid a small fee to Amazon and provided products to Amazon Vine members, who were then required to publish a review.

## Results:
ETL was performed in PySpark and the cleaned data was loaded into SQL. The breakdown of Vine Reviews is given below. <br><img width="353" alt="Screen Shot 2021-10-18 at 11 25 11 AM" src="https://user-images.githubusercontent.com/10199828/137761622-e62d74ff-f88d-4348-a04f-4c46f5efa92b.png">
<br>

**Key Takeaways:**
1. This dataset was almost entirely from non-Vine members. Only 2 out of 3,105,515 reviews were written by Vine members.
2. Of the five star reviews, 1,864,803 were from non-Vine users and only 1 was written by a Vine member.
3. Roughly 60% non-Vine reviews were 5 stars, and 50% of Vine reviews were 5 stars. 

**Summary:**
- Positivity bias for reviews could not be detected because this dataset did not include sufficient data from Vine users. That being said, the same code and approach can used to test any future datasets. 
- A more comprehensive analysis of bias in Vine members could utilize the following views:
  - Percentage of reviews with stars (1-5) for Vine vs non-Vine by every Product Category
  - Specific reviewer_ids that are deviating from a product_id's average star rating 


**Additional tables put together in Deliverable 2:**<br>
<br>**Table of products that had more than 20 reviews:**
<br><img width="582" alt="Screen Shot 2021-10-18 at 1 27 01 PM" src="https://user-images.githubusercontent.com/10199828/137778903-d8ef09a5-3454-49c2-b90b-51a993501810.png">

**Table with reviews (greater than 20+) where helpful:total was >= 0.5 <br>**
<img width="716" alt="Screen Shot 2021-10-18 at 1 21 49 PM" src="https://user-images.githubusercontent.com/10199828/137778212-b7e4dedb-6afd-4dce-b5bb-674eab8fab69.png">

**Table of Vine 20+ views with 0.5 helpful:total ratio:**
There is no data for this view because this dataset only included 2 Vine reviews (out of 3.1 million). Those two views only had 3 and 6 total votes, respectively (see below). <br> 
<img width="565" alt="Screen Shot 2021-10-18 at 1 31 43 PM" src="https://user-images.githubusercontent.com/10199828/137779569-931165de-860e-41fa-ad27-4d69b3dfb89e.png">

**Table of non-Vine 20+ views with 0.5 helpful:total ratio:** <br>
<img width="716" alt="Screen Shot 2021-10-18 at 1 30 00 PM" src="https://user-images.githubusercontent.com/10199828/137779323-47464f83-719f-4601-af4d-ffe1a531a08c.png">


