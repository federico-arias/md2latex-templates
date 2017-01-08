%% 
%% This is file `tesis.bst', generated 
%% on <1997/8/12> with the docstrip utility (2.2i).
%% 
%% The original source files were:
%% 
%% merlin.mbs  (with options: `head,exlang,seq-no,nm-init,yr-par,jtit-x,jttl-rm,vol-bf,vnum-x,volp-com,jpg-1,jnm-x,pub-date,pre-pub,edby,blk-com,blknt,spanish,pp,abr,jabr,and-xcom,{}')
%% spanish.mbs  (with options: `exlang,seq-no,nm-init,yr-par,jtit-x,jttl-rm,vol-bf,vnum-x,volp-com,jpg-1,jnm-x,pub-date,pre-pub,edby,blk-com,blknt,spanish,pp,abr,jabr,and-xcom,{}')
%% prjour.mbs  (with options: `exlang,seq-no,nm-init,yr-par,jtit-x,jttl-rm,vol-bf,vnum-x,volp-com,jpg-1,jnm-x,pub-date,pre-pub,edby,blk-com,blknt,spanish,pp,abr,jabr,and-xcom,{}')
%% merlin.mbs  (with options: `tail,exlang,seq-no,nm-init,yr-par,jtit-x,jttl-rm,vol-bf,vnum-x,volp-com,jpg-1,jnm-x,pub-date,pre-pub,edby,blk-com,blknt,spanish,pp,abr,jabr,and-xcom,{}')
%% ---------------------------------------- 
%% *** Tesis de Doctorado *** 
%% 
 %-------------------------------------------------------------------
 % The original source file contains the following version information:
 % \ProvidesFile{merlin.mbs}[1997/06/09 3.83 (PWD)]
 %
 % NOTICE:
 % This file may be used for non-profit purposes.
 % It may not be distributed in exchange for money,
 %   other than distribution costs.
 %
 % The author provides it `as is' and does not guarantee it in any way.
 %
 % Copyright (C) 1994-97 Patrick W. Daly
 %-------------------------------------------------------------------
 %   For use with BibTeX version 0.99a or later
 %-------------------------------------------------------------------
 % This bibliography style file is intended for texts in
 %   SPANISH
 % This is a numerical citation style, and as such is standard LaTeX.
 % It requires no extra package to interface to the main text.
 % The form of the \bibitem entries is
 %   \bibitem{key}...
 % Usage of \cite is as follows:
 %   \cite{key} ==>>          [#]
 %   \cite[chap. 2]{key} ==>> [#, chap. 2]
 % where # is a number determined by the ordering in the reference list.
 % The order in the reference list is that by which the works were originally
 %   cited in the text, or that in the database.
 %---------------------------------------------------------------------

ENTRY
  { address
    author
    booktitle
    chapter
    edition
    editor
    howpublished
    institution
    journal
    key
    month
    note
    number
    organization
    pages
    publisher
    school
    series
    title
    type
    volume
    year
  }
  {}
  { label }

INTEGERS { output.state before.all mid.sentence after.sentence after.block }

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
}

STRINGS { s t }

FUNCTION {output.nonnull}
{ 's :=
  output.state mid.sentence =
    { ", " * write$ }
    { output.state after.block =
        { add.period$ write$
          newline$
          "\newblock " write$
        }
        { output.state before.all =
            'write$
            { add.period$ " " * write$ }
          if$
        }
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}

FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}

FUNCTION {fin.entry}
{ add.period$
  write$
  newline$
}

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { after.block 'output.state := }
  if$
}

FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
        'skip$
        { after.sentence 'output.state := }
      if$
    }
  if$
}

FUNCTION {add.blank}
{  " " * before.all 'output.state :=
}

FUNCTION {date.block}
{
  skip$
}

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}

FUNCTION {new.block.checka}
{ empty$
    'skip$
    'new.block
  if$
}

FUNCTION {new.block.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}

FUNCTION {new.sentence.checka}
{ empty$
    'skip$
    'new.sentence
  if$
}

FUNCTION {new.sentence.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.sentence
  if$
}

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { "{\em " swap$ * "\/}" * }
  if$
}

FUNCTION {bolden}
{ duplicate$ empty$
    { pop$ "" }
    { "{\bf " swap$ * "}" * }
  if$
}

FUNCTION {capitalize}
{ "u" change.case$ "t" change.case$ }

FUNCTION {space.word}
{ " " swap$ * " " * }

 % Here are the language-specific definitions for explicit words.
 % Each function has a name bbl.xxx where xxx is the English word.
 %-------------------------------------------------------------------
 % The original source file contains the following version information:
 % \ProvidesFile{spanish.mbs}[1995/06/01 1.0 (PWD/TB)]
 % Copyright (C) 1994, 1995 Patrick W. Daly
 % Copyright (C) 1995 Tom\'as Bautista

 %-------------------------------------------------------------------

 % The language selected here is SPANISH
FUNCTION {bbl.and}
{ "y"}

FUNCTION {bbl.editors}
{ "editores" }

FUNCTION {bbl.editor}
{ "editor" }

FUNCTION {bbl.edby}
{ "editado por" }

FUNCTION {bbl.edition}
{ "edici\'on" }

FUNCTION {bbl.volume}
{ "Vol.\ " }

FUNCTION {bbl.of}
{ "de" }

FUNCTION {bbl.number}
{ "n\raise1ex\hbox{\underbar{\scriptsize o}}" }

FUNCTION {bbl.nr}
{ "n\raise1ex\hbox{\underbar{\scriptsize o}}" }

FUNCTION {bbl.in}
{ "en" }

FUNCTION {bbl.pages}
{ "p\'ags.\ " }

FUNCTION {bbl.page}
{ "p\'ag.\ " }

FUNCTION {bbl.chapter}
{ "Cap.\ " }

FUNCTION {bbl.techrep}
{ "Inf.\ T\'ec.\ " }

FUNCTION {bbl.mthesis}
{ "Proyecto Fin de Carrera" }

FUNCTION {bbl.phdthesis}
{ "Tesis Doctoral" }

FUNCTION {bbl.first}
{ "primera" }

FUNCTION {bbl.second}
{ "segunda" }

FUNCTION {bbl.third}
{ "tercera" }

FUNCTION {bbl.fourth}
{ "cuarta" }

FUNCTION {bbl.fifth}
{ "quinta" }

FUNCTION {bbl.th}
{ "\raise1ex\hbox{\underbar{\scriptsize a}}" }

MACRO {jan} {"ene."}

MACRO {feb} {"feb."}

MACRO {mar} {"mar."}

MACRO {apr} {"abr."}

MACRO {may} {"mayo"}

MACRO {jun} {"jun."}

MACRO {jul} {"jul."}

MACRO {aug} {"ago."}

MACRO {sep} {"sep."}

MACRO {oct} {"oct."}

MACRO {nov} {"nov."}

MACRO {dec} {"dic."}

 % End of language definition file

 %-------------------------------------------------------------------
 % The original source file contains the following version information:
 % \ProvidesFile{prjour.mbs}[1996/12/03 2.0a (PWD)]
 % Copyright (C) 1994--96 Patrick W. Daly
 %-------------------------------------------------------------------
MACRO {Accounts_of_Chemical_Research} {"Acc.\ Chem.\ Res.\ "}
MACRO {Acc._Chem._Res.} {"Acc.\ Chem.\ Res.\ "}

MACRO {Acta_Chemica_Scandinavica} {"Acta Chem.\ Scand.\ "}
MACRO {Acta_Chem._Scand.} {"Acta Chem.\ Scand.\ "}

MACRO {Acta_Crystallographica} {"Acta Crystallogr.\ "}
MACRO {Acta_Crystallogr.} {"Acta Crystallogr.\ "}

%%Acta Crystallographica, Section A: Crystal Physics, Diffraction, Theoretical and General Crystallography
MACRO {Acta_Crystallographica_Section_A_Crystal_Physics_Diffraction_Theoretical_and_General_Crystallography} {"Acta Cyrstallogr.\ Sect.\ A"}
MACRO {Acta_Cyrstallogr._Sect._A} {"Acta Cyrstallogr.\ Sect.\ A"}

%%Acta Crystallographica, Section B: Structural Crystallography and Crystal Chemistry
MACRO {Acta_Crystallographica_Section_B_Structural_Crystallography_and_Crystal_Chemistry} {"Acta Crystallogr.\ Sect.\ B"}
MACRO {Acta_Crystallogr._Sect._B} {"Acta Crystallogr.\ Sect.\ B"}

MACRO {Acta_Mathematica_Acedemiae_Scientiarum_Hungaricae} {"Acta Mathe.\ Acad.\ Sci.\ Hung.\ "}
MACRO {Acta_Mathe._Acad._Sci._Hung.} {"Acta Mathe.\ Acad.\ Sci.\ Hung.\ "}

MACRO {Acta_Metallurgica} {"Acta Metall.\ "}
MACRO {Acta_Metall.} {"Acta Metall.\ "}

MACRO {Acta_Oto-Laryngologica} {"Acta Oto-Laryngol.\ "}
MACRO {Acta_Oto-Laryngol.} {"Acta Oto-Laryngol.\ "}

MACRO {Acta_Physica} {"Acta Phys.\ "}
MACRO {Acta_Phys.} {"Acta Phys.\ "}

MACRO {Acta_Physica_Austriaca} {"Acta Phys.\ Austriaca"}
MACRO {Acta_Phys._Austriaca} {"Acta Phys.\ Austriaca"}

MACRO {Acta_Physica_Polonica} {"Acta Phys.\ Pol.\ "}
MACRO {Acta_Phys._Pol.} {"Acta Phys.\ Pol.\ "}

MACRO {Acustica} {"Acustica"}

MACRO {Advances_in_Applied_Mechanics} {"Adv.\ Appl.\ Mech.\ "}
MACRO {Adv._Appl._Mech.} {"Adv.\ Appl.\ Mech.\ "}

MACRO {Advances_in_Atomic_and_Molecular_Physics} {"Adv.\ At.\ Mol.\ Phys.\ "}
MACRO {Adv._At._Mol._Phys.} {"Adv.\ At.\ Mol.\ Phys.\ "}

MACRO {Advances_in_Chemical_Physics} {"Adv.\ Chem.\ Phys.\ "}
MACRO {Adv._Chem._Phys.} {"Adv.\ Chem.\ Phys.\ "}

MACRO {Advances_in_Magnetic_Resonance} {"Adv.\ Magn.\ Reson.\ "}
MACRO {Adv._Magn._Reson.} {"Adv.\ Magn.\ Reson.\ "}

MACRO {Advances_in_Physics} {"Adv.\ Phys.\ "}
MACRO {Adv._Phys._} {"Adv.\ Phys.\ "}

MACRO {Advances_in_Quantum_Chemistry} {"Adv.\ Quantum Chem.\ "}
MACRO {Adv._Quantum_Chem._} {"Adv.\ Quantum Chem.\ "}

MACRO {AIAA_Journal} {"AIAA J. "}
MACRO {AIAA_J.} {"AIAA J. "}

MACRO {AIChE_Journal} {"AIChE J. "}
MACRO {AIChE_J.} {"AIChE J. "}

MACRO {AIP_Conference_Proceedings} {"AIP Conf.\ Proc.\ "}
MACRO {AIP_Conf._Proc.} {"AIP Conf.\ Proc.\ "}

%%Akusticheskii Zhurnal [Soviet Physics---Acoustics]
MACRO {Akusticheskii_Zhurnal_Soviet_Physics_Acoustics} {"Akust.\ Zh.\ [Sov.\ Phys.\ Acoust.]"}
MACRO {Akust._Zh._Sov._Phys._Acoust.} {"Akust.\ Zh.\ [Sov.\ Phys.\ Acoust.]"}

MACRO {American_Journal_of_Physics} {"Am.\ J. Phys.\ "}
MACRO {Am._J._Phys.} {"Am.\ J. Phys.\ "}

MACRO {Analytical_Chemistry} {"Anal.\ Chem.\ "}
MACRO {Anal._Chem.} {"Anal.\ Chem.\ "}

%%Annalen der Physik (Leipzig)
MACRO {Annalen_der_Physik_Leipzig} {"Ann.\ Phys.\ (Leipzig)"}
MACRO {Ann._Phys._Leipzig} {"Ann.\ Phys.\ (Leipzig)"}

MACRO {Annales_de_Chimie_et_de_Physique} {"Ann.\ Chim.\ Phys.\ "}
MACRO {Ann._Chim._Phys.} {"Ann.\ Chim.\ Phys.\ "}

MACRO {Annales_de_Geophysique} {"Ann.\ Geophys.\ "}
MACRO {Ann._Geophys.} {"Ann.\ Geophys.\ "}

%%Annales de l'Institut Henri Poincare
MACRO {Annales_de_l_Institut_Henri_Poincare} {"Ann.\ Inst.\ Henri Poincare"}
MACRO {Ann._Inst._Henri_Poincare} {"Ann.\ Inst.\ Henri Poincare"}

%%Annales de l'Institut Henri Poincare, Section A: Physique Theorique
MACRO {Annales_de_l_Institut_Henri_Poincare_Section_A_Physique_Theorique} {"Ann.\ Inst.\ Henri Poincare, A"}
MACRO {Ann._Inst._Henri_Poincare_A} {"Ann.\ Inst.\ Henri Poincare, A"}

%%Annales de l'Institut Henri Poincare, Section B: Calcul des Probabilites et Statistique
MACRO {Annales_de_l_Institut_Henri_Poincare_Section_B_Calcul_des_Probabilites_et_Statistique} {"Ann.\ Inst.\ Henri Poincare, B"}
MACRO {Ann._Inst._Henri_Poincare_B} {"Ann.\ Inst.\ Henri Poincare, B"}

%%Annales de Physique (Paris)
MACRO {Annales_de_Physique_Paris} {"Ann.\ Phys.\ (Paris)"}
MACRO {Ann._Phys._Paris} {"Ann.\ Phys.\ (Paris)"}

MACRO {Annals_of_Fluid_Dynamics} {"Ann.\ Fluid Dyn.\ "}
MACRO {Ann._Fluid_Dyn.} {"Ann.\ Fluid Dyn.\ "}

MACRO {Annals_of_Mathematics} {"Ann.\ Math.\ "}
MACRO {Ann._Math._} {"Ann.\ Math.\ "}

%%Annals of Otology, Rhinology & Laryngology
MACRO {Annals_of_Otology_Rhinology_&_Laryngology} {"Ann.\ Otol.\ Rhinol.\ Laryngol.\ "}
MACRO {Ann._Otol._Rhinol._Laryngol.} {"Ann.\ Otol.\ Rhinol.\ Laryngol.\ "}

%%Annals of Physics (New York)
MACRO {Annals_of_Physics_New_York} {"Ann.\ Phys.\ (N. Y.)"}
MACRO {Ann._Phys._N._Y.} {"Ann.\ Phys.\ (N. Y.)"}

MACRO {Annual_Review_of_Astronomy_and_Astrophysics}
{"Ann.\ Rev.\ Astron.\ Ap.\ "}
MACRO {Ann._Rev._Astron._Ap.} {"Ann.\ Rev.\ Astron.\ Ap.\ "}

MACRO {Annual_Review_of_Nuclear_Science} {"Ann.\ Rev.\ Nucl.\ Sci.\ "}
MACRO {Ann._Rev._Nucl._Sci.} {"Ann.\ Rev.\ Nucl.\ Sci.\ "}

