Homology Assertion Editing
==========================

Exploration
-----------

1. Open homology-edit.owl in Protege
2. Type 'homologous_to' in search box
3. Select 'Object Properties' tab
4. Select 'Usage' sub-tab
5. You should see a list of all assertions that use the homologous_to relation (you can do the same for serially_homologous_to etc)
6. Find a homology assertion, and select the subject or target, change to classes tab
7. To see the evidence/provenance click on the '@' next to the axiom (if this is not highlighted, there is no provenance associated)

Notes: Currently assertions are made in only one direction in the edit
file. This means if you are focused on 'incus' you will see the
homologous_to axiom in the Description tab. However, if you are on
'quadrate bone' you will NOT see this in the Description tab - you
must be in the usage tab. (If you are an experienced protege user this
should make sense).

This may not be universally adhered to - in some cases there are
reciprocal assertions.

Editing
-------

We are using the EAHM (Existential Axiom Homology Model) for
editing. E.g. statements are of the form:

     'incus' SubClassOf homologous_to some 'quadrate bone'

You should only make the assertion in one direction. Downstream
software will auto-create the reciprocal assertion.

You should try and attach evidence/provenance. These are normal axiom
annotations, as in standard ontology editing. Click on the '@'. Use
"source" to indicate the source.

Note that a small number of homology assertions are stored in core,
where they cannot be edited.

Downstream querying
-------------------

Jenkins will generate the query model which will have reciprocal
axioms annotated. Details to be added later.




