import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioInput in;
FFT fft;

int HIST_MAX = 25;
int SPECTRUM_MAX = 200;
int SPECTRUM_H_START = 140;
int SPECTRUM_H_END = 220;
int BAND_MAX = 480;

int history = 0;
int [][] spectrum = new int[SPECTRUM_MAX][HIST_MAX];

void setup()
{
  size(848, 480);
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512);
  fft = new FFT(in.bufferSize(), in.sampleRate());

  noStroke();
  colorMode(HSB, 360, 100, 100, 100);
  frameRate(60);
  background(0);

  // initialize spectrum with 0
  for (int i=0; i<SPECTRUM_MAX; i++)
  {
    for (int j=0; j<HIST_MAX; j++)
    {
      spectrum[i][j] = 0;
    }
  }
}


void draw()
{
  background(0);
  fft.forward(in.mix);
  int h, w;
  w = fft.specSize();
  if( w > SPECTRUM_MAX) w = SPECTRUM_MAX;
  for(int i=0; i<w; i++)
  {
    // draw history
    for (int j=0; j<HIST_MAX; j++)
    {
      h = spectrum[i][j];
      fill(SPECTRUM_H_START+(SPECTRUM_H_END-SPECTRUM_H_START)*i/w, 80, 70, 100/HIST_MAX*2);
      rect(24+i*4, height-h, 3, h);
    }
    // draw current
    h = int(fft.getBand(i) * 10);
    if (h>BAND_MAX) h=BAND_MAX;
    fill(SPECTRUM_H_START+(SPECTRUM_H_END-SPECTRUM_H_START)*i/w, 80, 100, 100);
    rect(24+i*4, height-h, 3, h);
    // add history
    spectrum[i][history] = h;
  }
  history = (history + 1) % HIST_MAX;
}
