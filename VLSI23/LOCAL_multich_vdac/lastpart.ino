void setup() {

  // initialize SPI:
  SPI.begin();   

  // initialize UART
  // maximum baudrate for Arduino IDE
  Serial.begin(2000000);
  Serial.flush();   
  Serial.println("\nSPI Interface for Stimuli Generator");  

  // rated for 20ns -> 50MHz
  SPISettings settingsA(50000000, MSBFIRST, SPI_MODE2);  
  SPI.beginTransaction(settingsA);      

  dac_setup_all(0);
  dac_setup_all(1);
  
}

void dac_setup_all(int WHICH_DAC) {

 

  if (WHICH_DAC==0) {

    // SW_RESET
    pinMode(SYNCb_DAC1, OUTPUT); // The CS_Pin should remain in a high impedance state (INPUT) when it is not in use.    
    digitalWrite(SYNCb_DAC1, LOW); // Activate the CS line (CS is active LOW)

    SPI.transfer(0x7D); 
    SPI.transfer(0xAC);     

    pinMode(SYNCb_DAC1, INPUT); // Set CS_Pin to high impedance to allow pull-up to reset CS to inactive.
    digitalWrite(SYNCb_DAC1, HIGH); // Enable internal pull-up     

    //SPI.endTransaction();
    Serial.println("Chip1 reset");  

    // DAC CONFIG
    // configure all channels as DACs
    pinMode(SYNCb_DAC1, OUTPUT); // The CS_Pin should remain in a high impedance state (INPUT) when it is not in use.    
    digitalWrite(SYNCb_DAC1, LOW); // Activate the CS line (CS is active LOW)

    SPI.transfer(0x28); 
    SPI.transfer(0xFF);     

    pinMode(SYNCb_DAC1, INPUT); // Set CS_Pin to high impedance to allow pull-up to reset CS to inactive.
    digitalWrite(SYNCb_DAC1, HIGH); // Enable internal pull-up     

    //SPI.endTransaction();
    Serial.println("Chip1 configured as DACs");  

    // POWER DOWN / REFERENCE CTRL REGISTER
    // enable internal vref only, do not power down
    pinMode(SYNCb_DAC1, OUTPUT); // The CS_Pin should remain in a high impedance state (INPUT) when it is not in use.    
    digitalWrite(SYNCb_DAC1, LOW); // Activate the CS line (CS is active LOW)

    SPI.transfer(0x5A); // D9=1 
    SPI.transfer(0x00); // normal mode     

    pinMode(SYNCb_DAC1, INPUT); // Set CS_Pin to high impedance to allow pull-up to reset CS to inactive.
    digitalWrite(SYNCb_DAC1, HIGH); // Enable internal pull-up     

    //SPI.endTransaction();
    Serial.println("Chip1 internal VREF enabled");  
  } else if (WHICH_DAC==1) {

      // SW_RESET
      pinMode(SYNCb_DAC2, OUTPUT); // The CS_Pin should remain in a high impedance state (INPUT) when it is not in use.    
      digitalWrite(SYNCb_DAC2, LOW); // Activate the CS line (CS is active LOW)

      SPI.transfer(0x7D); 
      SPI.transfer(0xAC);     

      pinMode(SYNCb_DAC2, INPUT); // Set CS_Pin to high impedance to allow pull-up to reset CS to inactive.
      digitalWrite(SYNCb_DAC2, HIGH); // Enable internal pull-up     

      //SPI.endTransaction();
      Serial.println("Chip2 reset");  

      // DAC CONFIG
      // configure all channels as DACs
      pinMode(SYNCb_DAC2, OUTPUT); // The CS_Pin should remain in a high impedance state (INPUT) when it is not in use.    
      digitalWrite(SYNCb_DAC2, LOW); // Activate the CS line (CS is active LOW)

      SPI.transfer(0x28); 
      SPI.transfer(0xFF);     

      pinMode(SYNCb_DAC2, INPUT); // Set CS_Pin to high impedance to allow pull-up to reset CS to inactive.
      digitalWrite(SYNCb_DAC2, HIGH); // Enable internal pull-up     

      //SPI.endTransaction();
      Serial.println("Chip2 configured as DACs");  

      // POWER DOWN / REFERENCE CTRL REGISTER
      // enable internal vref only, do not power down
      pinMode(SYNCb_DAC2, OUTPUT); // The CS_Pin should remain in a high impedance state (INPUT) when it is not in use.    
      digitalWrite(SYNCb_DAC2, LOW); // Activate the CS line (CS is active LOW)

      SPI.transfer(0x5A); // D9=1 
      SPI.transfer(0x00); // normal mode     

      pinMode(SYNCb_DAC2, INPUT); // Set CS_Pin to high impedance to allow pull-up to reset CS to inactive.
      digitalWrite(SYNCb_DAC2, HIGH); // Enable internal pull-up     

      //SPI.endTransaction();
      Serial.println("Chip2 internal VREF enabled");      
  }
}  

