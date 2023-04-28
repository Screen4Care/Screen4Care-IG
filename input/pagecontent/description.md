
**Table of content**


## Description of a person (patient/research subject) ##
The PERSON module plays a central role in the information model of each hospital and each large study, as well as in cross-site or cross-project information models.
 
In the present specification, the PERSON module is explicitly modeled for PATIENTS and PROBANDS, the previous DEMOGRAPHY module is integrated, and the possibility of a cross-site Master Patient Index based on identifying data (IDAT) is provided.
 
The addition of demographic features such as date of birth, gender, and place of residence improves the identification capability. (The insurance number can be mentioned as a further, in a certain context well identifying characteristic for patients with statutory insurance (90% of the population in Germany)).
 
The individual data on persons in the PERSON module are not used for identification purposes only. An attribute such as place of residence is also needed for spatial analyses; and age and gender, for example, are also needed for risk adjustment. The fact that this information is contained in the PERSON module of the core data set does not mean that it is intended for general release. Their use is subject to the rules of the respective data integration center and the Medical Informatics Initiative (MII). The required special security must be ensured by technical and organizational measures and as part of the implementation.
 
Within hospitals or other health care institution, the term *patient* is used for persons admitted for care on one or more occasions. In most cases, a person receives a *patient identifier* and a *case number/admission number* the first time they are hospitalized. Each time a person is admitted again, administratively delineated, they receive new case numbers; the patient number should be retained for life, if possible. Each person can be a patient in several different hospitals and other health care institutions and is assigned a institution-specific patient identification number for each. For more information on the *patient* entity, look at module CASE.
 
In studies, the term *subject* is used for test persons. Each person can be a subject in different studies and receives a new *subject identification number* in each case.
 
From the perspective of the MII, a distinction must be made between external and internal test persons. External subjects are enrolled in cohort studies, registry studies, or randomized clinical trials where data are collected independently of the MII. On the other hand, Internal subjects are enrolled in the MII based on health care data, and individuals may be test persons more than once, for example, in the HiGHmed use cases Infection Control and Cardiology or the SMITH use cases HELP and ASIC, and additionally in one or both of the consortia-wide use cases CORD and POLAR. Each person can be a test person more than once.
 
For each subject, the study in which participation is taking place is noted. In addition, the featuressubject identification code, legal basis of participation, start, end and status of participation are documented.


## Context in overall project/ References to other modules ##
The module PERSON plays a central role in all use cases of the MII in the form of the entity patient and in the form of the entity test person:
- Patient: Secondary use of health care data is the focus of MII. Data of a patient exists only if the entity patient exists. The local Data Intergration Center (DIC) hold the local patient data for use.
- Subjects: Each inclusion in an MII use case generates one test person.
 
Person, patient and subject are at the beginning of all paths. This already happens when the data of the local care are prepared and made available in a "findable", "accessible", "interoperable" and "reusable" manner ([FAIR principles](https://www.go-fair.org/fair-principles/)) only locally at the site of care and when an initial study is planned.
 
The central role is played by the PERSON module with the entities patient and subject. Since each institution maintains its own instance of the MII core data set for all patients of the institution, there is initially usually a 1:1 relationship between person and patient per site. Since no individual is required to participate in a study but may participate in many studies, a 0:n relationship exists between individual and test person. Regular participation in the studies and notations as a patient are based on the patient's consents. The participation can also occur on a legal basis without agreement with the individuals, such as in the HiGHmed Use Case Infection Control, in which all patients of the participating hospitals (infected persons as the study group and non-infected persons as the reference group) receive a subject identification code on the basis of the Infection Control Act (IfSG) and are thus included.



## Description of a diagnosis
### Introduction
Diagnoses play a vital role in many different Questions, therapy decisions and business processes of the German healthcare system and thus also in the use cases of Medizininformatik-Initiative (MII) (Eng. Medical Informatics Initiative).

The goal of providing support and enabling for the use cases of MII, across consortia and institutions, is the superficial criterion in modelling the module `DIAGNOSIS` and the respective FHIR-profiles.
As far as possible, as well as focused as possible, more use cases are anticipated. 

The module `DIAGNOSIS` is meant to hold the description of disease and more features of a person (as stored in module PERSON). Each person may have one or more diseases at a given point in time or during a time period. These can be described by diagnoses with variable accuracy. 

Due to the MII priority of secondary use of real-world data of the health care context for both care and research, the basic module `DIAGNOSIS`, which is intended to designate and provide diagnoses in a provider-, sector- and context-neutral manner as far as possible, encounters notable challenges. For some use cases, the design of the module can only compensate to a limited extent for the limitations regarding the requirements of multiple usability, temporal assignment and international interoperability of the digitally available data sources.

The authors of the module `DIAGNOSIS` attempt to provide their part in overcoming these restrictions by setting milestones for documentation in the german healthcare system.

First and foremost, the use of additional catalogs will be anticipated. For international - or special projects (e.g. rare diseases) the parallel availability of complementary diagnostic catalogs is required. The following can be highlighted:

- ORPHA codes for rare diseases
- SNOMED CT (Systematized Nomenclature of Human and veterinary Medicine - Clinical Terms)
- Alpha-ID which is based on the alphabetical index in ICD-10-GM

As of now, the 11th revision of the ICD must also be taken into account, the introduction of which is being prepared by the subordinate BMG authorities DIMDI and BfArM. 

For example, the use of the ICD-O which allows a more differentiated
description of cancers, is also aimed at. 
However, this will not be opened in the basic module DIAGNOSIS, 
but in the extension module ONKOLOGY. 
Furthermore, the use of symptom and phenotype terminologies, 
such as the Human Phenotype Ontology is to be standardized. 
However, this will also not be done via the basic module `DIAGNOSIS`, but via an extension module with the working title `CLINIC/SYMPTOM/PHENOTYPE`. 