# ImplementationGuide Screen4Care

## **Introduction**

For patients with rare diseases this Implementation Guide aims to combine two fields of medical documentation:
1.	the structured clinical care documentation (regardless of the type of disease) and
2.	the scientifically-oriented registry documentation for rare and complex diseases with a general part and a special part for each selected spectrum of diseases.

In the care documentation, it is largely the case that it is initially not specific to the disease. A differentiation occurs, however, in that special elements are added to the documentation for specific diagnostic and therapeutic processes. In this sense, the supply part of the RD-documentation does not specifically differ from the general documentation, but it can contain special elements as a rule - for example, a disproportionately large number of exome analyzes. A special element is that among the documented diagnosis there is a rare disease, which should include an Orpha code if possible.
The next component of the RD-documentation described by the IG RDD is a common data set - regardless of specific disease groups. The common data set is based on the ERDRI CDS, the French National Rare Diseases Minimal Data Set and the German Examination-booklet.


As a third building block- specific modules for disease groups, that are based on existing special documentation, should be added - in particular the registries of the specific ERN.
When combining the forms of documentation, contradictions or tensions that may arise should be approached constructively in a learner improvement process.
Large hospitals are assumed as the documentation environment, which on the one hand operate a Data Integration Center (DIC) based on the model of the Medical Informatics Initiative and on the other hand have special medical areas for rare diseases with A- and B- centers based on the NAMSE concept.
As a first approximation, it is assumed that the regular care data are collected in any hospital information system and that a coordinating organizational unit (e.g. DIC) is largely standardized in the MII CDS format.
This should be followed by a special rare disease documentation based on the model of the present IG, which on the one hand is connected to the Hospital Information System (HIS) at least unidirectionally and on the other hand is accessible in a controlled manner by the DIC at least for cross-facility use parallel to the HIS.
This implementation guide explains the documentation, describes use cases and defines the rules of technical implementation.


---
## **1.2	Documentation goals, contexts and variants**

