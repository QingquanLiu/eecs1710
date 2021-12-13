class PitchNameInstrument implements Instrument
{
  Oscil sineOsc, lFOOsc;
  ADSR  adsr;
  PitchNameInstrument( String note, float amplitude )
  {
    float frequency = Frequency.ofPitch( note ).asHz();
    sineOsc = new Oscil( frequency, amplitude, Waves.TRIANGLE );
    adsr = new ADSR( 1.0, 0.01, 0.01, 1.0, 0.02 );
    sineOsc.patch( adsr );
  }
  void noteOn( float dur )
  {
    adsr.patch( out );
    adsr.noteOn();
  }
  void noteOff()
  {
    adsr.noteOff();
    adsr.unpatchAfterRelease( out );
  }
}