void dac_write(int WHICH_DAC, int CH, float VAL) {

  // Assumes: SPI.begin and end happens outside this function
  uint8_t channel;
  uint16_t dacval;
    
  dacval = round(4096*VAL/2.5);
  // Serial.print("dacval preshift: ");  
  // Serial.println(dacval,BIN);  
  //dacval = round(4096*VAL/5);
  channel = (CH << 4  & 0x70) | 0x80 | (dacval >> 8 & 0x0F);

  // Serial.print("channel: ");
  // Serial.println(channel,BIN);
  // Serial.print("dacval: ");  
  // Serial.println(dacval,BIN);

  // DAC_WR (DAC write register)
  if (WHICH_DAC==0) {

    pinMode(SYNCb_DAC1, OUTPUT); // The CS_Pin should remain in a high impedance state (INPUT) when it is not in use.    
    digitalWriteFast(SYNCb_DAC1, LOW); // Activate the CS line (CS is active LOW)

    SPI.transfer(channel); 
    SPI.transfer(dacval & 0xFF);     

    //pinMode(SYNCb_DAC1, INPUT); // Set CS_Pin to high impedance to allow pull-up to reset CS to inactive.
    digitalWriteFast(SYNCb_DAC1, HIGH); // Enable internal pull-up    

  } else if (WHICH_DAC==1) {

    pinMode(SYNCb_DAC2, OUTPUT); // The CS_Pin should remain in a high impedance state (INPUT) when it is not in use.    
    digitalWriteFast(SYNCb_DAC2, LOW); // Activate the CS line (CS is active LOW)

    SPI.transfer(channel); 
    SPI.transfer(dacval & 0xFF);     

    //pinMode(SYNCb_DAC2, INPUT); // Set CS_Pin to high impedance to allow pull-up to reset CS to inactive.
    digitalWriteFast(SYNCb_DAC2, HIGH); // Enable internal pull-up     
  }    
}

void sineout_inf (float amp, float fin, float ofs) {

  float wave;
  float t;
  //const float tlength = 0.4; // from MATLAB sims before
  float tlength = 1/fin; // 1 cycle of fin
  const float fs = 10000; // from MATLAB sims before
  //float n = round(tlength*fin*fs);
  float n = round(tlength*fs);
  //float tlength = 1/fin;
  //float dt;

  int chip;
  int ch;

  int i;

  //dt = 1/fs;

  while(1) {

    //for(t=0;t<tlength-dt;t=t+dt) {
    for(i=0; i < n; i++) {  
      t = (float) i / (fs/fin);
      wave = (amp * sin(2*3.14*t)) + ofs; // accepts radians
      //Serial.println(wave, DEC);      

      //time0 = micros();
      // assumes delay in all this << one oversampling period
      for(chip=0;chip<2;chip++) {
        for(ch=0;ch<8;ch++) {
          dac_write(chip, ch, wave);
        }
      }

      // dac_write(0, 0, wave);      
      // dac_write(0, 1, wave); 
      // dac_write(0, 2, wave);      
      // dac_write(0, 3, wave); 
      // dac_write(0, 4, wave);      
      // dac_write(0, 5, wave); 
      // dac_write(0, 6, wave);      
      // dac_write(0, 7, wave);      
      // dac_write(1, 0, wave);      
      // dac_write(1, 1, wave); 
      // dac_write(1, 2, wave);      
      // dac_write(1, 3, wave); 
      // dac_write(1, 4, wave);      
      // dac_write(1, 5, wave); 
      // dac_write(1, 6, wave);      
      // dac_write(1, 7, wave);          
                  
      // //Serial.print("Elapsed time to program all DACs: ");
      //Serial.println(micros() - time0, DEC);

      //delayMicroseconds(1000000/fs/10);

    }
  }
}



void read_data_bank(float vpp, float ofs) {
  float incomingByte;  
  float data; // needs to be float so computation of data_dac is not rounded off
  float data_dac;

  int chip;
  int ch;

  int i; 
  int n; 

  const float fs = 10000; // from MATLAB sims before  
  //const float vpp = 0.005;
  //const float ofs = 0.256;


  while(1) {


    //ch=1;
    // assumes delay in all this << one oversampling period
    for(n=0;n<DATALEN;n++) {     
      //time0 = micros(); 
      for(ch=0;ch<8;ch++) {
      //for(ch=1;ch<2;ch++) {  
        data = pgm_read_byte(&(DATABANK_CH0[ch][n]));
        //data = pgm_read_byte(&(DATABANK_TT[0][n]));         
        //data_dac = pgm_read_float(DATABANK_FL+n);  
        //data =  pgm_read_byte(DATABANK_CH0+n);    
        //Serial.println(data);
        data_dac =  ofs + vpp*((data - 127) / 256);
        //data_dac =  ofs + vpp*(((int)data - 127) << 8);
        //Serial.println(data_dac,6);
        dac_write(0, ch, data_dac);
        // Serial.println(ch,DEC);
        // Serial.println(data,DEC);
        // Serial.println(data_dac,8);
      }   

      for(ch=0;ch<8;ch++) {
        data = pgm_read_byte(&(DATABANK_CH1[ch][n]));        
        //data = pgm_read_byte(&(DATABANK_TT[0][n])); 
        data_dac = ofs + vpp*((data - 127) / 256);        
        dac_write(1, ch, data_dac);
      }        
      
      //delayMicroseconds(1000000/fs); 
      //Serial.print("Elapsed time to program all DACs: ");
      //Serial.println(micros() - time0, DEC);
    }     
    




      
  }  
}




void loop() {

  // 10mVpp, 100Hz, 250mV offset
  //sineout_inf(0.18,100,0.25);
  //dac_write(0, 0, 2.4);  
  read_data_bank(0.18,0.25);
  //read_data_bank_ch0(0.018,0.25);

  
}

