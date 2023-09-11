
/*
  used in VLSI23 paper

  ARDUINO MEGA 2560
  CODE to interface MAIN TESTBOARD

  - SPI for VDAC (and IDAC) and ADC
  - AER INTERFACE (no spike limit, no spike storage but is transmited to MATLAB through serial instantly)

  Inspired from: https://github.com/Jones1403/SPI-DAC7611/blob/master/src/SPI-DAC7611.cpp

  digitalWriteFast libraries
  download from github. Sketch -> include library -> add zip

  FASTER AER (16-60us compared to 0.5ms of nov22a.ino)
  - digitalWriteFast
  - buffer then transmit (serial is slow)
  - islew = 1uA 
*/

#include <SPI.h>
#include <EEPROM.h>
//#include <SERIAL.h>
#include <math.h>
#include <digitalWriteFast.h>
#include <eRCaGuy_Timer2_Counter.h>

//#define MAX_SPIKES 800
#define MAX_SPIKES 800

#define MUX_CONFIG_LEFT_SIZE 420 
#define MUX_CONFIG_RIGHT_SIZE 420 
#define MUX_CONFIG_HEM_LEFT_SIZE 24
#define MUX_CONFIG_HEM_RIGHT_SIZE 24
#define HEM_RATIO_LEFT_SIZE 48
#define HEM_RATIO_RIGHT_SIZE 48
#define CAP_ATT_SIZE 2
#define SPKGATEX_SIZE 16
#define SPKGATEY_SIZE 12
#define VMODE_SIZE 1
#define FASTTAU_EN_SIZE 1
#define VRESGATE_AVDD_SIZE 1
#define AER_DIS_SIZE 1


// change pin numbers depending on the header connections

// SPI FOR DAC
int LDACb_DAC = 22; //11;
int CSb_IDAC = 24; //12;
int CSb_ADC = 25; //13;
int RESETb_DAC = 26; //5;
int CSb_VDAC = 28; //10;
int CSb_IDAC_SCALED = 29; //4;
int BUSY = 30; //3;
// AER INTERFACE
const int ADDRX_3 = 31; //9;
const int ADDRX_2 = 32; //2;
const int ADDRX_1 = 33; //8;
const int ADDRX_0 = 34; //1;
const int REQON = 23;//35;
const int REQOFF = 36;
const int ACK_33 = 47; //7;
const int AER_RST_33 = 38; //6;
const int ADDRY_3 = 39; //0;
const int ADDRY_2 = 40; 
const int ADDRY_1 = 41;
const int ADDRY_0 = 42;  
// SERIAL REGISTER
int SHIFT_33 = 43;  
int SCLK_33 = 44;
int SOUT = 45;
int SIN_33 = 46;




int tx_done=0;

// for measuring time in-between frames
unsigned long time0=0;
unsigned long delta_t=0;

int spk_x[MAX_SPIKES]={0};
int spk_y[MAX_SPIKES]={0};
unsigned long spk_times[MAX_SPIKES]={0};
bool spk_polarity[MAX_SPIKES]={0};


bool ackd;


int spk_count;
bool setup_done;
bool first_run;

/*
byte MUX_CONFIG[MUX_CONFIG_SIZE/4] = {0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF};
byte MUX_CONFIG_HEM[MUX_CONFIG_HEM_SIZE/4];
byte HEM_RATIO[HEM_RATIO_SIZE/4];
bool CAP_ATT[CAP_ATT_SIZE];
byte SPKGATE[SPKGATE_SIZE/4];
*/
bool VMODE;
bool AER_DIS;

float Nres_start=4.5;//4.5;//2.77;//5.5;  // careful for N=2 -> negative VREFL!
float lsb_hi= 1/pow(2,Nres_start); //0.05;
float lsb_lo = lsb_hi; //compensate   if 3b no compensation. if 4b, lsb, if 5b, 2lsb, if 5.5b, 2*lsb, if 6b,4*lsb -> for measurements, no lsb skew
float vcm_real=0.25;

void setup() {  


  setup_done=0;

  timer2.setup();

  pinMode(SCLK_33, OUTPUT);
  pinMode(SHIFT_33, OUTPUT);
  pinMode(SIN_33, OUTPUT);

  digitalWrite(SCLK_33,LOW);  
  digitalWrite(SHIFT_33,LOW);    
  digitalWrite(SIN_33,LOW);  

  // tie LDACb to GND
  pinMode(LDACb_DAC,OUTPUT);
  //digitalWrite(LDACb_DAC,LOW); 
  //digitalWrite(LDACb_DAC,HIGH);

  // initialize SPI:
  SPI.begin();   

  // initialize UART
  // maximum baudrate for Arduino IDE
  Serial.begin(2000000);
  Serial.flush();   
  Serial.println("\nMain Testboard Arduino Interface");

  // RESET ALL DAC REGISTER TO ZERO (RESETSEL=0V)
  pinMode(RESETb_DAC,OUTPUT);
  digitalWrite(RESETb_DAC,LOW);
  delayMicroseconds(1);  
  digitalWrite(RESETb_DAC,HIGH);  
  

  Serial.print("LSB_HI=");
  Serial.println(lsb_hi,DEC);
  Serial.print("LSB_LO=");
  Serial.println(lsb_lo,DEC);  

  //dac_setup_1p8("VREFL",0.5); // induce spikes to reset channels    
  //dac_setup_1p8("VREFH",0); // induce spikes to reset channels 

  // will induce spikes at VREFH < 0.25V
  // will induce spikes at VREFL > 0.23V
  if (vcm_real - lsb_lo < 0) {
    dac_setup("VREFL",0);   
    Serial.println("vrefl is negative. changed to zero");
  } else {
    dac_setup("VREFL",vcm_real-lsb_lo);  // !!!!!!!!!!!!!!!!
    //dac_setup_1p8("VREFL",0.5);
  }
  //dac_setup("VREFL",1);  
  dac_setup("VREFH",vcm_real+lsb_hi);    
  //dac_setup("VREFH",0); 
  dac_setup("VPOS_CM",0.25);
  dac_setup("VIL",0); // reset leak cap first
  //dac_setup("VIL",1); // used as GND
  //dac_setup("VIL",0.6);
  dac_setup("ITAIL",0.099); // 100nA (can be set to zero)
  //dac_setup("ITAIL",0); // 1nA (can be set to zero)
  //dac_setup_1p8("ITAIL",0.5); // 100nA (can be set to zero)
  dac_setup("ITH",0); // 0.2nA 
  //dac_setup("ITH",0.01); // 10nA 
  dac_setup("IBLEED",0); // set to >0 if some weird shit happens
  //dac_setup("IBLEED",0.01);
  //dac_setup("ISPKFAST",10);
  //dac_setup("ISPK",10);
  dac_setup("ISPKFAST",0);
  dac_setup("ISPK",0);  
  //dac_setup("ISLEW",0.075);
  //dac_setup_1p8("ISLEW",1);
  dac_setup("ISLEW",0);
  
  // in aer_interface_init, aer_rst is asserted. Hence serial config needs to happen after
  aer_interface_init(); 
  //serial_interface_testmode();



  // get init spiketime (change to when Arduino motor control starts)
  time0 = micros();
  //time0 = timer2.get_micros();

  setup_done=1;




}//end setup

