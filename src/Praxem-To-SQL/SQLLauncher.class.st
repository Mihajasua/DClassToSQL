Class {
	#name : #SQLLauncher,
	#superclass : #Object,
	#category : #'Praxem-To-SQL'
}

{ #category : #'as yet unclassified' }
SQLLauncher >> launchSQL [

 | dc2SQL sql2code prxm2SQL |

dc2SQL := PrxmToFamixSQL new.
sql2code := PrxmSQLExporter new.

prxm2SQL := PrxmToFamixSQL new.
(PrxmXMIImporter new import: 'C:\Users\mfanomez\Desktop\MDclasse.xmi') accept: prxm2SQL.

String streamContents: 
	[ :stream | 
		(prxm2SQL model) allContainers do: 
			[ :table | sql2code generateTable: table on: stream
			].
	].
]
