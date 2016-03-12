unit LinearInterpolation;

interface
  type
     TVector = array of double;

  function LinearInterp(args, values : TVector; x : double):double;


implementation

   function LinearInterp(args, values : TVector; x : double):double;
   var
      i, len : integer;
      koeff : TVector;
   begin
      len := Length(args);

      if(x <= args[0]) then
           result := values[0];
           exit;
      end;

      if(x >= args[len-1]) then
           result := values[len-1];
           exit;
      end;

      SetLength(koeff, 2);
      for i:= 0 to len-1 do
         koeff[i] := 1;

      for i:= 1 to len-1 do begin
         if(x >= args[i-1]) then begin
            koeff[0] := (values[i] - values[i-1]) / (args[i] - args[i-1]);
            koeff[1] := values[i-1] - koeff[0]*args[i-1];
            break;
         end;
      end;
      result := koeff[1] + koeff[0]*x;
   end;

end.
