unit uTST_dAimWW_CommonSET;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses testregistry, uTST_dAim__coreTestCase,
  dAimWW;

type
 tTST_dAimWW_core=class(tTST_dAim__coreTestCase)
  public
    constructor Create; override;
  end;

type //-------------------------------------------------------------------------
 tTST_dAimWW_Base=class(tTST_dAimWW_core)
  published
    procedure INITialize_fromNIL;
    procedure INITialize_fromSomething;
  published
    procedure FINALize_fromNIL;
    procedure FINALize_fromManual;
  published
    procedure INITialize_Count;
    procedure INITialize_defValue;
  published
    procedure getLength_fromNIL;
    procedure getLength;
  published
    procedure clc_pItem;
    procedure get_pItem;
  end;

type //-------------------------------------------------------------------------
 tTST_dAimWW_core_numbering=class(tTST_dAimWW_core)
  protected
    procedure SetUp; override;
  end;

type //-------------------------------------------------------------------------

 tTST_dAimWW_setLength_common=class(tTST_dAimWW_core_numbering)
  published
    procedure forNilArray;
    procedure count_less;
    procedure count_more;
  end;

 tTST_dAimWW_setLength_defVAL=class(tTST_dAimWW_core_numbering)
  published
    procedure forNilArray;
    procedure count_less;
    procedure count_more;
  end;

type //-------------------------------------------------------------------------

 tTST_dAimWW_itemsADD_common_toBegin=class(tTST_dAimWW_core_numbering)
  published
    procedure forNilArray;
    procedure count_0_element;
    procedure count_1_element;
    procedure count_random;
  end;

 tTST_dAimWW_itemsADD_common_toMiddle=class(tTST_dAimWW_core_numbering)
  published
    procedure forNilArray;
    procedure count_0_element;
    procedure count_1_element;
    procedure count_random;
  end;

 tTST_dAimWW_itemsADD_common_toEND=class(tTST_dAimWW_core_numbering)
  published
    procedure count_0_element;
    procedure count_1_element;
    procedure count_random;
  end;

 tTST_dAimWW_itemsADD_defVAL_toBegin=class(tTST_dAimWW_core_numbering)
  published
    procedure forNilArray;
    procedure count_0_element;
    procedure count_1_element;
    procedure count_random;
  end;

 tTST_dAimWW_itemsADD_defVAL_toMiddle=class(tTST_dAimWW_core_numbering)
  published
    procedure forNilArray;
    procedure count_0_element;
    procedure count_1_element;
    procedure count_random;
  end;

 tTST_dAimWW_itemsADD_defVAL_toEND=class(tTST_dAimWW_core_numbering)
  published
    procedure count_0_element;
    procedure count_1_element;
    procedure count_random;
  end;

type //-------------------------------------------------------------------------

 tTST_dAimWW_itemsDEL_fromBegin=class(tTST_dAimWW_core_numbering)
  published
    procedure count_0_element;
    procedure count_1_element;
    procedure count_lessLength;
    procedure count_Length;
    procedure count_moreLength;
  end;

 tTST_dAimWW_itemsDEL_fromEnd=class(tTST_dAimWW_core_numbering)
  published
    procedure count_0_element;
    procedure count_1_element;
    procedure count_lessLength;
  end;

 tTST_dAimWW_itemsDEL_fromMiddle=class(tTST_dAimWW_core_numbering)
  published
    procedure count_0_element;
    procedure count_1_element;
    procedure count_less_thenEnd;
    procedure count_more_thenEnd;
  end;

type //-------------------------------------------------------------------------

 tTST_dAimWW_FIND=class(tTST_dAimWW_core_numbering)
  published
    procedure noExistingValue;
    procedure AllExistingValue;
  end;

implementation
//------------------------------------------------------------------------------
const cTST_SuitePath=cTest__dAim__SuitePath+'.[Word][Word]CommonSET';
type  tTST_tDefValue=Word;
//------------------------------------------------------------------------------

