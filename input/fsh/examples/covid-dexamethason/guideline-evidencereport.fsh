// Author: Gregor Lichtner @glichtner
Instance: COVID19IntensiveCareTreatmentGuideline
InstanceOf: guideline
Usage: #example
Title: "COVID19 Intensive Care Treatment Guideline"
Description: "COVID19 Intensive Care Treatment Guideline."
* identifier[MAGICapp].value = "5062"
* extension[version].valueString = "1.0"
* status = #retired
* subject
  * characteristic[population]
    * valueReference = Reference(ExamplePopulation)
  * characteristic[intervention]
    * valueReference = Reference(ExampleIntervention)
* section[+]
  * title = "Stationäre Therapie von COVID-19 Patienten"

Instance: DexamethasoneRecommendation
InstanceOf: guideline-recommendation
Usage: #example
Title: "Dexamethasone for critically ill COVID-19 patients"
Description: "Dexamethasone in critically ill patients with COVID-19."
* identifier[MAGICapp].value = "80618"
* status = #retired
* date = "2020-03-01"
* version = "1.0.0"
* title = "Dexamethason bei kritisch kranken Patienten mit COVID-19"
* description = "Bei Patienten mit schwerer (SpO2 < 90 %, Atemfrequenz > 30/min) oder kritischer (ARDS, Sepsis, Beatmung, Vasopressorengabe) COVID-19-Erkrankung soll eine Therapie mit Dexamethason erfolgen. Die Dosis beträgt 6 mg Dexamethason p. o./i. v. täglich für 10 Tage."
* variableDefinition[+]
  * intended = Reference(ExamplePopulation)

* variableDefinition[intervention]
  * intended = Reference(ExampleIntervention)
* certainty[overall]
  * description = "Very low quality"
  * rating = $cs-certainty-rating#very-low "Very low quality"
* insert recommendation-strength(#strong-for)