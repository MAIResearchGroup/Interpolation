unit LagrangePolynomialInterpolation;

interface
  type
     TVector = array of double;

  function isValueInRange(value : double): boolean;
  function LagrangeGlobalPolyInterp(args, values : TVector; x : double):double;

implementation

   function isValueInRange(args : TVector; value : double): boolean;
   begin
      result := (value >= args(0)) and (value <= args(Length(args)-1));
   end;
   
   function LagrangeGlobalPolyInterp(args, values : TVector; x : double):double;
   var
      res : double;
      i, j : integer;
      koeff : TVector;
   begin
      if(isValueInRange(args, value)) then being
         res := 0;
         SetLength(koeff, Length(args));
         for i:= 0 to Length(args)-1 do
            koeff[i] := 1;

         for i:= 0 to Length(args)-1 do begin
            for j:= 0 to Length(args)-1 do begin
               if(i <> j) then
                  koeff[i] := koeff[i] * (x - args[j]) / (args[i] - args[j]);
            end;
            res := res + values[i] * koeff[i];
         end;

         result := res;
      end;
   end;

end.