constructor tTST_dAimWW_core.Create;
begin
    inherited;
   _lngSizeOf_:=2;
   _itmSizeOf_:=2;
end;

//------------------------------------------------------------------------------

procedure tTST_dAimWW_Base.INITialize_fromNIL;
begin
    //---!!!---
    dAimWW_INITialize(dAIM);
    //---!!!---
    AssertNull(dAIM);
end;

procedure tTST_dAimWW_Base.INITialize_fromSomething;
begin
    dAIM:=self;
    //---!!!---
    dAimWW_INITialize(dAIM);
    //---!!!---
    AssertNull(dAIM);
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

procedure tTST_dAimWW_Base.FINALize_fromNIL;
begin
    //---!!!---
    dAimWW_FINALize(dAIM);
    //---!!!---
    AssertNull(dAIM);
end;

procedure tTST_dAimWW_Base.FINALize_fromManual;
begin
    dAIM:=_MANUAL_dAIM_create(16+random(16));
    //---!!!---
    dAimWW_FINALize(dAIM);
    //---!!!---
    AssertNull(dAIM);
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

procedure tTST_dAimWW_Base.INITialize_Count;
var l:byte;
begin
    l:=16+random(16);
    //---!!!---
    dAimWW_INITialize(dAIM,l);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l,_MANUAL_dAIM_Length(dAIM));
end;

procedure tTST_dAimWW_Base.INITialize_defValue;
var l:byte;
  def:tTST_tDefValue;
    i:integer;
begin
    l:=16+random(16);
    def:=222;
    //---!!!---
    dAimWW_INITialize(dAIM,l,def);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,def);
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

procedure tTST_dAimWW_Base.getLength_fromNIL;
begin
    AssertEquals(0,dAimWW_getLength(dAIM));
end;

procedure tTST_dAimWW_Base.getLength;
var l:byte;
begin
    l:=16+random(16);
    dAIM:=_MANUAL_dAIM_create(l);
    //---!!!---
    AssertEquals(l,dAimWW_getLength(dAIM));
    //---!!!---
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

procedure tTST_dAimWW_Base.clc_pItem;
var l:byte;
    i:integer;
begin
    l:=16+random(16);
    dAIM:=_MANUAL_dAIM_create(l);
    //---!!!---
    for i:=0 to l-1 do
    AssertSame('wrong from range',_MANUAL_dAIM_pItem(dAIM,i),dAimWW_clc_pItem(dAIM,i));
    AssertSame('wrong from OUT'  ,_MANUAL_dAIM_pItem(dAIM,l),dAimWW_clc_pItem(dAIM,l));
    //---!!!---
end;

procedure tTST_dAimWW_Base.get_pItem;
var l:byte;
    i:integer;
begin
    l:=16+random(16);
    dAIM:=_MANUAL_dAIM_create(l);
    //---!!!---
    AssertSame('wrong from NIL'  , NIL,dAimWW_get_pItem(NIL,l));
    for i:=0 to l-1 do
    AssertSame('wrong from range',_MANUAL_dAIM_pItem(dAIM,i),dAimWW_get_pItem(dAIM,i));
    AssertSame('wrong from OUT'  ,_MANUAL_dAIM_pItem(dAIM,l),dAimWW_clc_pItem(dAIM,l));
    //---!!!---
end;

// -^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-

procedure tTST_dAimWW_core_numbering.SetUp;
begin
    dAimWW_INITialize (dAIM,64+random(16));
   _MANUAL_dAIM_nmbr01(dAIM);
end;

// -^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-

procedure tTST_dAimWW_setLength_common.forNilArray;
var l:integer;
begin
   _MANUAL_dAIM_FINAL(dAIM);
    l:=64+random(16);
    //---!!!---
    dAimWW_setLength(dAIM,l);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l,_MANUAL_dAIM_Length(dAIM));
end;

