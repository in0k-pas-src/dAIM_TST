unit uTST_dAimB__coreTestCase;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses fpcunit, testregistry, sysutils,
  dAim_CountB,
  uTST_dAim__coreTestCase;

const
  cTest__dAimB__SuitePath=cTest__dAim__SuitePath+'.cntByte';

type

 tTST_dAimB__coreTestCase=class(tTST_dAim__coreTestCase)
  protected
    procedure TearDown; override;
  public
    constructor Create; override;
  end;

implementation

constructor tTST_dAimB__coreTestCase.Create;
begin
   inherited;
  _lngSizeOf_:=1;
end;

procedure tTST_dAimB__coreTestCase.TearDown;
begin
    if _itmSizeOf_>0 then dAimB_FINALize(dAIM,_itmSizeOf_);
    inherited;
end;

end.