void adc_start() {

  byte data1;
  byte data2;
  uint16_t adc_data;
  float adc_v;

  // rated for 400ns -> 250MHz
  SPISettings settingsB(2500000, MSBFIRST, SPI_MODE0);  
  SPI.beginTransaction(settingsB);     

  pinMode(CSb_ADC, OUTPUT); // The CS_Pin should remain in a high impedance state (INPUT) when it is not in use.    
  digitalWrite(CSb_ADC, LOW); // Activate the CS line (CS is active LOW)

  SPI.transfer(0x86); // ch0, single-ended, internal clk conversion
  data1 = SPI.transfer(0x00);  // get first byte of DOUT
  data2 = SPI.transfer(0x00);  // get next byte
  
  pinMode(CSb_ADC, INPUT); // Set CS_Pin to high impedance to allow pull-up to reset CS to inactive.
  digitalWrite(CSb_ADC, HIGH); // Enable internal pull-up     

  adc_data = (data1 << 8) | data2;
  adc_v = 2.5*adc_data/65536;

  Serial.print("CH0 - POS_TEST_CAMP: ");
  Serial.print(adc_v);
  Serial.println(" V");

  //-----------------------------

  pinMode(CSb_ADC, OUTPUT); // The CS_Pin should remain in a high impedance state (INPUT) when it is not in use.    
  digitalWrite(CSb_ADC, LOW); // Activate the CS line (CS is active LOW)

  SPI.transfer(0x96); // ch1, single-ended, internal clk conversion
  data1 = SPI.transfer(0x00);  // get first byte of DOUT
  data2 = SPI.transfer(0x00);  // get next byte
  
  pinMode(CSb_ADC, INPUT); // Set CS_Pin to high impedance to allow pull-up to reset CS to inactive.
  digitalWrite(CSb_ADC, HIGH); // Enable internal pull-up     

  adc_data = (data1 << 8) | data2;
  adc_v = 2.5*adc_data/65536;

  Serial.print("CH1 - HEM_OUT_I2V: ");
  Serial.print(adc_v);
  Serial.println(" V");  

  //-----------------------------

  pinMode(CSb_ADC, OUTPUT); // The CS_Pin should remain in a high impedance state (INPUT) when it is not in use.    
  digitalWrite(CSb_ADC, LOW); // Activate the CS line (CS is active LOW)

  SPI.transfer(0xA6); // ch2, single-ended, internal clk conversion
  data1 = SPI.transfer(0x00);  // get first byte of DOUT
  data2 = SPI.transfer(0x00);  // get next byte
  
  pinMode(CSb_ADC, INPUT); // Set CS_Pin to high impedance to allow pull-up to reset CS to inactive.
  digitalWrite(CSb_ADC, HIGH); // Enable internal pull-up     

  adc_data = (data1 << 8) | data2;
  adc_v = 2.5*adc_data/65536;

  Serial.print("CH2 - TSENSE: ");
  Serial.print(adc_v);
  Serial.println(" V");    

  //-----------------------------

  pinMode(CSb_ADC, OUTPUT); // The CS_Pin should remain in a high impedance state (INPUT) when it is not in use.    
  digitalWrite(CSb_ADC, LOW); // Activate the CS line (CS is active LOW)

  SPI.transfer(0xB6); // ch3, single-ended, internal clk conversion
  data1 = SPI.transfer(0x00);  // get first byte of DOUT
  data2 = SPI.transfer(0x00);  // get next byte
  
  pinMode(CSb_ADC, INPUT); // Set CS_Pin to high impedance to allow pull-up to reset CS to inactive.
  digitalWrite(CSb_ADC, HIGH); // Enable internal pull-up     

  adc_data = (data1 << 8) | data2;
  adc_v = 2.5*adc_data/65536;

  Serial.print("CH3 - VPOS_AFE: ");
  Serial.print(adc_v);
  Serial.println(" V");    

  //-----------------------------

  pinMode(CSb_ADC, OUTPUT); // The CS_Pin should remain in a high impedance state (INPUT) when it is not in use.    
  digitalWrite(CSb_ADC, LOW); // Activate the CS line (CS is active LOW)

  SPI.transfer(0xC6); // ch4, single-ended, internal clk conversion
  data1 = SPI.transfer(0x00);  // get first byte of DOUT
  data2 = SPI.transfer(0x00);  // get next byte
  
  pinMode(CSb_ADC, INPUT); // Set CS_Pin to high impedance to allow pull-up to reset CS to inactive.
  digitalWrite(CSb_ADC, HIGH); // Enable internal pull-up     

  adc_data = (data1 << 8) | data2;
  adc_v = 2.5*adc_data/65536;

  Serial.print("CH4 - VREF_2P5V: ");
  Serial.print(adc_v);
  Serial.println(" V");  

  //-----------------------------

  pinMode(CSb_ADC, OUTPUT); // The CS_Pin should remain in a high impedance state (INPUT) when it is not in use.    
  digitalWrite(CSb_ADC, LOW); // Activate the CS line (CS is active LOW)

  SPI.transfer(0xD6); // ch5, single-ended, internal clk conversion
  data1 = SPI.transfer(0x00);  // get first byte of DOUT
  data2 = SPI.transfer(0x00);  // get next byte
  
  pinMode(CSb_ADC, INPUT); // Set CS_Pin to high impedance to allow pull-up to reset CS to inactive.
  digitalWrite(CSb_ADC, HIGH); // Enable internal pull-up     

  adc_data = (data1 << 8) | data2;
  adc_v = 2.5*adc_data/65536;

  Serial.print("CH5 - VREF_2P5V: ");
  Serial.print(adc_v);
  Serial.println(" V");  

  SPI.endTransaction();
}


