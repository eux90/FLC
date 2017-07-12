/* The following code was generated by JFlex 1.4.1 on 24/06/17 11.31 */

import java_cup.runtime.*;


/**
 * This class is a scanner generated by 
 * <a href="http://www.jflex.de/">JFlex</a> 1.4.1
 * on 24/06/17 11.31 from the specification file
 * <tt>scanner.jflex</tt>
 */
class scanner implements java_cup.runtime.Scanner {

  /** This character denotes the end of file */
  public static final int YYEOF = -1;

  /** initial size of the lookahead buffer */
  private static final int ZZ_BUFFERSIZE = 16384;

  /** lexical states */
  public static final int YYINITIAL = 0;

  /** 
   * Translates characters to character classes
   */
  private static final String ZZ_CMAP_PACKED = 
    "\11\0\1\35\1\34\2\0\1\33\22\0\1\35\13\0\1\36\1\0"+
    "\1\20\1\25\1\17\1\30\1\27\1\3\2\31\4\26\1\32\1\37"+
    "\5\0\12\16\1\23\1\16\1\21\2\16\1\22\12\16\4\0\1\4"+
    "\1\0\1\15\1\24\1\16\1\14\1\11\3\16\1\6\2\16\1\5"+
    "\1\1\2\16\1\2\1\16\1\12\1\7\1\10\1\16\1\13\4\16"+
    "\uff85\0";

  /** 
   * Translates characters to character classes
   */
  private static final char [] ZZ_CMAP = zzUnpackCMap(ZZ_CMAP_PACKED);

  /** 
   * Translates DFA states to action switch labels.
   */
  private static final int [] ZZ_ACTION = zzUnpackAction();

  private static final String ZZ_ACTION_PACKED_0 =
    "\1\0\3\1\1\2\3\1\1\2\1\1\3\2\1\3"+
    "\2\4\1\5\1\6\3\0\2\2\7\0\3\2\24\0"+
    "\1\7\1\10\1\0\1\11\1\0\1\12\5\0\1\13"+
    "\5\0\1\14\2\0\3\15\1\16\2\0\1\15\1\0"+
    "\1\17";

  private static int [] zzUnpackAction() {
    int [] result = new int[82];
    int offset = 0;
    offset = zzUnpackAction(ZZ_ACTION_PACKED_0, offset, result);
    return result;
  }

  private static int zzUnpackAction(String packed, int offset, int [] result) {
    int i = 0;       /* index in packed string  */
    int j = offset;  /* index in unpacked array */
    int l = packed.length();
    while (i < l) {
      int count = packed.charAt(i++);
      int value = packed.charAt(i++);
      do result[j++] = value; while (--count > 0);
    }
    return j;
  }


  /** 
   * Translates a state to a row index in the transition table
   */
  private static final int [] ZZ_ROWMAP = zzUnpackRowMap();

  private static final String ZZ_ROWMAP_PACKED_0 =
    "\0\0\0\40\0\100\0\140\0\200\0\240\0\300\0\340"+
    "\0\u0100\0\u0120\0\u0140\0\u0160\0\u0180\0\40\0\u01a0\0\40"+
    "\0\40\0\40\0\140\0\u01c0\0\u01e0\0\u0200\0\u0220\0\u0240"+
    "\0\u0260\0\u0280\0\u02a0\0\u02c0\0\u02e0\0\u0300\0\u0320\0\u0340"+
    "\0\u0360\0\u0380\0\u03a0\0\u03c0\0\u03e0\0\u0400\0\u0420\0\u0440"+
    "\0\u0460\0\u0480\0\u04a0\0\u04c0\0\u04e0\0\u0500\0\u0520\0\u0540"+
    "\0\u0560\0\u0580\0\u05a0\0\u05c0\0\u05e0\0\140\0\140\0\u0600"+
    "\0\40\0\u0620\0\40\0\u0640\0\u0660\0\u0680\0\u06a0\0\u06c0"+
    "\0\40\0\u06e0\0\u0700\0\u0720\0\u0740\0\u0760\0\140\0\u0780"+
    "\0\u07a0\0\40\0\u07c0\0\u07e0\0\140\0\u0800\0\u0820\0\u0840"+
    "\0\u0860\0\40";

  private static int [] zzUnpackRowMap() {
    int [] result = new int[82];
    int offset = 0;
    offset = zzUnpackRowMap(ZZ_ROWMAP_PACKED_0, offset, result);
    return result;
  }

