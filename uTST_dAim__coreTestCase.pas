unit uTST_dAim__coreTestCase;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}

interface

uses fpcunit, testregistry, sysutils;

const
  cTest__dAim__SuitePath='dAIM';

type

 tTST_dAim__coreTestCase=class(TTestCase)
  protected
   _lngSizeOf_:word;
   _itmSizeOf_:word;
    function  _MANUAL_dAIM_create(Length:integer):pointer;
    procedure _MANUAL_dAIM_FINAL (var dAIM:pointer);
    function  _MANUAL_dAIM_Length(dAIM:pointer):integer;
    function  _MANUAL_dAIM_pItem (dAIM:pointer; index:integer):pointer;
    procedure _MANUAL_dAIM_number(dAIM:pointer);
    procedure _MANUAL_dAIM_tstVAL(dAIM:pointer; index:integer; value:integer);
  protected
    dAIM:pointer;
  protected
    procedure SetUp;    override;
    procedure TearDown; override;
  public
    constructor Create; override;
  end;

implementation

constructor tTST_dAim__coreTestCase.Create;
begin
   inherited;
  _lngSizeOf_:=0;
  _itmSizeOf_:=0;
end;

procedure tTST_dAim__coreTestCase.SetUp;
begin
   dAIM:=nil;
end;

procedure tTST_dAim__coreTestCase.TearDown;
begin
   dAIM:=nil;
end;

//------------------------------------------------------------------------------

function tTST_dAim__coreTestCase._MANUAL_dAIM_create(Length:integer):pointer;
begin
   AssertTrue('MANUAL_dAIM_Length is FAIL: _lngSizeOf_ not set',_lngSizeOf_ in [1,2,4,8]);
   AssertTrue('MANUAL_dAIM_Length is FAIL: _itmSizeOf_ not set',_itmSizeOf_>0);
   //---
   Getmem(result,_lngSizeOf_+_itmSizeOf_*Length);
   case _lngSizeOf_ of
    1: pByte (result)^:=Length;
    2: pWord (result)^:=Length;
    4: pDWord(result)^:=Length;
    8: pQWord(result)^:=Length;
   end;
   AssertNotNull('_MANUAL_dAIM_create is FAIL',result);
end;

procedure tTST_dAim__coreTestCase._MANUAL_dAIM_FINAL(var dAIM:pointer);
begin
    AssertTrue('MANUAL_dAIM_Length is FAIL: _lngSizeOf_ not set',_lngSizeOf_ in [1,2,4,8]);
    AssertTrue('MANUAL_dAIM_Length is FAIL: _itmSizeOf_ not set',_itmSizeOf_>0);
    if dAIM<>nil then begin
      Freememory(dAIM,_lngSizeOf_+_itmSizeOf_*_MANUAL_dAIM_Length(dAIM));
    end;
    dAIM:=NIL;
end;

function tTST_dAim__coreTestCase._MANUAL_dAIM_Length(dAIM:pointer):integer;
begin
    AssertTrue('MANUAL_dAIM_Length is FAIL: _lngSizeOf_ not set',_lngSizeOf_ in [1,2,4,8]);
    AssertTrue('MANUAL_dAIM_Length is FAIL: _itmSizeOf_ not set',_itmSizeOf_>0);
    //---
    result:=0;
    if dAIM<>nil then ;
    case _lngSizeOf_ of
      1: result:=pByte (dAIM)^;
      2: result:=pWord (dAIM)^;
      4: result:=pDWord(dAIM)^;
      8: result:=pQWord(dAIM)^;
    end;
end;

function tTST_dAim__coreTestCase._MANUAL_dAIM_pItem (dAIM:pointer; index:integer):pointer;
begin
    AssertNotNull('MANUAL_dAIM_Length is FAIL:  dAIM not set',dAIM);
    AssertTrue   ('MANUAL_dAIM_Length is FAIL: _lngSizeOf_ not set',_lngSizeOf_ in [1,2,4,8]);
    AssertTrue   ('MANUAL_dAIM_Length is FAIL: _itmSizeOf_ not set',_itmSizeOf_>0);
    //---
    result:=dAim+_lngSizeOf_+ _itmSizeOf_*index;
end;

procedure tTST_dAim__coreTestCase._MANUAL_dAIM_number(dAIM:pointer);
var i:integer;
begin
    AssertNotNull('_MANUAL_dAIM_number is FAIL:  dAIM not set',dAIM);
    AssertTrue   ('_MANUAL_dAIM_number is FAIL: _lngSizeOf_ not set',_lngSizeOf_ in [1,2,4,8]);
    AssertTrue   ('_MANUAL_dAIM_number is FAIL: _itmSizeOf_ not set',_itmSizeOf_ in [1,2,4,8]);
    //---
    for i:=0 to _MANUAL_dAIM_Length(dAIM)-1 do begin
        case _itmSizeOf_ of
          1  : pByte (_MANUAL_dAIM_pItem(dAIM,i))^:=i;
          2  : pWord (_MANUAL_dAIM_pItem(dAIM,i))^:=i;
          4  : pDWord(_MANUAL_dAIM_pItem(dAIM,i))^:=i;
          8  : pQWord(_MANUAL_dAIM_pItem(dAIM,i))^:=i;
        end;
    end;
end;

procedure tTST_dAim__coreTestCase._MANUAL_dAIM_tstVAL(dAIM:pointer; index:integer; value:integer);
var p:pointer;
    v:integer;
begin
    AssertNotNull('_MANUAL_dAIM_tstVAL is FAIL:  dAIM not set',dAIM);
    AssertTrue   ('_MANUAL_dAIM_tstVAL is FAIL: _lngSizeOf_ not set',_lngSizeOf_ in [1,2,4,8]);
    AssertTrue   ('_MANUAL_dAIM_tstVAL is FAIL: _itmSizeOf_ not set',_itmSizeOf_ in [1,2,4,8]);
    //---
    p:=_MANUAL_dAIM_pItem(dAIM,index);
    case _itmSizeOf_ of
      1  : v:=pByte (p)^;
      2  : v:=PWord (p)^;
      4  : v:=pDWord(p)^;
      8  : v:=pQWord(p)^;
    end;
    AssertEquals('Items['+inttostr(index)+'].Value',value,v);
end;


end.

