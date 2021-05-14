# Executive Summary

By Ramon Perez

The Iconic Data Science Challenge

## The Problem

Keeping customers happy is no easy task, and doing so while our knowledge of them is limited, can be even more challenging. Because of this, this task aims to reduce the uncertaincy of what we don't know about our customers yet using what we do know about them.

The task is to build a pipeline wereby the data available get's inspected, cleaned, reshaped, best-selected, modelled, and evaluated. All while having no clue about the source of truth behind the labels that make up the gender of a customer.

## The Data (Cleaning)

The data contain rich purchase and visit behaviour and deanonnimized information to protect the privacy of our customers. The featues are mostly numerical and include revenue, order, returns, cancellations, platforms used, and different raw counts of gender-relate item purchases.

The data had two corrupt variables, several duplicate rows, and a significant number of variables highly correlated with one another. The two corrupted variables were `days_since_last_order` and `average_discount_rate`. Both of these were in different scales than similar variables as well as what their names inplied (e.g. days_since). For instance, `days_since_last_order`was in hours rather than days, and `average_discount_rate` was in the thousands rather than as a percentage. Nonetheless, the duplicated rows were removed and the aformentioned columns were dealt with and rescaled into their approriate format.

There were also two variables, not found in the dictionary, that appeared in the dataset, these were `coupon_discount_applied` and `redpen_discount_used`. The former had missing values, the only ones in the dataset, and there was no clarity on the latter as to what it represented. The missing values were filled with zeros.

## Feature Engineering

The were a host of features to create new ones from and many others to condense into fewer features. For example, the different kinds of items purchased by males and females, the payment types, the place where orders were delivered and the method by which a consumer placed an order, were all part of a whole feature. Hence, these only needed one representation in the model to avoid high correlations in either directions.

In addition to reducing these features to fewer variables by taking the percentage of the female ones versus all others, I also created an average amount of days by orders placed. Moreover, several categories both numerical and non-numerical, required or benefited from, getting encoded into dummy variables. For example, such variables were the newsletter signees, the curvy items purchases and the has_cancelled a purchase var.

Some of the features I would have love to find, aside from the ones given, would have been geographical ones. Australia is a big country in size but not in population, and regardless if it were, there's a lot of information one can derive from physical locations alone that could help the clustering and classification processes be much more robust. For example, features that capture

- The relationship between vouchers, items, and a geographical location
- The return patterns base on particular locations
- The cancellations of particular items paid in full versus items paid with discounts
- The combination of time of day, month, and year where vouchers, discounts, and other features that can aggregate together 
- The combination of other categorical information containing specific attributes of the items purchased

would be interesting combinations of features that might enable more useful groupings and results. 

## Conclusion

While the output of the classification model provided a high accuracy, the labels it used as its source of truth for training and validation came form a completely unsupervised process with a lot of room for improvement. For example, Universal Manifold Approximation and Projection is an excellent algorithm for dimensionality reduction and pure exploratory data analysis. That said, other dimmensionality reduction techniques, such as non-negative factorization matrix or, other clustering algorithms that do not expect the parameter K but that provide noise in place of the wrong assignment of a label, might have been better suited for the gender inference task. Our k-means only achieved a silhouette score of ~67 and this roughly tells us the measure by which our groups are clorely related to themeselves and closely unrelated to the other group(s).

Nevertheless, a proof of concept such as the one created for this task can be beneficial for the operations at The Iconic in several ways. For example, while gender was not a clear cut replacement for the source of truth, segmenting consumers based of their purchasing preference, whether based on male or female clothing purchases, or sporty or accessory-full ones, these segments can help tailor marketing strategies more effectively and customize the experience of our customers further.