  private static int zzUnpackRowMap(String packed, int offset, int [] result) {
    int i = 0;  /* index in packed string  */
    int j = offset;  /* index in unpacked array */
    int l = packed.length();
    while (i < l) {
      int high = packed.charAt(i++) << 16;
      result[j++] = high | packed.charAt(i++);
    }
    return j;
  }

  /** 
   * The transition table of the DFA
   */
  private static final int [] ZZ_TRANS = zzUnpackTrans();

  private static final String ZZ_TRANS_PACKED_0 =
    "\1\2\1\3\1\4\1\5\3\4\1\6\1\7\3\4"+
    "\1\10\2\4\1\11\1\2\2\4\1\12\1\4\1\2"+
    "\1\13\1\14\1\15\1\13\1\16\1\17\2\20\1\21"+
    "\1\22\41\0\1\23\1\24\15\23\1\25\4\23\1\0"+
    "\4\23\7\0\17\23\1\25\4\23\1\0\4\23\11\0"+
    "\1\26\13\0\1\27\1\30\5\0\2\26\1\27\1\26"+
    "\7\0\10\23\1\31\6\23\1\25\4\23\1\0\4\23"+
    "\7\0\5\23\1\32\11\23\1\25\4\23\1\0\4\23"+
    "\7\0\14\23\1\33\2\23\1\25\4\23\1\0\4\23"+
    "\11\0\1\34\13\0\1\35\1\30\5\0\4\34\7\0"+
    "\17\23\1\25\3\23\1\36\1\0\4\23\11\0\1\26"+
    "\13\0\1\26\1\30\5\0\4\26\11\0\1\37\13\0"+
    "\1\37\1\30\5\0\1\27\2\37\1\40\11\0\1\41"+
    "\13\0\1\41\1\30\5\0\4\41\42\0\1\20\4\0"+
    "\2\23\1\42\14\23\1\25\4\23\1\0\4\23\7\0"+
    "\1\43\17\0\1\44\21\0\1\26\13\0\1\26\6\0"+
    "\4\26\11\0\1\26\13\0\1\26\5\0\1\45\4\26"+
    "\11\0\1\46\13\0\1\46\6\0\1\46\1\47\1\50"+
    "\1\46\7\0\11\23\1\51\5\23\1\25\4\23\1\0"+
    "\4\23\7\0\1\52\16\23\1\25\4\23\1\0\4\23"+
    "\7\0\7\23\1\53\7\23\1\25\4\23\1\0\4\23"+
    "\33\0\1\45\4\0\1\54\37\0\1\54\6\0\17\23"+
    "\1\25\4\23\1\55\4\23\11\0\1\13\13\0\1\13"+
    "\5\0\1\45\1\26\3\13\1\54\10\0\1\13\13\0"+
    "\1\13\5\0\1\45\1\26\3\13\11\0\1\13\13\0"+
    "\1\13\1\30\4\0\1\45\4\13\1\54\6\0\3\23"+
    "\1\56\13\23\1\25\4\23\1\0\4\23\10\0\1\57"+
    "\57\0\1\57\34\0\1\60\10\0\1\61\27\0\1\62"+
    "\22\0\1\63\13\0\1\63\1\62\6\0\3\63\11\0"+
    "\1\64\13\0\1\64\1\62\5\0\4\64\7\0\12\23"+
    "\1\65\4\23\1\25\4\23\1\0\4\23\7\0\10\23"+
    "\1\66\6\23\1\25\4\23\1\0\4\23\7\0\14\23"+
    "\1\67\2\23\1\25\4\23\1\0\4\23\11\0\1\70"+
    "\13\0\1\70\7\0\3\70\15\0\1\71\31\0\4\23"+
    "\1\72\12\23\1\25\4\23\1\0\4\23\11\0\1\73"+
    "\37\0\1\74\22\0\4\74\25\0\1\74\7\0\2\74"+
    "\12\0\1\75\13\0\1\75\6\0\1\75\1\76\1\77"+
    "\1\75\11\0\1\46\13\0\1\46\7\0\3\46\11\0"+
    "\1\46\13\0\1\46\1\62\5\0\4\46\7\0\10\23"+
    "\1\100\6\23\1\25\4\23\1\0\4\23\11\0\1\101"+
    "\13\0\1\101\6\0\4\101\7\0\5\23\1\102\11\23"+
    "\1\25\4\23\1\0\4\23\33\0\1\103\32\0\1\104"+
    "\22\0\1\105\13\0\1\105\1\104\6\0\3\105\11\0"+
    "\1\106\13\0\1\106\1\104\5\0\4\106\7\0\11\23"+
    "\1\107\5\23\1\25\4\23\1\0\4\23\7\0\6\23"+
    "\1\110\10\23\1\25\4\23\1\0\4\23\35\0\1\111"+
    "\13\0\1\112\13\0\1\112\6\0\1\112\1\113\1\114"+
    "\1\112\11\0\1\75\13\0\1\75\7\0\3\75\11\0"+
    "\1\75\13\0\1\75\1\104\5\0\4\75\7\0\7\23"+
    "\1\115\7\23\1\25\4\23\1\0\4\23\11\0\1\116"+
    "\13\0\1\116\6\0\4\116\11\0\1\117\13\0\1\117"+
    "\7\0\3\117\11\0\1\120\13\0\1\120\6\0\4\120"+
    "\11\0\1\121\13\0\1\121\6\0\4\121\11\0\1\112"+
    "\13\0\1\112\7\0\3\112\11\0\1\112\13\0\1\112"+
    "\6\0\4\112\11\0\1\122\13\0\1\122\6\0\4\122"+
    "\6\0";

