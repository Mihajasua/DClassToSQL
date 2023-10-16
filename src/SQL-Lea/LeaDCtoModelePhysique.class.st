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
LeaDCtoModelePhysique >> sqlType: typeName [

	(typeName = 'int') ifTrue: [ ^builder ensureType: 'int' ].
	(typeName = 'String') ifTrue: [ ^builder ensureType: 'varchar(255)' ].
	^'unknownType'
]
