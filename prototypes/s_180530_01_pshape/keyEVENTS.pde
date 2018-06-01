
//////////////////////////////
// KeyEVENTS - flipping switches!


////////////////////////////////////////////////////
//  KEYCODE FOR EVENTS

//////////////////////////////////////
//  CREATE MOMENTARY SWITCH 
// Current keyCode for the pressed key

//   The system variable 'key' always contains the value 
//     of the most recent key on the keyboard (either pressed or released). 

//   For non-ASCII keys, use the 'keyCode' variable. 
//      The keys included in the ASCII specification 
//      (BACKSPACE, TAB, ENTER, RETURN, ESC, and DELETE) 
//      do not require checking to see if the key is coded, 
//      and you should simply use the 'key' variable instead of 'keyCode'

char currentKey; 
int currentKeyCode = -1;

// Remember the current key when it goes down.
void keyPressed() { 
  currentKeyCode = keyCode; 
  currentKey = key;

  if (key == CODED) {
    if (keyCode == LEFT) {
      println("keyCode == LEFT");
    } else if (keyCode == RIGHT) {
      println("keyCode == RIGHT");
    } else if (keyCode == UP) {
      println("keyCoe == UP");
    } else if (keyCode == DOWN) {
      println("keyCoe == DOWN");
    }
  }



  //DEBUG: println("keyCode = "+keyCode+ " key = "+key);


  switch(currentKey) {
  case '-':
    println("HYPEN!");
    break;
  case '1':
    println("1");
    break;
  case '2':
    println("2");
    break;
  case '3':
    println("3");
    break;
  case '4':
    println("4");
    break;
  case '5':
    println("5");
    break;
  case '6':
    println("6");
    break;
  case '7':
    println("7");
    break;
  case '8':
    println("8");
    break;
  case '9':
    println("9");
    break;
  case '0':
    println("10");
    break;
  }
}


// Clear the current key when it goes up.
void keyReleased() {
  currentKeyCode = -1;
}
//  END MOMENTARY SWITCH
//////////////////////////////////////


void updateControlsFromKeyboard() {
  // if no key is currently down, make sure all of the buttons are up and bail  
  if (currentKeyCode == -1) {
    //clearButtons();
    return;
  }
  //////////////////////////////////////////////////
  //  SCREEN CAPTURE  =  ENTER
  //////////////////////////////////////////////////
  if (currentKeyCode==ENTER) {
    String filename = nowAsString() + ".png";
    println("SAVED AS "+filename);
    saveFrame(SNAP_FOLDER_PATH + filename);
    //saveFrame(SNAP_FOLDER_PATH + "screen-####.png");
    noCursor();
  } else {
    cursor();
  }
  /////////////////////////////////////////////////
  //  CLEAR BACKGROUND = TAB 
  /////////////////////////////////////////////////
  if (currentKeyCode==TAB) {
    background(0);
    pg_1.beginDraw();
    pg_1.background(0);
    pg_1.endDraw();
  } 

  /////////////////////////////////////////////////
  //     SELECT NEW SOURCE IMAGES FOR CHANNELS 1-4
  /////////////////////////////////////////////////
  //select source for chnl 1
  if (currentKey == 'q') {
    println(currentKey);
  } else if (currentKey == 'w') {
    println(currentKey);
  }
  //select source for chnl 2
  else if (currentKey == 'e') {
    println(currentKey);
  } else if (currentKey == 'r') {
    println(currentKey);
  }
  //select source for chnl 3
  else if (currentKey == 't') {
    println(currentKey);
  } else if (currentKey == 'y') {
    println(currentKey);
  }
  //select source for chnl 4
  else if (currentKey == 'u') {
    println(currentKey);
  } else if (currentKey == 'i') {
    println(currentKey);
  }
  //select source for chnl 5
  else if (currentKey == 'o') {
    println(currentKey);
  } else if (currentKey == 'p') {
    println(currentKey);
  }
  //select source for chnl 6
  else if (currentKey == '[') {
    println(currentKey);
  } else if (currentKey == ']') {
    println(currentKey);
  }

  //     END SELECT NEW SOURCE IMAGE
  ////////////////////////////////////////////////
}
//  END KEYCODE FOR EVENTS
/////////////////////////////////////////////////////////////


////////////////////////////////////////////////////
//    SCREEN SNAPS
// output: right now + project + version as a string
// 2015-03-15_portal-control/portal-control_v0.5.3_01-42-50
String nowAsString() {
  return nf(year(), 4)+"-"+
    nf(month(), 2)+"-"+
    nf(day(), 2)+"_"+
    project+"/"+
    project+"_"+
    version+"_"+
    nf(hour(), 2)+"-"+
    nf(minute(), 2)+"-"+
    nf(second(), 2);
}
// Save the current screen state as a .png in the SNAP_FOLDER_PATH,
// If you pass a filename, we'll use that, otherwise we'll default to the current date.
// NOTE: do NOT pass the ".jpg" or the path.
// Returns the name of the file saved.
String saveScreen() {
  return saveScreen(null);
}
String saveScreen(String fileName) {
  if (fileName == null) {
    fileName = nowAsString();
  }
  save(SNAP_FOLDER_PATH + fileName + ".png");
  println("SAVED AS "+fileName);
  return fileName;
}
//   END SCREEN SNAPS
////////////////////////////////////////////////////////////