  private static int [] zzUnpackTrans() {
    int [] result = new int[2176];
    int offset = 0;
    offset = zzUnpackTrans(ZZ_TRANS_PACKED_0, offset, result);
    return result;
  }

  private static int zzUnpackTrans(String packed, int offset, int [] result) {
    int i = 0;       /* index in packed string  */
    int j = offset;  /* index in unpacked array */
    int l = packed.length();
    while (i < l) {
      int count = packed.charAt(i++);
      int value = packed.charAt(i++);
      value--;
      do result[j++] = value; while (--count > 0);
    }
    return j;
  }


  /* error codes */
  private static final int ZZ_UNKNOWN_ERROR = 0;
  private static final int ZZ_NO_MATCH = 1;
  private static final int ZZ_PUSHBACK_2BIG = 2;

  /* error messages for the codes above */
  private static final String ZZ_ERROR_MSG[] = {
    "Unkown internal scanner error",
    "Error: could not match input",
    "Error: pushback value was too large"
  };

  /**
   * ZZ_ATTRIBUTE[aState] contains the attributes of state <code>aState</code>
   */
  private static final int [] ZZ_ATTRIBUTE = zzUnpackAttribute();

  private static final String ZZ_ATTRIBUTE_PACKED_0 =
    "\1\0\1\11\13\1\1\11\1\1\3\11\3\0\2\1"+
    "\7\0\3\1\24\0\2\1\1\0\1\11\1\0\1\11"+
    "\5\0\1\11\5\0\1\1\2\0\1\11\3\1\2\0"+
    "\1\1\1\0\1\11";

  private static int [] zzUnpackAttribute() {
    int [] result = new int[82];
    int offset = 0;
    offset = zzUnpackAttribute(ZZ_ATTRIBUTE_PACKED_0, offset, result);
    return result;
  }

  private static int zzUnpackAttribute(String packed, int offset, int [] result) {
    int i = 0;       /* index in packed string  */
    int j = offset;  /* index in unpacked array */
    int l = packed.length();
    while (i < l) {
      int count = packed.charAt(i++);
      int value = packed.charAt(i++);
      do result[j++] = value; while (--count > 0);
    }
    return j;
  }

  /** the input device */
  private java.io.Reader zzReader;

  /** the current state of the DFA */
  private int zzState;

  /** the current lexical state */
  private int zzLexicalState = YYINITIAL;

  /** this buffer contains the current text to be matched and is
      the source of the yytext() string */
  private char zzBuffer[] = new char[ZZ_BUFFERSIZE];

  /** the textposition at the last accepting state */
  private int zzMarkedPos;

  /** the textposition at the last state to be included in yytext */
  private int zzPushbackPos;

  /** the current text position in the buffer */
  private int zzCurrentPos;

  /** startRead marks the beginning of the yytext() string in the buffer */
  private int zzStartRead;

  /** endRead marks the last character in the buffer, that has been read
      from input */
  private int zzEndRead;

  /** number of newlines encountered up to the start of the matched text */
  private int yyline;