MACRO {Applied_Optics} {"Appl.\ Opt.\ "}
MACRO {Appl._Opt.} {"Appl.\ Opt.\ "}

MACRO {Applied_Physics_Letters} {"Appl.\ Phys.\ Lett.\ "}
MACRO {Appl._Phys._Lett.} {"Appl.\ Phys.\ Lett.\ "}

MACRO {Applied_Spectroscopy} {"Appl.\ Spectrosc.\ "}
MACRO {Appl._Spectrosc.} {"Appl.\ Spectrosc.\ "}

MACRO {Arkiv_foer_Fysik} {"Ark.\ Fys.\ "}
MACRO {Ark._Fys.} {"Ark.\ Fys.\ "}

MACRO {Astronomical_Journal} {"Astron.\ J. "}
MACRO {Astron._J.} {"Astron.\ J. "}

%%Astronomicheskii Zhurnal [Soviet Astronomy]
MACRO {Astronomicheskii_Zhurnal_Soviet_Astronomy} {"Astron.\ Zh.\ [Sov.\ Astron.]"}
MACRO {Astron._Zh._Sov._Astron.} {"Astron.\ Zh.\ [Sov.\ Astron.]"}

MACRO {Astronomische_Nachrichten} {"Astron.\ Nachr.\ "}
MACRO {Astron._Nachr.} {"Astron.\ Nachr.\ "}

MACRO {Astronomy_and_Astrophysics} {"Astron.\ Astrophys.\ "}
MACRO {Astron._Astrophys.} {"Astron.\ Astrophys.\ "}

MACRO {Astrophysical_Journal} {"Astrophys.\ J."}
MACRO {Astrophys._J.} {"Astrophys.\ J."}

%%Astrophysical Journal, Letters to the Editor
MACRO {Astrophysical_Journal_Letters_to_the_Editor} {"Astrophys.\ J. Lett.\ "}
MACRO {Astrophys._J._Lett.} {"Astrophys.\ J. Lett.\ "}

%%Astrophysical Journal, Supplement Series
MACRO {Astrophysical_Journal_Supplement_Series} {"Astrophys.\ J. Suppl.\ Ser.\ "}
MACRO {Astrophys._J._Suppl._Ser.} {"Astrophys.\ J. Suppl.\ Ser.\ "}

MACRO {Astrophysical_Letters} {"Astrophys.\ Lett.\ "}
MACRO {Astrophys._Lett.} {"Astrophys.\ Lett.\ "}

MACRO {Astrophysics_and_Space_Science} {"Astrophys.\ Space Sci.\ "}
MACRO {Astrophys._Space_Sci.} {"Astrophys.\ Space Sci.\ "}

MACRO {Atomic_Data_and_Nuclear_Data_Tables} {"At.\ Data Nucl.\ Data Tables"}
MACRO {At._Data_Nucl._Data_Tables} {"At.\ Data Nucl.\ Data Tables"}

%%Atomnaya Energiya [Soviet Journal of Atomic Energy]
MACRO {Atomnaya_Energiya_Soviet_Journal_of_Atomic_Energy} {"At.\ Energ.\ [Sov.\ J. At.\ Energy]"}
MACRO {At._Energ.\_Sov._J._At._Energy} {"At.\ Energ.\ [Sov.\ J. At.\ Energy]"}

MACRO {Australian_Journal_of_Physics} {"Aust.\ J. Phys.\ "}
MACRO {Aust._J._Phys.} {"Aust.\ J. Phys.\ "}

MACRO {Bell_System_Technical_Journal} {"Bell Syst.\ Tech.\ J. "}
MACRO {Bell_Syst._Tech._J.} {"Bell Syst.\ Tech.\ J. "}

MACRO {Berichte_der_Bunsengesellschaft_fuer_Physikalische_Chemie} {"Ber.\ Bunsenges.\ Phys.\ Chem.\ "}
MACRO {Ber._Bunsenges._Phys._Chem.} {"Ber.\ Bunsenges.\ Phys.\ Chem.\ "}

MACRO {British_Journal_of_Applied_Physics} {"Br.\ J. Appl.\ Phys.\ "}
MACRO {Br._J._Appl._Phys.} {"Br.\ J. Appl.\ Phys.\ "}

%%Bulletin of the Academy of Sciences of the USSR, Physical Series
MACRO {Bulletin_of_the_Academy_of_Sciences_of_the_USSR_Physical_Series} {"Bull.\ Acad.\ Sci.\ USSR, Phys.\ Ser.\ "}
MACRO {Bull._Acad._Sci._USSR_Phys._Ser.} {"Bull.\ Acad.\ Sci.\ USSR, Phys.\ Ser.\ "}

MACRO {Bulletin_of_the_American_Astronomical_Society} {"Bull.\ Am.\ Astron.\ Soc.\ "}
MACRO {Bull._Am._Astron._Soc.} {"Bull.\ Am.\ Astron.\ Soc.\ "}

MACRO {Bulletin_of_The_American_Physical_Society} {"Bull.\ Am.\ Phys.\ Soc.\ "}
MACRO {Bull._Am._Phys._Soc.} {"Bull.\ Am.\ Phys.\ Soc.\ "}

MACRO {Bulletin_of_the_Astronomical_Institutes_of_the_Netherlands} {"Bull.\ Astron.\ Inst.\ Neth.\ "}
MACRO {Bull._Astron._Inst._Neth.} {"Bull.\ Astron.\ Inst.\ Neth.\ "}

MACRO {Bulletin_of_the_Chemical_Society_of_Japan} {"Bull.\ Chem.\ Soc.\ Jpn.\ "}
MACRO {Bull._Chem._Soc._Jpn.} {"Bull.\ Chem.\ Soc.\ Jpn.\ "}

MACRO {Bulletin_of_the_Seismological_Society_of_America} {"Bull.\ Seismol.\ Soc.\ Am.\ "}
MACRO {Bull._Seismol._Soc._Am.} {"Bull.\ Seismol.\ Soc.\ Am.\ "}

MACRO {Canadian_Journal_of_Chemistry} {"Can.\ J. Chem.\ "}
MACRO {Can._J._Chem.} {"Can.\ J. Chem.\ "}

MACRO {Canadian_Journal_of_Physics} {"Can.\ J. Phys.\ "}
MACRO {Can._J._Phys.} {"Can.\ J. Phys.\ "}

MACRO {Canadian_Journal_of_Research} {"Can.\ J. Res.\ "}
MACRO {Can._J._Res._} {"Can.\ J. Res.\ "}

MACRO {Chemical_Physics} {"Chem.\ Phys.\ "}
MACRO {Chem._Phys.} {"Chem.\ Phys.\ "}

MACRO {Chemical_Physics_Letters} {"Chem.\ Phys.\ Lett.\ "}
MACRO {Chem._Phys._Lett.} {"Chem.\ Phys.\ Lett.\ "}

MACRO {Chemical_Reviews} {"Chem.\ Rev.\ "}
MACRO {Chem._Rev._} {"Chem.\ Rev.\ "}

MACRO {Chinese_Journal_of_Physics} {"Chin.\ J. Phys.\ "}
MACRO {Chin._J._Phys._} {"Chin.\ J. Phys.\ "}

MACRO {Comments_on_Astrophysics_and_Space_Physics} {"Comments Astrophys.\ Space Phys.\ "}
MACRO {Comments_Astrophys._Space_Phys.} {"Comments Astrophys.\ Space Phys.\ "}

MACRO {Comments_on_Atomic_and_Molecular_Physics} {"Comments At.\ Mol.\ Phys.\ "}
MACRO {Comments_At._Mol._Phys.} {"Comments At.\ Mol.\ Phys.\ "}

MACRO {Comments_on_Nuclear_and_Particle_Physics} {"Comments Nucl.\ Part.\ Phys.\ "}
MACRO {Comments_Nucl._Part._Phys.} {"Comments Nucl.\ Part.\ Phys.\ "}

MACRO {Comments_on_Plasma_Physics_and_Controlled_Fusion} {"Comments Plasma Phys.\ Controlled Fusion"}
MACRO {Comments_Plasma_Phys._Controlled_Fusion} {"Comments Plasma Phys.\ Controlled Fusion"}

MACRO {Comments_on_Solid_State_Physics} {"Comments Solid State Phys.\ "}
MACRO {Comments_Solid_State_Phys.} {"Comments Solid State Phys.\ "}

MACRO {Communications_in_Mathematical_Physics} {"Commun.\ Math.\ Phys.\ "}
MACRO {Commun._Math._Phys.} {"Commun.\ Math.\ Phys.\ "}

MACRO {Communications_on_Pure_and_Applied_Mathematics} {"Commun.\ Pure Appl.\ Math.\ "}
MACRO {Commun._Pure_Appl._Math.} {"Commun.\ Pure Appl.\ Math.\ "}

%%Comptes Rendus Hebdomadaires des Seances de l'Academie des Sciences
MACRO {Comptes_Rendus_Hebdomadaires_des_Seances_de_l_Academie_des_Sciences} {"C. R. Acad.\ Sci.\ "}
MACRO {C._R._Acad._Sci.} {"C. R. Acad.\ Sci.\ "}

%%Comptes Rendus Hebdomadaires des Seances de l'Academie des Sciences,
%% Serie A: Sciences Mathematiques
MACRO {Comptes_Rendus_Hebdomadaires_des_Seances_de_l_Academie_des_Sciences_Serie_A_Sciences_Mathematiques } {"C. R. Acad.\ Sci.\ Ser.\ A"}
MACRO {C._R._Acad._Sci._Ser._A} {"C. R. Acad.\ Sci.\ Ser.\ A"}

%%Comptes Rendus Hebdomadaires des Seances de l'Academie des Sciences,
%% Serie B: Sciences Physiques
MACRO {Comptes_Rendus_Hebdomadaires_des_Seances_de_l_Academie_des_Sciences_Serie_B_Sciences_Physiques } {"C. R. Acad.\ Sci.\ Ser.\ B"}
MACRO {C._R._Acad._Sci._Ser._B} {"C. R. Acad.\ Sci.\ Ser.\ B"}

MACRO {Cryogenics} {"Cryogenics"}

MACRO {Czechoslovak_Journal_of_Physics} {"Czech.\ J. Phys.\ "}
MACRO {Czech._J._Phys.} {"Czech.\ J. Phys.\ "}

MACRO {Discussions_of_the_Faraday_Society} {"Discuss.\ Faraday Soc.\ "}
MACRO {Discuss._Faraday_Soc.} {"Discuss.\ Faraday Soc.\ "}

%%Doklady Akademii Nauk SSSR [Soviet Physics---Doklady]
MACRO {Doklady_Akademii_Nauk_SSSR_Soviet_Physics_Doklady} {"Dokl.\ Akad.\ Nauk SSSR [Sov.\ Phys.\ Dokl.]"}
MACRO {Dokl._Akad._Nauk_SSSR_Sov._Phys._Dokl.} {"Dokl.\ Akad.\ Nauk SSSR [Sov.\ Phys.\ Dokl.]"}

MACRO {Earth_and_Planetary_Science_Letters} {"Earth Planet.\ Sci.\ Lett.\ "}
MACRO {Earth_Planet._Sci._Lett.} {"Earth Planet.\ Sci.\ Lett.\ "}

MACRO {Electronics_Letters} {"Electron.\ Lett.\ "}
MACRO {Electron._Lett.} {"Electron.\ Lett.\ "}

MACRO {Experientia} {"Experientia"}

MACRO {Fields_and_Quanta} {"Fields Quanta"}
MACRO {Fields_Quanta} {"Fields Quanta"}

%%Fizika Elementarnykh Chastits i Atomnogo Yadra [Soviet Journal of Particles and Nuclei]
MACRO {Fizika_Elementarnykh_Chastits_i_Atomnogo_Yadra_Soviet_Journal_of_Particles_and_Nuclei} {"Fiz.\ Elem.\ Chastits At.\ Yadra [Sov.\ J. Part.\ Nucl.]"}
MACRO {Fiz._Elem._Chastits_At._Yadra_Sov._J._Part._Nucl.} {"Fiz.\ Elem.\ Chastits At.\ Yadra [Sov.\ J. Part.\ Nucl.]"}

%%Fizika i Tekhnika Poluprovodnikov [Soviet Physics---Semiconductors]
MACRO {Fizika_i_Tekhnika_Poluprovodnikov_Soviet_Physics_Semiconductors} {"Fiz.\ Tekh.\ Poluprovodn.\ [Sov.\ Phys.\ Semicond.]"}
MACRO {Fiz._Tekh._Poluprovodn._Sov._Phys._Semicond.} {"Fiz.\ Tekh.\ Poluprovodn.\ [Sov.\ Phys.\ Semicond.]"}

%%Fizika Metallov i Metallovedenie [Physics of Metals and Metallography (USSR)]
MACRO {Fizika_Metallov_i_Metallovedenie_Physics_of_Metals_and_Metallography_USSR} {"Fiz.\ Met.\ Metalloved.\ [Phys.\ Met.\ Metallogr.\ (USSR)]"}
MACRO {Fiz._Met._Metalloved._Phys._Met._Metallogr._USSR} {"Fiz.\ Met.\ Metalloved.\ [Phys.\ Met.\ Metallogr.\ (USSR)]"}

%%Fizika Nizkikh Temperatur [Soviet Journal of Low Temperature Physics]
MACRO {Fizika_Nizkikh_Temperatur_Soviet_Journal_of_Low_Temperature_Physics} {"Fiz.\ Nizk.\ Temp.\ [Sov.\ J. Low Temp.\ Phys.]"}
MACRO {Fiz._Nizk._Temp._Sov._J._Low_Temp._Phys.} {"Fiz.\ Nizk.\ Temp.\ [Sov.\ J. Low Temp.\ Phys.]"}

%%Fizika Plazmy [Soviet Journal of Plasma Physics]
MACRO {Fizika_Plazmy_Soviet_Journal_of_Plasma_Physics} {"Fiz.\ Plazmy [Sov.\ J. Plasma Phys.]"}
MACRO {Fiz._Plazmy_Sov._J._Plasma_Phys.} {"Fiz.\ Plazmy [Sov.\ J. Plasma Phys.]"}

%%Fizika Tverdogo Tela (Leningrad) [Soviet Physics---Solid State]
MACRO {Fizika_Tverdogo_Tela_Leningrad_Soviet_Physics_Solid_State} {"Fiz.\ Tverd.\ Tela (Leningrad) [Sov.\ Phys.\ Solid State]"}
MACRO {Fiz._Tverd._Tela_Leningrad_Sov._Phys._Solid_State} {"Fiz.\ Tverd.\ Tela (Leningrad) [Sov.\ Phys.\ Solid State]"}

%%Fizika (Zagreb)
MACRO {Fizika_Zagreb} {"Fizika (Zagreb)"}

MACRO {Fortschritte_der_Physik} {"Fortschr.\ Phys.\ "}
MACRO {Fortschr._Phys.} {"Fortschr.\ Phys.\ "}

MACRO {Foundations_of_Physics} {"Found.\ Phys.\ "}
MACRO {Found._Phys.} {"Found.\ Phys.\ "}

MACRO {General_Relativity_and_Gravitation} {"Gen.\ Relativ.\ Gravit.\ "}
MACRO {Gen._Relativ._Gravit.} {"Gen.\ Relativ.\ Gravit.\ "}

MACRO {Geochimica_et_Cosmochimica_Acta} {"Geochim.\ Cosmochim.\ Acta"}
MACRO {Geochim._Cosmochim._Acta} {"Geochim.\ Cosmochim.\ Acta"}

