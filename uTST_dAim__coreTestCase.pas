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
   _lngSizeOf_:word; //< размер переменной ДЛИННА
   _itmSizeOf_:word; //< размер одного ЭЛЕМЕНТА
    function  _MANUAL_dAIM_create(Length:integer):pointer;
    procedure _MANUAL_dAIM_FINAL (var dAIM:pointer);
    function  _MANUAL_dAIM_Length(dAIM:pointer):SizeInt;
    function  _MANUAL_dAIM_pItem (dAIM:pointer; index:SizeInt):pointer;
    procedure _MANUAL_dAIM_nmbr01(dAIM:pointer);
    procedure _MANUAL_dAIM_tstVAL(dAIM:pointer; index:SizeInt; value:integer); overload;
    procedure _MANUAL_dAIM_tstVAL(dAIM:pointer; index:SizeInt; value:pointer); overload;
  protected
    dAIM:pointer; //< подопотный
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
    if (dAIM<>nil)and(_lngSizeOf_>0)and(_itmSizeOf_>0) then begin
       _MANUAL_dAIM_FINAL(dAIM);
    end;
    dAIM:=nil;
end;

//------------------------------------------------------------------------------

function tTST_dAim__coreTestCase._MANUAL_dAIM_create(Length:integer):pointer;
begin
   AssertTrue('MANUAL_dAIM_create is FAIL: _lngSizeOf_ not set',_lngSizeOf_ in [1,2,4,8]);
   AssertTrue('MANUAL_dAIM_create is FAIL: _itmSizeOf_ not set',_itmSizeOf_>0);
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
    AssertTrue('MANUAL_dAIM_FINAL is FAIL: _lngSizeOf_ not set',_lngSizeOf_ in [1,2,4,8]);
    AssertTrue('MANUAL_dAIM_FINAL is FAIL: _itmSizeOf_ not set',_itmSizeOf_>0);
    if dAIM<>nil then begin
      Freememory(dAIM,_lngSizeOf_+_itmSizeOf_*_MANUAL_dAIM_Length(dAIM));
    end;
    dAIM:=NIL;
end;

function tTST_dAim__coreTestCase._MANUAL_dAIM_Length(dAIM:pointer):SizeInt;
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

function tTST_dAim__coreTestCase._MANUAL_dAIM_pItem (dAIM:pointer; index:SizeInt):pointer;
begin
    AssertNotNull('MANUAL_dAIM_Length is FAIL:  dAIM not set',dAIM);
    AssertTrue   ('MANUAL_dAIM_Length is FAIL: _lngSizeOf_ not set',_lngSizeOf_ in [1,2,4,8]);
    AssertTrue   ('MANUAL_dAIM_Length is FAIL: _itmSizeOf_ not set',_itmSizeOf_>0);
    //---
    result:=dAim+_lngSizeOf_+ _itmSizeOf_*index;
end;

procedure tTST_dAim__coreTestCase._MANUAL_dAIM_nmbr01(dAIM:pointer);
var i:SizeInt;
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

procedure tTST_dAim__coreTestCase._MANUAL_dAIM_tstVAL(dAIM:pointer; index:SizeInt; value:integer);
begin
    AssertNotNull('_MANUAL_dAIM_tstVAL is FAIL:  dAIM not set',dAIM);
    AssertTrue   ('_MANUAL_dAIM_tstVAL is FAIL: _lngSizeOf_ not set',_lngSizeOf_ in [1,2,4,8]);
    AssertTrue   ('_MANUAL_dAIM_tstVAL is FAIL: _itmSizeOf_ not set',_itmSizeOf_ in [1,2,4]);
    //---
    case _itmSizeOf_ of
      1  : AssertEquals('Items['+inttostr(index)+'].Value',Byte (value),pByte (_MANUAL_dAIM_pItem(dAIM,index))^);
      2  : AssertEquals('Items['+inttostr(index)+'].Value',Word (value),PWord (_MANUAL_dAIM_pItem(dAIM,index))^);
      4  : AssertEquals('Items['+inttostr(index)+'].Value',DWord(value),pDWord(_MANUAL_dAIM_pItem(dAIM,index))^);
    end;
end;

procedure tTST_dAim__coreTestCase._MANUAL_dAIM_tstVAL(dAIM:pointer; index:SizeInt; value:pointer);
begin
    AssertNotNull('_MANUAL_dAIM_tstVAL is FAIL:  dAIM not set',dAIM);
    AssertTrue   ('_MANUAL_dAIM_tstVAL is FAIL: _lngSizeOf_ not set',_lngSizeOf_ in [1,2,4,8]);
    AssertTrue   ('_MANUAL_dAIM_tstVAL is FAIL: _itmSizeOf_ not set',_itmSizeOf_ = sizeOf(Pointer));
    //---
    AssertSame   ('Items['+inttostr(index)+'].Value',value,ppointer (_MANUAL_dAIM_pItem(dAIM,index))^);
end;

end.

