unit uTST_dAimB_core_Base;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses testregistry,
  dAim_CountB,
  uTST_dAimB_core__coreTestCase;

type

 tTST_dAimB_core_Base=class(tTST_dAimB_core__coreTestCase)
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
    procedure get_pItem_fromNIL;
    procedure get_pItem;
  end;


 tTST_dAimB_setLength=class(tTST_dAimB_core__coreTestCase)
  protected
    procedure SetUp; override;
  end;

 tTST_dAimB_setLength_common=class(tTST_dAimB_setLength)
  published
    procedure forNilArray;
    procedure count_less;
    procedure count_more;
  end;

 tTST_dAimB_setLength_defVAL=class(tTST_dAimB_setLength)
  published
    procedure forNilArray;
    procedure count_less;
    procedure count_more;
  end;


 tTST_dAimB_itemsADD=class(tTST_dAimB_core__coreTestCase)
  protected
    procedure SetUp; override;
  end;

 tTST_dAimB_itemsADD_common_toBegin=class(tTST_dAimB_itemsADD)
  published
    procedure forNilArray;
    procedure count_0_element;
    procedure count_1_element;
    procedure count_random;
  end;

 tTST_dAimB_itemsADD_common_toMiddle=class(tTST_dAimB_itemsADD)
  published
    procedure forNilArray;
    procedure count_0_element;
    procedure count_1_element;
    procedure count_random;
  end;

 tTST_dAimB_itemsADD_common_toEND=class(tTST_dAimB_itemsADD)
  published
    procedure count_0_element;
    procedure count_1_element;
    procedure count_random;
  end;

 tTST_dAimB_itemsADD_defVAL_toBegin=class(tTST_dAimB_itemsADD)
  published
    procedure forNilArray;
    procedure count_0_element;
    procedure count_1_element;
    procedure count_random;
  end;

 tTST_dAimB_itemsADD_defVAL_toMiddle=class(tTST_dAimB_itemsADD)
  published
    procedure forNilArray;
    procedure count_0_element;
    procedure count_1_element;
    procedure count_random;
  end;

 tTST_dAimB_itemsADD_defVAL_toEND=class(tTST_dAimB_itemsADD)
  published
    procedure count_0_element;
    procedure count_1_element;
    procedure count_random;
  end;


 tTST_dAimB_itemsDEL=class(tTST_dAimB_core__coreTestCase)
  protected
    procedure SetUp; override;
  end;

 tTST_dAimB_itemsDEL_fromBegin=class(tTST_dAimB_itemsDEL)
  published
    procedure count_0_element;
    procedure count_1_element;
    procedure count_lessLength;
    procedure count_Length;
    procedure count_moreLength;
  end;

 tTST_dAimB_itemsDEL_fromEnd=class(tTST_dAimB_itemsDEL)
  published
    procedure count_0_element;
    procedure count_1_element;
    procedure count_lessLength;
  end;

 tTST_dAimB_itemsDEL_fromMiddle=class(tTST_dAimB_itemsDEL)
  published
    procedure count_0_element;
    procedure count_1_element;
    procedure count_less_thenEnd;
    procedure count_more_thenEnd;
  end;


implementation

procedure tTST_dAimB_core_Base.INITialize_fromNIL;
begin
    dAimB_INITialize(dAIM);
    AssertNull(dAIM);
end;

procedure tTST_dAimB_core_Base.INITialize_fromSomething;
begin
    dAIM:=self;
    dAimB_INITialize(dAIM);
    AssertNull(dAIM);
end;

//------------------------------------------------------------------------------

procedure tTST_dAimB_core_Base.FINALize_fromNIL;
begin
    dAimB_INITialize(dAIM);
    dAimB_FINALize  (dAIM,_itmSizeOf_);
    AssertNull(dAIM);
end;

procedure tTST_dAimB_core_Base.FINALize_fromManual;
begin
    dAIM:=_MANUAL_dAIM_create(16+random(16));
    dAimB_FINALize  (dAIM,_itmSizeOf_);
    AssertNull(dAIM);
