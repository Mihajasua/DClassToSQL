Class {
	#name : #LeaDCtoModelePhysique,
	#superclass : #Object,
	#instVars : [
		'builder'
	],
	#category : #'SQL-Lea'
}

{ #category : #'as yet unclassified' }
LeaDCtoModelePhysique >> classToTable: aClass [

	| aTable |
	aTable := builder createTable: aClass name.

	aTable addColumn: (builder createColum: (aClass name , 'ID') type: 'int').

	aClass attributes do: [ :att |
		aTable addColumn: (builder createColum: (att name) type: (self sqlType: att declaredType)).
	].

	^aTable.
]

{ #category : #initialization }
LeaDCtoModelePhysique >> initialize [

	super initialize.
	
	builder := LeaBuildDatabase new
]

{ #category : #'as yet unclassified' }
LeaDCtoModelePhysique >> sqlType: type [
	type 
		ifNil: [^'unknown' ]
 		ifNotNil: [ 
			(type name = 'Numerique') ifTrue: [ ^'int'].
			(type name = 'Texte') ifTrue: [ ^ 'varchar(255)'].
			(type name = 'Boolean') ifTrue: [ ^ 'boolean'].
			(type name = 'Date') ifTrue: [ ^'date'].
			^ 'unknown'
		]
	



	
]
