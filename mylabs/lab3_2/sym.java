
//----------------------------------------------------
// The following code was generated by CUP v0.10k
// Sun Jun 18 16:52:37 CEST 2017
//----------------------------------------------------

/** CUP generated class containing symbol constants. */
public class sym {
  /* terminals */
  public static final int INT = 6;
  public static final int DATE = 16;
  public static final int LETTER = 12;
  public static final int CM = 14;
  public static final int S = 15;
  public static final int LI = 8;
  public static final int CL = 5;
  public static final int EOF = 0;
  public static final int ARROW = 3;
  public static final int SEP = 13;
  public static final int BO = 9;
  public static final int AV = 10;
  public static final int ISBN = 4;
  public static final int SO = 11;
  public static final int error = 1;
  public static final int LS = 7;
  public static final int NAME = 2;
public String[] TT;
	public sym(){
		TT = new String[100];
		TT[6]=new String("INT");
		TT[16]=new String("DATE");
		TT[12]=new String("LETTER");
		TT[14]=new String("CM");
		TT[15]=new String("S");
		TT[8]=new String("LI");
		TT[5]=new String("CL");
		TT[0]=new String("EOF");
		TT[3]=new String("ARROW");
		TT[13]=new String("SEP");
		TT[9]=new String("BO");
		TT[10]=new String("AV");
		TT[4]=new String("ISBN");
		TT[11]=new String("SO");
		TT[1]=new String("error");
		TT[7]=new String("LS");
		TT[2]=new String("NAME");
	}
public String getTT(int i){return TT[i];}
}