end;

//------------------------------------------------------------------------------

procedure tTST_dAimB_core_Base.INITialize_Count;
var l:byte;
begin
    l:=16+random(16);
    dAimB_INITialize(dAIM,l,_itmSizeOf_);
    //---
    AssertEquals(l,_MANUAL_dAIM_Length(dAIM));
end;

procedure tTST_dAimB_core_Base.INITialize_defValue;
var l:byte;
  def:byte;
    i:integer;
begin
    l:=16+random(16);
    def:=222;
    dAimB_INITialize(dAIM,l,_itmSizeOf_,@def);
    //---
    AssertEquals(l,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to _MANUAL_dAIM_Length(dAIM)-1 do begin
        _MANUAL_dAIM_tstVAL(dAIM,i,def);
    end;
end;

//------------------------------------------------------------------------------

procedure tTST_dAimB_core_Base.getLength_fromNIL;
begin
    AssertEquals(0,dAimB_getLength(dAIM));
end;

procedure tTST_dAimB_core_Base.getLength;
var l:byte;
begin
    l:=16+random(16);
    dAimB_INITialize(dAIM,l,_itmSizeOf_);
    //---
    AssertEquals(l,dAimB_getLength(dAIM));
end;

//------------------------------------------------------------------------------

procedure tTST_dAimB_core_Base.clc_pItem;
var l:byte;
    i:integer;
begin
    l:=16+random(16);
    dAimB_INITialize(dAIM,l,_itmSizeOf_);
    //---
    for i:=0 to l-1 do begin
      AssertSame(_MANUAL_dAIM_pItem(dAIM,i),dAimB_clc_pItem(dAIM,i,_lngSizeOf_));
    end;
    AssertSame(_MANUAL_dAIM_pItem(dAIM,l),dAimB_clc_pItem(dAIM,l,_lngSizeOf_));
end;

procedure tTST_dAimB_core_Base.get_pItem_fromNIL;
begin
    AssertNull(dAimB_get_pItem(NIL,random(255),_lngSizeOf_));
end;

procedure tTST_dAimB_core_Base.get_pItem;
var l:byte;
    i:integer;
begin
    l:=16+random(16);
    dAimB_INITialize(dAIM,l,_itmSizeOf_);
    //---
    for i:=0 to l-1 do begin
      AssertSame(dAimB_clc_pItem(dAIM,i,_lngSizeOf_),dAimB_get_pItem(dAIM,i,_lngSizeOf_));
    end;
    AssertNull(dAimB_get_pItem(dAIM,l,_lngSizeOf_));
end;

// -^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-

procedure tTST_dAimB_setLength.SetUp;
begin
    dAimB_INITialize  (dAIM,64+random(16),_itmSizeOf_);
   _MANUAL_dAIM_number(dAIM);
end;

//------------------------------------------------------------------------------

procedure tTST_dAimB_setLength_common.forNilArray;
var l:integer;
begin
   _MANUAL_dAIM_FINAL(dAIM);
    l:=64+random(16);
    //---!!!---
    dAimB_setLength(dAIM,l,_itmSizeOf_);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l,_MANUAL_dAIM_Length(dAIM));
end;

procedure tTST_dAimB_setLength_common.count_less;
var l,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    l:=1+random(l div 4)+random(l div 2);
    //---!!!---
    dAimB_setLength(dAIM,l,_itmSizeOf_);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
end;

procedure tTST_dAimB_setLength_common.count_more;
var l,k,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    k:=1+random(16);
    //---!!!---
    dAimB_setLength(dAIM,l+k,_itmSizeOf_);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l+k,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
end;

//------------------------------------------------------------------------------

procedure tTST_dAimB_setLength_defVAL.forNilArray;
var l,i:integer;
    def:byte;
begin
   _MANUAL_dAIM_FINAL(dAIM);
    l:=64+random(16);
    def:=222;
    //---!!!---
    dAimB_setLength(dAIM,l,_itmSizeOf_,@def);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,def);