//void dac_setup(char *WHICH_DAC, int WHICH_CH, float DAC_VAL) {
void dac_setup(char *PARAM, float DAC_VAL) {
  // DAC_VAL: unit V if VDAC
  //.         unit uA if IDAC

  uint8_t data1;
  uint8_t data2;
  uint16_t  msb;
  uint16_t dac_code;
  char *WHICH_DAC;
  byte WHICH_CH;

  if (PARAM=="VREFL") {
    WHICH_DAC = "VDAC";
    WHICH_CH = 3;
    dac_code = round(DAC_VAL*4095/2.5);    
    Serial.print("DAC_CODE for VREFL: ");
    Serial.println(dac_code,DEC);    
  } else if (PARAM=="VREFH") {
    WHICH_DAC = "VDAC";
    WHICH_CH = 2;
    dac_code = round(DAC_VAL*4095/2.5);    
    Serial.print("DAC_CODE for VREFH: ");
    Serial.println(dac_code,DEC);    
  } else if (PARAM=="VPOS_CM") {
    WHICH_DAC = "VDAC";
    WHICH_CH = 1;
    dac_code = round(DAC_VAL*4095/2.5); 
    Serial.print("DAC_CODE for VPOS_CM: ");
    Serial.println(dac_code,DEC);      
  } else if (PARAM=="VIL") {
    WHICH_DAC = "VDAC";
    WHICH_CH = 0;
    dac_code = round(DAC_VAL*4095/2.5);   
    Serial.print("DAC_CODE for VIL: ");
    Serial.println(dac_code,DEC);        
  } else if (PARAM=="ITAIL") {
    WHICH_DAC = "IDAC_SCALED";
    WHICH_CH = 2;
    dac_code = round(4095*(1-DAC_VAL*0.000001*1000*10000/2.5));        // uA * 1000 scalefactor * 10kohm  
    Serial.print("DAC_CODE for ITAIL: ");
    Serial.println(dac_code,DEC);
  } else if (PARAM=="ITH") {
    WHICH_DAC = "IDAC_SCALED";
    WHICH_CH = 1;
    //dac_code = round(DAC_VAL*0.000001*1000*10000*4095/2.5);        // uA * 1000 scalefactor * 10kohm   
    dac_code = round(4095*(1-DAC_VAL*0.000001*1000*10000/2.5));        // uA * 1000 scalefactor * 10kohm     
    Serial.print("DAC_CODE for ITH: ");
    Serial.println(dac_code,DEC);       
  } else if (PARAM=="IBLEED") {
    WHICH_DAC = "IDAC_SCALED";
    WHICH_CH = 0;
    //dac_code = round(DAC_VAL*0.000001*1000*10000*4095/2.5);        // uA * 1000 scalefactor * 10kohm   
    dac_code = round(4095*(1-DAC_VAL*0.000001*1000*10000/2.5));        // uA * 1000 scalefactor * 10kohm     
    Serial.print("DAC_CODE for IBLEED: ");
    Serial.println(dac_code,DEC);      
  } else if (PARAM=="ISPKFAST") {
    WHICH_DAC = "IDAC";
    WHICH_CH = 2;
    dac_code = round(4095*(1-DAC_VAL*0.000001*10000/2.5));        // uA * 10kohm
    Serial.print("DAC_CODE for ISPKFAST: ");
    Serial.println(dac_code,DEC);      
  } else if (PARAM=="ISPK") {
    WHICH_DAC = "IDAC";
    WHICH_CH = 1;
    dac_code = round(4095*(1-DAC_VAL*0.000001*10000/2.5));    // uA * 10kohm
    Serial.print("DAC_CODE for ISPK: ");
    Serial.println(dac_code,DEC);      
  } else if (PARAM=="ISLEW") {
    WHICH_DAC = "IDAC";
    WHICH_CH = 0;
    dac_code = round(4095*(1-DAC_VAL*0.000001*25000/2.5));    // uA * 25kohm
    Serial.print("DAC_CODE for ISLEW: ");
    Serial.println(dac_code,DEC);      
  }

  // set up the speed, data order and data mode
  // DAC7614 DAC is rated for 1/25ns = 40MHz
  //SPISettings settingsA(10000000, MSBFIRST, SPI_MODE3);  
  SPISettings settingsA(1000000, MSBFIRST, SPI_MODE3); 
  SPI.beginTransaction(settingsA);       

  // REMOVE!!!
  //dac_code=2048;
  msb = dac_code & 0x0F00;
  msb = msb >> 8;

  data1 = 0;
  data1 = (WHICH_CH << 6) | msb;
  data2 = dac_code & 0xFF;

  Serial.print("data1: ");
  Serial.println(data1,HEX);
  Serial.print("data2: ");
  Serial.println(data2,HEX);


  if (WHICH_DAC=="VDAC") {

    digitalWrite(LDACb_DAC,HIGH);
    pinMode(CSb_VDAC, OUTPUT); // The CS_Pin should remain in a high impedance state (INPUT) when it is not in use.    
    digitalWrite(CSb_VDAC, LOW); // Activate the CS line (CS is active LOW)

    SPI.transfer(data1); 
    SPI.transfer(data2);     

    pinMode(CSb_VDAC, INPUT); // Set CS_Pin to high impedance to allow pull-up to reset CS to inactive.
    digitalWrite(CSb_VDAC, HIGH); // Enable internal pull-up     

    digitalWrite(LDACb_DAC,LOW);

    //digitalWrite(LDACb_DAC,LOW);
    //delayMicroseconds(1);
    //digitalWrite(LDACb_DAC,HIGH);
    SPI.endTransaction();
    Serial.println("VDAC setup done");

  } else if (WHICH_DAC=="IDAC") {

    digitalWrite(LDACb_DAC,HIGH);
    pinMode(CSb_IDAC, OUTPUT); // The CS_Pin should remain in a high impedance state (INPUT) when it is not in use.    
    digitalWrite(CSb_IDAC, LOW); // Activate the CS line (CS is active LOW)

    SPI.transfer(data1); 
    SPI.transfer(data2);     

    pinMode(CSb_IDAC, INPUT); // Set CS_Pin to high impedance to allow pull-up to reset CS to inactive.
    digitalWrite(CSb_IDAC, HIGH); // Enable internal pull-up     

    digitalWrite(LDACb_DAC,LOW);
    //digitalWrite(LDACb_DAC,LOW);
    //delayMicroseconds(1);
    //digitalWrite(LDACb_DAC,HIGH);    
    SPI.endTransaction();
    Serial.println("IDAC setup done");    
  } else if (WHICH_DAC=="IDAC_SCALED") {

    digitalWrite(LDACb_DAC,HIGH);      

    pinMode(CSb_IDAC_SCALED, OUTPUT); // The CS_Pin should remain in a high impedance state (INPUT) when it is not in use.    
    digitalWrite(CSb_IDAC_SCALED, LOW); // Activate the CS line (CS is active LOW)

    SPI.transfer(data1); 
    SPI.transfer(data2);     

    pinMode(CSb_IDAC_SCALED, INPUT); // Set CS_Pin to high impedance to allow pull-up to reset CS to inactive.
    digitalWrite(CSb_IDAC_SCALED, HIGH); // Enable internal pull-up   

    digitalWrite(LDACb_DAC,LOW);
    //digitalWrite(LDACb_DAC,LOW);
    //delayMicroseconds(1);
    //digitalWrite(LDACb_DAC,HIGH);      
    SPI.endTransaction();
    Serial.println("IDAC_SCALED setup done");    
  }



}


