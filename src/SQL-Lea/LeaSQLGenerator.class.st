Class {
	#name : #LeaSQLGenerator,
	#superclass : #Object,
	#category : #'SQL-Lea'
}

{ #category : #'as yet unclassified' }
LeaSQLGenerator >> generateColumn: aColumn on: aStream [

	aStream
		tab ;
		<< aColumn name ;
		space.

	self
		generateType: aColumn typeReferences first type
		on: aStream
]

{ #category : #'as yet unclassified' }
LeaSQLGenerator >> generateTable: aTable [
	^String streamContents: [ :aStream |
		self generateTable: aTable on: aStream
	]
]

{ #category : #'as yet unclassified' }
LeaSQLGenerator >> generateTable: aTable on: aStream [

	aStream
		<< 'CREATE TABLE ' ;
		<< aTable name ;
		<< ' (' ;
		cr.

	aTable columns
		do: [ :col |
			self generateColumn: col on: aStream 
		]
		separatedBy: [
			aStream
				<< ',' ;
				cr
		].

	aStream
		cr ;
		<< ');' ;
		cr
]

{ #category : #'as yet unclassified' }
LeaSQLGenerator >> generateType: aType on: aStream [

	aStream
		<< aType name


]