procedure tTST_dAimWW_setLength_common.count_less;
var l,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    l:=1+random(l div 4)+random(l div 2);
    //---!!!---
    dAimWW_setLength(dAIM,l);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
end;

procedure tTST_dAimWW_setLength_common.count_more;
var l,k,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    k:=1+random(16);
    //---!!!---
    dAimWW_setLength(dAIM,l+k);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l+k,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
end;

//------------------------------------------------------------------------------

procedure tTST_dAimWW_setLength_defVAL.forNilArray;
var l,i:integer;
    def:tTST_tDefValue;
begin
   _MANUAL_dAIM_FINAL(dAIM);
    l:=64+random(16);
    def:=222;
    //---!!!---
    dAimWW_setLength(dAIM,l,def);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,def);
end;

procedure tTST_dAimWW_setLength_defVAL.count_less;
var l,i:integer;
    def:tTST_tDefValue;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    l:=1+random(l div 4)+random(l div 2);
    def:=222;
    //---!!!---
    dAimWW_setLength(dAIM,l,DEF);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
end;

procedure tTST_dAimWW_setLength_defVAL.count_more;
var l,k,i:integer;
    def  :tTST_tDefValue;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    k:=1+random(16);
    def:=222;
    //---!!!---
    dAimWW_setLength(dAIM,l+k,DEF);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l+k,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
    for i:=l to l+k-1 do _MANUAL_dAIM_tstVAL(dAIM,i,DEF);
end;

// -^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-

procedure tTST_dAimWW_itemsADD_common_toBegin.forNilArray;
var l:integer;
begin
   _MANUAL_dAIM_FINAL(dAIM);
    l:=64+random(16);
    //---!!!---
    dAimWW_itemsADD(dAIM,0,l);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l,_MANUAL_dAIM_Length(dAIM));
end;

procedure tTST_dAimWW_itemsADD_common_toBegin.count_0_element;
var l,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    //---!!!---
    dAimWW_itemsADD(dAIM,0,0);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
end;

procedure tTST_dAimWW_itemsADD_common_toBegin.count_1_element;
var l,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    //---!!!---
    dAimWW_itemsADD(dAIM,0,1);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l+1,_MANUAL_dAIM_Length(dAIM));
    for i:=1 to l do _MANUAL_dAIM_tstVAL(dAIM,i,i-1);
end;

procedure tTST_dAimWW_itemsADD_common_toBegin.count_random;
var l,c,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    c:=1+random(16);
    //---!!!---
    dAimWW_itemsADD(dAIM,0,c);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l+c,_MANUAL_dAIM_Length(dAIM));
    for i:=c to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i-c);
end;

//------------------------------------------------------------------------------

procedure tTST_dAimWW_itemsADD_common_toMiddle.forNilArray;
var k,c:integer;
begin
   _MANUAL_dAIM_FINAL(dAIM);
    k:=1 +random(16);
    c:=64+random(16);
    //---!!!---
    dAimWW_itemsADD(dAIM,k,c);
    //---!!!---
    AssertEquals('wrong "LENGTH"',k+c,_MANUAL_dAIM_Length(dAIM));
end;

procedure tTST_dAimWW_itemsADD_common_toMiddle.count_0_element;
var l,k,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    k:=1 +random(l div 2);
    //---!!!---
    dAimWW_itemsADD(dAIM,k,0);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
end;

procedure tTST_dAimWW_itemsADD_common_toMiddle.count_1_element;
var l,k,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    k:=1 +random(l div 2);
    //---!!!---
    dAimWW_itemsADD(dAIM,k,1);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l+1,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to k-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
    for i:=k+1 to k-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i-1);
end;

procedure tTST_dAimWW_itemsADD_common_toMiddle.count_random;
var l,c,k,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    k:=1+random(l div 2);
    c:=1+random(16);
    //---!!!---
    dAimWW_itemsADD(dAIM,k,c);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l+c,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to k-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
    for i:=k+c to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i-c);
end;

//------------------------------------------------------------------------------