//void dac_setup(char *WHICH_DAC, int WHICH_CH, float DAC_VAL) {
void dac_setup_1p8(char *PARAM, float DAC_VAL) {
  // DAC_VAL: unit V if VDAC
  //.         unit uA if IDAC

  uint8_t data1;
  uint8_t data2;
  uint16_t  msb;
  uint16_t dac_code;
  char *WHICH_DAC;
  byte WHICH_CH;

  if (PARAM=="VREFL") {
    WHICH_DAC = "VDAC";
    WHICH_CH = 3;
    dac_code = round(DAC_VAL*4095/1.8);    
    Serial.print("DAC_CODE for VREFL: ");
    Serial.println(dac_code,DEC);    
  } else if (PARAM=="VREFH") {
    WHICH_DAC = "VDAC";
    WHICH_CH = 2;
    dac_code = round(DAC_VAL*4095/1.8);    
    Serial.print("DAC_CODE for VREFH: ");
    Serial.println(dac_code,DEC);    
  } else if (PARAM=="VPOS_CM") {
    WHICH_DAC = "VDAC";
    WHICH_CH = 1;
    dac_code = round(DAC_VAL*4095/1.8); 
    Serial.print("DAC_CODE for VPOS_CM: ");
    Serial.println(dac_code,DEC);      
  } else if (PARAM=="VIL") {
    WHICH_DAC = "VDAC";
    WHICH_CH = 0;
    dac_code = round(DAC_VAL*4095/1.8);   
    Serial.print("DAC_CODE for VIL: ");
    Serial.println(dac_code,DEC);        
  } else if (PARAM=="ITAIL") {
    WHICH_DAC = "IDAC_SCALED";
    WHICH_CH = 2;
    dac_code = round(4095*(1-DAC_VAL*0.000001*1000*10000/1.8));        // uA * 1000 scalefactor * 10kohm  
    Serial.print("DAC_CODE for ITAIL: ");
    Serial.println(dac_code,DEC);
  } else if (PARAM=="ITH") {
    WHICH_DAC = "IDAC_SCALED";
    WHICH_CH = 1;
    //dac_code = round(DAC_VAL*0.000001*1000*10000*4095/2.5);        // uA * 1000 scalefactor * 10kohm   
    dac_code = round(4095*(1-DAC_VAL*0.000001*1000*10000/1.8));        // uA * 1000 scalefactor * 10kohm     
    Serial.print("DAC_CODE for ITH: ");
    Serial.println(dac_code,DEC);       
  } else if (PARAM=="IBLEED") {
    WHICH_DAC = "IDAC_SCALED";
    WHICH_CH = 0;
    //dac_code = round(DAC_VAL*0.000001*1000*10000*4095/2.5);        // uA * 1000 scalefactor * 10kohm   
    dac_code = round(4095*(1-DAC_VAL*0.000001*1000*10000/1.8));        // uA * 1000 scalefactor * 10kohm     
    Serial.print("DAC_CODE for IBLEED: ");
    Serial.println(dac_code,DEC);      
  } else if (PARAM=="ISPKFAST") {
    WHICH_DAC = "IDAC";
    WHICH_CH = 2;
    dac_code = round(4095*(1-DAC_VAL*0.000001*10000/1.8));        // uA * 10kohm
    Serial.print("DAC_CODE for ISPKFAST: ");
    Serial.println(dac_code,DEC);      
  } else if (PARAM=="ISPK") {
    WHICH_DAC = "IDAC";
    WHICH_CH = 1;
    dac_code = round(4095*(1-DAC_VAL*0.000001*10000/1.8));    // uA * 10kohm
    Serial.print("DAC_CODE for ISPK: ");
    Serial.println(dac_code,DEC);      
  } else if (PARAM=="ISLEW") {
    WHICH_DAC = "IDAC";
    WHICH_CH = 0;
    dac_code = round(4095*(1-DAC_VAL*0.000001*25000/1.8));    // uA * 25kohm
    Serial.print("DAC_CODE for ISLEW: ");
    Serial.println(dac_code,DEC);      
  }

  // set up the speed, data order and data mode
  // DAC7614 DAC is rated for 1/25ns = 40MHz
  //SPISettings settingsA(10000000, MSBFIRST, SPI_MODE3);  
  SPISettings settingsA(1000000, MSBFIRST, SPI_MODE3); 
  SPI.beginTransaction(settingsA);       

  // REMOVE!!!
  //dac_code=2048;
  msb = dac_code & 0x0F00;
  msb = msb >> 8;

  data1 = 0;
  data1 = (WHICH_CH << 6) | msb;
  data2 = dac_code & 0xFF;

  Serial.print("data1: ");
  Serial.println(data1,HEX);
  Serial.print("data2: ");
  Serial.println(data2,HEX);


  if (WHICH_DAC=="VDAC") {

    digitalWrite(LDACb_DAC,HIGH);
    pinMode(CSb_VDAC, OUTPUT); // The CS_Pin should remain in a high impedance state (INPUT) when it is not in use.    
    digitalWrite(CSb_VDAC, LOW); // Activate the CS line (CS is active LOW)

    SPI.transfer(data1); 
    SPI.transfer(data2);     

    pinMode(CSb_VDAC, INPUT); // Set CS_Pin to high impedance to allow pull-up to reset CS to inactive.
    digitalWrite(CSb_VDAC, HIGH); // Enable internal pull-up     

    digitalWrite(LDACb_DAC,LOW);

    //digitalWrite(LDACb_DAC,LOW);
    //delayMicroseconds(1);
    //digitalWrite(LDACb_DAC,HIGH);
    SPI.endTransaction();
    Serial.println("VDAC setup done");

  } else if (WHICH_DAC=="IDAC") {

    digitalWrite(LDACb_DAC,HIGH);
    pinMode(CSb_IDAC, OUTPUT); // The CS_Pin should remain in a high impedance state (INPUT) when it is not in use.    
    digitalWrite(CSb_IDAC, LOW); // Activate the CS line (CS is active LOW)

    SPI.transfer(data1); 
    SPI.transfer(data2);     

    pinMode(CSb_IDAC, INPUT); // Set CS_Pin to high impedance to allow pull-up to reset CS to inactive.
    digitalWrite(CSb_IDAC, HIGH); // Enable internal pull-up     

    digitalWrite(LDACb_DAC,LOW);
    //digitalWrite(LDACb_DAC,LOW);
    //delayMicroseconds(1);
    //digitalWrite(LDACb_DAC,HIGH);    
    SPI.endTransaction();
    Serial.println("IDAC setup done");    
  } else if (WHICH_DAC=="IDAC_SCALED") {

    digitalWrite(LDACb_DAC,HIGH);      

    pinMode(CSb_IDAC_SCALED, OUTPUT); // The CS_Pin should remain in a high impedance state (INPUT) when it is not in use.    
    digitalWrite(CSb_IDAC_SCALED, LOW); // Activate the CS line (CS is active LOW)

    SPI.transfer(data1); 
    SPI.transfer(data2);     

    pinMode(CSb_IDAC_SCALED, INPUT); // Set CS_Pin to high impedance to allow pull-up to reset CS to inactive.
    digitalWrite(CSb_IDAC_SCALED, HIGH); // Enable internal pull-up   

    digitalWrite(LDACb_DAC,LOW);
    //digitalWrite(LDACb_DAC,LOW);
    //delayMicroseconds(1);
    //digitalWrite(LDACb_DAC,HIGH);      
    SPI.endTransaction();
    Serial.println("IDAC_SCALED setup done");    
  }



}

