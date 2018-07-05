unit uMaquina;

interface

uses
  uIMaquina, Classes;

type

  TMaquina = class(TInterfacedObject, IMaquina)
  public
    function MontarTroco(aTroco: Double): TList;
  end;

implementation

uses uTroco;

function TMaquina.MontarTroco(aTroco: Double): TList;
var
  FCedulas: TList;
  i: TCedula;
  Qtde:integer;
begin
  FCedulas := TList.Create;
  for i := Low(CValorCedula) to High(CValorCedula) do
  begin
    if aTroco > CValorCedula[i] then
    begin
      Qtde := Trunc(aTroco / CValorCedula[i]);
      aTroco := aTroco - (CValorCedula[i] * Qtde);
      FCedulas.Add(TTroco.Create(i,Qtde));
    end;
  end;

  Result := FCedulas;

end;

end.