procedure tTST_dAimWW_itemsADD_common_toEND.count_0_element;
var l,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    //---!!!---
    dAimWW_itemsADD(dAIM,l,0);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
end;

procedure tTST_dAimWW_itemsADD_common_toEND.count_1_element;
var l,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    //---!!!---
    dAimWW_itemsADD(dAIM,l,1);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l+1,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
end;

procedure tTST_dAimWW_itemsADD_common_toEND.count_random;
var l,c,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    c:=1+random(16);
    //---!!!---
    dAimWW_itemsADD(dAIM,l,c);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l+c,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
end;

//------------------------------------------------------------------------------

procedure tTST_dAimWW_itemsADD_defVAL_toBegin.forNilArray;
var l,i:integer;
    def:tTST_tDefValue;
begin
    def:=222;
   _MANUAL_dAIM_FINAL(dAIM);
    l:=64+random(16);
    //---!!!---
    dAimWW_itemsADD(dAIM,0,l,def);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,l-1,def);
end;

procedure tTST_dAimWW_itemsADD_defVAL_toBegin.count_0_element;
var l,i:integer;
    def:tTST_tDefValue;
begin
    def:=222;
    l:=_MANUAL_dAIM_Length(dAIM);
    //---!!!---
    dAimWW_itemsADD(dAIM,0,0,def);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
end;

procedure tTST_dAimWW_itemsADD_defVAL_toBegin.count_1_element;
var l,i:integer;
    def:tTST_tDefValue;
begin
    def:=222;
    l:=_MANUAL_dAIM_Length(dAIM);
    //---!!!---
    dAimWW_itemsADD(dAIM,0,1,def);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l+1,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to 1-1 do _MANUAL_dAIM_tstVAL(dAIM,i,def);
    for i:=1 to l   do _MANUAL_dAIM_tstVAL(dAIM,i,i-1);
end;

procedure tTST_dAimWW_itemsADD_defVAL_toBegin.count_random;
var l,c,i:integer;
    def:tTST_tDefValue;
begin
    def:=222;
    l:=_MANUAL_dAIM_Length(dAIM);
    c:=1+random(16);
    //---!!!---
    dAimWW_itemsADD(dAIM,0,c,def);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l+c,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to c-1 do _MANUAL_dAIM_tstVAL(dAIM,i,def);
    for i:=c to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i-c);
end;

//------------------------------------------------------------------------------

procedure tTST_dAimWW_itemsADD_defVAL_toMiddle.forNilArray;
var k,c,i:integer;
    def:tTST_tDefValue;
begin
    def:=222;
   _MANUAL_dAIM_FINAL(dAIM);
    k:=1 +random(16);
    c:=64+random(16);
    //---!!!---
    dAimWW_itemsADD(dAIM,k,c,def);
    //---!!!---
    AssertEquals('wrong "LENGTH"',k+c,_MANUAL_dAIM_Length(dAIM));
    for i:=k to k+c-1 do _MANUAL_dAIM_tstVAL(dAIM,i,def);
end;

procedure tTST_dAimWW_itemsADD_defVAL_toMiddle.count_0_element;
var l,k,i:integer;
    def:tTST_tDefValue;
begin
    def:=222;
    l:=_MANUAL_dAIM_Length(dAIM);
    k:=1 +random(l div 2);
    //---!!!---
    dAimWW_itemsADD(dAIM,k,0,def);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
end;

procedure tTST_dAimWW_itemsADD_defVAL_toMiddle.count_1_element;
var l,k,i:integer;
    def:tTST_tDefValue;
begin
    def:=222;
    l:=_MANUAL_dAIM_Length(dAIM);
    k:=1 +random(l div 2);
    //---!!!---
    dAimWW_itemsADD(dAIM,k,1,def);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l+1,_MANUAL_dAIM_Length(dAIM));
    for i:=0   to k-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
    for i:=k   to k   do _MANUAL_dAIM_tstVAL(dAIM,i,def);
    for i:=k+1 to k-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i-1);
