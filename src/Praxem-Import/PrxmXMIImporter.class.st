Class {
	#name : #PrxmXMIImporter,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'Praxem-Import'
}

{ #category : #api }
PrxmXMIImporter >> import: filename [

	filename asFileReference readStreamDo: [ :st |
		^self importString: st contents
	]
]

{ #category : #api }
PrxmXMIImporter >> importString: aString [
	|visitor |
	model := FamixPraxemModel  new.
	
		
	model newClassNamed: 'Date'.
	model newClassNamed: 'Texte'.
	model newClassNamed: 'Boolean'.
	model newClassNamed: 'Numerique'.
	

	visitor := PrxmXMIVisitor  new.
			
	visitor model: model.
	
	(XMLDOMParser parse: aString)
		acceptNodeVisitor: visitor.	
	
	(PrxmResolver  new) checkAttributeType: model.
	
	^visitor model

]

{ #category : #initialization }
PrxmXMIImporter >> initialize [

	super initialize.

	model := FamixJavaModel new
]