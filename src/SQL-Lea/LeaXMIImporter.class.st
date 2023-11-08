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
	model := FamixJavaModel new.
	visitor := LeaXMIVisitor new.
	visitor model: model.
	(XMLDOMParser parse: aString)
		acceptNodeVisitor: visitor.
	^visitor model

]

{ #category : #initialization }
LeaXMIImporter >> initialize [

	super initialize.

	model := FamixJavaModel new
]
