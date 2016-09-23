# Data Mining
This is the repository for the data mining course at the University of Southampton (2015-16)

## [Aims and Objectives](http://www.ecs.soton.ac.uk/module/COMP6237)
Overview

### Aim
Having successfully completed this module, you will be able to:
 * appreciate the role of data-mining in solving real-world problems

### Knowledge and Understanding
Having successfully completed this module, you will be able to demonstrate knowledge and understanding of:
 * Key concepts, tools and approaches for data mining on complex unstructured data sets (including multimedia mining, Twitter analysis, etc)
 * Natural language processing techniques for extracting features from text
 * The theory behind modern data indexing systems
 * Techniques for modelling and extracting features from non-textual data
 * State-of-the-art data-mining techniques including topic modelling approaches such as LDA, clustering techniques and applications of matrix factorisations
 * Theoretical concepts and the motivations behind different data-mining approaches

### Subject Specific Intellectual
Having successfully completed this module, you will be able to:
 * Conceptually understand the role of data-mining, together with the mathematical techniques this requires

### Subject Specific Practical
Having successfully completed this module, you will be able to:
 * Solve real-word data-mining, data-indexing and information extraction tasks 

## Syllabus

 * Key concepts
	 * The importance of data-mining
	 * Real-world applications of data-mining (cyber-security, financial forecasting, trend prediction, etc)
	 *  What is unstructured data
		 * Modalities of data
 	 * Underlying techniques
		 * Inverted indexes
		 * Matrix factorisation
		 * Probabilistic graphical models
		 * Dimensionality reduction
 * Modelling data
	 * Understanding Text
		 * Bags of Words
		 * TF-IDF
		 * Natural language processing
			 * POS Tagging
			 * Entity extraction
	 * Dealing with non-textual data
		 * Feature extraction techniques
		 * Bags of features
	 * Modern data indexing at scale
		 * Information retrieval models
		 * Efficient indexing (one-pass versus two-pass; updatable indexes)
		 * Index compression
		 * Ranking models
	 * Unimodal data mining
		 * Dimensionality reduction
		 * Topic modelling (techniques such as LSA, pLSA, LDA, NNMF)
		 * Clustering (Hierarchical agglomerative, Spectral)
		 * Multi-dimensional scaling
		 * Mining graphs and networks (hubs and authorities [PageRank/HITS], spectral methods, etc)
	 * Multimodal data mining
		 * Finding independent features (ICA, NNMF)
		 * Finding correlations and making predictions (CL-LSI, classifiers, etc.)
		 * Collaborative filtering and recommender systems

## Courseworks

### CW1: Natural Language Processing ([Specification](https://github.com/alunmeredith/DataMining/blob/master/IndividualCoursework/Specification.pdf), [Report](https://github.com/alunmeredith/DataMining/blob/master/IndividualCoursework/Report/DataMiningReport.pdf), Grade: 96/100)
Exploratory/descriptive data mining on  24 texts about Antiquity (both classical and secondary literature); the original books have been scanned and run through an Optical Character Recognition system to produce an HTML document for each page. Parsing the data into a usable format, feature extraction and applying standard techniques such as Entropy calculations, K-Means and Hierarchical Clustering, and data-analytic visualisation techniques like Multidimensional Scaling and Principal component analysis. 

__Feedback__:
Excellent analysis of the problem - very obvious in the report that you spent time looking at and understanding the data before applying the analytic techniques and then used this understanding to help with interpretation. Well done. 

### CW2: Predictive Data Mining Group Project ([Specification](https://github.com/miballeuk/airbnb/blob/master/Specification.pdf), [Report](https://github.com/miballeuk/airbnb/blob/master/Deliverables/DMCW2Report.pdf), Grade: 80/100)
This coursework used the AirBnB kaggle competition, predicting user destination countries from session data. Exploring the data and implementing and comparing a collection of models; neural networks, gradient boosting and random forests. The group coursework is stored in [this](https://github.com/miballeuk/airbnb) repository. 

