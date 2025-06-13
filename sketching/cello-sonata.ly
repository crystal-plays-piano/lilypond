\version "2.24.4"

\header {
  title = "Sonata in F"
  instrument = "Cello and Piano"
  composer = "crystal mandal"
}

\paper {
  % Add space for instrument names
  indent = 18\mm
}

\layout {
  \context {
    \Voice
    \consists "Melody_engraver"
    \override Stem.neutral-direction = #'()
  }
}

global = {
  \key f \major
  \time 2/2
  \tempo "Largo"
}

cello = \relative c {
  \global
  % Music follows here.
  
  r8 bes8 c des8. f, 16 f
  
}

right = \relative c'' {
  \global
  % Music follows here.
  
}

dynamics = {
  \global
  % Dynamics follow here.
  
}

left = \relative c' {
  \global
  % Music follows here.
  
}

celloPart = \new Staff \with {
  instrumentName = "Cello"
  midiInstrument = "cello"
} { \clef bass \cello }

pianoPart = \new PianoStaff \with {
  instrumentName = "Piano"
} <<
  \new Staff = "right" \with {
    midiInstrument = "acoustic grand"
  } \right
  \new Dynamics \dynamics
  \new Staff = "left" \with {
    midiInstrument = "acoustic grand"
  } { \clef bass \left }
>>

\score {
  <<
    \celloPart
    \pianoPart
  >>
  \layout { }
  \midi {
    \tempo 4=40
  }
}