  /** the number of characters up to the start of the matched text */
  private int yychar;

  /**
   * the number of characters from the last newline up to the start of the 
   * matched text
   */
  private int yycolumn;

  /** 
   * zzAtBOL == true <=> the scanner is currently at the beginning of a line
   */
  private boolean zzAtBOL = true;

  /** zzAtEOF == true <=> the scanner is at the EOF */
  private boolean zzAtEOF;

  /** denotes if the user-EOF-code has already been executed */
  private boolean zzEOFDone;

  /* user code: */
  private final static boolean _DEBUG = false;
  private Symbol symbol(int type) {
    return new Symbol(type, yyline, yycolumn);
  }
  private Symbol symbol(int type, Object value) {
    return new Symbol(type, yyline, yycolumn, value);

  }


  /**
   * Creates a new scanner
   * There is also a java.io.InputStream version of this constructor.
   *
   * @param   in  the java.io.Reader to read input from.
   */
  scanner(java.io.Reader in) {
    this.zzReader = in;
  }

  /**
   * Creates a new scanner.
   * There is also java.io.Reader version of this constructor.
   *
   * @param   in  the java.io.Inputstream to read input from.
   */
  scanner(java.io.InputStream in) {
    this(new java.io.InputStreamReader(in));
  }

  /** 
   * Unpacks the compressed character translation table.
   *
   * @param packed   the packed character translation table
   * @return         the unpacked character translation table
   */
  private static char [] zzUnpackCMap(String packed) {
    char [] map = new char[0x10000];
    int i = 0;  /* index in packed string  */
    int j = 0;  /* index in unpacked array */
    while (i < 102) {
      int  count = packed.charAt(i++);
      char value = packed.charAt(i++);
      do map[j++] = value; while (--count > 0);
    }
    return map;
  }


  /**
   * Refills the input buffer.
   *
   * @return      <code>false</code>, iff there was new input.
   * 
   * @exception   java.io.IOException  if any I/O-Error occurs
   */
  private boolean zzRefill() throws java.io.IOException {

    /* first: make room (if you can) */
    if (zzStartRead > 0) {
      System.arraycopy(zzBuffer, zzStartRead,
                       zzBuffer, 0,
                       zzEndRead-zzStartRead);

      /* translate stored positions */
      zzEndRead-= zzStartRead;
      zzCurrentPos-= zzStartRead;
      zzMarkedPos-= zzStartRead;
      zzPushbackPos-= zzStartRead;
      zzStartRead = 0;
    }

    /* is the buffer big enough? */
    if (zzCurrentPos >= zzBuffer.length) {
      /* if not: blow it up */
      char newBuffer[] = new char[zzCurrentPos*2];
      System.arraycopy(zzBuffer, 0, newBuffer, 0, zzBuffer.length);
      zzBuffer = newBuffer;
    }

    /* finally: fill the buffer with new input */
    int numRead = zzReader.read(zzBuffer, zzEndRead,
                                            zzBuffer.length-zzEndRead);

    if (numRead < 0) {
      return true;
    }
    else {
      zzEndRead+= numRead;
      return false;
    }
  }

    
  /**
   * Closes the input stream.
   */
  public final void yyclose() throws java.io.IOException {
    zzAtEOF = true;            /* indicate end of file */
    zzEndRead = zzStartRead;  /* invalidate buffer    */

    if (zzReader != null)
      zzReader.close();
  }


  /**
   * Resets the scanner to read from a new input stream.
   * Does not close the old reader.
   *
   * All internal variables are reset, the old input stream 
   * <b>cannot</b> be reused (internal buffer is discarded and lost).
   * Lexical state is set to <tt>ZZ_INITIAL</tt>.
   *
   * @param reader   the new input stream 
   */
  public final void yyreset(java.io.Reader reader) {
    zzReader = reader;
    zzAtBOL  = true;
    zzAtEOF  = false;
    zzEndRead = zzStartRead = 0;
    zzCurrentPos = zzMarkedPos = zzPushbackPos = 0;
    yyline = yychar = yycolumn = 0;
    zzLexicalState = YYINITIAL;
  }


  /**
   * Returns the current lexical state.
   */
  public final int yystate() {
    return zzLexicalState;
  }


  /**
   * Enters a new lexical state
   *
   * @param newState the new lexical state
   */
  public final void yybegin(int newState) {
    zzLexicalState = newState;
  }


