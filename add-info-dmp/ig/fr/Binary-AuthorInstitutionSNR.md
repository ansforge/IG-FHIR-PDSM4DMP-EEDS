# AuthorInstitutionSNR - Utilisation de PDSm dans le contexte d'EEDS v0.1.0

## Exemple Binary: AuthorInstitutionSNR

This content is an example of the [AuthorInstitution (LM)](StructureDefinition-AuthorInstitution.md) Logical Model and is not a FHIR Resource

```

<rim:Classification  classificationScheme="urn:uuid:93606bcf-9494-43ec-9b4e-a7748d1a838d"  classifiedObject="theDocument"  nodeRepresentation=""> <!-- nodeRepresentation intentionnellement non renseigné -->  <rim:Slot name="authorPerson">     <rim:ValueList>    <rim:Value>3750100125/9762^Automate de laboratoire X^waralab1000^^^^^^&amp;1.2.250.1.71.4.2.1&amp;ISO^U^^^RI</rim:Value>   </rim:ValueList>  </rim:Slot>  <rim:Slot name="authorInstitution">     <rim:ValueList>    <rim:Value>Groupe Pitié Salpêtrière^^^^^&amp;1.2.250.1.71.4.2.2&amp;ISO^IDNST^^^1750100125</rim:Value>   </rim:ValueList>  </rim:Slot>  <rim:Slot name="authorRole">   <rim:ValueList>    <rim:Value>analyse de sang</rim:Value>   </rim:ValueList>  </rim:Slot>  <rim:Slot name="authorSpecialty">     <rim:ValueList>    <rim:Value>DISPOSITIF^dispositif médical^1.2.250.1.213.1.1.4.6</rim:Value>   </rim:ValueList>  </rim:Slot> </rim:Classification> 
```



## Resource Binary Content

text/x-hl7-ft:

```
[B@48e7a9df
```