end;

procedure tTST_dAimB_setLength_defVAL.count_less;
var l,i:integer;
    def:byte;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    l:=1+random(l div 4)+random(l div 2);
    def:=222;
    //---!!!---
    dAimB_setLength(dAIM,l,_itmSizeOf_,@DEF);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
end;

procedure tTST_dAimB_setLength_defVAL.count_more;
var l,k,i:integer;
    def  :byte;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    k:=1+random(16);
    def:=222;
    //---!!!---
    dAimB_setLength(dAIM,l+k,_itmSizeOf_,@DEF);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l+k,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
    for i:=l to l+k-1 do _MANUAL_dAIM_tstVAL(dAIM,i,DEF);
end;

// -^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-

procedure tTST_dAimB_itemsADD.SetUp;
begin
    dAimB_INITialize  (dAIM,64+random(16),_itmSizeOf_);
   _MANUAL_dAIM_number(dAIM);
end;

//------------------------------------------------------------------------------

procedure tTST_dAimB_itemsADD_common_toBegin.forNilArray;
var l,i:integer;
begin
   _MANUAL_dAIM_FINAL(dAIM);
    l:=64+random(16);
    //---!!!---
    dAimB_itemsADD(dAIM,0,l,_itmSizeOf_);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l,_MANUAL_dAIM_Length(dAIM));
end;

procedure tTST_dAimB_itemsADD_common_toBegin.count_0_element;
var l,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    //---!!!---
    dAimB_itemsADD(dAIM,0,0,_itmSizeOf_);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
end;

procedure tTST_dAimB_itemsADD_common_toBegin.count_1_element;
var l,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    //---!!!---
    dAimB_itemsADD(dAIM,0,1,_itmSizeOf_);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l+1,_MANUAL_dAIM_Length(dAIM));
    for i:=1 to l do _MANUAL_dAIM_tstVAL(dAIM,i,i-1);
end;

procedure tTST_dAimB_itemsADD_common_toBegin.count_random;
var l,c,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    c:=1+random(16);
    //---!!!---
    dAimB_itemsADD(dAIM,0,c,_itmSizeOf_);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l+c,_MANUAL_dAIM_Length(dAIM));
    for i:=c to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i-c);
end;

//------------------------------------------------------------------------------

procedure tTST_dAimB_itemsADD_common_toMiddle.forNilArray;
var k,c,i:integer;
begin
   _MANUAL_dAIM_FINAL(dAIM);
    k:=1 +random(16);
    c:=64+random(16);
    //---!!!---
    dAimB_itemsADD(dAIM,k,c,_itmSizeOf_);
    //---!!!---
    AssertEquals('wrong "LENGTH"',k+c,_MANUAL_dAIM_Length(dAIM));
end;

procedure tTST_dAimB_itemsADD_common_toMiddle.count_0_element;
var l,k,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    k:=1 +random(l div 2);
    //---!!!---
    dAimB_itemsADD(dAIM,k,0,_itmSizeOf_);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
end;

procedure tTST_dAimB_itemsADD_common_toMiddle.count_1_element;
var l,k,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    k:=1 +random(l div 2);
    //---!!!---
    dAimB_itemsADD(dAIM,k,1,_itmSizeOf_);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l+1,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to k-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
    for i:=k+1 to k-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i-1);
end;

procedure tTST_dAimB_itemsADD_common_toMiddle.count_random;
var l,c,k,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    k:=1+random(l div 2);
    c:=1+random(16);
    //---!!!---
    dAimB_itemsADD(dAIM,k,c,_itmSizeOf_);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l+c,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to k-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
    for i:=k+c to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i-c);
end;

//------------------------------------------------------------------------------

procedure tTST_dAimB_itemsADD_common_toEND.count_0_element;
var l,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    //---!!!---
    dAimB_itemsADD(dAIM,l,0,_itmSizeOf_);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
end;