void serial_interface_testmode() {
  int i;
  unsigned int clkperiod_us = 2000;
  int sout8;

  pinMode(SCLK_33, OUTPUT);
  pinMode(SHIFT_33, OUTPUT);
  pinMode(SOUT, INPUT);
  pinMode(SIN_33, OUTPUT);

  //pinMode(AER_RST_33, OUTPUT);  
  
  // AER reset also resets serial reg
  //digitalWrite(AER_RST_33, HIGH);
  //delayMicroseconds(10);
  //digitalWrite(AER_RST_33, LOW);




  // right 1 bit for SOUT
  /*for(i=0; i<1; i++) {
    digitalWrite(SCLK_33, LOW);
    digitalWrite(SIN_33, HIGH);    
    delayMicroseconds(clkperiod_us/2);
    digitalWrite(SCLK_33, HIGH);

    sout8 = digitalRead(SOUT);
    delayMicroseconds(clkperiod_us/2);
    Serial.print(sout8);
  }
  */
  digitalWrite(SHIFT_33, HIGH);
  digitalWrite(SCLK_33, LOW);  
  delayMicroseconds(100);

  for(i=0; i<HEM_RATIO_LEFT_SIZE; i++) {


    digitalWrite(SCLK_33, LOW);
    digitalWrite(SIN_33, LOW);    
    delayMicroseconds(clkperiod_us/2);
    digitalWrite(SCLK_33, HIGH);

    //sout8 = digitalRead(SOUT);
    delayMicroseconds(clkperiod_us/2);
    //Serial.print(sout8);
  }

  for(i=0; i<MUX_CONFIG_HEM_LEFT_SIZE; i++) {
    digitalWrite(SCLK_33, LOW);
    digitalWrite(SIN_33, LOW);    
    delayMicroseconds(clkperiod_us/2);
    digitalWrite(SCLK_33, HIGH);
    
    //sout8 = digitalRead(SOUT);
    delayMicroseconds(clkperiod_us/2);
    //Serial.print(sout8);
  }


  for(i=0; i<MUX_CONFIG_LEFT_SIZE; i++) {
    digitalWrite(SCLK_33, LOW);
    //digitalWrite(SIN_33, HIGH);  
    digitalWrite(SIN_33, LOW);      
    delayMicroseconds(clkperiod_us/2);
    digitalWrite(SCLK_33, HIGH);
    
    //sout8 = digitalRead(SOUT);
    delayMicroseconds(clkperiod_us/2);
    //Serial.print(sout8);
  }  

  for(i=0; i<MUX_CONFIG_RIGHT_SIZE; i++) {
    digitalWrite(SCLK_33, LOW);
    //digitalWrite(SIN_33, HIGH);    
    digitalWrite(SIN_33, LOW);  
    delayMicroseconds(clkperiod_us/2);
    digitalWrite(SCLK_33, HIGH);
    
    //sout8 = digitalRead(SOUT);
    delayMicroseconds(clkperiod_us/2);
    //Serial.print(sout8);
  }    

  for(i=0; i<MUX_CONFIG_HEM_RIGHT_SIZE; i++) {
    digitalWrite(SCLK_33, LOW);
    digitalWrite(SIN_33, LOW);    
    delayMicroseconds(clkperiod_us/2);
    digitalWrite(SCLK_33, HIGH);
    
    //sout8 = digitalRead(SOUT);
    delayMicroseconds(clkperiod_us/2);
    //Serial.print(sout8);
  }

  for(i=0; i<HEM_RATIO_RIGHT_SIZE; i++) {
    digitalWrite(SCLK_33, LOW);
    digitalWrite(SIN_33, LOW);    
    delayMicroseconds(clkperiod_us/2);
    digitalWrite(SCLK_33, HIGH);
    
    //sout8 = digitalRead(SOUT);
    delayMicroseconds(clkperiod_us/2);
    //Serial.print(sout8);
  }  
     
  for(i=0; i<5; i++) {
    digitalWrite(SCLK_33, LOW);
    //digitalWrite(SIN_33, LOW);  
    digitalWrite(SIN_33, HIGH);       
    delayMicroseconds(clkperiod_us/2);
    digitalWrite(SCLK_33, HIGH);
    
    //sout8 = digitalRead(SOUT);
    delayMicroseconds(clkperiod_us/2);
    //Serial.print(sout8);
  }  

  for(i=0; i<SPKGATEY_SIZE-5; i++) {
    digitalWrite(SCLK_33, LOW);
    digitalWrite(SIN_33, LOW);  
    //digitalWrite(SIN_33, HIGH);       
    delayMicroseconds(clkperiod_us/2);
    digitalWrite(SCLK_33, HIGH);
    
    //sout8 = digitalRead(SOUT);
    delayMicroseconds(clkperiod_us/2);
    //Serial.print(sout8);
  }  


  for(i=0; i<SPKGATEX_SIZE; i++) {
    digitalWrite(SCLK_33, LOW);
    digitalWrite(SIN_33, LOW);    
    //digitalWrite(SIN_33, HIGH);  
    delayMicroseconds(clkperiod_us/2);
    digitalWrite(SCLK_33, HIGH);
    
    //sout8 = digitalRead(SOUT);
    delayMicroseconds(clkperiod_us/2);
    //Serial.print(sout8);
  }    


  for(i=0; i<FASTTAU_EN_SIZE; i++) {
    digitalWrite(SCLK_33, LOW);
    digitalWrite(SIN_33, LOW);    
    delayMicroseconds(clkperiod_us/2);
    digitalWrite(SCLK_33, HIGH);
    
    //sout8 = digitalRead(SOUT);
    delayMicroseconds(clkperiod_us/2);
    //Serial.print(sout8);
  }  

  for(i=0; i<VRESGATE_AVDD_SIZE; i++) {
    digitalWrite(SCLK_33, LOW);
    digitalWrite(SIN_33, LOW);    
    delayMicroseconds(clkperiod_us/2);
    digitalWrite(SCLK_33, HIGH);
    
    //sout8 = digitalRead(SOUT);
    delayMicroseconds(clkperiod_us/2);
    //Serial.print(sout8);
  }   

  for(i=0; i<CAP_ATT_SIZE; i++) {
    digitalWrite(SCLK_33, LOW);
    //digitalWrite(SIN_33, LOW);    
    digitalWrite(SIN_33, HIGH);  
    delayMicroseconds(clkperiod_us/2);
    digitalWrite(SCLK_33, HIGH);
    
    //sout8 = digitalRead(SOUT);
    delayMicroseconds(clkperiod_us/2);
    //Serial.print(sout8);
  }     

  
  for(i=0; i<VMODE_SIZE; i++) {
    digitalWrite(SCLK_33, LOW);
    digitalWrite(SIN_33, LOW);    
    //digitalWrite(SIN_33, HIGH);
    delayMicroseconds(clkperiod_us/2);
    digitalWrite(SCLK_33, HIGH);
    
    //sout8 = digitalRead(SOUT);
    delayMicroseconds(clkperiod_us/2);
    //Serial.print(sout8);
  }
  for(i=0; i<AER_DIS_SIZE; i++) {
    digitalWrite(SCLK_33, LOW);
    //digitalWrite(SIN_33, HIGH); 
    digitalWrite(SIN_33, LOW);   
    delayMicroseconds(clkperiod_us/2);
    digitalWrite(SCLK_33, HIGH);
    
    //sout8 = digitalRead(SOUT);
    delayMicroseconds(clkperiod_us/2);
    //Serial.print(sout8);
  }  
  digitalWrite(SHIFT_33, LOW);
  digitalWrite(SCLK_33,LOW);
  digitalWrite(SIN_33,LOW);

  Serial.println("SERIAL REGISTERS PROGRAMMED");

/*
  // shift out for debug
  digitalWrite(SHIFT_33, HIGH);
  for(i=0; i<1018; i++) {
    digitalWrite(SCLK_33, LOW);
    digitalWrite(SIN_33, LOW);    
    delayMicroseconds(clkperiod_us/2);
    digitalWrite(SCLK_33, HIGH);
    sout8 = digitalRead(SOUT);    
    delayMicroseconds(clkperiod_us/2);
    
    Serial.print(sout8,BIN);
  }
  digitalWrite(SHIFT_33, LOW);
  digitalWrite(SCLK_33,LOW);
  digitalWrite(SIN_33,HIGH);
*/

}



