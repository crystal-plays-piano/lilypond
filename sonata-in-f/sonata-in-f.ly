\version "2.24.4"

\header {
  title = "Sonata in F"
  composer = "Mandal"
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
  \key f \minor
  \time 2/2
  \tempo "Andante"
}

right = \relative c'' {
  \global
  % Music follows here.
  \partial 2 r2 | r4. 
  <des, aes' des>8 \arpeggio | r1 | r1 | 

  
}

dynamics = {
  \global
  % Dynamics follow here.
}

left = \relative c {
  \global
  % Music follows here.
  
  \partial 2 r8 bes c des | 
  des8. f,16 
  <<
    {
      \voiceOne
      f4.\fermata 
    }
    \new Voice {
      \voiceTwo
      r8 
      < f' bes f'> \arpeggio
      < bes des bes'> \arpeggio

    }
  >>
  r8 bes c des | des8. e,16 e4\fermata r8 aes? bes c |  c8. ees,?16 \acciaccatura{ees} bes'8. aes16 g4 e4 c2\fermata r8 c' des ees |  
  ees8. ges16   
}

\score {
  \new PianoStaff \with {
    instrumentName = "Piano"
  } <<
    \new Staff = "right" \with {
      midiInstrument = "acoustic grand"
    } { \clef treble \right }
    \new Dynamics \dynamics
    \new Staff = "left" \with {
      midiInstrument = "acoustic grand"
    } { \clef bass \left }
  >>
  \layout { }
  \midi {
    \tempo 4=48
  }
}