procedure tTST_dAimB_itemsADD_common_toEND.count_1_element;
var l,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    //---!!!---
    dAimB_itemsADD(dAIM,l,1,_itmSizeOf_);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l+1,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
end;

procedure tTST_dAimB_itemsADD_common_toEND.count_random;
var l,c,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    c:=1+random(16);
    //---!!!---
    dAimB_itemsADD(dAIM,l,c,_itmSizeOf_);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l+c,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
end;

//------------------------------------------------------------------------------

procedure tTST_dAimB_itemsADD_defVAL_toBegin.forNilArray;
var l,i:integer;
    def:byte;
begin
    def:=222;
   _MANUAL_dAIM_FINAL(dAIM);
    l:=64+random(16);
    //---!!!---
    dAimB_itemsADD(dAIM,0,l,_itmSizeOf_,@def);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,def);
end;

procedure tTST_dAimB_itemsADD_defVAL_toBegin.count_0_element;
var l,i:integer;
    def:byte;
begin
    def:=222;
    l:=_MANUAL_dAIM_Length(dAIM);
    //---!!!---
    dAimB_itemsADD(dAIM,0,0,_itmSizeOf_,@def);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
end;

procedure tTST_dAimB_itemsADD_defVAL_toBegin.count_1_element;
var l,i:integer;
    def:byte;
begin
    def:=222;
    l:=_MANUAL_dAIM_Length(dAIM);
    //---!!!---
    dAimB_itemsADD(dAIM,0,1,_itmSizeOf_,@def);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l+1,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to 1-1 do _MANUAL_dAIM_tstVAL(dAIM,i,def);
    for i:=1 to l   do _MANUAL_dAIM_tstVAL(dAIM,i,i-1);
end;

procedure tTST_dAimB_itemsADD_defVAL_toBegin.count_random;
var l,c,i:integer;
    def:byte;
begin
    def:=222;
    l:=_MANUAL_dAIM_Length(dAIM);
    c:=1+random(16);
    //---!!!---
    dAimB_itemsADD(dAIM,0,c,_itmSizeOf_,@def);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l+c,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to c-1 do _MANUAL_dAIM_tstVAL(dAIM,i,def);
    for i:=c to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i-c);
end;

//------------------------------------------------------------------------------

procedure tTST_dAimB_itemsADD_defVAL_toMiddle.forNilArray;
var k,c,i:integer;
    def:byte;
begin
    def:=222;
   _MANUAL_dAIM_FINAL(dAIM);
    k:=1 +random(16);
    c:=64+random(16);
    //---!!!---
    dAimB_itemsADD(dAIM,k,c,_itmSizeOf_,@def);
    //---!!!---
    AssertEquals('wrong "LENGTH"',k+c,_MANUAL_dAIM_Length(dAIM));
    for i:=k to k+c-1 do _MANUAL_dAIM_tstVAL(dAIM,i,def);
end;

procedure tTST_dAimB_itemsADD_defVAL_toMiddle.count_0_element;
var l,k,i:integer;
    def:byte;
begin
    def:=222;
    l:=_MANUAL_dAIM_Length(dAIM);
    k:=1 +random(l div 2);
    //---!!!---
    dAimB_itemsADD(dAIM,k,0,_itmSizeOf_,@def);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
end;

procedure tTST_dAimB_itemsADD_defVAL_toMiddle.count_1_element;
var l,k,i:integer;
    def:byte;
begin
    def:=222;
    l:=_MANUAL_dAIM_Length(dAIM);
    k:=1 +random(l div 2);
    //---!!!---
    dAimB_itemsADD(dAIM,k,1,_itmSizeOf_,@def);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l+1,_MANUAL_dAIM_Length(dAIM));
    for i:=0   to k-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
    for i:=k   to k   do _MANUAL_dAIM_tstVAL(dAIM,i,def);
    for i:=k+1 to k-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i-1);
end;

procedure tTST_dAimB_itemsADD_defVAL_toMiddle.count_random;
var l,c,k,i:integer;
    def:byte;
