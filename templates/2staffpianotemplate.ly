\version "2.24.4"

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
  \key c \major
  \time 4/4
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

\score {
  \new PianoStaff \with {
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
  \layout { }
  \midi {
    \tempo 4=100
  }
}
