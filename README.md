# Banal Coding Test
### Supplied by people that infest a HR department
### Made rightous by Mark Addinall - 2015
___

Here are the instructions that came with the coding test.
___
Instructions

1. Figure out what this function does 
2. Write a unit test for it
3. Refactor for readability and efficiency

NOTE: Do regular commits that show agile style iterations through the problem.
If you prefer a different language, you can provide your solution in PHP, 
Python or Javascript too.
___
If the function was written well and/or documented to a decent standard, one would not have to make the effort.  I hate stupid tests like this.  THey show ernormous disrespect for the people who bother to respond to your position requirements.  "we have written something CLEVER and CRYPTIC".  Now you can waste your time figuring it out.

I normally don't even bother doing these tests as I find them somewhat insulting.  However, I am mildly interested in this position as it broaches on Health and the Life Sciences. So...

##Methodology

####Reverse Engineer
- Find out by reverse engineering WHAT the code is SUPPOSED to do (sans documentation).
- Test that assumption
- Refactor into something less horrible

The directory structure is as follows:

- original (code as cloned from github)
- in_progress (reverse engineering including data structure predictions)
- refactor (new code including test suites)

##Results (Interim)

This is where I would stop refactoring and ask the owner of this code WHAT it is supposed to do.

After investigating this code, all the implemented algorithm does is take an array of hashes and sort them by BRAND.  If that is the intention then the refactoring can be done in a few lines.  The methods are called GROUP however they don't do any grouping in a traditional sense of the word:

ORDER BY ...
GROUP BY ...

the array is just sorted on one element.

If this is the requirement then this one line can replace the Package
```
    my @sorted = sort { $a->{brand} cmp $b->{brand} } @products;
```
So, as one of the instructions was to run this as an Agile project, right now I feel it is the time to point out to SCRUMASTER or my coding peer that this is a bit silly.

Here is a program run


#### Unsorted table

``` -----------products-------------------
[
  { brand => "Apple", type => 1 },
  { brand => "Tomato", type => 1 },
  { brand => "Pear", type => 1 },
  { brand => "Orange", type => 1 },
  { brand => "Grape", type => 2 },
  { brand => "Kiwi", type => 3 },
  { brand => "Cumquat", type => 4 },
  { brand => "Grapefruit", type => 5 },
]
 --------- --------------------
{ brand => "Apple", type => 1 }
 --------- --------------------
{ brand => "Tomato", type => 1 }
 --------- --------------------
{ brand => "Pear", type => 1 }
 --------- --------------------
{ brand => "Orange", type => 1 }
 --------- --------------------
{ brand => "Grape", type => 2 }
 --------- --------------------
{ brand => "Kiwi", type => 3 }
 --------- --------------------
{ brand => "Cumquat", type => 4 }
 --------- --------------------
{ brand => "Grapefruit", type => 5 }
 ------------------brand type------------
(
  "Kiwi",
  { 3 => 1 },
  "Pear",
  { 1 => 1 },
  "Cumquat",
  { 4 => 1 },
  "Grape",
  { 2 => 1 },
  "Grapefruit",
  { 5 => 1 },
  "Tomato",
  { 1 => 1 },
  "Apple",
  { 1 => 1 },
  "Orange",
  { 1 => 1 },
)
 --------------brand----------------
"Apple"
==================
1
==================

 --------------brand----------------
"Cumquat"
==================
4
==================

 --------------brand----------------
"Grape"
==================
2
==================

 --------------brand----------------
"Grapefruit"
==================
5
==================

 --------------brand----------------
"Kiwi"
==================
3
==================

 --------------brand----------------
"Orange"
==================
1
==================

 --------------brand----------------
"Pear"
==================
1
==================

 --------------brand----------------
"Tomato"
==================
1
==================
```
#### Sorted table

```
---------grouped products---------------------
[
  { brand => "Apple", type => 1 },
  { brand => "Cumquat", type => 4 },
  { brand => "Grape", type => 2 },
  { brand => "Grapefruit", type => 5 },
  { brand => "Kiwi", type => 3 },
  { brand => "Orange", type => 1 },
  { brand => "Pear", type => 1 },
  { brand => "Tomato", type => 1 },
]
 ------------------------------
```
