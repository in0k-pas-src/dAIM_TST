unit uTST_dAimB_core__coreTestCase;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses
  dAim_CountB,
  uTST_dAimB__coreTestCase;

const
 cTest__dAimB_core__SuitePath=cTest__dAimB__SuitePath+'.Core';

type

 tTST_dAimB_core__coreTestCase=class(tTST_dAimB__coreTestCase)
  public
    constructor Create; override;
  end;

implementation

constructor tTST_dAimB_core__coreTestCase.Create;
begin
    inherited;
   _itmSizeOf_:=1; //< будем БАЙТАМИ тестировать
end;


end.

