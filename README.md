Instructions for editors
========================

Pre-edit checklist
------------------
Do you have an ID range in the idranges file (phenoscape-idranges.owl,
in this directory)? If not, get one from the head curator.

Ensure that you have Protege configured to generate new IRIs in your
own range. Note that if you edit multiple files, you need to check this every time to ensure that the proper settings are in place.

(You can ignore this if you do not intend to create new classes)

Get Jim's awesome obsolescence plugin here:
https://github.com/balhoff/obo-actions/downloads
To add plugins to Protege, navigate to the application, open the application contents, navigate to contents/Resources/Java/plugins and put the jar file in there. Your plugin should be installed next time you start protege.

Get Elk here:
http://code.google.com/p/elk-reasoner/downloads/list
perform same operation as above to install.

Getting started
---------------

Always start by doing:

`git pull origin master` (or equivalent in the GitHub Desktop app)

Then, open the file phenoscape-ext.owl in Protege

Switch on the Elk reasoner (see how to get plugins above). If you are making changes, be sure to
synchronize the reasoner.

You have access rights to any classes that are highlighted in bold
font. Do not make changes to classes that are NOT in bold - changes
here go through the uberon tracker, or be brought up on the mailing
list. Note that it is fine for any request to go on the uberon tracker. 
The tracker is here: https://github.com/obophenotype/uberon/issues

Obsoleting
---------------

At first, there may be a number of bold terms that need obsoleting and replacing with existing uberon classes. Here are the steps:

1. Find the bold class you wish to obsolete, and compare it with the class you wish to replace it with. You need to check that both the text definition and the logical axioms have the same intent, and that nothing desired is lost in the obsolescence.

2. Copy any subClass axioms that you intend to keep for historical purposes (e.g. those that are not replicated on the target class) into a comment annotation property. If you do this, please ensure to add to any exisiting comments rather than adding a new COMMENT. There can be only one COMMENT in obo format and Jenkins will throw an error. If there are equivalence axioms, you may wish to consult with an expert to make sure the axioms are retained properly in the file.

3. Go to the obsolescenc plugin by going to the edit menu and scroll to the bottom, to "Make Entity Obsolete". This will perform the following for you:
	Relabel the class as "obsolete your old term label here". 
	Add an annotation property, "deprecated", value "true", of type "boolean". 
	Delete subClassOf axioms
You should see the class crossed out after you do this. 

4. Add an annotation property "term replaced by". Navigate to the term by clicking on the "entity IRI" and either browse or control F to find the term that is replacing the one being obsoleted.

6. You may wish to add a comment regarding the reason for obsolescence or so as to include reference to why the term was replaced with whatever is indicated. Again, do not add more than one comment annotation on a class.

About definition citations and dbxrefs
---------------
In order to properly display definition sources, you should add citations to the end of the definition text (make sure string is chosen in the bottom left type selector). Some examples include:
definition "Paired long bones of endochondral origin that extend from the pectoral girdle to the elbows[AAO, modified]."^^string
definition "The major postaxial endochondral bone in the posterior zeugopod[Phenoscape]."^^string
definition "Paired cartilaginous element forming the posterior portion of the pelvic girdle. [D.F. Markle, BULLETIN OF MARINE SCIENCE. 30(1): 45-53. 1980]"^^string
definition "A midventral endochondral skeletal element which represents the origin site of the pectoral muscles[PHENOSCAPE:ad]."^^string

Note that this is *different* than making a dbxref. The dbxref field should be used only for xref to another ontology class, database ID, or URL. dbxrefs can be made on the definition as an annotation on the definition or on the class directly, depending on the nature of the xref. To make an annotation on the definition, click the little "a" symbol (this works similarly on any axiom or annotation).


Saving and committing
---------------

Save and commit regularly. Always describe the changes you have made
at a high level in the svn commit messages. It is a good idea to type
`git diff` before committing (although the output can be hard to
decipher, it can sometimes show you egregious errors, sometimes Protege's fault).

**Important: make sure you save in functional syntax, using the same
  prefixes as in the source file. This SHOULD be automatic (but Protege sometimes gets it wrong - one reason to do the diff).
  
**Important: there is currently a bug in Protege that is being investigated (well, there are many, but this one concerns editing ext). If protege asks you to name your merged file when you save and gives you no other option, DON'T DO IT. Quit Protege and start over. You will lose your work - another reason to save and commit in small increments. 

Example session from view of command line:

  git pull origin master
  # [open in protege]
  # [edit in Protege]
  # [save in Protege]
  # ...
  # [edit in Protege]
  # [save in Protege]
  git diff phenoscape-ext.owl
  git commit -a -m "polished up skull"
  git push origin master

It is always a good idea to `git pull` immediately after a git commit. If there are changes, Protege will ask you to reload. You may wish not to trust the reload and simply reopen Protege.

After a git commit, Jenkins will check your changes to make sure they conform to guidelines and do not introduce any inconsistencies - an email will be sent to the curators list.

You can check on the build here:
  http://build.berkeleybop.org/job/build-phenoscape/
Check for errors in the report, send an email to phenoscape curators if you cannot determine what the error is.

Checklist
---------

Always synchronize the reasoner before committing. Did your changes
introduce unsatisfiable classes? If so, investigate them.

For any classes you have created, are they in your ID range? Did you
add text definitions, adding provenance information? Is the reasoner finding unintended inferred equivalent classes? Subclasses? 

Check the jenkins report after your commits. This should alert you to
any of the following:

 * consistency problems with anatomy ontologies
 * consistency problems with other ontologies
 * violation of obo-format (e.g. two labels for a class; two text
   definitions; etc)

Editors guide
-------------

Ensure you have read and understand to some degree the various design
documents pertinent to the area you are working on.

In particular:

* https://docs.google.com/document/d/16JZOuH9sh_a8uIXA4cqg0Q1H6MV5yCj3-rhuKsZoV_U/edit
* https://docs.google.com/document/d/1cPWBqrl_Qy7XHEWFqtR_PgQX61yRkgGuLaiDpnEXxkE/edit
* http://genomebiology.com/2012/13/1/R5

NEVER delete classes - ALWAYS obsolete/deprecate instead of deleting,
and even then, do this carefully. Uses replaced_by/consider.

Ontology coordination
---------------------

Always be aware of the impact of changes you make on other parts of
the ontology, and on dependent ontologies. Propose any non-trivial
changes on the curators list before making them, giving a rough
outline of what you intend to do.

Always look at analagous or homologous structures such that your
modeling decisions are consistent or at least informed by previous
work. For example, if you are going to add a new subclass of
"calcareous tooth" look at existing subclasses and use the same
relationships, naming conventions and text definition styles.

Some axioms live in phenotype-ext, some in the core uberon_edit
source. A seamless view is presented for editors, but be aware that
you should only edit classes that appear in bold. You can request that
particular classes or portions of the ontology be moved into
phenotype-ext, but classes that have multiple "join points" will
remain in the core uberon edit source file for now.

Note it is possible to accidentally save axioms in the wrong
ontology. We will add checks to ensure this doesn't happen.

Tips
----

*Advanced*

You can work offline if you download uberon in advance.

In the edit/ directory, type

  wget http://purl.obolibrary.org/obo/uberon/merged.owl

The next time you open Protege it will create a catalog-v001.xml file
which maps the ontology to the space on your hard-drive. You will have
to ensure that you regularly update your local copy.

If there is demand, we can use svn:externals to automate this linkage.

Advanced users can also customize the version of uberon that they
import by editing catalog-v001.xml

FAQ
---