  /**
   * Returns the text matched by the current regular expression.
   */
  public final String yytext() {
    return new String( zzBuffer, zzStartRead, zzMarkedPos-zzStartRead );
  }


  /**
   * Returns the character at position <tt>pos</tt> from the 
   * matched text. 
   * 
   * It is equivalent to yytext().charAt(pos), but faster
   *
   * @param pos the position of the character to fetch. 
   *            A value from 0 to yylength()-1.
   *
   * @return the character at position pos
   */
  public final char yycharat(int pos) {
    return zzBuffer[zzStartRead+pos];
  }


  /**
   * Returns the length of the matched text region.
   */
  public final int yylength() {
    return zzMarkedPos-zzStartRead;
  }


  /**
   * Reports an error that occured while scanning.
   *
   * In a wellformed scanner (no or only correct usage of 
   * yypushback(int) and a match-all fallback rule) this method 
   * will only be called with things that "Can't Possibly Happen".
   * If this method is called, something is seriously wrong
   * (e.g. a JFlex bug producing a faulty scanner etc.).
   *
   * Usual syntax/scanner level error handling should be done
   * in error fallback rules.
   *
   * @param   errorCode  the code of the errormessage to display
   */
  private void zzScanError(int errorCode) {
    String message;
    try {
      message = ZZ_ERROR_MSG[errorCode];
    }
    catch (ArrayIndexOutOfBoundsException e) {
      message = ZZ_ERROR_MSG[ZZ_UNKNOWN_ERROR];
    }

    throw new Error(message);
  } 


  /**
   * Pushes the specified amount of characters back into the input stream.
   *
   * They will be read again by then next call of the scanning method
   *
   * @param number  the number of characters to be read again.
   *                This number must not be greater than yylength()!
   */
  public void yypushback(int number)  {
    if ( number > yylength() )
      zzScanError(ZZ_PUSHBACK_2BIG);

    zzMarkedPos -= number;
  }


  /**
   * Contains user EOF-code, which will be executed exactly once,
   * when the end of file is reached
   */
  private void zzDoEOF() throws java.io.IOException {
    if (!zzEOFDone) {
      zzEOFDone = true;
      yyclose();
    }
  }


