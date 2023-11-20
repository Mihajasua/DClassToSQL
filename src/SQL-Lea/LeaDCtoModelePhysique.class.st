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

	aTable addColumn: (builder
			 createColum: (self generatePrimaryKeyID: aClass name)
			 type: 'int').

	aClass attributes do: [ :att |
		aTable addColumn:
			(builder
				 createColum: att name
				 type: (self sqlType: att declaredType)) ].

	aTable addColumn:
		(builder createColum: 'PRIMARY KEY (' , aClass name , 'ID)' type: '').

	self createForeignKeys: aTable from: aClass.

	^ aTable
]

{ #category : #'as yet unclassified' }
LeaDCtoModelePhysique >> createForeignKeys: aTable from: aClass [

	aClass attributes do: [ :attRef |
		attRef declaredType ifNotNil: [
		  attRef declaredType attributes ifNotEmpty: [
			  aTable addColumn: (builder
					   createColum: 'FOREIGN KEY (' , attRef name , ') REFERENCES '
						   , attRef declaredType name , ' ('
						   , (self generatePrimaryKeyID: attRef declaredType name)
						   , ' )'
					   type: '') ] ] ]
]

{ #category : #'as yet unclassified' }
LeaDCtoModelePhysique >> generatePrimaryKeyID: tableName [

	^ tableName,'ID'
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
			(type name = 'Texte') ifTrue: [ ^'varchar(255)'].
			(type name = 'Boolean') ifTrue: [ ^'boolean'].
			(type name = 'Date') ifTrue: [ ^'date'].
			(type attributes) ifNotNil: [ ^type name].
			 ^ 'unknown'
		]
	



	
]
