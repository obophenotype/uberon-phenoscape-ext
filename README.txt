INSTRUCTIONS FOR EDITORS
========================

PRE-EDIT CHECKLIST
------------------

Do you have an ID range in the idranges file? If not, get one from the
head curator.

Ensure that you have Protege configured to generate new IRIs in your
own range.

(You can ignore this if you do not intend to create new classes)

GETTING STARTED
---------------

Always start by doing:

  svn update

Then, open the file phenoscape-ext.owl in Protege

Switch on the Elk reasoner. If you are making changes, be sure to
synchronize them.

You have access rights to any classes that are highlighted in bold
font. Do not make changes to classes that are not in bold - changes
here go through the uberon tracker, or be brought up on the mailing
list.

Save and commit regularly. Always describe the changes you have made
at a high level in the commit messages. It is a good idea to type "svn
diff" before committing, although the output can be hard to decipher.

**Important: make sure you save in functional syntax, using the same
  prefixes as in the source file. This should be automatic.

E.g.

  # [save in Protege]
  svn diff phenoscape-ext.owl
  svn commit -m "polished up skull" phenoscape-ext.owl
  svn update

It is a good idea to svn update immediately after an svn commit. If
there are changes, Protege will ask you to reload.

After an svn commit, Jenkins will check your changes to make sure they
conform to guidelines and do not introduce any inconsistencies - an
email will be sent to the curators list [TODO - decide if this is
desirable].

  http://build.berkeleybop.org/job/build-phenoscape/

CHECKLIST
---------

Always synchronize the reasoner before committing. Did your changes
introduce unsatisfiable classes? If so, investigate them.

For any classes you ahve created, are they in your ID range? Did you
add text definitions, adding provenance information?

Check the jenkins report after your commits. This should alert you to
any of the following:

 * consistency problems with anaotomy ontologies
 * consistency problems with other ontologies
 * violation of obo-format (e.g. two labels for a class; two text
   definitions; etc)

EDITORS GUIDE
-------------

Ensure you have read and understand to some degree the various design
documents pertinent to the area you are working on.

In particular:

* https://docs.google.com/document/d/16JZOuH9sh_a8uIXA4cqg0Q1H6MV5yCj3-rhuKsZoV_U/edit
* https://docs.google.com/document/d/1cPWBqrl_Qy7XHEWFqtR_PgQX61yRkgGuLaiDpnEXxkE/edit
* http://genomebiology.com/2012/13/1/R5

Never delete classes - obsolete instead of deleting, and even then,
with care.

ONTOLOGY COORDINATION
---------------------

Always be aware of the impact of changes you make on other parts of
the ontology, and on dependent ontologies. Propose any non-trivial
changes on the curators list before making them, giving a rough
outline of what you intend to do.

Always look at analagous or homologous structures such that your
modeling decisions are consistent or at least informed by previous
work.

Some axioms live in phenotype-ext, some in the core uberon_edit
source. A seamless view is presented for editors, but be aware that
you should only edit classes that appear in bold. You can request that
particular classes or portions of the ontology be moved into
phenotype-ext, but classes that have multiple "join points" will
remain in the core uberon edit source file for now.

Note it is possible to accidentally save axioms in the wrong
ontology. We will add checks to ensure this doesn't happen.

TIPS
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
bring by editing catalog-v001.xml