  /**
   * Resumes scanning until the next regular expression is matched,
   * the end of input is encountered or an I/O-Error occurs.
   *
   * @return      the next token
   * @exception   java.io.IOException  if any I/O-Error occurs
   */
  public java_cup.runtime.Symbol next_token() throws java.io.IOException {
    int zzInput;
    int zzAction;

    // cached fields:
    int zzCurrentPosL;
    int zzMarkedPosL;
    int zzEndReadL = zzEndRead;
    char [] zzBufferL = zzBuffer;
    char [] zzCMapL = ZZ_CMAP;

    int [] zzTransL = ZZ_TRANS;
    int [] zzRowMapL = ZZ_ROWMAP;
    int [] zzAttrL = ZZ_ATTRIBUTE;

    while (true) {
      zzMarkedPosL = zzMarkedPos;

      boolean zzR = false;
      for (zzCurrentPosL = zzStartRead; zzCurrentPosL < zzMarkedPosL;
                                                             zzCurrentPosL++) {
        switch (zzBufferL[zzCurrentPosL]) {
        case '\u000B':
        case '\u000C':
        case '\u0085':
        case '\u2028':
        case '\u2029':
          yyline++;
          yycolumn = 0;
          zzR = false;
          break;
        case '\r':
          yyline++;
          yycolumn = 0;
          zzR = true;
          break;
        case '\n':
          if (zzR)
            zzR = false;
          else {
            yyline++;
            yycolumn = 0;
          }
          break;
        default:
          zzR = false;
          yycolumn++;
        }
      }

      if (zzR) {
        // peek one character ahead if it is \n (if we have counted one line too much)
        boolean zzPeek;
        if (zzMarkedPosL < zzEndReadL)
          zzPeek = zzBufferL[zzMarkedPosL] == '\n';
        else if (zzAtEOF)
          zzPeek = false;
        else {
          boolean eof = zzRefill();
          zzEndReadL = zzEndRead;
          zzMarkedPosL = zzMarkedPos;
          zzBufferL = zzBuffer;
          if (eof) 
            zzPeek = false;
          else 
            zzPeek = zzBufferL[zzMarkedPosL] == '\n';
        }
        if (zzPeek) yyline--;
      }
      zzAction = -1;

      zzCurrentPosL = zzCurrentPos = zzStartRead = zzMarkedPosL;
  
      zzState = zzLexicalState;


      zzForAction: {
        while (true) {
    
          if (zzCurrentPosL < zzEndReadL)
            zzInput = zzBufferL[zzCurrentPosL++];
          else if (zzAtEOF) {
            zzInput = YYEOF;
            break zzForAction;
          }
          else {
            // store back cached positions
            zzCurrentPos  = zzCurrentPosL;
            zzMarkedPos   = zzMarkedPosL;
            boolean eof = zzRefill();
            // get translated positions and possibly new buffer
            zzCurrentPosL  = zzCurrentPos;
            zzMarkedPosL   = zzMarkedPos;
            zzBufferL      = zzBuffer;
            zzEndReadL     = zzEndRead;
            if (eof) {
              zzInput = YYEOF;
              break zzForAction;
            }
            else {
              zzInput = zzBufferL[zzCurrentPosL++];
            }
          }
          int zzNext = zzTransL[ zzRowMapL[zzState] + zzCMapL[zzInput] ];
          if (zzNext == -1) break zzForAction;
          zzState = zzNext;

          int zzAttributes = zzAttrL[zzState];
          if ( (zzAttributes & 1) == 1 ) {
            zzAction = zzState;
            zzMarkedPosL = zzCurrentPosL;
            if ( (zzAttributes & 8) == 8 ) break zzForAction;
          }

        }
      }

      // store back cached position
      zzMarkedPos = zzMarkedPosL;

      switch (zzAction < 0 ? zzAction : ZZ_ACTION[zzAction]) {
        case 6: 
          { if(_DEBUG)
                          System.out.println("S: " + yytext());
                          return symbol(sym.S);
          }
        case 16: break;
        case 1: 
          { System.out.println("SCANNER ERROR: " + yytext());
          }
        case 17: break;
        case 3: 
          { if(_DEBUG)
                          System.out.println("C: " + yytext());
                          return symbol(sym.C);
          }
        case 18: break;
        case 7: 
          { if(_DEBUG)
                          System.out.println("TIME: " + yytext());
                          return symbol(sym.TIME);
          }
        case 19: break;
        case 9: 
          { if(_DEBUG)
                          System.out.println("BITRATE: " + yytext());
                          return symbol(sym.BITRATE);
          }
        case 20: break;
        case 5: 
          { if(_DEBUG)
                          System.out.println("CM: " + yytext());
                          return symbol(sym.CM);
          }
        case 21: break;
        case 11: 
          { if(_DEBUG)
                          System.out.println("TIME STAMP: " + yytext());
                          return symbol(sym.TIME_STAMP);
          }
        case 22: break;
        case 4: 
          { ;
          }
        case 23: break;
        case 15: 
          { if(_DEBUG)
                          System.out.println("DATE STAMP: " + yytext());
                          return symbol(sym.DATE_STAMP);
          }
        case 24: break;
        case 14: 
          { if(_DEBUG)
                          System.out.println("LIST: " + yytext());
                          return symbol(sym.LIST);
          }
        case 25: break;
        case 2: 
          { if(_DEBUG)
                          System.out.println("INT: " + yytext());
                          return symbol(sym.INT, new Integer(yytext()));
          }
        case 26: break;
        case 12: 
          { if(_DEBUG)
                          System.out.println("SERVER: " + yytext());
                          return symbol(sym.SERVER);
          }
        case 27: break;
        case 8: 
          { if(_DEBUG)
                          System.out.println("DATA: " + yytext());
                          return symbol(sym.DATA);
          }
        case 28: break;
        case 13: 
          { if(_DEBUG)
                          System.out.println("IP: " + yytext());
                          return symbol(sym.IP, new String(yytext()));
          }
        case 29: break;
        case 10: 
          { if(_DEBUG)
                          System.out.println("FILE: " + yytext());
                          return symbol(sym.FILE, new String(yytext()));
          }
        case 30: break;
        default: 
          if (zzInput == YYEOF && zzStartRead == zzCurrentPos) {
            zzAtEOF = true;
            zzDoEOF();
              { return new java_cup.runtime.Symbol(sym.EOF); }
          } 
          else {
            zzScanError(ZZ_NO_MATCH);
          }
      }
    }
  }


}
