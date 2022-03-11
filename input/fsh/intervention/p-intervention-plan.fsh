// Author: Gregor Lichtner @glichtner
Profile: InterventionPlan
Parent: PlanDefinition
Id: intervention-plan
Title: "Intervention Plan"
Description: "Definition of an activity that is part of an intervention in the context of a clinical practice guideline recommendation."
* insert metadata(2021-12-03, #draft, 0.1.0)
* insert profile("This profile is used to define the recommended activities for an intervention in the context of a clinical practice guideline recommendation.")
* subject[x] 1..1 MS
* subject[x] only Reference
* subjectReference only Reference(PopulationGroup)
* version 1..1 MS
* name 1..1 MS
* title 1..1
* date 1..1
* description 1..1
* action 1..*
  * definition[x] 1..1 MS
  * definition[x] only canonical
  * definitionCanonical only Canonical(InterventionActivity or ObservationDefinition) // TODO: Profile ObservationDefinition?
* relatedArtifact 0..*
* relatedArtifact ^slicing.discriminator.type = #value
* relatedArtifact ^slicing.discriminator.path = "classifier"
* relatedArtifact ^slicing.rules = #open
* relatedArtifact contains
    recommendationRating 0..1 and
    certaintyOfEvidenceRating 0..* and
    recommendationCitation 0..1 and
    guidelineCitation 0..1 and
    netEffect 0..1
* relatedArtifact[recommendationRating]
  * type = $cs-related-artifact-type#justification
  * classifier 1..1
  * classifier = $cs-ceosys#recommendation-rating "Recommendation rating"
  * resourceReference 1..1 MS
  * resourceReference only Reference(CPGRecommendationRating)
* relatedArtifact[certaintyOfEvidenceRating]
  * type = $cs-related-artifact-type#justification
  * classifier 1..1
  * classifier = $cs-ceosys#certainty-of-evidence-rating "Certainty of evidence rating"
  * resourceReference 1..1 MS
  * resourceReference only Reference(CertaintyOfEvidenceRating)
* relatedArtifact[recommendationCitation]
  * type = $cs-related-artifact-type#citation
  * classifier 1..1
  * classifier = $cs-ceosys#guideline-recommendation "Clinical practice guideline recommendation"
  * resourceReference 1..1 MS
  * resourceReference only Reference(RecommendationCitation)
* relatedArtifact[guidelineCitation]
  * type = $cs-related-artifact-type#citation
  * classifier 1..1
  * classifier = $cs-ceosys#clinical-practice-guideline "Clinical practice guideline"
  * resourceReference 1..1 MS
  * resourceReference only Reference(GuidelineCitation)
* relatedArtifact[netEffect]
  * type = $cs-related-artifact-type#supported-with
  * classifier 1..1
  * classifier = $cs-ceosys#net-effect "Net effect"
  * resourceReference 1..1 MS
  * resourceReference only Reference(NetEffectEvidence)

Instance: ExampleInterventionPlan
InstanceOf: intervention-plan
Usage: #example
Title: "Example Intervention plan"
Description: "An active intervention plan."
* name = "InterventionPlan"
* title = "Intervention Plan"
* version = "1.0"
* date = "2022-02-14"
* status = #active
* description = "Example Intervention Plan"
* subjectReference = Reference(ExamplePopulationGroup)
* action[+]
  * definitionCanonical = Canonical(ExampleInterventionActivity)
* relatedArtifact[recommendationRating].resourceReference = Reference(ExampleRecommendationRating)
* relatedArtifact[recommendationCitation].resourceReference = Reference(ExampleRecommendationCitation)
* relatedArtifact[guidelineCitation].resourceReference = Reference(ExampleGuidelineCitation)
* relatedArtifact[certaintyOfEvidenceRating][+].resourceReference = Reference(ExampleCertaintyOfEvidenceRating)
* relatedArtifact[netEffect].resourceReference = Reference(ExampleNetEffect)