end;

procedure tTST_dAimWW_itemsADD_defVAL_toMiddle.count_random;
var l,c,k,i:integer;
    def:tTST_tDefValue;
begin
    def:=222;
    l:=_MANUAL_dAIM_Length(dAIM);
    k:=1+random(l div 2);
    c:=1+random(16);
    //---!!!---
    dAimWW_itemsADD(dAIM,k,c,def);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l+c,_MANUAL_dAIM_Length(dAIM));
    for i:=0   to k-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
    for i:=k to k+c-1 do _MANUAL_dAIM_tstVAL(dAIM,i,def);
    for i:=k+c to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i-c);
end;

//------------------------------------------------------------------------------

procedure tTST_dAimWW_itemsADD_defVAL_toEND.count_0_element;
var l,i:integer;
    def:tTST_tDefValue;
begin
    def:=222;
    l:=_MANUAL_dAIM_Length(dAIM);
    //---!!!---
    dAimWW_itemsADD(dAIM,l,0,def);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
end;

procedure tTST_dAimWW_itemsADD_defVAL_toEND.count_1_element;
var l,i:integer;
    def:tTST_tDefValue;
begin
    def:=222;
    l:=_MANUAL_dAIM_Length(dAIM);
    //---!!!---
    dAimWW_itemsADD(dAIM,l,1,def);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l+1,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
    for i:=l to l   do _MANUAL_dAIM_tstVAL(dAIM,i,def);
end;

procedure tTST_dAimWW_itemsADD_defVAL_toEND.count_random;
var l,c,i:integer;
    def:tTST_tDefValue;
begin
    def:=222;
    l:=_MANUAL_dAIM_Length(dAIM);
    c:=1+random(16);
    //---!!!---
    dAimWW_itemsADD(dAIM,l,c,def);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l+c,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
    for i:=l to l+c-1 do _MANUAL_dAIM_tstVAL(dAIM,i,def);
end;

// -^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-

procedure tTST_dAimWW_itemsDEL_fromBegin.count_0_element;
var l,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    //---!!!---
    dAimWW_itemsDEL(dAIM,0,0);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
end;

procedure tTST_dAimWW_itemsDEL_fromBegin.count_1_element;
var l,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    //---!!!---
    dAimWW_itemsDEL(dAIM,0,1);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l-1,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-2 do _MANUAL_dAIM_tstVAL(dAIM,i,i+1);
end;

procedure tTST_dAimWW_itemsDEL_fromBegin.count_lessLength;
var l,k,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    k:=random(l div 2)+1;
    //---!!!---
    dAimWW_itemsDEL(dAIM,0,k);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l-k,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-k-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i+k);
end;

procedure tTST_dAimWW_itemsDEL_fromBegin.count_Length;
var l:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    //---!!!---
    dAimWW_itemsDEL(dAIM,0,l);
    //---!!!---
    AssertNull(dAIM);
end;

procedure tTST_dAimWW_itemsDEL_fromBegin.count_moreLength;
var l:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    //---!!!---
    dAimWW_itemsDEL(dAIM,0,l+1);
    //---!!!---
    AssertNull(dAIM);
end;

//------------------------------------------------------------------------------

procedure tTST_dAimWW_itemsDEL_fromEND.count_0_element;
var l,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    //---!!!---
    dAimWW_itemsDEL(dAIM,l-1,0);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
end;