MACRO {Helvetica_Chimica_Acta} {"Helv.\ Chim.\ Acta"}
MACRO {Helv._Chim._Acta} {"Helv.\ Chim.\ Acta"}

MACRO {Helvetica_Physica_Acta} {"Helv.\ Phys.\ Acta"}
MACRO {Helv._Phys._Acta} {"Helv.\ Phys.\ Acta"}

%%High Temperature (USSR)
MACRO {High_Temperature_USSR} {"High Temp.\ (USSR)"}
MACRO {High_Temp._USSR} {"High Temp.\ (USSR)"}

MACRO {IBM_Journal_of_Research_and_Development} {"IBM J. Res.\ Dev.\ "}
MACRO {IBM_J._Res._Dev.} {"IBM J. Res.\ Dev.\ "}

MACRO {Icarus} {"Icarus"}

MACRO {IEEE_Journal_of_Quantum_Electronics} {"IEEE J. Quantum Electron.\ "}
MACRO {IEEE_J._Quantum_Electron.} {"IEEE J. Quantum Electron.\ "}

MACRO {IEEE_Transactions_on_Antennas_and_Propagation} {"IEEE Trans.\ Antennas Propag.\ "}
MACRO {IEEE_Trans._Antennas_Propag.} {"IEEE Trans.\ Antennas Propag.\ "}

MACRO {IEEE_Transactions_on_Electron_Devices} {"IEEE Trans.\ Electron Devices"}
MACRO {IEEE_Trans._Electron_Devices} {"IEEE Trans.\ Electron Devices"}

MACRO {IEEE_Transactions_on_Information_Theory} {"IEEE Trans.\ Inf.\ Theory"}
MACRO {IEEE_Trans._Inf._Theory} {"IEEE Trans.\ Inf.\ Theory"}

MACRO {IEEE_Transactions_on_Instrumentation_and_Measurement} {"IEEE Trans.\ Instrum.\ Meas.\ "}
MACRO {IEEE_Trans._Instrum._Meas.} {"IEEE Trans.\ Instrum.\ Meas.\ "}

MACRO {IEEE_Transactions_on_Magnetics} {"IEEE Trans.\ Magn.\ "}
MACRO {IEEE_Trans._Magn.} {"IEEE Trans.\ Magn.\ "}

MACRO {IEEE_Transactions_on_Microwave_Theory_and_Techniques} {"IEEE Trans.\ Microwave Theory Tech.\ "}
MACRO {IEEE_Trans._Microwave_Theory_Tech.} {"IEEE Trans.\ Microwave Theory Tech.\ "}

MACRO {IEEE_Transactions_on_Nuclear_Science} {"IEEE Trans.\ Nucl.\ Sci.\ "}
MACRO {IEEE_Trans._Nucl._Sci.} {"IEEE Trans.\ Nucl.\ Sci.\ "}

MACRO {IEEE_Transactions_on_Sonics_and_Ultrasonics} {"IEEE Trans.\ Sonics Ultrason.\ "}
MACRO {IEEE_Trans._Sonics_Ultrason.} {"IEEE Trans.\ Sonics Ultrason.\ "}

MACRO {Industrial_and_Engineering_Chemistry} {"Ind.\ Eng.\ Chem.\ "}
MACRO {Ind._Eng._Chem.} {"Ind.\ Eng.\ Chem.\ "}

MACRO {Infrared_Physics} {"Infrared Phys.\ "}
MACRO {Infrared_Phys.} {"Infrared Phys.\ "}

MACRO {Inorganic_Chemistry} {"Inorg.\ Chem.\ "}
MACRO {Inorg._Chem.} {"Inorg.\ Chem.\ "}

%%Inorganic Materials (USSR)
MACRO {Inorganic_Materials_USSR} {"Inorg.\ Mater.\ (USSR)"}
MACRO {Inorg._Mater._USSR} {"Inorg.\ Mater.\ (USSR)"}

%%Instruments and Experimental Techniques (USSR)
MACRO {Instruments_and_Experimental_Techniques_USSR} {"Instrum.\ Exp.\ Tech.\ (USSR)"}
MACRO {Instrum._Exp._Tech._USSR} {"Instrum.\ Exp.\ Tech.\ (USSR)"}

MACRO {International_Journal_of_Magnetism} {"Int.\ J. Magn.\ "}
MACRO {Int._J._Magn.} {"Int.\ J. Magn.\ "}

MACRO {International_Journal_of_Quantum_Chemistry} {"Int.\ J. Quantum Chem.\ "}
MACRO {Int._J._Quantum_Chem.} {"Int.\ J. Quantum Chem.\ "}

%%International Journal of Quantum Chemistry, Part 1
MACRO {International_Journal_of_Quantum_Chemistry_Part_1} {"Int.\ J. Quantum Chem.\ 1"}
MACRO {Int._J._Quantum_Chem._1} {"Int.\ J. Quantum Chem.\ 1"}

%%International Journal of Quantum Chemistry, Part 2
MACRO {International_Journal_of_Quantum_Chemistry_Part_2} {"Int.\ J. Quantum Chem.\ 2"}
MACRO {Int._J._Quantum_Chem._2} {"Int.\ J. Quantum Chem.\ 2"}

MACRO {International_Journal_of_Theoretical_Physics} {"Int.\ J. Theor.\ Phys.\ "}
MACRO {Int._J._Theor._Phys.} {"Int.\ J. Theor.\ Phys.\ "}

%%Izvestiya, Academy of Sciences, USSR, Atmospheric and Oceanic Physics
MACRO {Izvestiya_Academy_of_Sciencies_USSR_Atmospheric_and_Oceanic_Physics} {"Izv.\ Acad.\ Sci.\ USSR, Atmos.\ Oceanic Phys.\ "}
MACRO {Izv._Acad._Sci._USSR_Atmos._Oceanic_Phys.} {"Izv.\ Acad.\ Sci.\ USSR, Atmos.\ Oceanic Phys.\ "}

%%Izvestiya, Academy of Sciences, USSR, Physics of the Solid Earth
MACRO {Izvestiya_Academy_of_Sciencies_USSR_Physics_of_the_Solid_Earth} {"Izv.\ Acad.\ Sci.\ USSR, Phys.\ Solid Earth"}
MACRO {Izv._Acad._Sci._USSR_Phys._Solid_Earth} {"Izv.\ Acad.\ Sci.\ USSR, Phys.\ Solid Earth"}

%%Izvestiya Academii Nauk SSSR, Fizika Atmosfery i Okeana [Izvestiya, Academy of Sciences, USSR, Atmospheric and Oceanic Physics]
MACRO {Izvestiya_Academii_Nauk_SSSR_Fizika_Atmosfery_i_Okeana_Izvestiya_Academy_of_Sciences_USSR_Atmospheric_and_Oceanic_Physics} {"Izv.\ Akad.\ Nauk SSSR, Fiz.\ Atmos.\ Okeana [Izv.\ Acad.\ Sci.\ USSR, Atmos.\ Oceanic Phys.]"}
MACRO {Izv._Akad._Nauk_SSSR_Fiz._Atmos._Okeana_Izv._Acad._Sci._USSR_Atmos._Oceanic_Phys.} {"Izv.\ Akad.\ Nauk SSSR, Fiz.\ Atmos.\ Okeana [Izv.\ Acad.\ Sci.\ USSR, Atmos.\ Oceanic Phys.]"}

%%Izvestiya Akademii Nauk SSSR, Fizika Zemli [Izvestiya, Academy of Sciences, USSR, Physics of the Solid Earth]
MACRO {Izvestiya_Akademii_Nauk_SSSR_Fizika_Zemli_Izvestiya_Academy_of_Sciences_USSR_Physics_of_the_Solid_Earth} {"Izv.\ Akad.\ Nauk SSSR, Fiz.\ Zemli [Izv.\ Acad.\ Sci.\ USSR, Phys.\ Solid Earth]"}
MACRO {Izv._Akad._Nauk_SSSR_Fiz._Zemli_Izv._Acad._Sci._USSR_Phys._Solid_Earth} {"Izv.\ Akad.\ Nauk SSSR, Fiz.\ Zemli [Izv.\ Acad.\ Sci.\ USSR, Phys.\ Solid Earth]"}

%%Izvestiya Akademii Nauk SSSR, Neorganicheskie Materialy [Inorganic Materials (USSR)]
MACRO {Izvestiya_Akademii_Nauk_SSSR_Neorganicheskie_Materialy_Inorganic_Materials_USSR} {"Izv.\ Akad.\ Nauk SSSR, Neorg.\ Mater.\ [Inorg.\ Mater.\ (USSR)]"}
MACRO {Izv._Akad._Nauk_SSSR_Neorg._Mater._Inorg._Mater._USSR} {"Izv.\ Akad.\ Nauk SSSR, Neorg.\ Mater.\ [Inorg.\ Mater.\ (USSR)]"}

%%Izvestiya Akademii Nauk SSSR, Seriya Fizicheskaya [Bulletin of the Academy of Sciences of the USSR, Physical Series]
MACRO {Izvestiya_Akademii_Nauk_SSSR_Seriya_Fizicheskaya_Bulletin_of_the_Academy_of_Sciences_of_the_USSR_Physical_Series} {"Izv.\ Akad.\ Nauk SSSR, Ser.\ Fiz.\ [Bull.\ Acad.\ Sci.\ USSR, Phys.\ Ser.]"}
MACRO {Izv._Akad._Nauk_SSSR_Ser._Fiz._Bull._Acad._Sci._USSR_Phys._Ser.} {"Izv.\ Akad.\ Nauk SSSR, Ser.\ Fiz.\ [Bull.\ Acad.\ Sci.\ USSR, Phys.\ Ser.]"}

%%Izvestiya Vysshikh Uchebnykh Zavedenii, Fizika [Soviet Physics Journal]
MACRO {Izvestiya_Vysshikh_Uchebnykh_Zavedenii_Fizika_Soviet_Physics_Journal} {"Izv.\ Vyssh.\ Uchebn.\ Zaved.\ Fiz.\ [Sov.\ Phys.\ J.]"}
MACRO {Izv._Vyssh._Uchebn._Zaved._Fiz._Sov._Phys._J.} {"Izv.\ Vyssh.\ Uchebn.\ Zaved.\ Fiz.\ [Sov.\ Phys.\ J.]"}

%%Izvestiya Vysshikh Uchebnykh Zavedenii, Radiofizika [Soviet Radiophysics]
MACRO {Izvestiya_Vysshikh_Uchebnykh_Zavedenii_Radiofizika_Soviet_Radiophysics} {"Izv.\ Vyssh.\ Uchebn.\ Zaved.\ Radiofiz.\ [Sov.\ Radiophys.]"}
MACRO {Izv._Vyssh._Uchebn._Zaved._Radiofiz._Sov._Radiophys.} {"Izv.\ Vyssh.\ Uchebn.\ Zaved.\ Radiofiz.\ [Sov.\ Radiophys.]"}

MACRO {Japanese_Journal_of_Applied_Physics} {"Jpn.\ J. Appl.\ Phys.\ "}
MACRO {Jpn._J._Appl._Phys.} {"Jpn.\ J. Appl.\ Phys.\ "}

MACRO {Jananese_Journal_of_Physics} {"Jpn.\ J. Phys.\ "}
MACRO {Jpn._J._Phys.} {"Jpn.\ J. Phys.\ "}

MACRO {JETP_Letters} {"JETP Lett.\ "}
MACRO {JETP_Lett.} {"JETP Lett.\ "}

MACRO {Journal_de_Chimie_Physique} {"J. Chim.\ Phys.\ "}
MACRO {J._Chim._Phys.} {"J. Chim.\ Phys.\ "}

%%Journal de Physique (Paris)
MACRO {Journal_de_Physique_Paris} {"J. Phys.\ (Paris)"}
MACRO {J._Phys._Paris} {"J. Phys.\ (Paris)"}

MACRO {Journal_de_Physique_et_le_Radium} {"J. Phys.\ Radium"}
MACRO {J._Phys._Radium} {"J. Phys.\ Radium"}

MACRO {Journal_of_Applied_Crystallography} {"J. Appl.\ Crystallogr.\ "}
MACRO {J._Appl._Crystallogr.} {"J. Appl.\ Crystallogr.\ "}

MACRO {Journal_of_Applied_Physics} {"J. Appl.\ Phys.\ "}
MACRO {J._Appl._Phys.} {"J. Appl.\ Phys.\ "}

%%Journal of Applied Spectroscopy (USSR)
MACRO {Journal_of_Applied_Spectroscopy_USSR} {"J. Appl.\ Spectrosc.\ (USSR)"}
MACRO {J._Appl._Spectrosc._USSR} {"J. Appl.\ Spectrosc.\ (USSR)"}

MACRO {Journal_of_Atmospheric_and_Terrestrial_Physics} {"J. Atmos.\ Terr.\ Phys.\ "}
MACRO {J._Atmos._Terr._Phys.} {"J. Atmos.\ Terr.\ Phys.\ "}

MACRO {Journal_of_Atmospheric_Sciences} {"J. Atmos.\ Sci.\ "}
MACRO {J._Atmos._Sci.} {"J. Atmos.\ Sci.\ "}

MACRO {Journal_of_Chemical_Physics} {"J. Chem.\ Phys.\ "}
MACRO {J._Chem._Phys.} {"J. Chem.\ Phys.\ "}

MACRO {Journal_of_Computational_Physics} {"J. Comput.\ Phys.\ "}
MACRO {J._Comput._Phys.} {"J. Comput.\ Phys.\ "}

MACRO {Journal_of_Crystal_Growth} {"J. Cryst.\ Growth"}
MACRO {J._Cryst._Growth} {"J. Cryst.\ Growth"}

MACRO {Journal_of_Fluid_Mechanics} {"J. Fluid Mech.\ "}
MACRO {J._Fluid_Mech.} {"J. Fluid Mech.\ "}

MACRO {Journal_of_Geophysical_Research} {"J. Geophys.\ Res.\ "}
MACRO {J._Geophys._Res.} {"J. Geophys.\ Res.\ "}

MACRO {Journal_of_Inorganic_and_Nuclear_Chemistry} {"J. Inorg.\ Nucl.\ Chem.\ "}
MACRO {J._Inorg._Nucl._Chem.} {"J. Inorg.\ Nucl.\ Chem.\ "}

MACRO {Journal_of_Low_Temperature_Physics} {"J. Low Temp.\ Phys.\ "}
MACRO {J._Low_Temp._Phys.} {"J. Low Temp.\ Phys.\ "}

MACRO {Journal_of_Luminescence} {"J. Lumin.\ "}
MACRO {J._Lumin.} {"J. Lumin.\ "}

%%Journal of Macromolecular Science, [Part B] Physics
MACRO {Journal_of_Macromolecular_Science_Part_B_Physics} {"J. Macromol.\ Sci.\ Phys.\ "}
MACRO {J._Macromol._Sci._Phys.} {"J. Macromol.\ Sci.\ Phys.\ "}

MACRO {Journal_of_Mathematical_Physics} {"J. Math.\ Phys.\ "}
MACRO {J._Math._Phys.} {"J. Math.\ Phys.\ "}

MACRO {Journal_of_Molecular_Spectroscopy} {"J. Mol.\ Spectrosc.\ "}
MACRO {J._Mol._Spectrosc.} {"J. Mol.\ Spectrosc.\ "}

