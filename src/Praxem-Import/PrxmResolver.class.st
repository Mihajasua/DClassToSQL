"
Le PrxmResolver parcours tous les PrxmAttributs et PrxmMethod d'un modele pour aller cherche le nom de leur AttributeType ou ReturnType et retrouver la PrxmClass qui correspond a ce nom.


"
Class {
	#name : #PrxmResolver,
	#superclass : #Object,
	#category : #'Praxem-Import'
}

{ #category : #'as yet unclassified' }
PrxmResolver >> findPraxemClassNamed: attributeTypeName inModel: aModel [
	"pour un nom de classe, on cherche dans tous les PrxmPrimitiveClass ou tous les PrxmClass
	pour trouver celle qui a le meme nom"

	^ (aModel allWithType: FamixPraxemPrimitiveClass)
		  detect: [ :aClass | aClass name = attributeTypeName ]
		  ifNone: [
			  (aModel allWithType: FamixPraxemClass)
				  detect: [ :aClass | aClass name = attributeTypeName ]
				  ifNone: [ nil ] ]
]

{ #category : #'as yet unclassified' }
PrxmResolver >> resolveEntityType: anEntity inModel: aModel [
	"pour une entite qui est un attribut ou une methode, on cherche dans tous les PrxmClass
	pour trouver celle qui a le meme nom que le type de l'entite
	Quand on a trouve la bonne classe on la mets dans le declaredType de l'entite"

	| praxemClass entityDeclaredTypeName |
	entityDeclaredTypeName := anEntity
		                          attributeAt: #attributeType
		                          ifAbsent: ''.

	praxemClass := self
		               findPraxemClassNamed: entityDeclaredTypeName
		               inModel: aModel.

	anEntity declaredType: praxemClass
]

{ #category : #'as yet unclassified' }
PrxmResolver >> resolveNamedTypes: aModel [
	"dans cette methode, on prend tous les PrxmAttributes ou PrxmMethodes
	pour chacun, on cherche dans la PrxmClass qui a le meme nom que le type de l'entite
	Quand on a trouve la bonne classe on la mets dans le declaredType de l'entite"

	(aModel allWithType: FamixPraxemAttribute) do: [ :anAttribute |
		self resolveEntityType: anAttribute inModel: aModel ].


	(aModel allWithType: FamixPraxemMethod) do: [ :aMethod |
		self resolveEntityType: aMethod inModel: aModel ]
]
