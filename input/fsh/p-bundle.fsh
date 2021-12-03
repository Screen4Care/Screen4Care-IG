Profile: GuidelineRecommendationBundle
Parent: Bundle
Id: guideline-recommendation-bundle
Title: "Guideline Recommendation Bundle"
Description: ""
* insert metadata(2021-12-03, #draft, 0.1.0)
* obeys bdl-1
* type = #transaction
* entry 4..* MS
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry contains
  Guideline 1..* MS
  and Population 1..* MS
  and Intervention 1..* MS
  and Outcome 0..* MS
* entry[Guideline]
  * resource 1.. MS
  * resource only Guideline
  * fullUrl 1..1 MS
* entry[Population]
  * resource 1.. MS
  * resource only PopulationEvidenceVariable
  * fullUrl 1..1 MS
* entry[Intervention]
  * resource 1.. MS
  * resource only InterventionEvidenceVariable
  * fullUrl 1..1 MS
* entry[Outcome]
  * resource 1.. MS
  * resource only OutcomeEvidenceVariable
  * fullUrl 1..1 MS

Invariant: bdl-1
Description: "First element of Bundle must be an EvidenceReport"
Expression: "entry.first().resource.is(EvidenceReport)"
Severity: #error

Instance: EvidenceReportGuidelineRecommendationExample
InstanceOf: guideline-recommendation-bundle
Usage: #example
Title: "Guideline Recommendation Example"
Description: ""
* entry[Guideline]
  * resource = GuidelineExample
  * fullUrl = "https://www.covid-evidenz.de/guidelines/guideline-example"
* entry[Population]
  * resource = ExamplePopulation
  * fullUrl = "https://www.covid-evidenz.de/guidelines/guideline-example/population"
* entry[Intervention]
  * resource = ExampleIntervention
  * fullUrl = "https://www.covid-evidenz.de/guidelines/guideline-example/intervention"
* entry[Outcome]
  * resource = ExampleOutcome
  * fullUrl = "https://www.covid-evidenz.de/guidelines/guideline-example/outcome"