begin
    def:=222;
    l:=_MANUAL_dAIM_Length(dAIM);
    k:=1+random(l div 2);
    c:=1+random(16);
    //---!!!---
    dAimB_itemsADD(dAIM,k,c,_itmSizeOf_,@def);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l+c,_MANUAL_dAIM_Length(dAIM));
    for i:=0   to k-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
    for i:=k to k+c-1 do _MANUAL_dAIM_tstVAL(dAIM,i,def);
    for i:=k+c to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i-c);
end;

//------------------------------------------------------------------------------

procedure tTST_dAimB_itemsADD_defVAL_toEND.count_0_element;
var l,i:integer;
    def:byte;
begin
    def:=222;
    l:=_MANUAL_dAIM_Length(dAIM);
    //---!!!---
    dAimB_itemsADD(dAIM,l,0,_itmSizeOf_,@def);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
end;

procedure tTST_dAimB_itemsADD_defVAL_toEND.count_1_element;
var l,i:integer;
    def:byte;
begin
    def:=222;
    l:=_MANUAL_dAIM_Length(dAIM);
    //---!!!---
    dAimB_itemsADD(dAIM,l,1,_itmSizeOf_,@def);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l+1,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
    for i:=l to l   do _MANUAL_dAIM_tstVAL(dAIM,i,def);
end;

procedure tTST_dAimB_itemsADD_defVAL_toEND.count_random;
var l,c,i:integer;
    def:byte;
begin
    def:=222;
    l:=_MANUAL_dAIM_Length(dAIM);
    c:=1+random(16);
    //---!!!---
    dAimB_itemsADD(dAIM,l,c,_itmSizeOf_,@def);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l+c,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
    for i:=l to l+c-1 do _MANUAL_dAIM_tstVAL(dAIM,i,def);
end;

// -^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-

procedure tTST_dAimB_itemsDEL.SetUp;
begin
    dAimB_INITialize  (dAIM,64+random(16),_itmSizeOf_);
   _MANUAL_dAIM_number(dAIM);
end;

//------------------------------------------------------------------------------

procedure tTST_dAimB_itemsDEL_fromBegin.count_0_element;
var l,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    //---!!!---
    dAimB_itemsDEL(dAIM,0,0,_itmSizeOf_);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
end;

procedure tTST_dAimB_itemsDEL_fromBegin.count_1_element;
var l,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    //---!!!---
    dAimB_itemsDEL(dAIM,0,1,_itmSizeOf_);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l-1,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-2 do _MANUAL_dAIM_tstVAL(dAIM,i,i+1);
end;

procedure tTST_dAimB_itemsDEL_fromBegin.count_lessLength;
var l,k,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    k:=random(l div 2)+1;
    //---!!!---
    dAimB_itemsDEL(dAIM,0,k,_itmSizeOf_);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l-k,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-k-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i+k);
end;

procedure tTST_dAimB_itemsDEL_fromBegin.count_Length;
var l:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    //---!!!---
    dAimB_itemsDEL(dAIM,0,l,_itmSizeOf_);
    //---!!!---
    AssertNull(dAIM);
end;

procedure tTST_dAimB_itemsDEL_fromBegin.count_moreLength;
var l:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    //---!!!---
    dAimB_itemsDEL(dAIM,0,l+1,_itmSizeOf_);
    //---!!!---
    AssertNull(dAIM);
end;

//------------------------------------------------------------------------------

procedure tTST_dAimB_itemsDEL_fromEND.count_0_element;
var l,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    //---!!!---
    dAimB_itemsDEL(dAIM,l-1,0,_itmSizeOf_);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
end;