MACRO {Journal_of_Non-Crystalline_Solids} {"J. Non-Cryst.\ Solids"}
MACRO {J._Non-Cryst._Solids} {"J. Non-Cryst.\ Solids"}

MACRO {Journal_of_Nuclear_Energy} {"J. Nucl.\ Energy"}
MACRO {J._Nucl._Energy} {"J. Nucl.\ Energy"}

%%Journal of Nuclear Energy, Part C: Plasma Physics, Accelerators, Thermonuclear Research
MACRO {Journal_of_Nuclear_Energy_Part_C_Plasma_Physics_Accelerators_Thermonuclear_Research} {"J. Nucl.\ Energy, Part C"}
MACRO {J._Nucl._Energy_Part_C} {"J. Nucl.\ Energy, Part C"}

MACRO {Journal_of_Nuclear_Materials} {"J. Nucl.\ Mater.\ "}
MACRO {J._Nucl._Mater.} {"J. Nucl.\ Mater.\ "}

MACRO {Journal_of_Physical_and_Chemical_Reference_Data} {"J. Phys.\ Chem.\ Ref.\ Data"}
MACRO {J._Phys._Chem._Ref._Data} {"J. Phys.\ Chem.\ Ref.\ Data"}

MACRO {Journal_of_Physical_Chemistry} {"J. Phys.\ Chem.\ "}
MACRO {J._Phys._Chem.} {"J. Phys.\ Chem.\ "}

%%Journal of Physics A: General Physics
MACRO {Journal_of_Physics_A_General_Physics} {"J. Phys.\ A"}
MACRO {J._Phys._A} {"J. Phys.\ A"}

MACRO {Journal_of_Physics_and_Chemistry_of_Solids} {"J. Phys.\ Chem.\ Solids"}
MACRO {J._Phys._Chem._Solids} {"J. Phys.\ Chem.\ Solids"}

%%Journal of Physics B: Atomic and Molecular Physics
MACRO {Journal_of_Physics_B_Atomic_and_Molecular_Physics} {"J. Phys.\ B"}
MACRO {J._Phys._B} {"J. Phys.\ B"}

%%Journal of Physics C: Solid State Physics
MACRO {Journal_of_Physics_C_Solid_State_Physics} {"J. Phys.\ C"}
MACRO {J._Phys._C} {"J. Phys.\ C"}

%%Journal of Physics D: Applied Physics
MACRO {Journal_of_Physics_D_Applied_Physics} {"J. Phys.\ D"}
MACRO {J._Phys._D} {"J. Phys.\ D"}

%%Journal of Physics E: Scientific Instruments
MACRO {Journal_of_Physics_E_Scientific_Instruments} {"J. Phys.\ E"}
MACRO {J._Phys._E} {"J. Phys.\ E"}

%%Journal of Physics F: Metal Physics
MACRO {Journal_of_Physics_F_Metal_Physics} {"J. Phys.\ F"}
MACRO {J._Phys._F} {"J. Phys.\ F"}

%%Journal of Physics (Moscow)
MACRO {Journal_of_Physics_Moscow} {"J. Phys.\ (Moscow)"}
MACRO {J._Phys._Moscow} {"J. Phys.\ (Moscow)"}

MACRO {Journal_of_Plasma_Physics} {"J. Plasma Phys.\ "}
MACRO {J._Plasma_Phys.} {"J. Plasma Phys.\ "}

MACRO {Journal_of_Polymer_Science} {"J. Polym.\ Sci.\ "}
MACRO {J._Polym._Sci.} {"J. Polym.\ Sci.\ "}

%%Journal of Polymer Science, Polymer Letters Edition
MACRO {Journal_of_Polymer_Science_Polymer_Letters_Edition} {"J. Polym.\ Sci.\ Polym.\ Lett.\ Ed.\ "}
MACRO {J._Polym._Sci._Polym._Lett._Ed._} {"J. Polym.\ Sci.\ Polym.\ Lett.\ Ed.\ "}

%%Journal of Polymer Science, Polymer Physics Edition
MACRO {Journal_of_Polymer_Science_Polymer_Physics_Edition} {"J. Polym.\ Sci.\ Polym.\ Phys.\ Ed.\ "}
MACRO {J._Polym._Sci._Polym._Phys._Ed.} {"J. Polym.\ Sci.\ Polym.\ Phys.\ Ed.\ "}

MACRO {Journal_of_Quantitative_Spectroscopy_&_Radiative_Transfer} {"J. Quant.\ Spectrosc.\ Radiat.\ Transfer"}
MACRO {J._Quant._Spectrosc._Radiat._Transfer} {"J. Quant.\ Spectrosc.\ Radiat.\ Transfer"}

MACRO {Journal_of_Research_of_the_National_Bureau_of_Standards} {"J. Res.\ Nat.\ Bur.\ Stand.\ "}
MACRO {J._Res._Nat._Bur._Stand.} {"J. Res.\ Nat.\ Bur.\ Stand.\ "}

%%Journal of Research of the National Bureau of Standards, Section A: Physics and Chemistry
MACRO {Journal_of_Research_of_the_National_Bureau_of_Standards_Section_A_Physics_and_Chemistry} {"J. Res.\ Nat.\ Bur.\ Stand.\ Sect.\ A"}
MACRO {J._Res._Nat._Bur._Stand._Sect._A} {"J. Res.\ Nat.\ Bur.\ Stand.\ Sect.\ A"}

%%Journal of Research of the National Bureau of Standards, Section B: Mathematical Sciences
MACRO {Journal_of_Research_of_the_National_Bureau_of_Standards_Section_B_Mathematical_Sciences} {"J. Res.\ Nat.\ Bur.\ Stand.\ Sect.\ B"}
MACRO {J._Res._Nat._Bur._Stand._Sect._B} {"J. Res.\ Nat.\ Bur.\ Stand.\ Sect.\ B"}

%%Journal of Research of the National Bureau of Standards, Section C: Engineering and Instrumentation
MACRO {Journal_of_Research_of_the_National_Bureau_of_Standards_Section_C_Engineering_and_Instrumentation} {"J. Res.\ Nat.\ Bur.\ Stand.\ Sect.\ C"}
MACRO {J._Res._Nat._Bur._Stand._Sect._C} {"J. Res.\ Nat.\ Bur.\ Stand.\ Sect.\ C"}

MACRO {Journal_of_Scientific_Instruments} {"J. Sci.\ Instrum.\ "}
MACRO {J._Sci._Instrum.} {"J. Sci.\ Instrum.\ "}

MACRO {Journal_of_Sound_and_Vibration} {"J. Sound Vib.\ "}
MACRO {J._Sound_Vib.} {"J. Sound Vib.\ "}

MACRO {Journal_of_Speech_and_Hearing_Disorders} {"J. Speech Hear.\ Disord.\ "}
MACRO {J._Speech_Hear._Disord.} {"J. Speech Hear.\ Disord.\ "}

MACRO {Journal_of_Speech_and_Hearing_Research} {"J. Speech Hear.\ Res.\ "}
MACRO {J._Speech_Hear._Res.} {"J. Speech Hear.\ Res.\ "}

MACRO {Journal_of_Statistical_Physics} {"J. Stat.\ Phys.\ "}
MACRO {J._Stat._Phys.} {"J. Stat.\ Phys.\ "}

MACRO {Journal_of_the_Acoustical_Society_of_America} {"J. Acoust.\ Soc.\ Am.\ "}
MACRO {J._Acoust._Soc._Am._} {"J. Acoust.\ Soc.\ Am.\ "}

MACRO {Journal_of_the_American_Ceramic_Society} {"J. Am.\ Ceram.\ Soc.\ "}
MACRO {J._Am._Ceram._Soc.} {"J. Am.\ Ceram.\ Soc.\ "}

MACRO {Journal_of_the_American_Chemical_Society} {"J. Am.\ Chem.\ Soc.\ "}
MACRO {J._Am._Chem._Soc.} {"J. Am.\ Chem.\ Soc.\ "}

MACRO {Journal_of_the_American_Institute_of_Electrical_Engineers} {"J. Am.\ Inst.\ Electr.\ Eng.\ "}
MACRO {J._Am._Inst._Electr._Eng.} {"J. Am.\ Inst.\ Electr.\ Eng.\ "}

MACRO {Journal_of_the_Audio_Engineering_Society} {"J. Audio Eng.\ Soc.\ "}
MACRO {J._Audio_Eng._Soc.} {"J. Audio Eng.\ Soc.\ "}

MACRO {Journal_of_the_Chemical_Society} {"J. Chem.\ Soc.\ "}
MACRO {J._Chem._Soc.} {"J. Chem.\ Soc.\ "}

MACRO {Journal_of_the_Electrochemical_Society} {"J. Electrochem.\ Soc.\ "}
MACRO {J._Electrochem._Soc.} {"J. Electrochem.\ Soc.\ "}

MACRO {Journal_of_the_Mechanics_and_Physics_of_Solids} {"J. Mech.\ Phys.\ Solids"}
MACRO {J._Mech._Phys._Solids} {"J. Mech.\ Phys.\ Solids"}

MACRO {Journal_of_the_Optical_Society_of_America} {"J. Opt.\ Soc.\ Am.\ "}
MACRO {J._Opt._Soc._Am.} {"J. Opt.\ Soc.\ Am.\ "}

MACRO {Journal_of_the_Physical_Society_of_Japan} {"J. Phys.\ Soc.\ Jpn.\ "}
MACRO {J._Phys._Soc._Jpn.} {"J. Phys.\ Soc.\ Jpn.\ "}

MACRO {Journal_of_Vacuum_Science_and_Technology} {"J. Vac.\ Sci.\ Technol.\ "}
MACRO {J._Vac._Sci._Technol.} {"J. Vac.\ Sci.\ Technol.\ "}

MACRO {Kolloid_Zeitschrift_&_Zeitschrift_fuer_Polymere} {"Kolloid Z. Z. Polym.\ "}
MACRO {Kolloid_Z._Z._Polym.} {"Kolloid Z. Z. Polym.\ "}

%%Kongelige Danske Videnskabernes Selskab, Matematsik Fysiske Meddelelser
MACRO {Kongelige_Danske_Videnskabernes_Selskab_Matematsik_Fysiske_Meddelelser} {"K. Dan.\ Vidensk.\ Selsk.\ Mat.\ Fys.\ Medd.\ "}
MACRO {K._Dan._Vidensk._Selsk._Mat._Fys._Medd.} {"K. Dan.\ Vidensk.\ Selsk.\ Mat.\ Fys.\ Medd.\ "}

%%Kristallografiya [Soviet Physics---Crystallography]
MACRO {Kristallografiya_Soviet_Physics_Crystallography} {"Kristallografiya [Sov.\ Phys.\ Crystallogr.]"}
MACRO {Kristallografiya_Sov._Phys._Crystallogr.} {"Kristallografiya [Sov.\ Phys.\ Crystallogr.]"}

%%Kvantovaya Elektronika (Moscow) [Soviet Journal of Quantum Electronics]
MACRO {Kvantovaya_Elektronika_Moscow_Soviet_Journal_of_Quantum_Electronics} {"Kvant.\ Elektron.\ (Moscow) [Sov.\ J. Quantum Electron.]"}
MACRO {Kvant._Elektron._Moscow_Sov._J._Quantum_Electron.} {"Kvant.\ Elektron.\ (Moscow) [Sov.\ J. Quantum Electron.]"}

MACRO {Laryngoscope} {"Laryngoscope"}

MACRO {Lettere_al_Nuovo_Cimento} {"Lett.\ Nuovo Cimento"}
MACRO {Lett._Nuovo_Cimento} {"Lett.\ Nuovo Cimento"}

MACRO {Lick_Observatory_Bulletin} {"Lick Obs.\ Bull.\ "}
MACRO {Lick_Obs._Bull.} {"Lick Obs.\ Bull.\ "}

MACRO {Materials_Research_Bulletin} {"Mater.\ Res.\ Bull.\ "}
MACRO {Mater._Res._Bull.} {"Mater.\ Res.\ Bull.\ "}

MACRO {Medical_Physics} {"Med.\ Phys.\ "}
MACRO {Med._Phys.} {"Med.\ Phys.\ "}

MACRO {Memoirs_of_the_Royal_Astronomical_Society} {"Mem.\ R. Astron.\ Soc.\ "}
MACRO {Mem._R._Astron._Soc.} {"Mem.\ R. Astron.\ Soc.\ "}

MACRO {Molecular_Crystals_and_Liquid_Crystals} {"Mol.\ Cryst.\ Liq.\ Cryst.\ "}
MACRO {Mol._Cryst._Liq._Cryst.} {"Mol.\ Cryst.\ Liq.\ Cryst.\ "}

MACRO {Molecular_Physics} {"Mol.\ Phys.\ "}
MACRO {Mol._Phys.} {"Mol.\ Phys.\ "}

MACRO {Monthly_Notices_of_the_Royal_Astronomical_Society} {"Mon.\ Not.\ R. Astron.\ Soc.\ "}
MACRO {Mon._Not._R._Astron._Soc.} {"Mon.\ Not.\ R. Astron.\ Soc.\ "}

%%National Bureau of Standards (U.S.), Circular
MACRO {National_Bureau_of_Standards_U.S._Circular} {"Nat.\ Bur.\ Stand.\ (U.S.) Circ.\ "}
MACRO {Nat._Bur._Stand._U.S._Circ.} {"Nat.\ Bur.\ Stand.\ (U.S.) Circ.\ "}

%%National Bureau of Standards (U.S.), Miscellaeous Publication
MACRO {National_Bureau_of_Standards_U.S._Miscellaeous_Publication} {"Nat.\ Bur.\ Stand.\ (U.S.) Misc.\ Publ.\ "}
MACRO {Nat._Bur._Stand._U.S._Misc._Publ.} {"Nat.\ Bur.\ Stand.\ (U.S.) Misc.\ Publ.\ "}

%%National Bureau of Standards (U.S.), Special Publication
MACRO {National_Bureau_of_Standards_U.S._Special_Publication} {"Nat.\ Bur.\ Stand.\ (U.S.) Spec.\ Publ.\ "}
MACRO {Nat._Bur._Stand._U.S._Spec._Publ.} {"Nat.\ Bur.\ Stand.\ (U.S.) Spec.\ Publ.\ "}

%%Nature
MACRO {Nature} {"Nature"}

%%Nature (London)
MACRO {Nature_London} {"Nature (London)"}

MACRO {Naturwissenschaften} {"Naturwissenschaften"}

%%Nuclear Data, Section A
MACRO {Nuclear_Data_Section_A} {"Nucl.\ Data, Sect.\ A"}
MACRO {Nucl._Data_Sect._A} {"Nucl.\ Data, Sect.\ A"}

%%Nuclear Data, Section B
MACRO {Nuclear_Data_Section_B} {"Nucl.\ Data, Sect.\ B"}
MACRO {Nucl._Data_Sect._B} {"Nucl.\ Data, Sect.\ B"}

MACRO {Nuclear_Fusion} {"Nucl.\ Fusion"}
MACRO {Nucl._Fusion} {"Nucl.\ Fusion"}

MACRO {Nuclear_Instruments} {"Nucl.\ Instrum.\ "}
MACRO {Nucl._Instrum.} {"Nucl.\ Instrum.\ "}

MACRO {Nuclear_Instruments_&_Methods} {"Nucl.\ Instrum.\ Method.\ "}
MACRO {Nucl._Instrum._Method.} {"Nucl.\ Instrum.\ Method.\ "}

