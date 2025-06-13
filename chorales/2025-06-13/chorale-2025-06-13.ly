\version "2.24.4"

\header {
  title = "chorale"
}

\paper {
  % Add space for instrument names
  indent = 25\mm
} 

\layout {
  \context {
    \Voice
    \consists "Melody_engraver"
    \override Stem.neutral-direction = #'()
  }
}

global = {
  \key d \major
  \numericTimeSignature
  \time 3/4
  \tempo "Largo"
}

violinI = \relative c'' {
  \global
  % Music follows here.
  \partial 4 a8 d | d4 cis b8 a | a d fis d e4  
  
}

violinII = \relative c'' {
  \global
  % Music follows here.
  
}

viola = \relative c' {
  \global
  % Music follows here.
  
}

cello = \relative c {
  \global
  % Music follows here.
  
}

violinIPart = \new Staff \with {
  instrumentName = "Violin I"
  midiInstrument = "violin"
} \violinI

violinIIPart = \new Staff \with {
  instrumentName = "Violin II"
  midiInstrument = "violin"
} \violinII

violaPart = \new Staff \with {
  instrumentName = "Viola"
  midiInstrument = "viola"
} { \clef alto \viola }

celloPart = \new Staff \with {
  instrumentName = "Cello"
  midiInstrument = "cello"
} { \clef bass \cello }

\score {
  \new StaffGroup <<
    \violinIPart
    \violinIIPart
    \violaPart
    \celloPart
  >>
  \layout { }
  \midi {
    \tempo 4=100
  }
}
