\layout {
%  #(set! paper-alist (cons '("mein Format" . (cons (* 28 cm) (* 20 cm))) paper-alist))
%  #(set-default-paper-size "mein Format")
  indent = #0
  \context {
    \Score
    \remove "Bar_number_engraver"
  }
}
\paper {
 oddFooterMarkup = \markup{ \fill-line{ \line{" "} } }
}
\header{
  title = "Momos Herbstlied"
 
composer = "Text und Melodie: momo und der Singekreis Mitteldeutschland" 
}

Akkorde = \chords { \time 6/8  \set chordNameLowercaseMinor = ##t  \germanChords
 d4:m s2 a2:m s4 c2 s4 f2 s4 
 d2:m s4 a2:m s4 g2 s4 e2 s4
 a2 s4 g2:m s4 f2 s4 e2 s4 
 a2 s4 g4:m s8 f4 s4 s4 d4:m s8 a2 s4
 \time 2/4 
s4 s4
 d1 bes4 f4 g2 c1 a4 a4:7 a4 s
         a s2 d4
}


\score {
\new ChoirStaff <<
      \Akkorde

    \new Staff {
      \new Voice = "melody" {
\relative c' {\key d\minor  \time 6/8
              
        d4.( d4) e16( d) | c4.( c8) r8 c | c4.( c8) r8 c | c4.( c8) r4 |
        d4. d4. | c4. c | b b | b r4. 
        a'4.( a8) bes8 a8 | g8 f4.( f8) f8 | f4. f | e( e)
        a4.( a8) bes8( a8) | g8 f4.( f4) | f4. f | a^\markup { \italic{molto rit.} } r4.   \bar "||"  
 \time 2/4          \tempo \markup {
    \concat { \smaller \general-align #Y #DOWN \note #"4." #1 " = " \smaller \general-align #Y #DOWN \note #"2" #1     }
  }
  r4 a8 a  \repeat volta3 { d,4^\markup { \italic{a tempo} } a'  a4. c8  c8 bes bes a  g4 g8 g 
       c,4 g'  g4. bes8  bes a a g } \alternative {{ a4 a8 a }{a4 r4  a8 a8 d,4 \bar"|."}}
}
      }
    }
    \new Lyrics = "firstVerse" \lyricsto "melody" {
\large \set stanza = #"1." Zimt durch -- weht die sü -- ße  Luft,
               wür -- zig scharf im Ku -- chen -- duft.
               Ich hab ver -- ges -- sen, wie Ho -- nig schmeckt,
               Lin -- den -- zau -- ber drin ver -- steckt.  \set stanza = #"Refrain:"  Je -- der    <<
        { 
               Be -- sen -- strich zieht Schlie -- ren durch die Zeit,
               schau, das Mor -- gen -- licht taucht in das Ne -- bel -- kleid, Zip -- fel -- Gras.	 }
	\new Lyrics = "secondVerse"
        \with { alignBelowContext = #"firstVerse" } {
	  \set associatedVoice = "melody" \large
	  mütz -- en -- kin -- der steh'n im Pfütz -- en -- nass,
              Streu -- obst -- äpf -- el fall'n ins knie -- tief ho -- he 
	}
      >>
       Schu -- he nass.
    }
    \new Voice = "harmony" {
\relative c' {\key d\minor  \time 6/8
a'4.( a4) a8  a4.( a8) r8 a8 | 
g4.( g8) r g | f4.( f8) r4 |
f4. f | e e | d d | e r | 
a4. e4 g8 | f8 d4( d4) d8 | c2( d8) e | gis,4.( gis) |
a4.( a8) bes( cis) | d4. d | c4.( c8) d( e) | e4.^\markup { \italic{molto rit.}} r4.  \bar "||" \break
  \time 2/4 \clef "bass" r2  \repeat volta3{
        d,4^\markup { \italic{a tempo}} a d a d bes'8 a g4 g c, f c f a, a} \alternative {{ a8 a b8 cis }{a4 r4  a8 c8 d4 \bar"|."}} 
 }
    }
       \new Lyrics = "zweite" \lyricsto "harmony" { %\set associatedVoice = "harmony"
\large \set stanza = #"1." Zimt  durch -- weht die sü -- ße  Luft,
               wür -- zig scharf im Ku -- chen -- duft.
               Ich hab ver -- ges -- sen, wie Ho -- nig schmeckt,
               Lin -- den -- zau -- ber drin ver -- steckt.      <<
        { \set stanza = #"Refrain:" 
           Pitsch -- Patsch, Pitsch -- Patsch, Pitsch, Pfütz -- en -- sprin -- gen, 
    Patsch, Pitsch -- Patsch, Pitsch Herbst -- zeit ist so wu -- nder -- schön. Schu -- he nass.	}
	\new Lyrics = "zweiteunten"
        \with { alignBelowContext = #"zweite" } {
	  \set associatedVoice = "harmony" \large schön Pitsch -- Patsch, Pitsch -- Patsch,  Pfütz -- en -- sprin -- gen, 
      Patsch, Pitsch -- Patsch, Pitsch  Herbst ist
	}
      >>
       Schu -- he nass.
    }
        
  >>
}
