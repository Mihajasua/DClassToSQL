Class {
	#name : #LeaXMIImporter,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'SQL-Lea'
}

{ #category : #api }
LeaXMIImporter >> import: filename [

	filename asFileReference readStreamDo: [ :st |
		^self importString: st contents
	]
]

{ #category : #api }
LeaXMIImporter >> importString: aString [
	|visitor |
	model := FamixPraxemModel  new.
	
		
	model newClassNamed: 'Date'.
	model newClassNamed: 'Texte'.
	model newClassNamed: 'Boolean'.
	model newClassNamed: 'Numerique'.
	

	visitor := LeaXMIVisitor new.
			
	visitor model: model.
	
	(XMLDOMParser parse: aString)
		acceptNodeVisitor: visitor.	
	
	(LeaPraxemResolver new) checkAttributeType: model.
	
	^visitor model

]

{ #category : #initialization }
LeaXMIImporter >> initialize [

	super initialize.

	model := FamixJavaModel new
]
