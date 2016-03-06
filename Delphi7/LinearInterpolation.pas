unit LinearInterpolation;

interface
  type
     TVector = array of double;

  function isValueInRange(value : double): boolean;
  function LinearInterp(args, values : TVector; x : double):double;


implementation

   function isValueInRange(args : TVector; value : double): boolean;
   begin
      result := (value >= args(0)) and (value <= args(Length(args)-1));
   end;

   function LinearInterp(args, values : TVector; x : double):double;
   var
      i : integer;
      koeff : TVector;
   begin
      if(isValueInRange(args, x)) then begin
         SetLength(koeff, 2);

         for i:= 1 to Length(args)-1 do begin
            if(x >= args[i-1]) and (x < args[i]) then begin
               koeff[0] := (values[i] - values[i-1]) / (args[i] - args[i-1]);
               koeff[1] := values[i-1] - koeff[0]*args[i-1];
            end;
         end;
         result := koeff[1] + koeff[0]*x;
      end;
   end;

end.