MACRO {Nuclear_Physics} {"Nucl.\ Phys.\ "}
MACRO {Nucl._Phys.} {"Nucl.\ Phys.\ "}

MACRO {Nuclear_Physics_A} {"Nucl.\ Phys.\ "}

MACRO {Nuclear_Physics_B} {"Nucl.\ Phys.\ "}

MACRO {Nuclear_Science_and_Engineering} {"Nucl.\ Sci.\ Eng.\ "}
MACRO {Nucl._Sci._Eng.} {"Nucl.\ Sci.\ Eng.\ "}

MACRO {Nukleonik} {"Nukleonik"}

MACRO {Nuovo_Cimento} {"Nuovo Cimento"}

MACRO {Nuovo_Cimento_A} {"Nuovo Cimento"}

MACRO {Nuovo_Cimento_B} {"Nuovo Cimento"}

MACRO {Optica_Acta} {"Opt.\ Acta"}
MACRO {Opt._Acta} {"Opt.\ Acta"}

%%Optics and Spectroscopy (USSR)
MACRO {Optics_and_Spectroscopy_USSR} {"Opt.\ Spectrosc.\ (USSR)"}
MACRO {Opt._Spectrosc._USSR} {"Opt.\ Spectrosc.\ (USSR)"}

MACRO {Optics_Communications} {"Opt.\ Commun.\ "}
MACRO {Opt._Commun.} {"Opt.\ Commun.\ "}

MACRO {Optics_Letters} {"Opt.\ Lett.\ "}
MACRO {Opt._Lett.} {"Opt.\ Lett.\ "}

MACRO {Optics_News} {"Opt.\ News"}
MACRO {Opt._News} {"Opt.\ News"}

%%Optik (Stuttgart)
MACRO {Optik_Stuttgart} {"Optik (Stuttgart)"}

%%Optika i Spectroskopiya [Optics and Spectroscopy (USSR)]
MACRO {Optika_i_Spectroskopiya_Optics_and_Spectroscopy_USSR} {"Opt.\ Spectrosk.\ [Opt.\ Spectrosc.\ (USSR)]"}
MACRO {Opt._Spectrosk._Opt._Spectrosc._USSR} {"Opt.\ Spectrosk.\ [Opt.\ Spectrosc.\ (USSR)]"}

%%Optiko-Mekhanicheskaya Promyshlennost [Soviet Journal of Optical Technology]
MACRO {Optiko-Mekhanicheskaya_Promyshlennost_Soviet_Journal_of_Optical_Technology} {"Opt.-Mekh.\ Prom.\ [Sov.\ J. Opt.\ Technol.]"}
MACRO {Opt.-Mekh._Prom._Sov._J._Opt._Technol.} {"Opt.\ Mekh.\ Prom.\ [Sov.\ J. Opt.\ Technol.]"}

MACRO {Perception_and_Psychophysics} {"Percept.\ Psychophys.\ "}
MACRO {Percept._Psychophys.} {"Percept.\ Psychophys.\ "}

MACRO {Philips_Research_Reports} {"Philips Res.\ Rep.\ "}
MACRO {Philips_Res._Rep.} {"Philips Res.\ Rep.\ "}

MACRO {Philosophical_Magazine} {"Philos.\ Mag.\ "}
MACRO {Philos._Mag.} {"Philos.\ Mag.\ "}

MACRO {Philosophical_Transactions_of_the_Royal_Society_of_London} {"Philos.\ Trans.\ R. Soc.\ London"}
MACRO {Philos._Trans._R._Soc._London} {"Philos.\ Trans.\ R. Soc.\ London"}

%%Philosophical Transactions of the Royal Society of London, Series A: Mathematical and Physical Sciences
MACRO {Philosophical_Transactions_of_the_Royal_Society_of_London_Series_A_Mathematical_and_Physical_Sciences} {"Philos.\ Trans.\ R. Soc.\ London, Ser.\ A"}
MACRO {Philos._Trans._R._Soc._London_Ser._A} {"Philos.\ Trans.\ R. Soc.\ London, Ser.\ A"}

MACRO {Physica_Scripta} {"Phys.\ Scripta"}
MACRO {Phys._Scripta} {"Phys.\ Scripta"}

MACRO {Physical_Review} {"Phys.\ Rev.\ "}
MACRO {Phys._Rev.} {"Phys.\ Rev.\ "}

%%Physical Review A: Atomic, Molecular, and Optical Physics
MACRO {Physical_Review_A_Atomic_Molecular_and_Optical_Physics} {"Phys.\ Rev.\ A"}
MACRO {Physical_Review_A} {"Phys.\ Rev.\ A"}
MACRO {Phys._Rev._A} {"Phys.\ Rev.\ A"}

%%Physical Review B: Solid State
MACRO {Physical_Review_B_Solid_State} {"Phys.\ Rev.\ B"}
MACRO {Physical_Review_B} {"Phys.\ Rev.\ B"}
MACRO {Phys._Rev._B} {"Phys.\ Rev.\ B"}

%%Physical Review C: Nuclear Physics
MACRO {Physical_Review_C_Nuclear_Physics} {"Phys.\ Rev.\ C"}
MACRO {Physical_Review_C} {"Phys.\ Rev.\ C"}
MACRO {Phys._Rev._C} {"Phys.\ Rev.\ C"}

%%Physical Review D: Particles and Fields
MACRO {Physical_Review_D_Particles_and_Fields} {"Phys.\ Rev.\ D"}
MACRO {Physical_Review_D} {"Phys.\ Rev.\ D"}
MACRO {Phys._Rev._D} {"Phys.\ Rev.\ D"}

%%Physical Review E: Statistical Physics, Plasmas, Fluids, and Related Interdisciplinary Topics
MACRO {Physical_Review_E_Statistical_Physics_Plasmas_Fluids_and_Related_Interdisciplinary_Topics} {"Phys.\ Rev.\ E"}
MACRO {Physical_Review_E} {"Phys.\ Rev.\ E"}
MACRO {Phys._Rev._E} {"Phys.\ Rev.\ E"}

MACRO {Physical_Review_Letters} {"Phys.\ Rev.\ Lett.\ "}
MACRO {Phys._Rev._Lett.} {"Phys.\ Rev.\ Lett.\ "}

MACRO {Physica_Status_Solidi} {"Phys.\ Status Solidi"}
MACRO {Phys._Status_Solidi} {"Phys.\ Status Solidi"}

%%Physica Status Solidi A: Applied Research
MACRO {Physica_Status_Solidi_A_Applied_Research} {"Phys.\ Status Solidi A"}
MACRO {Phys._Status_Solidi_A} {"Phys.\ Status Solidi A"}

%%Physica Status Solidi B: Basic Research
MACRO {Physica_Status_Solidi_B_Basic_Research} {"Phys.\ Status Solidi B"}
MACRO {Phys._Status_Solidi_B} {"Phys.\ Status Solidi B"}

%%Physica (Utrecht)
MACRO {Physica_Utrecht} {"Physica (Utrecht)"}

MACRO {Physics_and_Chemistry_of_Solids} {"Phys.\ Chem.\ Solids"}
MACRO {Phys._Chem._Solids} {"Phys.\ Chem.\ Solids"}

MACRO {Physics_Letters} {"Phys.\ Lett.\ "}
MACRO {Phys._Lett.} {"Phys.\ Lett.\ "}

MACRO {Physics_Letters_A} {"Phys.\ Lett.\ A"}
MACRO {Phys._Lett._A} {"Phys.\ Lett.\ A"}

MACRO {Physics_Letters_B} {"Phys.\ Lett.\ B"}
MACRO {Phys._Lett._B} {"Phys.\ Lett.\ B"}

%%Physics (New York)
MACRO {Physics_New_York} {"Physics (N. Y.)"}
MACRO {Physics_N._Y.} {"Physics (N. Y.)"}

MACRO {Physics_of_Fluids} {"Phys.\ Fluids"}
MACRO {Phys._Fluids} {"Phys.\ Fluids"}

%%Physics of Metals and Mettalography (USSR)
MACRO {Physics_of_Metals_and_Mettalography_USSR} {"Phys.\ Met.\ Mettalogr.\ (USSR)"}
MACRO {Phys._Met._Mettalogr._USSR} {"Phys.\ Met.\ Mettalogr.\ (USSR)"}

MACRO {Physics_of_Plasmas} {"Phys.\ Plasmas"}
MACRO {Phys._Plasmas} {"Phys.\ Plasmas"}

MACRO {Physics_Reports} {"Phys.\ Rep.\ "}
MACRO {Phys._Rep.} {"Phys.\ Rep.\ "}

MACRO {Physics_Teacher} {"Phys.\ Teach.\ "}
MACRO {Phys._Teach.} {"Phys.\ Teach.\ "}

MACRO {Physics_Today} {"Phys.\ Today"}
MACRO {Phys._Today} {"Phys.\ Today"}

MACRO {Physikalische_Zeitschrift} {"Phys.\ Z. "}
MACRO {Phys._Z.} {"Phys.\ Z. "}

MACRO {Physikalische_Zeitschrift_der_Sowjetunion} {"Phys.\ Z. Sowjetunion"}
MACRO {Phys._Z._Sowjetunion} {"Phys.\ Z. Sowjetunion"}

MACRO {Physik_der_Kondensierten_Materie} {"Phys.\ Kondens.\ Mater.\ "}
MACRO {Phys._Kondens._Mater.} {"Phys.\ Kondens.\ Mater.\ "}

%%Pis'ma v Astronomicheskii Zhurnal [Soviet Astronomy Letters]
MACRO {Pis_ma_v_Astronomicheskii_Zhurnal_Soviet_Astronomy_Letters} {"Pis'ma Astron.\ Zh.\ [Sov.\ Astron.\ Lett.]"}
MACRO {Pis_ma_Astron._Zh._Sov._Astron._Lett.} {"Pis'ma Astron.\ Zh.\ [Sov.\ Astron.\ Lett.]"}

%%Pis'ma v Zhurnal Eksperimental'noi i Teoreticheskoi Fiziki [JETP Letters]
MACRO {Pis_ma_v_Zhurnal_Eksperimental_noi_i_Teoreticheskoi_Fiziki_JETP_Letters} {"Pis'ma Zh.\ Eksp.\ Teor.\ Fiz.\ [JETP Lett.]"}
MACRO {Pis_ma_Zh._Eksp._Teor._Fiz._JETP_Lett.} {"Pis'ma Zh.\ Eksp.\ Teor.\ Fiz.\ [JETP Lett.]"}

%%Pis'ma v Zhurnal Tekhnicheskoi Fiziki [Soviet Technical Physics Letters]
MACRO {Pis_ma_v_Zhurnal_Tekhnicheskoi_Fiziki_Soviet_Technical_Physics_Letters} {"Pis'ma Zh.\ Tekh.\ Fiz.\ [Sov.\ Tech.\ Phys.\ Lett.]"}
MACRO {Pis_ma_Zh._Tekh._Fiz._Sov._Tech._Phys._Lett.} {"Pis'ma Zh.\ Tekh.\ Fiz.\ [Sov.\ Tech.\ Phys.\ Lett.]"}

MACRO {Planetary_and_Space_Science} {"Planet.\ Space Sci.\ "}
MACRO {Planet._Space_Sci.} {"Planet.\ Space Sci.\ "}

MACRO {Plasma_Physics} {"Plasma Phys.\ "}
MACRO {Plasma_Phys._} {"Plasma Phys.\ "}

MACRO {Plasma_Physics_and_Controlled_Fusion} {"Plasma Phys.\ Control.\ Fusion"}
MACRO {Plasma_Phys._Control._Fusion} {"Plasma Phys.\ Control.\ Fusion"}

%%Pribory i Tekhnika Eksperimenta [Instruments and Experimental Techniques (USSR)]
MACRO {Pribory_i_Tekhnika_Eksperimenta_Instruments_and_Experimental_Techniques_USSR} {"Prib.\ Tekh.\ Eksp.\ [Instrum.\ Exp.\ Tech.\ (USSR)]"}
MACRO {Prib._Tekh._Eksp._Instrum._Exp._Tech._USSR} {"Prib.\ Tekh.\ Eksp.\ [Instrum.\ Exp.\ Tech.\ (USSR)]"}

MACRO {Proceedings_of_the_Cambridge_Philosophical_Society} {"Proc.\ Cambridge Philos.\ Soc.\ "}
MACRO {Proc._Cambridge_Philos._Soc.} {"Proc.\ Cambridge Philos.\ Soc.\ "}

MACRO {Proceedings_of_the_IEEE} {"Proc.\ IEEE"}
MACRO {Proc._IEEE} {"Proc.\ IEEE"}

MACRO {Proceedings_of_the_IRE} {"Proc.\ IRE"}
MACRO {Proc._IRE} {"Proc.\ IRE"}

MACRO {Proceedings_of_the_National_Academy_of_Sciences_of_the_United_States_of_America} {"Proc.\ Nat.\ Acad.\ Sci.\ U. S. A."}
MACRO {Proc._Nat._Acad._Sci._U._S._A.} {"Proc.\ Nat.\ Acad.\ Sci.\ U. S. A."}

%%Proceedings of the Physical Society, London
MACRO {Proceedings_of_the_Physical_Society_London} {"Proc.\ Phys.\ Soc.\ London"}
MACRO {Proc._Phys._Soc._London} {"Proc.\ Phys.\ Soc.\ London"}

%%Proceedings of the Physical Society, London, Section A
MACRO {Proceedings_of_the_Physical_Society_London_Section_A} {"Proc.\ Phys.\ Soc.\ London, Sect.\ A"}
MACRO {Proc._Phys._Soc._London_Sect._A} {"Proc.\ Phys.\ Soc.\ London, Sect.\ A"}

%%Proceedings of the Physical Society, London, Section B
MACRO {Proceedings_of_the_Physical_Society_London_Section_B} {"Proc.\ Phys.\ Soc.\ London, Sect.\ B"}
MACRO {Proc._Phys._Soc._London_Sect._B} {"Proc.\ Phys.\ Soc.\ London, Sect.\ B"}

MACRO {Proceedings_of_the_Royal_Society_of_London} {"Proc.\ R. Soc.\ London"}
MACRO {Proc._R._Soc._London} {"Proc.\ R. Soc.\ London"}

%%Proceedings of the Royal Society of London, Series A: Mathematical and Physical Sciences
MACRO{Proceedings_of_the_Royal_Society_of_London_Series_A_Mathematical_and_Physical_Sciences} {"Proc.\ R. Soc.\ London, Ser.\ A"}
MACRO {Proc._R._Soc._London_Ser._A} {"Proc.\ R. Soc.\ London, Ser.\ A"}

MACRO{Progress_of_Theoretical_Physics} {"Prog.\ Theor.\ Phys.\ "}
MACRO {Prog._Theor._Phys.} {"Prog.\ Theor.\ Phys.\ "}

MACRO {Publications_of_the_Astronomical_Society_of_the_Pacific} {"Publ.\ Astron.\ Soc.\ Pac.\ "}
MACRO {Publ._Astron._Soc._Pac.} {"Publ.\ Astron.\ Soc.\ Pac.\ "}

MACRO {Radiation_Effects} {"Radiat.\ Eff.\ "}
MACRO {Radiat._Eff.} {"Radiat.\ Eff.\ "}

%%Radio Engineering and Electronic Physics (USSR)
MACRO {Radio_Engineering_and_Electronic_Physics_USSR} {"Radio Eng.\ Electron.\ Phys.\ (USSR)"}
MACRO {Radio_Eng._Electron._Phys._USSR} {"Radio Eng.\ Electron.\ Phys.\ (USSR)"}