procedure tTST_dAimB_itemsDEL_fromEND.count_1_element;
var l,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    //---!!!---
    dAimB_itemsDEL(dAIM,l-1,1,_itmSizeOf_);
    //---
    AssertEquals('wrong "LENGTH"',l-1,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-2 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
end;

procedure tTST_dAimB_itemsDEL_fromEND.count_lessLength;
var l,k,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    k:=random(l div 2)+1;
    //---!!!---
    dAimB_itemsDEL(dAIM,l-k,k,_itmSizeOf_);
    //---
    AssertEquals('wrong "LENGTH"',l-k,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-k-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
end;

//------------------------------------------------------------------------------

procedure tTST_dAimB_itemsDEL_fromMiddle.count_0_element;
var l,k,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    k:=1+random(l div 4)+random(l div 2); // место удаляемого
    //---!!!---
    dAimB_itemsDEL(dAIM,k,0,_itmSizeOf_);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to l-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i);
end;

procedure tTST_dAimB_itemsDEL_fromMiddle.count_1_element;
var l,k,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    k:=1+random(l div 4)+random(l div 2); // место удаляемого
    //---!!!---
    dAimB_itemsDEL(dAIM,k,1,_itmSizeOf_);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l-1,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to k-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i+0);
    for i:=k to l-2 do _MANUAL_dAIM_tstVAL(dAIM,i,i+1);
end;

procedure tTST_dAimB_itemsDEL_fromMiddle.count_less_thenEnd;
var l,k,c,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    k:=1+random(l div 4)+random(l div 2); // место удаляемого
    c:=1+random((l-k)div 2);              // кол-во удаляемого
    //---!!!---
    dAimB_itemsDEL(dAIM,k,c,_itmSizeOf_);
    //---!!!---
    AssertEquals('wrong "LENGTH"',l-c,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to k-1   do _MANUAL_dAIM_tstVAL(dAIM,i,i+0);
    for i:=k to l-c-1 do _MANUAL_dAIM_tstVAL(dAIM,i,i+c);
end;

procedure tTST_dAimB_itemsDEL_fromMiddle.count_more_thenEnd;
var l,k,i:integer;
begin
    l:=_MANUAL_dAIM_Length(dAIM);
    k:=1+random(l div 4)+random(l div 2); // место удаляемого
    //---!!!---
    dAimB_itemsDEL(dAIM,k,l,_itmSizeOf_);
    //---!!!---
    AssertEquals('wrong "LENGTH"',k,_MANUAL_dAIM_Length(dAIM));
    for i:=0 to k-1   do _MANUAL_dAIM_tstVAL(dAIM,i,i+0);
end;

initialization
    RegisterTest(cTest__dAimB_core__SuitePath,tTST_dAimB_core_Base);

    RegisterTest(cTest__dAimB_core__SuitePath+'.setLength',tTST_dAimB_setLength_common);
    RegisterTest(cTest__dAimB_core__SuitePath+'.setLength',tTST_dAimB_setLength_defVAL);

    RegisterTest(cTest__dAimB_core__SuitePath+'.itemsADD',tTST_dAimB_itemsADD_common_toBegin);
    RegisterTest(cTest__dAimB_core__SuitePath+'.itemsADD',tTST_dAimB_itemsADD_common_toMiddle);
    RegisterTest(cTest__dAimB_core__SuitePath+'.itemsADD',tTST_dAimB_itemsADD_common_toEND);

    RegisterTest(cTest__dAimB_core__SuitePath+'.itemsADD',tTST_dAimB_itemsADD_defVAL_toBegin);
    RegisterTest(cTest__dAimB_core__SuitePath+'.itemsADD',tTST_dAimB_itemsADD_defVAL_toMiddle);
    RegisterTest(cTest__dAimB_core__SuitePath+'.itemsADD',tTST_dAimB_itemsADD_defVAL_toEND);

    RegisterTest(cTest__dAimB_core__SuitePath+'.itemsDEL',tTST_dAimB_itemsDEL_fromBegin);
    RegisterTest(cTest__dAimB_core__SuitePath+'.itemsDEL',tTST_dAimB_itemsDEL_fromMiddle);
    RegisterTest(cTest__dAimB_core__SuitePath+'.itemsDEL',tTST_dAimB_itemsDEL_fromEnd);
end.


