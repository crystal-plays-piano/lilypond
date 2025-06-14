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
  \key g \major
  \time 3/4
}

% VOICES FOLLOW HERE

soprano = \relative c' {
  \global
  % Music follows here.
  e16 fis8. g8 d~ 4 | e16 fis8. g8 d~ 4 | 
}

alto = \relative c' {
  \global
  % Music follows here
  c4 b2 | r4 r r
}


tenor = \relative c' {
  \global
  % Music follows here.
  g4 g2 |
}

bass = \relative c {
  \global
  % Music follows here.
  c4 d2 |
}

dynamics = {
  \global
  % Dynamics follow here.
  
}

% SCORE SETUP AND PRINTING

\score {
  \new PianoStaff \with {
    instrumentName = "Piano"
  } <<
    \new Staff = "right" \with {
      midiInstrument = "acoustic grand"
    } << \new Voice = "soprano" {\voiceOne \soprano } 
         \new Voice = "alto" { \voiceTwo \alto}>>
    
    \new Dynamics \dynamics
    \new Staff = "left" \with {
      midiInstrument = "acoustic grand"
    } { \clef bass 
      << \new Voice = "tenor" {\voiceOne \tenor } 
         \new Voice = "bass" { \voiceTwo \bass}>>
}
  >>
  \layout { }
  \midi {
    \tempo 4=100
  }
}