The present IG assumes that in the course of the qualified digitalization or the standardized digital conversion in the German health care system, the boundaries between care documentation according to BGB §§ 613a-f, the scientific registry for selected diseases and partly the documentation for controlled clinical studies can be lost or actively lifted. This is explained in sections [1.3](#1.3), [1.4](#1.4) and [1.5](#1.5) and underlined with examples in section 4.1.

---
<a id="1.3"></a>
## **1.3 Care documentation for people with rare diseases**
The content, form and IT system basis of the general care documentation in the university clinics and in other hospitals show similarities and differences. The care documentation for people with rare diseases (RD-documentation) does not fundamentally differentiate in the respective house from the documentation with other diseases. In fact, the critical point up to now is that it has so far not been adequately differentiated even in the diagnosis coding with the leading ICD-10-GM code system.

This explicit point has been addressed through the inclusion of the Orpha cod-ing in the MII core data set, the GBA resolution on the financing of centers for rare diseases and the Parliament of the Federal Republic of Germany draft of the Digital Care and the Care Modernization Law (Digitale-Versorgung- und Pflege-Modernisierungs-Gesetz- DVPMG). Orpha coding is to be introduced nationwide with the immediate effect.

On this basis and with this supplement, the existing modules of the MII core data set are considered as the representatives of the care documentation in the present implementation guide for the RD-documentation. The following modules, which are required as a general basis for the RD-documentation, may be highlighted:

1.	Modul [PERSON](https://simplifier.net/guide/medizininformatikinitiative-modulperson-implementationguide/igmiikdsmodulperson) (specifically the FHIR resource Patient)
2.	Modul [CASE ](https://simplifier.net/guide/medizininformatikinitiative-modulfall-implementationguide/igmiikdsmodulfall) (three-level self-recursive hierarchy of the FHIR resource Encounter)
3.	Modul [DIAGNOSIS](https://simplifier.net/guide/medizininformatikinitiative-moduldiagnosen-implementationguide/igmiikdsmoduldiagnose) (FHIR resource Condition)
4.	Modul [PROCEDURE](https://simplifier.net/guide/medizininformatikinitiative-modulprozeduren-implementationguide/igmiikdsmodulprozedur) (FHIR resource Procedure)
5.	Modul [MEDICATION](https://simplifier.net/guide/medizininformatikinitiative-modulmedikation-implementationguide/igmiikdsmodulmedikation) (FHIR resources Medication, MedicationAdministration, MedicationStatement)
6.	Modul [LABORATORY FINDING](https://simplifier.net/guide/laborbefundindermedizininformatik-initiative/igmiikdsmodullabor)
(FHIR resources Observation, DiagnosticReport, ServiceRequest)
7.	Modul SYMPTOM/PHENOTYPE - Link coming soon
8.	Modul [OMICS (MOLECULAR GENETICS)](https://simplifier.net/guide/medizininformatikinitiative-modulmolekulargenetischerbefundberic/igmiikdsmodulmolekulargenetischerbefundbericht)

The individual patient information, described, needed or suggested by these modules can be viewed as a data volume which, for the individual patients, form certain overlaps with the data volumes presented in the following section in registries for rare diseases. The aim is to avoid double entry by making features from the care documentation available in the RD-documentation as ergonomically as possible.

With regard to the features that are required in the care documentation but not in the registry documentation, there is no exclusion in the combined RD-documentation. This does not necessarily require joint storage. As a rule, the data should remain where they were collected.

{{render:IGeng}} 

Examples of individual details that are required in the care documentation but not in the registry documentation can be identifying features (name, exact date of birth, administrative gender), accompanying and independent further diagnoses, laboratory values, other findings as well as accompanying and independent further therapies.

It should be noted that the referred care documentation at this point is mostly data from a hospital in accordance with the fragmented structure of the German health system. For the horizontal expansion, the aim of the MI Initiative is to enable the synchronous use of patient data from several university hospitals and other facilities. For vertical and longitudinal expansion, the connection of patient-collected data (e.g. patient reported outcomes; PROM) as well as electronic treatment information of the health insurances according to § 305 SGB V is suggested.


---
<a id="1.4"></a>
## **1.4 Common registry data sets for rare diseases**

While care data are collected in the way they are needed to support the current care, registry data sets are collected with a view to more or less defined evaluations, which are also called non-interventional registry studies. At the beginning of June 2013, the EU Committee of Experts on Rare Diseases (EU-CERD) included in its core recommendations for patient registries for rare diseases and for data collection the expansion of knowledge about rare diseases, the support of basic research, clinical and epidemiological research and the monitoring of the use of orphan-medical products and drugs with off-label use. For people with rare diseases and the responsible national authorities, registries should serve as an essential means of supporting the planning of health care and social services. Registry studies are also used to generate new scientific hypotheses for subsequent clinical trials.
The more differentiated the digital documentation in the care context and the more affected populations are covered, the merrier real-world data can be used for equivalents of registry studies. However, not all questions can be an-swered from native care data. The spectrum can, however, be expanded by collecting selected standard features. The following data patterns and data collections are suggested for this purpose:

* Common Dataset of the European Rare Disease Registry Infrastructure (ERDRI CDS)
* French National Rare Disease Minimum Dataset (French RD MDS)
* Examination-booklet of preventive medical checkups for children and adolescents

If the characteristics have not yet been recorded as part of the care documentation, the following data groups are added by ERDRI CDS (e) and French RD MDS (f):

| Nr.  | Data groups / Item Group | e | f |
|--------------|-----------|-----------|-----------|
|1  | Consent |     | f   |
|2  | Patient Identification |     | f   |
|2a | Pseudonym |   e  |   |
|3  | Administrative Information (Personal or Parent) |     | f   |
|4  | Family Information |     | f   |
|5  | Vital Status |   e  | f   |
|6  | Care pathway (multiple) |     | f   |
|7  | Care activities (multiple) |     | f   |
|8  | Disease history |     | f   |
|9  | Diagnosis  |  e   | f   |
|9a | Signs & Symptoms |  e   | f   |
|9b | Disability |  e   | f   |
|9c | Genetic diagnosis  |  e   | f   |
|9d | Undiagnosed Case  |  e   | f   |
|10 | Diagnosis confirmation  |     | f   |
|11 | Treatment |     | f   |
|12 | Ante and neonatal |     | f   |
|13 | Research |   e  | f   |
|13a | Biobank |   e  | f   |

If the characteristics have not yet been recorded in the context of the care documentation or by adding EDRI CDS or French RD MDS information, the following data groups are added by the digital Examination-booklet:



---
<a id="1.5"></a>
## **1.5 Additional modular components**


---