void aer_interface_init() {


  pinMode(ADDRX_3, INPUT);
  pinMode(ADDRX_2, INPUT);
  pinMode(ADDRX_1, INPUT);
  pinMode(ADDRX_0, INPUT); 
  
  pinMode(ADDRY_3, INPUT);
  pinMode(ADDRY_2, INPUT);
  pinMode(ADDRY_1, INPUT);
  pinMode(ADDRY_0, INPUT);

  pinMode(REQON, INPUT);
  pinMode(REQOFF, INPUT);
  pinMode(ACK_33, OUTPUT);
  pinMode(AER_RST_33, OUTPUT);  

/*
  digitalWrite(REQON, HIGH);
  digitalWrite(REQOFF, HIGH);
  digitalWrite(ADDRX_3, INPUT);
  digitalWrite(ADDRX_2, INPUT);
  digitalWrite(ADDRX_1, INPUT);
  digitalWrite(ADDRX_0, INPUT); 
  
  digitalWrite(ADDRY_3, INPUT);
  digitalWrite(ADDRY_2, INPUT);
  digitalWrite(ADDRY_1, INPUT);
  digitalWrite(ADDRY_0, INPUT);
*/   

  digitalWrite(AER_RST_33, HIGH);
  delayMicroseconds(100000); // minimum 50ms to reset common mode
  digitalWrite(AER_RST_33, LOW);

  // keep ACK HIGH to disable AER
  digitalWriteFast(ACK_33, HIGH);  

  Serial.println("AER INTERFACE INIT'D"); 
}