procedure tTST_dAimWW_itemsDEL_fromEND.count_1_element;
var l,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    //---!!!---
    dAimWW_itemsDEL(dAIM,l-1,1);
    //---
    AssertEquals('wrong "LENGTH"',l-1,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-2 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
end;

procedure tTST_dAimWW_itemsDEL_fromEND.count_lessLength;
var l,k,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    k:=random(l div 2)+1;
    //---!!!---
    dAimWW_itemsDEL(dAIM,l-k,k);
    //---
    AssertEquals('wrong "LENGTH"',l-k,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-k-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
end;

//------------------------------------------------------------------------------

procedure tTST_dAimWW_itemsDEL_fromMiddle.count_0_element;
var l,k,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    k:=1+random(l div 4)+random(l div 2); // место удаляемого
    //---!!!---
    dAimWW_itemsDEL(dAIM,k,0);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
end;

procedure tTST_dAimWW_itemsDEL_fromMiddle.count_1_element;
var l,k,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    k:=1+random(l div 4)+random(l div 2); // место удаляемого
    //---!!!---
    dAimWW_itemsDEL(dAIM,k,1);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l-1,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to k-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i+0);
    for i:=k to l-2 do _MANUAL_dAIM_tstVAL(dAIM,i,i+1);
end;

procedure tTST_dAimWW_itemsDEL_fromMiddle.count_less_thenEnd;
var l,k,c,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    k:=1+random(l div 4)+random(l div 2); // место удаляемого
    c:=1+random((l-k)div 2);              // кол-во удаляемого
    //---!!!---
    dAimWW_itemsDEL(dAIM,k,c);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l-c,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to k-1   do _MANUAL_dAIM_tstVAL(dAIM,i,i+0);
    for i:=k to l-c-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i+c);
end;

procedure tTST_dAimWW_itemsDEL_fromMiddle.count_more_thenEnd;
var l,k,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    k:=1+random(l div 4)+random(l div 2); // место удаляемого
    //---!!!---
    dAimWW_itemsDEL(dAIM,k,l);
    //---!!!---
    AssertEquals('wrong "LENGTH"',k,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to k-1   do _MANUAL_dAIM_tstVAL(dAIM,i,i+0);
end;

//------------------------------------------------------------------------------

procedure tTST_dAimWW_FIND.noExistingValue;
var l:integer;
    i:Word;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    //---!!!---
    AssertFalse(dAimWW_fnd_Value(dAIM,l,i));
    //---!!!---
end;

procedure tTST_dAimWW_FIND.AllExistingValue;
var l:integer;
    i:Word;
    j:tTST_tDefValue;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    //---!!!---
    for j:=0 to l-1 do begin
        AssertTrue  ('wrong FIND',dAimWW_fnd_Value(dAIM,j,i));
        AssertEquals('wrong FIND place',j,i);
    end;
    //---!!!---
end;

initialization
    RegisterTest(cTST_SuitePath,tTST_dAimWW_Base);

    RegisterTest(cTST_SuitePath+'.setLength',tTST_dAimWW_setLength_common);
    RegisterTest(cTST_SuitePath+'.setLength',tTST_dAimWW_setLength_defVAL);

    RegisterTest(cTST_SuitePath+'.itemsADD' ,tTST_dAimWW_itemsADD_common_toBegin);
    RegisterTest(cTST_SuitePath+'.itemsADD' ,tTST_dAimWW_itemsADD_common_toMiddle);
    RegisterTest(cTST_SuitePath+'.itemsADD' ,tTST_dAimWW_itemsADD_common_toEND);

    RegisterTest(cTST_SuitePath+'.itemsADD' ,tTST_dAimWW_itemsADD_defVAL_toBegin);
    RegisterTest(cTST_SuitePath+'.itemsADD' ,tTST_dAimWW_itemsADD_defVAL_toMiddle);
    RegisterTest(cTST_SuitePath+'.itemsADD' ,tTST_dAimWW_itemsADD_defVAL_toEND);

    RegisterTest(cTST_SuitePath+'.itemsDEL' ,tTST_dAimWW_itemsDEL_fromBegin);
    RegisterTest(cTST_SuitePath+'.itemsDEL' ,tTST_dAimWW_itemsDEL_fromMiddle);
    RegisterTest(cTST_SuitePath+'.itemsDEL' ,tTST_dAimWW_itemsDEL_fromEnd);

    RegisterTest(cTST_SuitePath+'.FIND'     ,tTST_dAimWW_FIND);
end.


