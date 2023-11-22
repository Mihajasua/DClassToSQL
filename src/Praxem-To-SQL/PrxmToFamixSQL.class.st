Class {
	#name : #PrxmToFamixSQL,
	#superclass : #PrxmAbstractVisitor,
	#instVars : [
		'builder',
		'model',
		'context'
	],
	#category : #'Praxem-To-SQL'
}

{ #category : #'as yet unclassified' }
PrxmToFamixSQL >> classToTable: aClass [

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
PrxmToFamixSQL >> createForeignKeys: aTable from: aClass [

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
PrxmToFamixSQL >> generatePrimaryKeyID: tableName [

	^ tableName,'ID'
]

{ #category : #initialization }
PrxmToFamixSQL >> initialize [

	super initialize.

	model := FamixSQLModel new.
	builder := PrxmBuildFamixSQLEntities new.
	context := Stack new
]

{ #category : #accessing }
PrxmToFamixSQL >> model [

	^ model
]

{ #category : #accessing }
PrxmToFamixSQL >> model: anObject [

	model := anObject
]

{ #category : #'as yet unclassified' }
PrxmToFamixSQL >> sqlType: type [

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

{ #category : #visiting }
PrxmToFamixSQL >> visitPraxemAttribute: aPraxemAttribute [

	| aTable column |
	
	aTable := context top.
		
	column := builder 
		createColum: aPraxemAttribute name 
		type: (self visitePraxemAttributeType: aPraxemAttribute declaredType).

	model add: column.
	aTable addColumn: column

]

{ #category : #visiting }
PrxmToFamixSQL >> visitPraxemClass: aPraxemClass [

	| aTable |
	
	aTable := builder createTable: aPraxemClass name.
	model add: aTable.
	context push: aTable.
	
	aTable addColumn: (builder
		 createColum: (self generatePrimaryKeyID: aPraxemClass name)
		 type: 'int').

	super visitPraxemClass: aPraxemClass.
	
	aTable addColumn:
		(builder createColum: 'PRIMARY KEY (' ,(self generatePrimaryKeyID: aPraxemClass name),')' type: '').
		
	self createForeignKeys: aTable from: aPraxemClass.


	context pop
]

{ #category : #visiting }
PrxmToFamixSQL >> visitePraxemAttributeType: aPraxemAttributeType [

	aPraxemAttributeType 
		ifNil: [^'unknown' ]
 		ifNotNil: [ 
			(aPraxemAttributeType name = 'Numerique') ifTrue: [ ^'int'].
			(aPraxemAttributeType name = 'Texte') ifTrue: [ ^'varchar(255)'].
			(aPraxemAttributeType name = 'Boolean') ifTrue: [ ^'boolean'].
			(aPraxemAttributeType name = 'Date') ifTrue: [ ^'date'].
			"(aPraxemAttributeType attributes) ifNotNil: [ ^aPraxemAttributeType name]."
			(aPraxemAttributeType attributes) ifNotNil: [ ^'int'].
			 ^ 'unknown'
		]
	
]