void aer_interface() {
  bool reqon_rcv;
  bool reqoff_rcv;
  bool req_rcv;
  bool addrx_3_r;
  bool addrx_2_r;
  bool addrx_1_r;
  bool addrx_0_r;
  bool addry_3_r;
  bool addry_2_r;
  bool addry_1_r;
  bool addry_0_r;  
  
  //int spk_x;
  //int spk_y;
  //unsigned long spk_times;
  //int spk_polarity;  
  //unsigned long spktimes;
  int spkaddrx;
  int spkaddry;


  reqon_rcv = digitalReadFast(REQON);
  reqoff_rcv = digitalReadFast(REQOFF);

  req_rcv = reqon_rcv | reqoff_rcv;

  //Serial.println(reqon_rcv);

/*
  if (spk_count == 100) {   // relax LSB after initial spikes
    float Nres=4;
    float lsb= 1/pow(2,Nres); //0.05;
    float vcm_real=0.25;
    dac_setup("VREFL",vcm_real-lsb);
    dac_setup("VREFH",vcm_real+lsb); 
  }     
*/
  if (req_rcv==HIGH && spk_count < MAX_SPIKES) {
  //if (req_rcv==HIGH) {
    //Serial.println("Spike received");

    
    addrx_3_r = digitalReadFast(ADDRX_3);
    addrx_2_r = digitalReadFast(ADDRX_2);
    addrx_1_r = digitalReadFast(ADDRX_1);
    addrx_0_r = digitalReadFast(ADDRX_0);
  
    addry_3_r = digitalReadFast(ADDRY_3);
    addry_2_r = digitalReadFast(ADDRY_2);
    addry_1_r = digitalReadFast(ADDRY_1);
    addry_0_r = digitalReadFast(ADDRY_0);     
        
    //spktimes = micros() - time0;
    //spkaddrx = (addrx_3_r * 8) + (addrx_2_r * 4) + (addrx_1_r * 2) +  (addrx_0_r);
    //spkaddry = (addry_3_r * 8) + (addry_2_r * 4) + (addry_1_r * 2) +  (addry_0_r);
    spkaddrx = (addrx_3_r << 3) | (addrx_2_r << 2) | (addrx_1_r << 1) | (addrx_0_r);
    spkaddry = (addry_3_r << 3) | (addry_2_r << 2)  | (addry_1_r << 1)  | (addry_0_r);    

    //if (reqon_rcv==HIGH && reqoff_rcv==HIGH) {

      //if ((spkaddrx==4 && spkaddry==6)) { // ignore garbage spikes
      //if ((spkaddrx==0 && spkaddry==0) || (spkaddrx==1 && spkaddry==0) || (spkaddrx==15 && spkaddry==0) || (spkaddrx==2 && spkaddry==1) || (spkaddrx==3 && spkaddry==6)  || (spkaddrx==4 && spkaddry==6) || (spkaddrx==5 && spkaddry==7) || (spkaddrx==6 && spkaddry==7) || (spkaddrx==7 && spkaddry==8) || (spkaddrx==8 && spkaddry==8) || (spkaddrx==9 && spkaddry==9) || (spkaddrx==10 && spkaddry==9) || (spkaddrx==11 && spkaddry==10) || (spkaddrx==12 && spkaddry==10) || (spkaddrx==13 && spkaddry==11) || (spkaddrx==14 && spkaddry==11)) {
      //if ((spkaddrx==0 && spkaddry==0) || (spkaddrx==1 && spkaddry==0) || (spkaddrx==15 && spkaddry==0) || (spkaddrx==2 && spkaddry==1) || (spkaddrx==3 && spkaddry==6)  || (spkaddrx==4 && spkaddry==6) || (spkaddrx==5 && spkaddry==7) || (spkaddrx==6 && spkaddry==7)) {
      if ((spkaddrx==4 && spkaddry==2) || (spkaddrx==5 && spkaddry==2) || (spkaddrx==11 && spkaddry==2) || (spkaddrx==6 && spkaddry==3) || (spkaddrx==3 && spkaddry==6)  || (spkaddrx==4 && spkaddry==6) || (spkaddrx==5 && spkaddry==7) || (spkaddrx==6 && spkaddry==7) || (spkaddrx==7 && spkaddry==8) || (spkaddrx==8 && spkaddry==8) || (spkaddrx==9 && spkaddry==9) || (spkaddrx==10 && spkaddry==9) || (spkaddrx==11 && spkaddry==10) || (spkaddrx==12 && spkaddry==10) || (spkaddrx==13 && spkaddry==11) || (spkaddrx==14 && spkaddry==11)) {
      //if ((spkaddrx==4 && spkaddry==2) || (spkaddrx==5 && spkaddry==2) || (spkaddrx==11 && spkaddry==2) || (spkaddrx==6 && spkaddry==3) || (spkaddrx==3 && spkaddry==6)  || (spkaddrx==4 && spkaddry==6) || (spkaddrx==5 && spkaddry==7) || (spkaddrx==6 && spkaddry==7) || (spkaddrx==7 && spkaddry==8) || (spkaddrx==8 && spkaddry==8) ||  (spkaddrx==10 && spkaddry==9) || (spkaddrx==11 && spkaddry==10) || (spkaddrx==12 && spkaddry==10) || (spkaddrx==13 && spkaddry==11) || (spkaddrx==14 && spkaddry==11)) {    
      //if ((spkaddrx==4 && spkaddry==2) || (spkaddrx==5 && spkaddry==2) || (spkaddrx==11 && spkaddry==2) || (spkaddrx==6 && spkaddry==3) || (spkaddrx==3 && spkaddry==6)  || (spkaddrx==4 && spkaddry==6) || (spkaddrx==5 && spkaddry==7)) {
      //if (spkaddrx==3 && spkaddry==6) {
        spk_times[spk_count] = (micros() - time0);//spktimes;
        //spk_times[spk_count] = (timer2.get_micros() - time0);//spktimes;
        spk_x[spk_count] = spkaddrx; //(addrx_3_r << 3) | (addrx_2_r << 2) | (addrx_1_r << 1) | (addrx_0_r); //(addrx_3_r * 8) + (addrx_2_r * 4) + (addrx_1_r * 2) +  (addrx_0_r); //spkaddrx;
        spk_y[spk_count] = spkaddry; //(addry_3_r << 3) | (addry_2_r << 2)  | (addry_1_r << 1)  | (addry_0_r); //(addry_3_r * 8) + (addry_2_r * 4) + (addry_1_r * 2) +  (addry_0_r);//spkaddry;
        spk_polarity[spk_count] = reqon_rcv;  //0b1;   
    
        spk_count=spk_count+1;

        // //spk_times[spk_count] = (micros() - time0);//spktimes;
        // spk_times[spk_count] = (timer2.get_micros() - time0);//spktimes;        
        // spk_x[spk_count] = (addrx_3_r << 3) | (addrx_2_r << 2) | (addrx_1_r << 1) | (addrx_0_r); // (addrx_3_r * 8) + (addrx_2_r * 4) + (addrx_1_r * 2) +  (addrx_0_r);
        // spk_y[spk_count] = (addry_3_r << 3) | (addry_2_r << 2)  | (addry_1_r << 1)  | (addry_0_r); //(addry_3_r * 8) + (addry_2_r * 4) + (addry_1_r * 2) +  (addry_0_r);//spkaddry;
        // spk_polarity[spk_count] = 0b0;        

        // spk_count=spk_count+1;
      }
      
    // } else {

    //   //if ((spkaddrx==4 && spkaddry==6)){ // ignore garbage spikes
    //   //if ((spkaddrx==0 && spkaddry==0) || (spkaddrx==1 && spkaddry==0) || (spkaddrx==15 && spkaddry==0) || (spkaddrx==2 && spkaddry==1) || (spkaddrx==3 && spkaddry==6)  || (spkaddrx==4 && spkaddry==6) || (spkaddrx==5 && spkaddry==7) || (spkaddrx==6 && spkaddry==7) || (spkaddrx==7 && spkaddry==8) || (spkaddrx==8 && spkaddry==8) || (spkaddrx==9 && spkaddry==9) || (spkaddrx==10 && spkaddry==9) || (spkaddrx==11 && spkaddry==10) || (spkaddrx==12 && spkaddry==10) || (spkaddrx==13 && spkaddry==11) || (spkaddrx==14 && spkaddry==11)) {
    //   //if ((spkaddrx==0 && spkaddry==0) || (spkaddrx==1 && spkaddry==0) || (spkaddrx==15 && spkaddry==0) || (spkaddrx==2 && spkaddry==1) || (spkaddrx==3 && spkaddry==6)  || (spkaddrx==4 && spkaddry==6) || (spkaddrx==5 && spkaddry==7) || (spkaddrx==6 && spkaddry==7)) {
    //   if ((spkaddrx==4 && spkaddry==2) || (spkaddrx==5 && spkaddry==2) || (spkaddrx==11 && spkaddry==2) || (spkaddrx==6 && spkaddry==3) || (spkaddrx==3 && spkaddry==6)  || (spkaddrx==4 && spkaddry==6) || (spkaddrx==5 && spkaddry==7) || (spkaddrx==6 && spkaddry==7) || (spkaddrx==7 && spkaddry==8) || (spkaddrx==8 && spkaddry==8) || (spkaddrx==9 && spkaddry==9) || (spkaddrx==10 && spkaddry==9) || (spkaddrx==11 && spkaddry==10) || (spkaddrx==12 && spkaddry==10) || (spkaddrx==13 && spkaddry==11) || (spkaddrx==14 && spkaddry==11)) {
    //   //if ((spkaddrx==4 && spkaddry==2) || (spkaddrx==5 && spkaddry==2) || (spkaddrx==11 && spkaddry==2) || (spkaddrx==6 && spkaddry==3) || (spkaddrx==3 && spkaddry==6)  || (spkaddrx==4 && spkaddry==6) || (spkaddrx==5 && spkaddry==7)) {

    //     //spk_times[spk_count] = (micros() - time0);//spktimes;
    //     spk_times[spk_count] = (timer2.get_micros() - time0);//spktimes;        
    //     spk_x[spk_count] = (addrx_3_r << 3) | (addrx_2_r << 2) | (addrx_1_r << 1) | (addrx_0_r); // (addrx_3_r * 8) + (addrx_2_r * 4) + (addrx_1_r * 2) +  (addrx_0_r);
    //     spk_y[spk_count] = (addry_3_r << 3) | (addry_2_r << 2)  | (addry_1_r << 1)  | (addry_0_r); //(addry_3_r * 8) + (addry_2_r * 4) + (addry_1_r * 2) +  (addry_0_r);//spkaddry;
 
    //     if (reqoff_rcv==HIGH)
    //       spk_polarity[spk_count] = 0b0;    
    //     else if (reqon_rcv==HIGH)
    //       spk_polarity[spk_count] = 0b1;                

    //       spk_count=spk_count+1;
    //   }          
    // }  

    // Send ACK
    digitalWriteFast(ACK_33, HIGH);
    //delayMicroseconds(1); // no handshaking
    digitalWriteFast(ACK_33, LOW);    
    //SET(PORTL,2);

    // // if (reqon_rcv==HIGH && reqoff_rcv==HIGH) {
    // //   //Serial.println("waiting for REQON to be deasserted");      
    // //   while(reqon_rcv==HIGH  && reqoff_rcv==HIGH) {
    // //     reqon_rcv = digitalReadFast(REQON); 
    // //     reqoff_rcv = digitalReadFast(REQOFF); 
    // //   }
    // //   //Serial.println("REQON deasserted");
    // //   //delayMicroseconds(10);
    // //   digitalWriteFast(ACK_33, LOW);                   
    // // }
    // //else if (reqoff_rcv==HIGH) {
    // if (reqoff_rcv==HIGH) {
    //   //Serial.println("waiting for REQOFF to be deasserted");         
    //   while(reqoff_rcv==HIGH) {
    //     reqoff_rcv = digitalReadFast(REQOFF); 
    //   }
    //   //Serial.println("REQOFF deasserted");      
    //   //delayMicroseconds(10);
    //   digitalWriteFast(ACK_33, LOW);                   
    // }

    // else if (reqon_rcv==HIGH ) {
    //   //Serial.println("waiting for REQON to be deasserted");      
    //   while(reqon_rcv==HIGH) {
    //     reqon_rcv = digitalReadFast(REQON); 
    //   }
    //   //Serial.println("REQON deasserted");
    //   //delayMicroseconds(1);
    //   digitalWriteFast(ACK_33, LOW);                   
    // }




  } else if (spk_count==MAX_SPIKES) {
    //adc_start();
    tx_spikes_serial();
    spk_count = 0;
  }
}