%%Radio Engineering and Electronics (USSR)
MACRO {Radio_Engineering_and_Electronics_USSR} {"Radio Eng.\ Electron.\ Phys.\ (USSR)"}

MACRO {Radiology} {"Radiology"}

MACRO {Radio_Science} {"Radio Sci.\ "}
MACRO {Radio_Sci.} {"Radio Sci.\ "}

%%Radiotekhnika i Elektronika [Radio Engineering and Electronic Physics (USSR)]
MACRO {Radiotekhnika_i_Elektronika_Radio_Engineering_and_Electronic_Physics_USSR} {"Radiotekh.\ Elektron.\ [Radio Eng.\ Electron.\ Phys.\ (USSR)]"}
MACRO {Radiotekh._Elektron._Radio_Eng._Electron._Phys._USSR} {"Radiotekh.\ Elektron.\ [Radio Eng.\ Electron.\ Phys.\ (USSR)]"}

%%Radiotekhnika i Elektronika [Radio Engineering and Electronics (USSR)]
MACRO {Radiotekhnika_i_Elektronika_Radio_Engineering_and_Electronics_USSR} {"Radiotekh.\ Elektron.\ [Radio Eng.\ Electron.\ Phys.\ (USSR)]"}

MACRO {RCA_Review} {"RCA Rev.\ "}
MACRO {RCA_Rev.} {"RCA Rev.\ "}

MACRO {Reports_on_Progress_in_Physics} {"Rep.\ Prog.\ Phys.\ "}
MACRO {Rep._Prog._Phys.} {"Rep.\ Prog.\ Phys.\ "}

MACRO {Review_of_Scientific_Instruments} {"Rev.\ Sci.\ Instrum.\ "}
MACRO {Rev._Sci._Instrum.} {"Rev.\ Sci.\ Instrum.\ "}

MACRO {Review_of_Modern_Physics} {"Rev.\ Mod.\ Phys.\ "}
MACRO {Rev._Mod._Phys.} {"Rev.\ Mod.\ Phys.\ "}

%%Revue d'Optique, Theorique et Instrumentale
MACRO {Revue_d_Optique_Theorique_et_Instrumentale} {"Rev.\ Opt.\ Theor.\ Instrum.\ "}
MACRO {Rev._Opt._Theor._Instrum.} {"Rev.\ Opt.\ Theor.\ Instrum.\ "}

MACRO {Russian_Journal_of_Physical_Chemistry} {"Russ.\ J. Phys.\ Chem.\ "}
MACRO {Russ._J._Phys._Chem.} {"Russ.\ J. Phys.\ Chem.\ "}

MACRO {Science} {"Science"}

MACRO {Scientific_American} {"Sci.\ Am.\ "}
MACRO {Sci._Am.} {"Sci.\ Am.\ "}

MACRO {Solar_Physics} {"Sol.\ Phys.\ "}
MACRO {Sol._Phys.} {"Sol.\ Phys.\ "}

MACRO {Solid_State_Communications} {"Solid State Commun.\ "}
MACRO {Solid_State_Commun.} {"Solid State Commun.\ "}

MACRO {Solid-State_Electronics} {"Solid-State Electron.\ "}
MACRO {Solid-State_Electron.}{"Solid-State Electron.\ "}

MACRO {Soviet_Astronomy} {"Sov.\ Astron.\ "}
MACRO {Sov._Astron.} {"Sov.\ Astron.\ "}

MACRO {Soviet_Astronomy_Letters} {"Sov.\ Astron.\ Lett.\ "}
MACRO {Sov._Astron._Lett.} {"Sov.\ Astron.\ Lett.\ "}

MACRO {Soviet_Journal_of_Atomic_Energy} {"Sov.\ J. At.\ Energy"}
MACRO {Sov._J._At._Energy} {"Sov.\ J. At.\ Energy"}

MACRO {Soviet_Journal_of_Low_Temperature_Physics} {"Sov.\ J. Low Temp.\ Phys.\ "}
MACRO {Sov._J._Low_Temp._Phys.} {"Sov.\ J. Low Temp.\ Phys.\ "}

MACRO {Soviet_Journal_of_Nuclear_Physics} {"Sov.\ J. Nucl.\ Phys.\ "}
MACRO {Sov._J._Nucl._Phys.} {"Sov.\ J. Nucl.\ Phys.\ "}

MACRO {Soviet_Journal_of_Optical_Technology} {"Sov.\ J. Opt.\ Technol.\ "}
MACRO {Sov._J._Opt._Technol.} {"Sov.\ J. Opt.\ Technol.\ "}

MACRO {Soviet_Journal_of_Particles_and_Nuclei} {"Sov.\ J. Part.\ Nucl.\ "}
MACRO {Sov._J._Part._Nucl.} {"Sov.\ J. Part.\ Nucl.\ "}

MACRO {Soviet_Journal_of_Plasma_Physics} {"Sov.\ J. Plasma Phys.\ "}
MACRO {Sov._J._Plasma_Phys.} {"Sov.\ J. Plasma Phys.\ "}

MACRO {Soviet_Journal_of_Quantum_Electronics} {"Sov.\ J. Quantum Electron.\ "}
MACRO {Sov._J._Quantum_Electron.} {"Sov.\ J. Quantum Electron.\ "}

%%Soviet Physics---Acoustics
MACRO {Soviet_Physics_Acoustics} {"Sov.\ Phys.\ Acoust.\ "}
MACRO {Sov._Phys._Acoust.} {"Sov.\ Phys.\ Acoust.\ "}

%%Soviet Physics---Crystallography

MACRO {Soviet_Physics_Crystallography} {"Sov.\ Phys.\ Crystallogr.\ "}
MACRO {Sov._Phys._Crystallogr.} {"Sov.\ Phys.\ Crystallogr.\ "}

%%Soviet Physics---Doklady
MACRO {Soviet_Physics_Doklady} {"Sov.\ Phys.\ Dokl.\ "}
MACRO {Sov._Phys._Dokl.} {"Sov.\ Phys.\ Dokl.\ "}

%%Soviet Physics---JETP
MACRO {Soviet_Physics_JETP} {"Sov.\ Phys.\ JETP"}
MACRO {Sov._Phys._JETP} {"Sov.\ Phys.\ JETP"}

MACRO {Soviet_Physics_Journal} {"Sov.\ Phys.\ J."}
MACRO {Sov._Phys._J.} {"Sov.\ Phys.\ J."}

%%Soviet Physics---Semiconductors
MACRO {Soviet_Physics_Semiconductors} {"Sov.\ Phys.\ Semicond.\ "}
MACRO {Sov._Phys._Semicond.} {"Sov.\ Phys.\ Semicond.\ "}

%%Soviet Physics---Solid State
MACRO {Soviet_Physics_Solid_State} {"Sov.\ Phys.\ Solid State"}
MACRO {Sov._Phys._Solid_State} {"Sov.\ Phys.\ Solid State"}

%%Soviet Physics---Technical Physics
MACRO {Soviet_Physics_Technical_Physics} {"Sov.\ Phys.\ Tech.\ Phys.\ "}
MACRO {Sov._Phys._Tech._Phys.} {"Sov.\ Phys.\ Tech.\ Phys.\ "}

%%Soviet Physics---Uspekhi
MACRO {Soviet_Physics_Uspekhi} {"Sov.\ Phys.\ Usp.\ "}
MACRO {Sov._Phys._Usp.} {"Sov.\ Phys.\ Usp.\ "}

MACRO {Soviet_Radiophysics} {"Sov.\ Radiophys.\ "}
MACRO {Sov._Radiophys.} {"Sov.\ Radiophys.\ "}

MACRO {Soviet_Technical_Physics_Letters} {"Sov.\ Tech.\ Phys.\ Lett.\ "}
MACRO {Sov._Tech._Phys._Lett.} {"Sov.\ Tech.\ Phys.\ Lett.\ "}

MACRO {Space_Science_Reviews} {"Space Sci.\ Rev.\ "}
MACRO {Space_Sci._Rev.} {"Space Sci.\ Rev.\ "}

MACRO {Spectrochimica_Acta} {"Spectrochim.\ Acta"}
MACRO {Spectrochim._Acta} {"Spectrochim.\ Acta"}

%%Spectrochimica Acta, Part A: Molecular Spectroscopy
MACRO {Spectrochimica_Acta_Part_A_Molecular_Spectroscopy} {"Spectrochim.\ Acta, Part A"}
MACRO {Spectrochim._Acta_Part_A} {"Spectrochim.\ Acta, Part A"}

%%Spectrochimica Acta, Part B: Atomic Spectroscopy
MACRO {Spectrochimica_Acta_Part_B_Atomic_Spectroscopy} {"Spectrochim.\ Acta, Part B"}
MACRO {Spectrochim._Acta_Part_B} {"Spectrochim.\ Acta, Part B"}

MACRO {Surface_Science} {"Surf.\ Sci.\ "}
MACRO {Surf._Sci.} {"Surf.\ Sci.\ "}

%%Teplofizika Vysokikh Temperatur [High Temperature (USSR)]
MACRO {Teplofizika_Vysokikh_Temperatur_High_Temperature_USSR} {"Teplofiz.\ Vys.\ Temp.\ "}
MACRO {Teplofiz._Vys._Temp.} {"Teplofiz.\ Vys.\ Temp.\ "}

MACRO {Tetrahedron} {"Tetrahedron"}

MACRO {Theoretica_Chimica_Acta} {"Theor.\ Chim.\ Acta"}
MACRO {Theor._Chim._Acta} {"Theor.\ Chim.\ Acta"}

MACRO {Thin_Solid_Films} {"Thin Solid Films"}

MACRO {Transactions_of_the_American_Crystallographic_Association} {"Trans.\ Am.\ Crystallogr.\ Assoc.\ "}
MACRO {Trans._Am._Crystallogr._Assoc.} {"Trans.\ Am.\ Crystallogr.\ Assoc.\ "}

MACRO {Transactions_of_the_American_Geophysical_Union} {"Trans.\ Am.\ Geophys.\ Union"}
MACRO {Trans._Am._Geophys._Union} {"Trans.\ Am.\ Geophys.\ Union"}

%%Transactions of the American Institute of Mining, Metallurgical and Petroleum Engineers
MACRO {Transactions_of_the_American_Institute_of_Mining_Metallurgical_and_Petroleum_Engineers} {"Trans.\ Am.\ Inst.\ Min.\ Metall.\ Pet.\ Eng.\ "}
MACRO {Trans._Am._Inst._Min._Metall._Pet._Eng.} {"Trans.\ Am.\ Inst.\ Min.\ Metall.\ Pet.\ Eng.\ "}

MACRO {Transactions_of_the_American_Nuclear_Society} {"Trans.\ Am.\ Nucl.\ Soc.\ "}
MACRO {Trans._Am._Nucl._Soc.} {"Trans.\ Am.\ Nucl.\ Soc.\ "}

MACRO {Transactions_of_the_American_Society_of_Metals} {"Trans.\ Am.\ Soc.\ Met.\ "}
MACRO {Trans._Am._Soc._Met.} {"Trans.\ Am.\ Soc.\ Met.\ "}

MACRO {Transactions_of_the_American_Society_of_Mechanical_Engineers} {"Trans.\ Am.\ Soc.\ Mech.\ Eng.\ "}
MACRO {Trans._Am._Soc._Mech._Eng.} {"Trans.\ Am.\ Soc.\ Mech.\ Eng.\ "}

MACRO {Transactions_of_the_British_Ceramic_Society} {"Trans.\ Br.\ Ceram.\ Soc.\ "}
MACRO {Trans._Br._Ceram._Soc.} {"Trans.\ Br.\ Ceram.\ Soc.\ "}

MACRO {Transactions_of_the_Faraday_Society} {"Trans.\ Faraday Soc.\ "}
MACRO {Trans._Faraday_Soc.} {"Trans.\ Faraday Soc.\ "}

MACRO {Transactions_of_the_Metallurgican_Society_of_AIME} {"Trans.\ Metall.\ Soc.\ AIME"}
MACRO {Trans._Metall._Soc._AIME} {"Trans.\ Metall.\ Soc.\ AIME"}

MACRO {Transactions_of_the_Society_of_Rheology} {"Trans.\ Soc.\ Rheol.\ "}
MACRO {Trans._Soc._Rheol.} {"Trans.\ Soc.\ Rheol.\ "}

MACRO {Ukrainian_Physics_Journal} {"Ukr.\ Phys.\ J."}
MACRO {Ukr._Phys._J.} {"Ukr.\ Phys.\ J."}

%%Ukrainskii Fizicheskii Zhurnal (Russian Edition) [Ukrainian Physics Journal]
MACRO {Ukrainskii_Fizicheskii_Zhurnal_Russian_Edition_Ukrainian_Physics_Journal} {"Ukr.\ Fiz.\ Zh.\ (Russ.\ Ed.) [Ukr.\ Phys.\ J.]"}
MACRO {Ukr._Fiz._Zh._Russ._Ed._Ukr._Phys._J.} {"Ukr.\ Fiz.\ Zh.\ (Russ.\ Ed.) [Ukr.\ Phys.\ J.]"}

MACRO {Ultrasonics} {"Ultrasonics"}

%%Uspekhi Fizicheskikh Nauk [Soviet Physics---Uspekhi]
MACRO {Uspekhi_Fizicheskikh_Nauk_Soviet_Physics_Uspekhi} {"Usp.\ Fiz.\ Nauk [Sov.\ Phys.\ Usp.]"}
MACRO {Usp._Fiz._Nauk_Sov._Phys._Usp.} {"Usp.\ Fiz.\ Nauk [Sov.\ Phys.\ Usp.]"}

%%Wuli Xuebao (Acta Physica Sinica) [Chinese Journal of Physics]
MACRO {Wuli_Xuebao_Acta_Physica_Sinica_Chinese_Journal_of_Physics} {"Wuli Xuebao (Acta Phys.\ Sin.) [Chin.\ J. Phys.]"}
MACRO {Wuli_Xuebao_Acta_Phys._Sin._Chin._J._Phys.} {"Wuli Xuebao (Acta Phys.\ Sin.) [Chin.\ J. Phys.]"}

%%Yadernaya Fizika [Soviet Journal of Nuclear Physics]
MACRO {Yadernaya_Fizika_Soviet_Journal_of_Nuclear_Physics} {"Yad.\ Fiz.\ [Sov.\ J. Nucl.\ Phys.]"}
MACRO {Yad._Fiz._Sov._J._Nucl._Phys.} {"Yad.\ Fiz.\ [Sov.\ J. Nucl.\ Phys.]"}

MACRO {Zeitschrift_fuer_Analytische_Chemie} {"Z. Anal.\ Chem.\ "}
MACRO {Z._Anal._Chem.} {"Z. Anal.\ Chem.\ "}

MACRO {Zeitschrift_fuer_Angewandte_Physik} {"Z. Angew.\ Phys.\ "}
MACRO {Z._Angew._Phys.} {"Z. Angew.\ Phys.\ "}

MACRO {Zeitschrift_fuer_Anorganische_und_Allgemeine_Chemie} {"Z. Anorg.\ Allg.\ Chem.\ "}
MACRO {Z._Anorg._Allg._Chem.} {"Z. Anorg.\ Allg.\ Chem.\ "}

MACRO {Zeitschrift_fuer_Astrophysik} {"Z. Astrophys.\ "}
MACRO {Z._Astrophys.} {"Z. Astrophys.\ "}

