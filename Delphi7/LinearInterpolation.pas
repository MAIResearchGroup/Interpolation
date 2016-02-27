unit LinearInterpolation;

interface
  type
     TVector = array of double;

  function LinearInterp(args, values : TVector; x : double):double;

implementation
   function LinearInterp(args, values : TVector; x : double):double;
   var
      i : integer;
      koeff : TVector;
   begin
      SetLength(koeff, 2);

      for i:= 1 to Length(args)-1 do begin
         if(x >= args[i-1]) and (x < args[i]) then begin
            koeff[0] := (values[i] - values[i-1]) / (args[i] - args[i-1]);
            koeff[1] := values[i-1] - koeff[0]*args[i-1];
         end;
      end;
      result := koeff[1] + koeff[0]*x;
   end;
end.