void tx_spikes_serial() {
  int i;


  for(i=0; i<MAX_SPIKES; i++) {

    Serial.print("S,");    
    Serial.print(spk_x[i],DEC);
    Serial.print(",");    
    Serial.print(spk_y[i],DEC);
    Serial.print(",");    
    if (spk_polarity[i]==1)
      Serial.print("1,"); 
    else if (spk_polarity[i]==0)
      Serial.print("2,");  
    Serial.println(spk_times[i]);
    delayMicroseconds(1);

  }

}

void loop() {

  //Serial.println(micros() - time0);



  
  while(setup_done==1) {
     if (first_run==0) {

    //   //deassert ACK to start receiving
       digitalWriteFast(ACK_33, LOW); 

    //   //dac_setup_1p8("VREFL",1); // induce spikes to reset channels    
    //   //dac_setup_1p8("VREFH",0); // induce spikes to reset channels 
    //   delay(1);

    //   // set actual thresholds
    //   dac_setup_1p8("VREFH",vcm_real+lsb);  
    //   if (vcm_real - lsb < 0) {
    //     dac_setup_1p8("VREFL",0);   
    //     Serial.println("vrefl is negative. changed to zero");
    //   } else {
    //     dac_setup_1p8("VREFL",vcm_real-lsb);
    //     //dac_setup_1p8("VREFL",0.22);
    //  }
      first_run=1;
     }


    aer_interface();
  }
}