MACRO {Zeitschrift_fuer_Elektrochemie} {"Z. Elektrochem.\ "}
MACRO {Z._Elektrochem.} {"Z. Elektrochem.\ "}

%%Zeitschrift fuer Kristallographie, Kristallgeometrie, Kristallphysik, Kristallchemie
MACRO {Zeitschrift_fuer_Kristallographie_Kristallgeometrie_Kristallphysik_Kristallchemie} {"Z. Kristallogr.\ Kristallgeom.\ Kristallphys.\ Kristallchem.\ "}
MACRO {Z._Kristallogr._Kristallgeom._Kristallphys._Kristallchem.} {"Z. Kristallogr.\ Kristallgeom.\ Kristallphys.\ Kristallchem.\ "}

MACRO {Zeitschrift_fuer_Metallkunde} {"Z. Metallkd.\ "}
MACRO {Z._Metallkd.} {"Z. Metallkd.\ "}

MACRO {Zeitschrift_fuer_Naturforschung} {"Z. Naturforsch.\ "}
MACRO {Z._Naturforsch.} {"Z. Naturforsch.\ "}

%%Zeitschrift fuer Naturforschung, Teil A: Physik, Physikalische Chemie, Kosmophysik
MACRO {Zeitschrift_fuer_Naturforschung_Teil_A_Physik_Physikalische_Chemie_Kosmophysik} {"Z. Naturforsch.\ Teil A"}
MACRO {Z._Naturforsch._Teil_A} {"Z. Naturforsch.\ Teil A"}

MACRO {Zeitschift_fuer_Physik} {"Z. Phys.\ "}
MACRO {Z._Phys.} {"Z. Phys.\ "}

%%Zeitschrift fuer Physik A: Atoms and Nuclei
MACRO {Zeitschrift_fuer_Physik_A_Atoms_and_Nuclei} {"Z. Phys.\ A"}
MACRO {Z._Phys._A} {"Z. Phys.\ A"}

%%Zeitschrift fuer Physik B: Condensed Matter and Quanta
MACRO {Zeitschrift_fuer_Physik_B_Condensed_Matter_and_Quanta} {"Z. Phys.\ B"}
MACRO {Z._Phys._B} {"Z. Phys.\ B"}

%%Zeitschrift fuer Physik C: Particles and Fields
MACRO {Zeitschrift_fuer_Physik_C_Particles_and_Fields} {"Z. Phys.\ C"}
MACRO {Z._Phys._C} {"Z. Phys.\ C"}

MACRO {Zeitschrift_fuer_Physikalisch-Chemische_Materialforschung} {"Z. Phys.-Chem.\ Materialforsch.\ "}
MACRO {Z._Phys.-Chem._Materialforsch.} {"Z. Phys.-Chem.\ Materialforsch.\ "}

%%Zeitschrift fuer Physikalische Chemie, Abteilung A: Chemische Thermodynamik, Kinetik, Elektrochemie, Eigenschaftslehre
MACRO {Zeitschrift_fuer_Physikalische_Chemie_Abteilung_A_Chemische_Thermodynamik_Kinetik_Elektrochemie_Eigenschaftslehre} {"Z. Phys.\ Chem.\ Abt.\ A"}
MACRO {Z._Phys._Chem._Abt._A} {"Z. Phys.\ Chem.\ Abt.\ A"}

%%Zeitschrift fuer Physikalische Chemie, Abteilung B: Chemie der Elementarprozesse, Aufbau der Materie
MACRO {Zeitschrift_fuer_Physikalische_Chemie_Abteilung_B_Chemie_der_Elementarprozesse_Aufbau_der_Materie} {"Z. Phys.\ Chem.\ Abt.\ B"}
MACRO {Z._Phys._Chem._Abt._B} {"Z. Phys.\ Chem.\ Abt.\ B"}

%%Zeitschrift fuer Physikalische Chemie (Frankfurt am Main)
MACRO {Zeitschrift_fuer_Physikalische_Chemie_Frankfurt_am_Main} {"Z. Phys.\ Chem.\ (Frankfurt am Main)"}
MACRO {Z._Phys._Chem._Frankfurt_am_Main} {"Z. Phys.\ Chem.\ (Frankfurt am Main)"}

%%Zeitschrift fuer Physikalische Chemie (Leipzig)
MACRO {Zeitschrift_fuer_Physikalische_Chemie_Leipzig} {"Z. Phys.\ Chem.\ (Leipzig)"}
MACRO {Z._Phys._Chem._Leipzig} {"Z. Phys.\ Chem.\ (Leipzig)"}

%%Zhurnal Eksperimental'noi i Teoreticheskoi Fiziki [Soviet Physics---JETP]
MACRO {Zhurnal_Eksperimental_noi_i_Teoreticheskoi_Fiziki_Soviet_Physics_JETP} {"Zh.\ Eksp.\ Teor.\ Fiz.\ [Sov.\ Phys.\ JETP]"}
MACRO {Zh._Eksp._Teor._Fiz._Sov._Phys._JETP} {"Zh.\ Eksp.\ Teor.\ Fiz.\ [Sov.\ Phys.\ JETP]"}

%%Zhurnal Fizicheskoi Khimii [Russian Journal of Physical Chemistry]
MACRO
{Zhurnal_Fizicheskoi_Khimii_Russian_Journal_of_Physical_Chemistry} {"Zh.\ Fiz.\ Khim.\ [Russ.\ J. Phys.\ Chem.]"}
MACRO {Zh._Fiz._Khim._Russ._J._Phys._Chem.} {"Zh.\ Fiz.\ Khim.\ [Russ.\ J. Phys.\ Chem.]"}

%%Zhurnal Prikladnoi Spektroskopii [Journal of Applied Spectroscopy (USSR)]
MACRO {Zhurnal_Prikladnoi_Spektroskopii_Journal_of_Applied_Spectroscopy_USSR} {"Zh.\ Prikl.\ Spektrosk.\ [J. Appl.\ Spectrosc.\ (USSR)]"}
MACRO {Zh._Prikl._Spektrosk._J._Appl._Spectrosc._USSR} {"Zh.\ Prikl.\ Spektrosk.\ [J. Appl.\ Spectrosc.\ (USSR)]"}

%%Zhurnal Tekhnicheskoi Fiziki [Soviet Physics---Technical Physics]
MACRO {Zhurnal_Tekhnicheskoi_Fiziki_Soviet_Physics_Technical_Physics} {"Zh.\ Tekh.\ Fiz.\ [Sov.\ Phys.\ Tech.\ Phys.]"}
MACRO {Zh._Tekh._Fiz._Sov._Phys._Tech._Phys.} {"Zh.\ Tekh.\ Fiz.\ [Sov.\ Phys.\ Tech.\ Phys.]"}
%%Acta Crystallographica, Section A: Crystal Physics, Diffraction, Theoretical and General Crystallography
%%Acta Crystallographica, Section B: Structural Crystallography and Crystal Chemistry
%%Akusticheskii Zhurnal [Soviet Physics---Acoustics]
%%Annalen der Physik (Leipzig)
%%Annales de l'Institut Henri Poincare
%%Annales de l'Institut Henri Poincare, Section A: Physique Theorique
%%Annales de l'Institut Henri Poincare, Section B: Calcul des Probabilites et Statistique
%%Annales de Physique (Paris)
%%Annals of Otology, Rhinology & Laryngology
%%Annals of Physics (New York)
%%Astronomicheskii Zhurnal [Soviet Astronomy]
%%Astrophysical Journal, Letters to the Editor
%%Astrophysical Journal, Supplement Series
%%Atomnaya Energiya [Soviet Journal of Atomic Energy]
%%Bulletin of the Academy of Sciences of the USSR, Physical Series
%%Comptes Rendus Hebdomadaires des Seances de l'Academie des Sciences
%%Comptes Rendus Hebdomadaires des Seances de l'Academie des Sciences,
%% Serie A: Sciences Mathematiques
%%Comptes Rendus Hebdomadaires des Seances de l'Academie des Sciences,
%% Serie B: Sciences Physiques
%%Doklady Akademii Nauk SSSR [Soviet Physics---Doklady]
%%Fizika Elementarnykh Chastits i Atomnogo Yadra [Soviet Journal of Particles and Nuclei]
%%Fizika i Tekhnika Poluprovodnikov [Soviet Physics---Semiconductors]
%%Fizika Metallov i Metallovedenie [Physics of Metals and Metallography (USSR)]
%%Fizika Nizkikh Temperatur [Soviet Journal of Low Temperature Physics]
%%Fizika Plazmy [Soviet Journal of Plasma Physics]
%%Fizika Tverdogo Tela (Leningrad) [Soviet Physics---Solid State]
%%Fizika (Zagreb)
%%High Temperature (USSR)
%%Inorganic Materials (USSR)
%%Instruments and Experimental Techniques (USSR)
%%International Journal of Quantum Chemistry, Part 1
%%International Journal of Quantum Chemistry, Part 2
%%Izvestiya, Academy of Sciences, USSR, Atmospheric and Oceanic Physics
%%Izvestiya, Academy of Sciences, USSR, Physics of the Solid Earth
%%Izvestiya Academii Nauk SSSR, Fizika Atmosfery i Okeana [Izvestiya, Academy of Sciences, USSR, Atmospheric and Oceanic Physics]
%%Izvestiya Akademii Nauk SSSR, Fizika Zemli [Izvestiya, Academy of Sciences, USSR, Physics of the Solid Earth]
%%Izvestiya Akademii Nauk SSSR, Neorganicheskie Materialy [Inorganic Materials (USSR)]
%%Izvestiya Akademii Nauk SSSR, Seriya Fizicheskaya [Bulletin of the Academy of Sciences of the USSR, Physical Series]
%%Izvestiya Vysshikh Uchebnykh Zavedenii, Fizika [Soviet Physics Journal]
%%Izvestiya Vysshikh Uchebnykh Zavedenii, Radiofizika [Soviet Radiophysics]
%%Journal de Physique (Paris)
%%Journal of Applied Spectroscopy (USSR)
%%Journal of Macromolecular Science, [Part B] Physics
%%Journal of Nuclear Energy, Part C: Plasma Physics, Accelerators, Thermonuclear Research
%%Journal of Physics A: General Physics
%%Journal of Physics B: Atomic and Molecular Physics
%%Journal of Physics C: Solid State Physics
%%Journal of Physics D: Applied Physics
%%Journal of Physics E: Scientific Instruments
%%Journal of Physics F: Metal Physics
%%Journal of Physics (Moscow)
%%Journal of Polymer Science, Polymer Letters Edition
%%Journal of Polymer Science, Polymer Physics Edition
%%Journal of Research of the National Bureau of Standards, Section A: Physics and Chemistry
%%Journal of Research of the National Bureau of Standards, Section B: Mathematical Sciences
%%Journal of Research of the National Bureau of Standards, Section C: Engineering and Instrumentation
%%Kongelige Danske Videnskabernes Selskab, Matematsik Fysiske Meddelelser
%%Kristallografiya [Soviet Physics---Crystallography]
%%Kvantovaya Elektronika (Moscow) [Soviet Journal of Quantum Electronics]
%%National Bureau of Standards (U.S.), Circular
%%National Bureau of Standards (U.S.), Miscellaeous Publication
%%National Bureau of Standards (U.S.), Special Publication
%%Nature
%%Nature (London)
%%Nuclear Data, Section A
%%Nuclear Data, Section B
%%Optics and Spectroscopy (USSR)
%%Optik (Stuttgart)
%%Optika i Spectroskopiya [Optics and Spectroscopy (USSR)]
%%Optiko-Mekhanicheskaya Promyshlennost [Soviet Journal of Optical Technology]
%%Philosophical Transactions of the Royal Society of London, Series A: Mathematical and Physical Sciences
%%Physical Review A: Atomic, Molecular, and Optical Physics
%%Physical Review B: Solid State
%%Physical Review C: Nuclear Physics
%%Physical Review D: Particles and Fields
%%Physical Review E: Statistical Physics, Plasmas, Fluids, and Related Interdisciplinary Topics
%%Physica Status Solidi A: Applied Research
%%Physica Status Solidi B: Basic Research
%%Physica (Utrecht)
%%Physics (New York)
%%Physics of Metals and Mettalography (USSR)
%%Pis'ma v Astronomicheskii Zhurnal [Soviet Astronomy Letters]
%%Pis'ma v Zhurnal Eksperimental'noi i Teoreticheskoi Fiziki [JETP Letters]
%%Pis'ma v Zhurnal Tekhnicheskoi Fiziki [Soviet Technical Physics Letters]
%%Pribory i Tekhnika Eksperimenta [Instruments and Experimental Techniques (USSR)]
%%Proceedings of the Physical Society, London
%%Proceedings of the Physical Society, London, Section A
%%Proceedings of the Physical Society, London, Section B
%%Proceedings of the Royal Society of London, Series A: Mathematical and Physical Sciences
%%Radio Engineering and Electronic Physics (USSR)
%%Radio Engineering and Electronics (USSR)
%%Radiotekhnika i Elektronika [Radio Engineering and Electronic Physics (USSR)]
%%Radiotekhnika i Elektronika [Radio Engineering and Electronics (USSR)]
%%Revue d'Optique, Theorique et Instrumentale
%%Soviet Physics---Acoustics
%%Soviet Physics---Crystallography
%%Soviet Physics---Doklady
%%Soviet Physics---JETP
%%Soviet Physics---Semiconductors
%%Soviet Physics---Solid State
%%Soviet Physics---Technical Physics
%%Soviet Physics---Uspekhi
%%Spectrochimica Acta, Part A: Molecular Spectroscopy
%%Spectrochimica Acta, Part B: Atomic Spectroscopy
%%Teplofizika Vysokikh Temperatur [High Temperature (USSR)]
%%Transactions of the American Institute of Mining, Metallurgical and Petroleum Engineers
%%Ukrainskii Fizicheskii Zhurnal (Russian Edition) [Ukrainian Physics Journal]
%%Uspekhi Fizicheskikh Nauk [Soviet Physics---Uspekhi]
%%Wuli Xuebao (Acta Physica Sinica) [Chinese Journal of Physics]
%%Yadernaya Fizika [Soviet Journal of Nuclear Physics]
%%Zeitschrift fuer Kristallographie, Kristallgeometrie, Kristallphysik, Kristallchemie
%%Zeitschrift fuer Naturforschung, Teil A: Physik, Physikalische Chemie, Kosmophysik
%%Zeitschrift fuer Physik A: Atoms and Nuclei
%%Zeitschrift fuer Physik B: Condensed Matter and Quanta
%%Zeitschrift fuer Physik C: Particles and Fields
%%Zeitschrift fuer Physikalische Chemie, Abteilung A: Chemische Thermodynamik, Kinetik, Elektrochemie, Eigenschaftslehre
%%Zeitschrift fuer Physikalische Chemie, Abteilung B: Chemie der Elementarprozesse, Aufbau der Materie
%%Zeitschrift fuer Physikalische Chemie (Frankfurt am Main)
%%Zeitschrift fuer Physikalische Chemie (Leipzig)
%%Zhurnal Eksperimental'noi i Teoreticheskoi Fiziki [Soviet Physics---JETP]
%%Zhurnal Fizicheskoi Khimii [Russian Journal of Physical Chemistry]
%%Zhurnal Prikladnoi Spektroskopii [Journal of Applied Spectroscopy (USSR)]
%%Zhurnal Tekhnicheskoi Fiziki [Soviet Physics---Technical Physics]
 % End of journal definition file


