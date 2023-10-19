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

	filename asFileReference readStreamDo: [ :st || visitor |
		model := FamixJavaModel new.
		visitor := LeaXMIVisitor new.
		visitor model: model.
		(XMLDOMParser parse: st contents)
			acceptNodeVisitor: visitor.
		
	]
]

{ #category : #initialization }
LeaXMIImporter >> initialize [

	super initialize.

	model := FamixJavaModel new
]