MACRO {acmcs} {"ACM Comput. Surv."}

MACRO {acta} {"Acta Inf."}

MACRO {cacm} {"Commun. ACM"}

MACRO {ibmjrd} {"IBM J. Res. Dev."}

MACRO {ibmsj} {"IBM Syst.~J."}

MACRO {ieeese} {"IEEE Trans. Softw. Eng."}

MACRO {ieeetc} {"IEEE Trans. Comput."}

MACRO {ieeetcad}
 {"IEEE Trans. Comput.-Aided Design Integrated Circuits"}

MACRO {ipl} {"Inf. Process. Lett."}

MACRO {jacm} {"J.~ACM"}

MACRO {jcss} {"J.~Comput. Syst. Sci."}

MACRO {scp} {"Sci. Comput. Programming"}

MACRO {sicomp} {"SIAM J. Comput."}

MACRO {tocs} {"ACM Trans. Comput. Syst."}

MACRO {tods} {"ACM Trans. Database Syst."}

MACRO {tog} {"ACM Trans. Gr."}

MACRO {toms} {"ACM Trans. Math. Softw."}

MACRO {toois} {"ACM Trans. Office Inf. Syst."}

MACRO {toplas} {"ACM Trans. Prog. Lang. Syst."}

MACRO {tcs} {"Theoretical Comput. Sci."}

INTEGERS { nameptr namesleft numnames }

FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{f.~}{vv~}{ll}{, jj}" format.name$ 't :=
      nameptr #1 >
        {
          namesleft #1 >
            { ", " * t * }
            {
              t "others" =
                { " et~al." * }
                { bbl.and space.word * t * }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {format.names.ed}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{f.~}{vv~}{ll}{, jj}"
      format.name$ 't :=
      nameptr #1 >
        {
          namesleft #1 >
            { ", " * t * }
            {
              t "others" =
                { " et~al." * }
                { bbl.and space.word * t * }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {format.authors}
{ author empty$
    { "" }
    {
      author format.names
    }
  if$
}

FUNCTION {format.editors}
{ editor empty$
    { "" }
    {
      editor format.names
      editor num.names$ #1 >
        { ", " * bbl.editors * }
        { ", " * bbl.editor * }
      if$
    }
  if$
}

FUNCTION {format.in.editors}
{ editor empty$
    { "" }
    { editor format.names.ed
    }
  if$
}

FUNCTION {format.note}
{ note empty$
    { "" }
    { note #1 #1 substring$
      duplicate$ "{" =
        'skip$
        { output.state mid.sentence =
          { "l" }
          { "u" }
        if$
        change.case$
        }
      if$
      note #2 global.max$ substring$ *
    }
  if$
}

FUNCTION {format.title}
{ title empty$
    { "" }
    { title "t" change.case$
    }
  if$
}

FUNCTION {output.bibitem}
{ newline$
  "\bibitem{" write$
  cite$ write$
  "}" write$
  newline$
  ""
  before.all 'output.state :=
}

FUNCTION {n.dashify}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-" =
        { t #1 #2 substring$ "--" = not
            { "--" *
              t #2 global.max$ substring$ 't :=
            }
            {   { t #1 #1 substring$ "-" = }
                { "-" *
                  t #2 global.max$ substring$ 't :=
                }
              while$
            }
          if$
        }
        { t #1 #1 substring$ *
          t #2 global.max$ substring$ 't :=
        }
      if$
    }
  while$
}

FUNCTION {word.in}
{ bbl.in
  " " * }

FUNCTION {format.date}
{ year empty$
    { month empty$
        { "" }
        { "there's a month but no year in " cite$ * warning$
          month
        }
      if$
    }
    { month empty$
        'year
        { month " " * year * }
      if$
    }
  if$
  duplicate$ empty$
    'skip$
    {
    before.all 'output.state :=
    " (" swap$ * ")" *
    }
  if$
}

FUNCTION {format.btitle}
{ title emphasize
}

FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
}

FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}

FUNCTION {format.bvolume}
{ volume empty$
    { "" }
    { bbl.volume volume tie.or.space.connect
      series empty$
        'skip$
        { bbl.of space.word * series emphasize * }
      if$
      "volume and number" number either.or.check
    }
  if$
}

FUNCTION {format.number.series}
{ volume empty$
    { number empty$
        { series field.or.null }
        { output.state mid.sentence =
            { bbl.number }
            { bbl.number capitalize }
          if$
          number tie.or.space.connect
          series empty$
            { "there's a number but no series in " cite$ * warning$ }
            { bbl.in space.word * series * }
          if$
        }
      if$
    }
    { "" }
  if$
}

FUNCTION {is.num}
{ chr.to.int$
  duplicate$ "0" chr.to.int$ < not
  swap$ "9" chr.to.int$ > not and
}

FUNCTION {extract.num}
{ duplicate$ 't :=
  "" 's :=
  { t empty$ not }
  { t #1 #1 substring$
    t #2 global.max$ substring$ 't :=
    duplicate$ is.num
      { s swap$ * 's := }
      { pop$ "" 't := }
    if$
  }
  while$
  s empty$
    'skip$
    { pop$ s }
  if$
}

FUNCTION {convert.edition}
{ edition extract.num "l" change.case$ 's :=
  s "first" = s "1" = or
    { bbl.first 't := }
    { s "second" = s "2" = or
        { bbl.second 't := }
        { s "third" = s "3" = or
            { bbl.third 't := }
            { s "fourth" = s "4" = or
                { bbl.fourth 't := }
                { s "fifth" = s "5" = or
                    { bbl.fifth 't := }
                    { s #1 #1 substring$ is.num
                        { s bbl.th * 't := }
                        { edition 't := }
                      if$
                    }
                  if$
                }
              if$
            }
          if$
        }
      if$
    }
  if$
  t
}

FUNCTION {format.edition}
{ edition empty$
    { "" }
    { output.state mid.sentence =
        { convert.edition "l" change.case$ " " * bbl.edition * }
        { convert.edition "t" change.case$ " " * bbl.edition * }
      if$
    }
  if$
}

INTEGERS { multiresult }

FUNCTION {multi.page.check}
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
        { #1 'multiresult := }
        { t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult
}

FUNCTION {format.pages}
{ pages empty$
    { "" }
    { pages multi.page.check
        { bbl.pages pages n.dashify tie.or.space.connect }
        { bbl.page pages tie.or.space.connect }
      if$
    }
  if$
}

FUNCTION {first.page}
{ 't :=
  ""
    {  t empty$ not t #1 #1 substring$ "-" = not and }
    { t #1 #1 substring$ *
      t #2 global.max$ substring$ 't :=
    }
  while$
}

FUNCTION {format.journal.pages}
{
  pages empty$
    'skip$
    { duplicate$ empty$
        { pop$ format.pages }
        { ", " * pages first.page * }
      if$
    }
  if$
}

FUNCTION {format.vol.num.pages}
{ volume field.or.null
  bolden
  format.journal.pages
}

FUNCTION {format.chapter.pages}
{ chapter empty$
    'format.pages
    { type empty$
        { bbl.chapter }
        { type "l" change.case$ }
      if$
      chapter tie.or.space.connect
      pages empty$
        'skip$
        { ", " * format.pages * }
      if$
    }
  if$
}

FUNCTION {format.in.ed.booktitle}
{ booktitle empty$
    { "" }
    { editor empty$
        { word.in booktitle emphasize * }
        { word.in booktitle emphasize *
          ", " *
          bbl.edby
          *
          " " *
          format.in.editors *
        }
      if$
    }
  if$
}

FUNCTION {empty.misc.check}
{ author empty$ title empty$ howpublished empty$
  month empty$ year empty$ note empty$
  and and and and and
    { "all relevant fields are empty in " cite$ * warning$ }
    'skip$
  if$
}

FUNCTION {format.thesis.type}
{ type empty$
    'skip$
    { pop$
      type "t" change.case$
    }
  if$
}

FUNCTION {format.tr.number}
{ type empty$
    { bbl.techrep }
    'type
  if$
  number empty$
    { "t" change.case$ }
    { number tie.or.space.connect }
  if$
}

FUNCTION {format.article.crossref}
{
  key empty$
    { journal empty$
        { "need key or journal for " cite$ * " to crossref " * crossref *
          warning$
          ""
        }
        { word.in journal emphasize * }
      if$
    }
    { word.in key * " " *}
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {format.crossref.editor}
{ editor #1 "{vv~}{ll}" format.name$
  editor num.names$ duplicate$
  #2 >
    { pop$ " et~al." * }
    { #2 <
        'skip$
        { editor #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
            { " et~al." * }
            { bbl.and space.word * editor #2 "{vv~}{ll}" format.name$ * }
          if$
        }
      if$
    }
  if$
}

FUNCTION {format.book.crossref}
{ volume empty$
    { "empty volume in " cite$ * "'s crossref of " * crossref * warning$
      word.in
    }
    { bbl.volume volume tie.or.space.connect
      bbl.of space.word *
    }
  if$
  editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
        { series empty$
            { "need editor, key, or series for " cite$ * " to crossref " *
              crossref * warning$
              "" *
            }
            { series emphasize * }
          if$
        }
        { key * }
      if$
    }
    { format.crossref.editor * }
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {format.incoll.inproc.crossref}
{
  editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
        { booktitle empty$
            { "need editor, key, or booktitle for " cite$ * " to crossref " *
              crossref * warning$
              ""
            }
            { word.in booktitle emphasize * }
          if$
        }
        { word.in key * " " *}
      if$
    }
    { word.in format.crossref.editor * " " *}
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {format.publisher}
{ publisher empty$
    { "empty publisher in " cite$ * warning$ }
    'skip$
  if$
  ""
  year empty$
    { "empty year in " cite$ * warning$ }
    'skip$
  if$
  address empty$ publisher empty$ and
  year empty$ and
    'skip$
    {
      add.blank "(" *
      publisher empty$
        { address empty$
          'skip$
          { address * }
          if$
        }
        { publisher *
          address empty$
            'skip$
            { ", " * address * }
          if$
        }
      if$
      year empty$
        'skip$
        { publisher empty$ address empty$ and
            'skip$
            { ", " * }
          if$
          year *
        }
      if$
      ")" *
    }
  if$
  output
}

FUNCTION {article}
{ output.bibitem
  format.authors "author" output.check
  crossref missing$
    { journal
      "journal" output.check
      add.blank
      format.vol.num.pages output
      format.date "year" output.check
    }
    { format.article.crossref output.nonnull
      format.pages output
    }
  if$
  new.sentence
  format.note output
  fin.entry
}

FUNCTION {book}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check
    }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  format.btitle "title" output.check
  crossref missing$
    { format.bvolume output
      format.number.series output
      format.publisher
    }
    {
      format.book.crossref output.nonnull
      format.date "year" output.check
    }
  if$
  format.edition output
  new.sentence
  format.note output
  fin.entry
}

FUNCTION {booklet}
{ output.bibitem
  format.authors output
  format.title "title" output.check
  howpublished output
  address output
  format.date output
  new.sentence
  format.note output
  fin.entry
}

FUNCTION {inbook}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check
    }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  format.btitle "title" output.check
  crossref missing$
    {
      format.publisher
      format.bvolume output
      format.chapter.pages "chapter and pages" output.check
      format.number.series output
    }
    {
      format.chapter.pages "chapter and pages" output.check
      format.book.crossref output.nonnull
      format.date "year" output.check
    }
  if$
  format.edition output
  new.sentence
  format.note output
  fin.entry
}

FUNCTION {incollection}
{ output.bibitem
  format.authors "author" output.check
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.check
      format.publisher
      format.bvolume output
      format.number.series output
      format.chapter.pages output
      format.edition output
    }
    { format.incoll.inproc.crossref output.nonnull
      format.chapter.pages output
    }
  if$
  new.sentence
  format.note output
  fin.entry
}

FUNCTION {inproceedings}
{ output.bibitem
  format.authors "author" output.check
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.check
      publisher empty$
        { organization output
          address output
          format.date "year" output.check
        }
        { organization output
          format.publisher
        }
      if$
      format.bvolume output
      format.number.series output
      format.pages output
    }
    { format.incoll.inproc.crossref output.nonnull
      format.pages output
    }
  if$
  new.sentence
  format.note output
  fin.entry
}

FUNCTION {conference} { inproceedings }

FUNCTION {manual}
{ output.bibitem
  author empty$
    { organization empty$
        'skip$
        { organization output.nonnull
          address output
        }
      if$
    }
    { format.authors output.nonnull }
  if$
  format.btitle "title" output.check
  author empty$
    { organization empty$
    {
          address output
        }
        'skip$
      if$
    }
    {
      organization output
      address output
    }
  if$
  format.edition output
  format.date output
  new.sentence
  format.note output
  fin.entry
}

FUNCTION {mastersthesis}
{ output.bibitem
  format.authors "author" output.check
  format.btitle "title" output.check
  bbl.mthesis format.thesis.type output.nonnull
  school "school" output.check
  address output
  format.date "year" output.check
  new.sentence
  format.note output
  fin.entry
}

FUNCTION {misc}
{ output.bibitem
  format.authors output
  format.title output
  howpublished output
  format.date output
  new.sentence
  format.note output
  fin.entry
  empty.misc.check
}

FUNCTION {phdthesis}
{ output.bibitem
  format.authors "author" output.check
  format.btitle "title" output.check
  bbl.phdthesis format.thesis.type output.nonnull
  school "school" output.check
  address output
  format.date "year" output.check
  new.sentence
  format.note output
  fin.entry
}

FUNCTION {proceedings}
{ output.bibitem
  editor empty$
    { organization output }
    { format.editors output.nonnull }
  if$
  format.btitle "title" output.check
  format.bvolume output
  format.number.series output
  address empty$
    { editor empty$
        { publisher new.sentence.checka }
        { organization publisher new.sentence.checkb
          organization output
        }
      if$
      publisher output
      format.date "year" output.check
    }
    { address output.nonnull
      format.date "year" output.check
      editor empty$
        'skip$
        { organization output }
      if$
      publisher output
    }
  if$
  new.sentence
  format.note output
  fin.entry
}

FUNCTION {techreport}
{ output.bibitem
  format.authors "author" output.check
  format.title "title" output.check
  format.tr.number output.nonnull
  institution "institution" output.check
  address output
  format.date "year" output.check
  new.sentence
  format.note output
  fin.entry
}

FUNCTION {unpublished}
{ output.bibitem
  format.authors "author" output.check
  format.title "title" output.check
  format.note "note" output.check
  fin.entry
}

FUNCTION {default.type} { misc }

READ

STRINGS { longest.label }

INTEGERS { number.label longest.label.width }

FUNCTION {initialize.longest.label}
{ "" 'longest.label :=
  #1 'number.label :=
  #0 'longest.label.width :=
}

FUNCTION {longest.label.pass}
{ number.label int.to.str$ 'label :=
  number.label #1 + 'number.label :=
  label width$ longest.label.width >
    { label 'longest.label :=
      label width$ 'longest.label.width :=
    }
    'skip$
  if$
}

EXECUTE {initialize.longest.label}

ITERATE {longest.label.pass}

FUNCTION {begin.bib}
{ preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  "\begin{thebibliography}{"  longest.label  * "}" *
  write$ newline$
}

EXECUTE {begin.bib}

EXECUTE {init.state.consts}

ITERATE {call.type$}

FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}

EXECUTE {end.bib}
%% End of customized bst file